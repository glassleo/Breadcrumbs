local _, Data = ...
Breadcrumbs = LibStub("AceAddon-3.0"):NewAddon("Breadcrumbs", "AceConsole-3.0", "AceEvent-3.0")
local HBD = LibStub("HereBeDragons-2.0")
local Pins = LibStub("HereBeDragons-Pins-2.0")


-- User settings (GUI NYI)
local setting_hidestorylines = true
local setting_pinsize = 20
local setting_objectivesize = 15
local setting_minimapsize = 15
local setting_showhelp = true
local setting_questframelevel = nil -- set to "PIN_FRAME_LEVEL_GROUP_MEMBER" to display above the player arrow
local setting_objectiveframelevel = nil -- set to "PIN_FRAME_LEVEL_GROUP_MEMBER" to display above the player arrow
local setting_vignetteframelevel = "PIN_FRAME_LEVEL_VIGNETTE" -- set to "PIN_FRAME_LEVEL_GROUP_MEMBER" to display above the player arrow
local setting_showbroken = false
local setting_showdiscovery = true


-- Frame recycling pool
local MapPool = {}
local MapPoolCount = 0
local MinimapPool = {}
local MinimapPoolCount = 0

local function RecycleAllPins()
	if MapPoolCount > 0 then
		for i = 1, MapPoolCount do
			local pin = _G["BreadcrumbsMapPin"..i]
			
			pin.arrow:Hide()
			pin:Hide()
			MapPool[pin] = true
		end
	end

	if MinimapPoolCount > 0 then
		for i = 1, MinimapPoolCount do
			local pin = _G["BreadcrumbsMinimapPin"..i]
			
			pin.arrow:Hide()
			pin:Hide()
			MinimapPool[pin] = true
		end
	end
end

local function NewPin(type)
	local type = type or "map"
	local pin = next(type == "minimap" and MinimapPool or MapPool)

	if pin then
		if type == "minimap" then
			MinimapPool[pin] = nil -- remove it from the pool
			pin:SetParent(Minimap)
		else
			MapPool[pin] = nil -- remove it from the pool
			pin:SetParent(WorldMapFrame)
		end
		pin:ClearAllPoints()
		pin.icon:SetTexCoord(0, 1, 0, 1)
		return pin
	end

	-- Create a new pin frame
	if type == "minimap" then
		MinimapPoolCount = MinimapPoolCount + 1
		pin = CreateFrame("Frame", "BreadcrumbsMinimapPin"..MinimapPoolCount, Minimap)
	else
		MapPoolCount = MapPoolCount + 1
		pin = CreateFrame("Frame", "BreadcrumbsMapPin"..MapPoolCount, WorldMapFrame)
	end

	local icon = pin:CreateTexture(nil, "OVERLAY")
	pin.icon = icon
	icon:SetAllPoints(pin)

	local arrow = pin:CreateTexture(nil, "OVERLAY")
	pin.arrow = arrow
	arrow:SetPoint("CENTER", pin)
	arrow:Hide()

	return pin
end



-- Variables
local variables = {
	["order_hall_name"] = {
		["DEATHKNIGHT"] = "Acherus: The Ebon Hold",
		["DEMONHUNTER"] = "The Fel Hammer",
		["DRUID"] = "The Dreamgrove",
		["HUNTER"] = "Trueshot Lodge",
		["MAGE"] = "Hall of the Guardian",
		["MONK"] = "The Wandering Isle",
		["PALADIN"] = "Sanctum of Light",
		["PRIEST"] = "Netherlight Temple",
		["ROGUE"] = "The Hall of Shadows",
		["SHAMAN"] = "The Maelstrom",
		["WARLOCK"] = "Dreadscar Rift",
		["WARRIOR"] = "Skyhold",
	},
	["order_hall_map_id"] = {
		["DEATHKNIGHT"] = 648,
		["DEMONHUNTER"] = 720,
		["DRUID"] = 747,
		["HUNTER"] = 739, -- need to check
		["MAGE"] = 734, -- need to check
		["MONK"] = 709,
		["PALADIN"] = 24,
		["PRIEST"] = 702,
		["ROGUE"] = 626, -- need to check
		["SHAMAN"] = 726,
		["WARLOCK"] = 717, -- need to check
		["WARRIOR"] = 695,
	},
	["scouting_map_in_order_hall"] = {
		["DEATHKNIGHT"] = "Scouting Map in Acherus",
		["DEMONHUNTER"] = "Scouting Map in the Fel Hammer",
		["DRUID"] = "Scouting Map in the Dreamgrove",
		["HUNTER"] = "Scouting Map in Trueshot Lodge",
		["MAGE"] = "Scouting Map in the Hall of the Guardian",
		["MONK"] = "Scouting Map on the Wandering Isle",
		["PALADIN"] = "Scouting Map in the Sanctum of Light",
		["PRIEST"] = "Scouting Map in Netherlight Temple",
		["ROGUE"] = "Scouting Map in the Hall of Shadows",
		["SHAMAN"] = "Scouting Map in the Heart of Azeroth",
		["WARLOCK"] = "Scouting Map in Dreadscar Rift",
		["WARRIOR"] = "Scouting Map in Skyhold",
	},
}

function Breadcrumbs:OnInitialize()
	if setting_hidestorylines then
		-- Remove StorylineQuestDataProvider
		for provider in next, WorldMapFrame.dataProviders do
		    if(provider.RequestQuestLinesForMap) then
		    	WorldMapFrame:RemoveDataProvider(provider)
		    end
		end
	end
end

function Breadcrumbs:OnEnable()
	Breadcrumbs:UpdateMap()
end

function Breadcrumbs:FixBonusObjectives()
	-- Attempt to fix the Blizzard map bug preventing Legion leveling bonus objectives from hiding properly at level 50+
	if not WorldMapFrame then return end

	-- If the player is below level 50 then do nothing
	if (UnitLevel("player") or 1) < 50 then return end

	-- We don't want to unregister the entire Data Provider so instead we'll just hide all the BonusObjectivePinTemplate pins for specific zones
	local map = WorldMapFrame:GetMapID() or 0
	if map == 630 or map == 641 or map == 650 or map == 634 then
		-- Azsuna, Val'sharah, Highmountain, Stormheim
		WorldMapFrame:RemoveAllPinsByTemplate("BonusObjectivePinTemplate")
	end
end
Breadcrumbs:RegisterEvent("QUEST_LOG_UPDATE", "FixBonusObjectives")

-- Format Tooltip Text
function Breadcrumbs:FormatTooltip(text, flags)
	text = text or ""
	flags = flags or {}

	text = string.gsub(text, "{([%d]+)}", "|T%1:18:18|t") -- texture id
	text = string.gsub(text, "{(Interface/)([%w%p]+)}", "|T%1%2:16:16|t") -- texture path
	text = string.gsub(text, "{!}", CreateAtlasMarkup(flags["warboard"] and "warboard" or flags["artifact"] and "questartifact" or flags["legendary"] and "questlegendary" or flags["campaign"] and "quest-campaign-available" or flags["dailycampaign"] and "quest-dailycampaign-available" or flags["daily"] and "questdaily" or "questnormal")) -- !
	text = string.gsub(text, "{([%w%p]+)}", CreateAtlasMarkup("%1")) -- atlas
	text = string.gsub(text, "%[Auto Accept", "|cff00ff00Auto Accept") -- Auto Accept green
	text = string.gsub(text, "%[friendly%]", "|cff00ff00") -- friendly green
	text = string.gsub(text, "%[neutral%]", "|cffff0000") -- neutral yellow
	text = string.gsub(text, "%[hostile%]", "|cffff0000") -- hostile red
	text = string.gsub(text, "%[poor%]", "|cffd9d9d9") -- poor grey
	text = string.gsub(text, "%[uncommon%]", "|cff1eff00") -- uncommon green
	text = string.gsub(text, "%[rare%]", "|cff0070dd") -- rare blue
	text = string.gsub(text, "%[epic%]", "|cffa335ee") -- epic purple
	text = string.gsub(text, "%[legendary%]", "|cffff8000") -- legendary orange
	text = string.gsub(text, "%[artifact%]", "|cffe6cc80") -- artifact beige
	text = string.gsub(text, "%[heirloom%]", "|cff00ccff") -- heirloom cyan
	text = string.gsub(text, "%[spell%]", "|cff71d5ff") -- light blue used for spell links
	text = string.gsub(text, "%[(%x%x%x%x%x%x)%]", "|cff%1") -- color
	text = string.gsub(text, "%[", "|cffffffff") -- white
	text = string.gsub(text, "%]", "|r") -- close color
	return text
end

function Breadcrumbs:GetMapID()
	return (HBD:GetPlayerZone())
end

-- Update Map
function Breadcrumbs:UpdateMap(event, ...)
	if event and (event == "PLAYER_LEVEL_UP" or event == "QUEST_TURNED_IN" or event == "QUEST_AUTOCOMPLETE" or event == "QUEST_COMPLETE") then
		-- Delay by 1 seconds to make sure quest status has updated
		C_Timer.After(1, function() Breadcrumbs:UpdateMap() end)
		return
	end
	if event and ZA and ZA.DebugMode then
		-- Debug
		print(event, ...)
	end

	-- Clean up
	Pins:RemoveAllWorldMapIcons("Breadcrumbs")
	Pins:RemoveAllMinimapIcons("Breadcrumbs")
	RecycleAllPins()

	-- Current Map ID
	local map = HBD:GetPlayerZone()

	-- Check if Chromie Time is active
	local playerlevel = UnitLevel("player") or 1
	local chromietime = false

	if playerlevel < 50 then -- Chromie Time becomes unavailable at level 50
		local options = C_ChromieTime.GetChromieTimeExpansionOptions()

		if options then
			for _, exp in pairs(options) do
				if exp.alreadyOn then chromietime = true end
			end
		end
	end

	local DisoveryQuests = {}

	-- Create Quest Pins
	if Data.Quests then
		for zone in pairs(Data.Quests) do
			for id in pairs(Data.Quests[zone]) do
				-- Quest must not be in the quest log and also not completed
				if not C_QuestLog.IsOnQuest(id) and not C_QuestLog.IsQuestFlaggedCompleted(id) then
					for i = 1, type(Data.Quests[zone][id]) == "string" and 1 or #Data.Quests[zone][id] do
						local datastring = type(Data.Quests[zone][id]) == "string" and Data.Quests[zone][id] or Data.Quests[zone][id][i]
						-- Check if we meet the quest requirements
						local eligible, title, x, y, xx, yy, source, flags, help = Breadcrumbs:CheckQuest(zone, id, datastring)

						if eligible and x and y then
							-- Build the flags table
							local link, flag_icon = nil, nil
							flags = flags and { strsplit(" ", flags) } or {}
							for _, v in ipairs(flags) do
								if string.match(v, "link:([%d]+)") then
									link = tonumber(string.match(v, "link:([%d]+)"))
									flags["link"] = true
								elseif string.match(v, "icon:([%d]+)") then
									flag_icon = tonumber(string.match(v, "icon:([%d]+)"))
									flags["icon"] = true
								else
									flags[v] = true
								end
							end

							if flags["discovery"] then
								-- It's a Discovery quest, add it to the Discovery table instead
								if not DisoveryQuests[zone] then DisoveryQuests[zone] = {} end

								local sort = string.format("%02d", tonumber(x) or 99)
								if flags["blacksmithing"] then sort = "blacksmithing"..sort end
								if flags["enchanting"] then sort = "enchanting"..sort end
								if flags["engineering"] then sort = "engineering"..sort end
								if flags["herbalism"] then sort = "herbalism"..sort end
								if flags["inscription"] then sort = "inscription"..sort end
								if flags["jewelcrafting"] then sort = "jewelcrafting"..sort end
								if flags["mining"] then sort = "mining"..sort end
								if flags["skinning"] then sort = "skinning"..sort end
								if flags["tailoring"] then sort = "tailoring"..sort end
								if flags["cooking"] then sort = "x1"..sort end
								if flags["fishing"] then sort = "x2"..sort end
								if flags["archaeology"] then sort = "x3"..sort end
								if flags["petbattle"] then sort = "x4"..sort end
								sort = sort..id

								DisoveryQuests[zone][sort] = {
									["id"] = id,
									["title"] = title,
									["icon"] = y,
									["source"] = source,
									["flags"] = flags,
									["help"] = help,
									["link"] = link,
								}
							else
								-- Pin size
								local size = setting_pinsize

								-- Create quest marker pin
								local pin = NewPin()
								pin:SetSize(flags["elsewhere"] and size*0.7647 or size, size)

								if flags["icon"] and flag_icon then
									pin.icon:SetTexture(flag_icon)
								elseif flags["red"] then
									pin.icon:SetTexture("Interface/AddOns/Breadcrumbs/Textures/questred")
								else
									pin.icon:SetAtlas(flags["elsewhere"] and "poi-traveldirections-arrow" or flags["warboard"] and "warboard" or flags["campaign"] and "quest-campaign-available" or flags["dailycampaign"] and "quest-dailycampaign-available" or flags["up"] and "questnormal" or flags["down"] and "questnormal" or flags["artifact"] and "questartifact" or flags["legendary"] and "questlegendary" or flags["daily"] and "questdaily" or "questnormal")
								end

								if flags["down"] or flags["up"] then
									pin.icon:SetDesaturated(true)
									pin.arrow:SetAtlas(flags["up"] and "minimap-positionarrowup" or "minimap-positionarrowdown")
									pin.arrow:SetSize(size*1.5, size*1.5)
									pin.arrow:Show()
								else
									pin.icon:SetDesaturated(false) -- Needs to be set in case the frame was reused
								end

								pin:SetScript("OnEnter", function(self, motion)
									GameTooltip:Hide()
									GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
									--local title = title or C_QuestLog.GetTitleForQuestID(id) or " "
									if flags["up"] or flags["down"] then -- Position arrow and grey text color
										GameTooltip:AddLine((flags["up"] and "|TInterface/MINIMAP/Minimap-PositionArrows:12:12:-2:0:16:32:0:16:0:16|t" or "|TInterface/MINIMAP/Minimap-PositionArrows:12:12:-2:0:16:32:0:16:16:32|t") .. title, 0.65, 0.65, 0.65)
									elseif flags["legendary"] or flags["artifact"] then -- Legendary text color
										GameTooltip:AddLine(title, 1, 0.5, 0)
									else -- Normal quest
										GameTooltip:AddLine(title)
									end
									if flags["dungeon"] then GameTooltip:AddLine(CreateAtlasMarkup("dungeon") .. " Dungeon") end
									if flags["raid"] then GameTooltip:AddLine(CreateAtlasMarkup("raid") .. " Raid") end
									if flags["alchemy"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-alchemy") .. " Alchemy") end
									if flags["blacksmithing"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-blacksmithing") .. " Blacksmithing") end
									if flags["enchanting"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-enchanting") .. " Enchanting") end
									if flags["engineering"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-engineering") .. " Engineering") end
									if flags["herbalism"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-herbalism") .. " Herbalism") end
									if flags["inscription"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-inscription") .. " Inscription") end
									if flags["jewelcrafting"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-jewelcrafting") .. " Jewelcrafting") end
									if flags["leatherworking"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-leatherworking") .. " Leatherworking") end
									if flags["mining"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-mining") .. " Mining") end
									if flags["skinning"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-skinning") .. " Skinning") end
									if flags["tailoring"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-tailoring") .. " Tailoring") end
									if flags["cooking"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-cooking") .. " Cooking") end
									if flags["fishing"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-fishing") .. " Fishing") end
									if flags["archaeology"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-archaeology") .. " Archaeology") end
									if flags["petbattle"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-petbattle") .. " Archaeology") end
									if flags["link"] and link then -- The pin is a link, indicate where it takes us
										local mapinfo = C_Map.GetMapInfo(link)
										GameTooltip:AddDoubleLine(AVAILABLE_QUEST, Breadcrumbs:FormatTooltip("{newplayertutorial-icon-mouse-leftbutton} ") .. (mapinfo.name or link), 1, 1, 1, 1, 1, 1)
									else -- It's a quest, show source
										GameTooltip:AddDoubleLine(AVAILABLE_QUEST, Breadcrumbs:FormatTooltip(source and "{!}" .. source or "", flags) or "", 1, 1, 1)
									end
									if setting_showhelp then -- Help tip
										if help and strlen(help) > 0 then
											GameTooltip:AddLine(" ")
											GameTooltip:AddLine(Breadcrumbs:FormatTooltip(help, flags))
										end
										if flags["chromiesync"] then
											GameTooltip:AddLine(" ")

											if playerlevel >= 50 then
												GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cffff0000You must Party Sync with a low level character to be able to obtain this quest|r")
											elseif chromietime then
												GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cff00ff00You have a Timewalking Campaign active and should be able to obtain this quest|r")
											else
												GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cffff0000You must activate a Timewalking Campaign to be able to obtain this quest|r")
											end
										elseif flags["chromietime"] then
											GameTooltip:AddLine(" ")

											if playerlevel >= 50 then
												GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cffff0000You cannot complete this quest because your level is too high|r")
											elseif chromietime then
												GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cff00ff00You have a Timewalking Campaign active and should be able to obtain this quest|r")
											else
												GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cffff0000You must activate a Timewalking Campaign to be able to obtain this quest|r")
											end
										end
									end
									GameTooltip:Show()
								end)

								pin:SetScript("OnLeave", function(self, motion)
									GameTooltip:Hide()
								end)

								if flags["link"] then
									pin:SetScript("OnMouseUp", function(self, button)
										if button == "LeftButton" then
											WorldMapFrame:SetMapID(link)
										end
									end)
								end

								Pins:AddWorldMapIconMap("Breadcrumbs", pin, zone, x/100, y/100, nil, setting_questframelevel or "PIN_FRAME_LEVEL_STORY_LINE")
								pin:Show()

								if xx and yy then
									-- Create alternate quest marker pin
									local pin = NewPin()
									size = setting_objectivesize
									pin:SetSize(size, size)

									pin.icon:SetAtlas(flags["down"] and "poi-door-down" or flags["up"] and "poi-door-up" or flags["inside"] and "poi-door-left" or flags["outside"] and "poi-door-right" or "questobjective")
									
									pin:SetScript("OnEnter", function(self, motion)
										GameTooltip:Hide()
										GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
										GameTooltip:AddLine(C_QuestLog.GetTitleForQuestID(id) or id)
										if flags["down"] or flags["up"] or flags["inside"] or flags["outside"] then
											GameTooltip:AddLine(flags["up"] and "Entrance" or flags["outside"] and "Exit" or "Entrance", 1, 1, 1)
										else
											GameTooltip:AddDoubleLine(AVAILABLE_QUEST, Breadcrumbs:FormatTooltip(source and "{!} " .. source or "", flags) or "", 1, 1, 1)
											if setting_showhelp and help and strlen(help) > 0 then
												GameTooltip:AddLine(" ")
												GameTooltip:AddLine(Breadcrumbs:FormatTooltip(help, flags))
											end
										end
										GameTooltip:Show()
									end)

									pin:SetScript("OnLeave", function(self, motion)
										GameTooltip:Hide()
									end)

									Pins:AddWorldMapIconMap("Breadcrumbs", pin, zone, xx/100, yy/100, nil, setting_questframelevel or "PIN_FRAME_LEVEL_STORY_LINE")
									pin:Show()
								end
							end
						end
					end
				end
			end
		end
	end

	-- Create Discovery Quest Pins
	if setting_showdiscovery then
		for zone in pairs(DisoveryQuests) do
			-- Sort the table
			local sorted = {}
			for k in pairs(DisoveryQuests[zone]) do sorted[#sorted+1] = k end
			table.sort(sorted)

			for i, k in ipairs(sorted) do
				local data = DisoveryQuests[zone][k]

				-- Pin size
				local size = setting_pinsize*1.8

				-- Create quest marker pin
				local pin = NewPin()
				pin:SetSize(size, size)

				-- Coordinates
				local x = size/10
				local y = 7 + ((size/5)*0.5) + ((i-1) * (size/4.5))

				-- Data
				local title = data["title"]
				local source = data["source"]
				local help = data["help"]
				local flags = data["flags"]
				local link = data["link"]

				-- Icon
				pin.icon:SetTexture(data["icon"] and "Interface/AddOns/Breadcrumbs/Textures/Discovery/" .. data["icon"] or 134400)
				pin.icon:SetTexCoord(0, 0.75, 0, 0.75) -- Crop 64x64 to 48x48
				pin.icon:SetDesaturated(false) -- Needs to be set in case the frame was reused

				pin:SetScript("OnEnter", function(self, motion)
					GameTooltip:Hide()
					GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
					if flags["legendary"] or flags["artifact"] then -- Legendary text color
						GameTooltip:AddLine(title, 1, 0.5, 0)
					else -- Normal quest
						GameTooltip:AddLine(title)
					end
					if flags["dungeon"] then GameTooltip:AddLine(CreateAtlasMarkup("dungeon") .. " Dungeon") end
					if flags["raid"] then GameTooltip:AddLine(CreateAtlasMarkup("raid") .. " Raid") end
					if flags["alchemy"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-alchemy") .. " Alchemy") end
					if flags["blacksmithing"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-blacksmithing") .. " Blacksmithing") end
					if flags["enchanting"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-enchanting") .. " Enchanting") end
					if flags["engineering"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-engineering") .. " Engineering") end
					if flags["herbalism"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-herbalism") .. " Herbalism") end
					if flags["inscription"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-inscription") .. " Inscription") end
					if flags["jewelcrafting"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-jewelcrafting") .. " Jewelcrafting") end
					if flags["leatherworking"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-leatherworking") .. " Leatherworking") end
					if flags["mining"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-mining") .. " Mining") end
					if flags["skinning"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-skinning") .. " Skinning") end
					if flags["tailoring"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-tailoring") .. " Tailoring") end
					if flags["cooking"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-cooking") .. " Cooking") end
					if flags["fishing"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-fishing") .. " Fishing") end
					if flags["archaeology"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-archaeology") .. " Archaeology") end
					if flags["petbattle"] then GameTooltip:AddLine(CreateAtlasMarkup("worldquest-icon-petbattle") .. " Archaeology") end
					if flags["link"] and link then -- The pin is a link, indicate where it takes us
						local mapinfo = C_Map.GetMapInfo(link)
						GameTooltip:AddDoubleLine(AVAILABLE_QUEST, Breadcrumbs:FormatTooltip("{newplayertutorial-icon-mouse-leftbutton} ") .. (mapinfo.name or link), 1, 1, 1, 1, 1, 1)
					else -- It's a quest, show source
						GameTooltip:AddDoubleLine(AVAILABLE_QUEST, Breadcrumbs:FormatTooltip(source and "{!}" .. source or "", flags) or "", 1, 1, 1)
					end
					if setting_showhelp then -- Help tip
						if help and strlen(help) > 0 then
							GameTooltip:AddLine(" ")
							GameTooltip:AddLine(Breadcrumbs:FormatTooltip(help, flags))
						end
						if flags["chromiesync"] then
							GameTooltip:AddLine(" ")

							if playerlevel >= 50 then
								GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cffff0000You must Party Sync with a low level character to be able to obtain this quest|r")
							elseif chromietime then
								GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cff00ff00You have a Timewalking Campaign active and should be able to obtain this quest|r")
							else
								GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cffff0000You must activate a Timewalking Campaign to be able to obtain this quest|r")
							end
						elseif flags["chromietime"] then
							GameTooltip:AddLine(" ")

							if playerlevel >= 50 then
								GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cffff0000You cannot complete this quest because your level is too high|r")
							elseif chromietime then
								GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cff00ff00You have a Timewalking Campaign active and should be able to obtain this quest|r")
							else
								GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " |cffff0000You must activate a Timewalking Campaign to be able to obtain this quest|r")
							end
						end
					end
					GameTooltip:Show()
				end)

				pin:SetScript("OnLeave", function(self, motion)
					GameTooltip:Hide()
				end)

				if flags["link"] then
					pin:SetScript("OnMouseUp", function(self, button)
						if button == "LeftButton" then
							WorldMapFrame:SetMapID(link)
						end
					end)
				end

				Pins:AddWorldMapIconMap("Breadcrumbs", pin, zone, x/100, y/100, nil, "PIN_FRAME_LEVEL_GROUP_MEMBER")
				pin:Show()
			end
		end
	end

	-- Create Objective Pins
	if Data.Objectives then
		for zone in pairs(Data.Objectives) do
			for id in pairs(Data.Objectives[zone]) do
				if C_QuestLog.IsOnQuest(id or 0) then
					for i = 1, type(Data.Objectives[zone][id]) == "string" and 1 or #Data.Objectives[zone][id] do
						local datastring = type(Data.Objectives[zone][id]) == "string" and Data.Objectives[zone][id] or Data.Objectives[zone][id][i]
						-- Get data
						local icon, coordinates, title, line1, line2, line3, line4 = strsplit("|", datastring)
						local x, y = strsplit(" ", coordinates or "")
						x = tonumber(x) or nil
						y = tonumber(y) or nil

						if icon and x and y then
							if not (icon == "questobjective" and (C_QuestLog.IsQuestFlaggedCompleted(id) or C_QuestLog.ReadyForTurnIn(id))) then -- Don't show the pin if the quest is complete
								-- Pin size
								local size = setting_objectivesize
								if icon == "questturnin" then size = setting_pinsize end

								-- Create map pin
								local pin = NewPin()
								pin:SetSize(size, size)

								if string.match(icon, "[%w%p]+") then
									pin.icon:SetAtlas(icon)
								else
									pin.icon:SetTexture(icon)
								end

								if title then
									pin:SetScript("OnEnter", function(self, motion)
										GameTooltip:Hide()
										GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
										GameTooltip:AddLine(Breadcrumbs:FormatTooltip(title))
										if line1 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line1)) end
										if line2 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line2)) end
										if line3 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line3)) end
										if line4 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line4)) end
										GameTooltip:Show()
									end)

									pin:SetScript("OnLeave", function(self, motion)
										GameTooltip:Hide()
									end)
								end

								Pins:AddWorldMapIconMap("Breadcrumbs", pin, zone, x/100, y/100)
								pin:Show()

								-- Create minimap pin
								local size = setting_minimapsize

								local pin = NewPin("minimap")
								pin:SetSize(size, size)

								if string.match(icon, "[%w%p]+") then
									pin.icon:SetAtlas(icon)
								else
									pin.icon:SetTexture(icon)
								end
								pin.icon:Show()

								if title then
									pin:SetScript("OnEnter", function(self, motion)
										GameTooltip:Hide()
										GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
										GameTooltip:AddLine(Breadcrumbs:FormatTooltip(title))
										if line1 and strlen(line1) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line1)) end
										if line2 and strlen(line2) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line2)) end
										if line3 and strlen(line3) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line3)) end
										if line4 and strlen(line4) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line4)) end
										GameTooltip:Show()
									end)

									pin:SetScript("OnLeave", function(self, motion)
										GameTooltip:Hide()
									end)
								end

								Pins:AddMinimapIconMap("Breadcrumbs", pin, zone, x/100, y/100, false, nil, setting_objectiveframelevel or "PIN_FRAME_LEVEL_AREA_POI")
								pin:Show()
							end
						end
					end
				end
			end
		end
	end

	-- This is not pretty but it works
	C_Timer.After(0.2, function() Breadcrumbs:FixBonusObjectives() end)
	C_Timer.After(0.4, function() Breadcrumbs:FixBonusObjectives() end)
	C_Timer.After(0.6, function() Breadcrumbs:FixBonusObjectives() end)
end

Breadcrumbs:RegisterEvent("QUEST_ACCEPTED", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_AUTOCOMPLETE", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_COMPLETE", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_REMOVED", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_TURNED_IN", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_ACCEPT_CONFIRM", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_WATCH_UPDATE", "UpdateMap")
Breadcrumbs:RegisterEvent("PLAYER_LEVEL_UP", "UpdateMap")


function Breadcrumbs:CheckQuest(map, quest, datastring)
	-- Doesn't exist, shut it down
	if not Data.Quests or not Data.Quests[map] or not Data.Quests[map][quest] or not datastring then return false end

	-- Variables
	--local raw = Data.Quests[map][quest] or ""
	local class = select(2, UnitClass("player"))
	datastring = string.gsub(datastring, "(%$order_hall_map_id)", variables["order_hall_map_id"][class])
	datastring = string.gsub(datastring, "(%$order_hall_name)", variables["order_hall_name"][class])
	datastring = string.gsub(datastring, "(%$scouting_map_in_order_hall)", variables["scouting_map_in_order_hall"][class])

	-- Check requirements
	local title, requirements, coordinates, source, flags, help = strsplit("|", datastring)
	local data = { strsplit(" ", strlower(requirements)) }
	local x, y, xx, yy = strsplit(" ", coordinates or "")

	class = strlower(class)
	local race = strlower(select(2, UnitRace("player")))
	local faction = strlower(UnitFactionGroup("player"))
	local level = UnitLevel("player") or 1
	local covenant = C_Covenants and C_Covenants.GetActiveCovenantID() or 0
	if covenant == 1 then covenant = "kyrian" end
	if covenant == 2 then covenant = "venthyr" end
	if covenant == 3 then covenant = "nightfae" end
	if covenant == 4 then covenant = "necrolord" end
	prof1, prof2, archaeology, fishing, cooking = GetProfessions()
	if prof1 then prof1 = strlower(GetProfessionInfo(prof1)) end -- This won't work on non-English clients
	if prof2 then prof2 = strlower(GetProfessionInfo(prof2)) end

	local pass = true
	for _, v in ipairs(data) do
		if pass then
			pass = false

			if string.match(v, "(%d+)%+") and tonumber(string.match(v, "(%d+)%+") or 0) <= level then
				pass = true -- Minimum level
			elseif tonumber(string.match(v, "(%d+)%-") or 0) >= level then
				pass = true -- Maximum level
			else
				local data = { strsplit(",", v) }

				for _, v in ipairs(data) do
					-- Must have completed quest (n)
					if C_QuestLog.IsQuestFlaggedCompleted(tonumber(v) or 0) then pass = true end

					-- Must have completed or picked up quest (+n)
					if string.match(v, "%+(%d+)") and (C_QuestLog.IsQuestFlaggedCompleted(tonumber(string.match(v, "%+(%d+)") or 0)) or C_QuestLog.IsOnQuest(tonumber(string.match(v, "%+(%d+)") or 0))) then pass = true end

					-- Must not have picked up quest (~n)
					if string.match(v, "~(%d+)") and not C_QuestLog.IsOnQuest(tonumber(string.match(v, "~(%d+)") or 0)) then pass = true end

					-- Must not have completed or picked up quest (-n)
					if string.match(v, "%-(%d+)") and not C_QuestLog.IsQuestFlaggedCompleted(tonumber(string.match(v, "%-(%d+)") or 0)) and not C_QuestLog.IsOnQuest(tonumber(string.match(v, "%-(%d+)") or 0)) then pass = true end

					-- Must match...
					if v == class or v == faction or v == covenant or v == prof1 or v == prof2 or v == race then pass = true end
					if archaeology and v == "archaeology" then pass = true end
					if fishing and v == "fishing" then pass = true end
					if cooking and v == "cooking" then pass = true end
					if race == "scourge" and (v == "undead" or v == "forsaken") then pass = true end
					if race == "highmountaintauren" and v == "highmountain" then pass = true end
					if race == "darkirondwarf" and v == "darkiron" then pass = true end
					if race == "magharorc" and v == "maghar" then pass = true end
					if race == "lightforgeddraenei" and v == "lightforged" then pass = true end
					if race == "kultiran" and v == "kultiranhuman" then pass = true end
					if race == "zandalaritroll" and v == "zandalari" then pass = true end

					-- Must not match...
					if string.match(v, "%-(%a+)") then
						pass = true -- We invert our logic
						local w = string.gsub(v, "%-(%a+)", "%1")

						if w == class or w == faction or w == covenant or w == prof1 or w == prof2 or w == race then pass = false end
						if archaeology and w == "archaeology" then pass = false end
						if fishing and w == "fishing" then pass = false end
						if cooking and w == "cooking" then pass = false end
						if race == "scourge" and (w == "undead" or w == "forsaken") then pass = false end
						if race == "highmountaintauren" and w == "highmountain" then pass = false end
						if race == "darkirondwarf" and w == "darkiron" then pass = false end
						if race == "magharorc" and w == "maghar" then pass = false end
						if race == "lightforgeddraenei" and w == "lightforged" then pass = false end
						if race == "kultiran" and w == "kultiranhuman" then pass = false end
						if race == "zandalaritroll" and w == "zandalari" then pass = false end
					end

					-- Broken
					if v == "broken" and setting_showbroken then pass = true end

					if string.match(v, "broken:(%d+)") then
						local brokenlevel = tonumber((string.gsub(v, "broken:(%d+)", "%1"))) or 0
						if level < brokenlevel or setting_showbroken then pass = true end
					end
				end
			end
		end
	end

	-- eligible, title, x, y, xx, yy, source, flags, help
	return pass, title, tonumber(x), y, tonumber(xx), tonumber(yy), source, flags, help
end