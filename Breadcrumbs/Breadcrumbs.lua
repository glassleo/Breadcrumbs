local _, Data = ...
Breadcrumbs = LibStub("AceAddon-3.0"):NewAddon("Breadcrumbs", "AceConsole-3.0", "AceEvent-3.0")
local HBD = LibStub("HereBeDragons-2.0")
local Pins = LibStub("HereBeDragons-Pins-2.0")
local Throttle = {}


-- User settings (GUI NYI)
local setting_hidestorylines = true
local setting_pinsize = 20
local setting_objectivesize = 15
local setting_vignettesize = 15
local setting_poisize = 25
local setting_poisizesmall = 20
local setting_showhelp = true
local setting_questframelevel = nil -- set to "PIN_FRAME_LEVEL_GROUP_MEMBER" to display above the player arrow
local setting_objectiveframelevel = nil -- set to "PIN_FRAME_LEVEL_GROUP_MEMBER" to display above the player arrow
local setting_vignetteframelevel = "PIN_FRAME_LEVEL_VIGNETTE" -- set to "PIN_FRAME_LEVEL_GROUP_MEMBER" to display above the player arrow
local setting_poiframelevel = "PIN_FRAME_LEVEL_AREA_POI" -- set to "PIN_FRAME_LEVEL_GROUP_MEMBER" to display above the player arrow
local setting_showbroken = false
local setting_showdiscovery = true
local setting_showitemtooltip = true
local setting_showitemtooltipcurrency = true
local setting_itemtooltipposition = "right" -- can be "bottom" or "right"
local setting_showtreasures = true
local setting_showvignettes = true
local setting_showpoi = true
local setting_showmailboxes = true


-- Frame recycling pool
local MapPool = {}
local MapPoolCount = 0

local function RecycleAllPins()
	if MapPoolCount > 0 then
		for i = 1, MapPoolCount do
			local pin = _G["BreadcrumbsMapPin"..i]
			
			pin:SetParent(WorldMapFrame)
			pin:SetPoint("CENTER", WorldMapFrame)
			pin.arrow:SetDesaturated(false)
			pin.arrow:SetTexture("")
			pin.arrow:Hide()
			if pin:GetNormalTexture() then
				pin:GetNormalTexture():SetDesaturated(false)
				pin:GetNormalTexture():SetVertexColor(1, 1, 1)
				pin:GetNormalTexture():SetTexCoord(0, 1, 0, 1)
			end
			pin:SetNormalTexture("")
			if pin:GetHighlightTexture() then
				pin:GetHighlightTexture():SetDesaturated(false)
				pin:GetHighlightTexture():SetVertexColor(1, 1, 1)
				pin:GetHighlightTexture():SetTexCoord(0, 1, 0, 1)
			end
			pin:SetHighlightTexture("")
			pin:UnregisterAllEvents()
			pin:SetScript("OnEnter", nil)
			pin:SetScript("OnLeave", nil)
			pin:SetScript("OnMouseUp", nil)
			pin:Hide()
			MapPool[pin] = true
		end
	end
end

local function NewPin()
	local pin = next(MapPool)

	if pin then
		MapPool[pin] = nil -- remove it from the pool
		pin:SetParent(WorldMapFrame)
		pin:ClearAllPoints()
		return pin
	end

	-- Create a new pin frame
	MapPoolCount = MapPoolCount + 1
	pin = CreateFrame("Button", "BreadcrumbsMapPin"..MapPoolCount, WorldMapFrame)

	local arrow = pin:CreateTexture(nil, "OVERLAY")
	pin.arrow = arrow
	arrow:SetPoint("CENTER", pin)
	arrow:Hide()

	return pin
end


-- Item Tooltip
local ItemTooltip = _G["BreadcrumbsItemTooltip"]
if not ItemTooltip then
    ItemTooltip = CreateFrame("GameTooltip", "BreadcrumbsItemTooltip", GameTooltip, "GameTooltipTemplate")
end


-- Initialization
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


-- Fix Bonus Objectives
function Breadcrumbs:FixBonusObjectives()
	-- Attempt to fix the Blizzard map bug preventing Legion leveling bonus objectives from hiding properly at level 50+
	if not WorldMapFrame then return end

	-- If the player is below level 50 then do nothing
	if (UnitLevel("player") or 1) < 50 then return end

	-- We don't want to unregister the entire Data Provider since that would mess up bonus objectives on other maps
	-- Instead we'll just hide all the BonusObjectivePinTemplate pins for specific zones
	local map = WorldMapFrame:GetMapID() or 0
	if map == 630 or map == 641 or map == 650 or map == 657 or map == 634 then
		-- Azsuna, Val'sharah, Highmountain, Neltharion's Vault, Stormheim
		WorldMapFrame:RemoveAllPinsByTemplate("BonusObjectivePinTemplate")
	end
end

function Breadcrumbs:FixBonusObjectivesDelayed()
	-- Ugly hack to prevent the Bonus Objective pins from reappearing after tracking a world quest
	C_Timer.After(0.01, function() Breadcrumbs:FixBonusObjectives() end)
end


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
	text = string.gsub(text, "%[poor%]", "|cff9d9d9d") -- poor grey
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


-- Update Map
function Breadcrumbs:UpdateMap(event, ...)
	if event and not event == "QUEST_ACCEPTED" then
		if Throttle[event] then
			return
		elseif event == "PLAYER_LEVEL_UP" or event == "BAG_UPDATE" then
			Throttle[event] = true
			C_Timer.After(1, function() Throttle[event] = false end)
		else
			Throttle[event] = true
			C_Timer.After(0.5, function() Throttle[event] = false end)
		end

		if event == "PLAYER_LEVEL_UP" then
			-- Delay by 1 second
			C_Timer.After(1, function() Breadcrumbs:UpdateMap() end)
			return
		elseif event == "QUEST_TURNED_IN" or event == "QUEST_AUTOCOMPLETE" or event == "QUEST_COMPLETE" then
			-- Delay by 0.5 seconds to make sure quest status has updated
			C_Timer.After(0.5, function() Breadcrumbs:UpdateMap() end)
			return
		end
	end

	--print(event, ...) -- Debug output

	-- Clean up
	Pins:RemoveAllWorldMapIcons("Breadcrumbs")
	RecycleAllPins()

	-- Current Map ID
	local map = WorldMapFrame:GetMapID() or 0

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
	if Data.Quests and Data.Quests[map] then
		for id in pairs(Data.Quests[map]) do
			-- Quest must not be in the quest log and also not completed
			if not C_QuestLog.IsOnQuest(id) and not C_QuestLog.IsQuestFlaggedCompleted(id) then
				for i = 1, type(Data.Quests[map][id]) == "string" and 1 or #Data.Quests[map][id] do
					local datastring = type(Data.Quests[map][id]) == "string" and Data.Quests[map][id] or Data.Quests[map][id][i]
					-- Check if we meet the quest requirements
					local eligible, title, x, y, xx, yy, source, flags, help = Breadcrumbs:CheckQuest(map, id, datastring)

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

							DisoveryQuests[sort] = {
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
								pin:SetNormalTexture(flag_icon)
							elseif flags["red"] then
								pin:SetNormalTexture("Interface/AddOns/Breadcrumbs/Textures/questred")
							else
								pin:SetNormalAtlas(flags["elsewhere"] and "poi-traveldirections-arrow" or flags["warboard"] and "warboard" or flags["campaign"] and "quest-campaign-available" or flags["dailycampaign"] and "quest-dailycampaign-available" or flags["up"] and "questnormal" or flags["down"] and "questnormal" or flags["artifact"] and "questartifact" or flags["legendary"] and "questlegendary" or flags["daily"] and "questdaily" or "questnormal")
							end

							if flags["down"] or flags["up"] then
								pin:GetNormalTexture():SetDesaturated(true)
								pin.arrow:SetAtlas(flags["up"] and "minimap-positionarrowup" or "minimap-positionarrowdown")
								pin.arrow:SetSize(size*1.5, size*1.5)
								pin.arrow:Show()
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
										GameTooltip:AddLine(Breadcrumbs:FormatTooltip(help, flags), nil, nil, nil, true)
									end
									if flags["chromiesync"] then
										GameTooltip:AddLine(" ")

										if playerlevel >= 50 then
											GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " You must Party Sync with a low level character to be able to obtain this quest", 1, 0, 0, true)
										elseif chromietime then
											GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " You have a Timewalking Campaign active and should be able to obtain this quest", 0, 1, 0, true)
										else
											GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " You must activate a Timewalking Campaign to be able to obtain this quest", 1, 0, 0, true)
										end
									elseif flags["chromietime"] then
										GameTooltip:AddLine(" ")

										if playerlevel >= 50 then
											GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " You cannot complete this quest because your level is too high", 1, 0, 0, true)
										elseif chromietime then
											GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " You have a Timewalking Campaign active and should be able to obtain this quest", 0, 1, 0, true)
										else
											GameTooltip:AddLine(CreateAtlasMarkup("chromietime-32x32") .. " You must activate a Timewalking Campaign to be able to obtain this quest", 1, 0, 0, true)
										end
									end
								end
								if ZA and ZA.DebugMode then -- Debug
									GameTooltip:AddLine(" ")
									GameTooltip:AddLine("|cff3ba5ffQuest ID:|r |cffffffff" .. (id or "unknown") .. "|r")
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

							Pins:AddWorldMapIconMap("Breadcrumbs", pin, map, x/100, y/100, nil, setting_questframelevel or "PIN_FRAME_LEVEL_STORY_LINE")
							pin:Show()

							if xx and yy then
								-- Create alternate quest marker pin
								local pin = NewPin()
								size = setting_objectivesize
								pin:SetSize(size, size)

								pin:SetNormalAtlas(flags["down"] and "poi-door-down" or flags["up"] and "poi-door-up" or flags["inside"] and "poi-door-left" or flags["outside"] and "poi-door-right" or "questobjective")
								
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
											GameTooltip:AddLine(Breadcrumbs:FormatTooltip(help, flags), nil, nil, nil, true)
										end
									end
									GameTooltip:Show()
								end)

								pin:SetScript("OnLeave", function(self, motion)
									GameTooltip:Hide()
								end)

								Pins:AddWorldMapIconMap("Breadcrumbs", pin, map, xx/100, yy/100, nil, setting_questframelevel or "PIN_FRAME_LEVEL_STORY_LINE")
								pin:Show()
							end
						end
					end
				end
			end
		end
	end

	-- Create Discovery Quest Pins
	if setting_showdiscovery then
		-- Sort the table
		local sorted = {}
		for k in pairs(DisoveryQuests) do sorted[#sorted+1] = k end
		table.sort(sorted)

		for i, k in ipairs(sorted) do
			local data = DisoveryQuests[k]

			-- Pin size
			local size = setting_pinsize*1.8

			-- Create quest marker pin
			local pin = NewPin()
			pin:SetSize(size, size)

			-- Coordinates
			local x = size/10
			local y = 7 + ((size/5)*0.5) + ((i-1) * (size/4.5))

			-- Data
			local id = data["id"]
			local title = data["title"]
			local source = data["source"]
			local help = data["help"]
			local flags = data["flags"]
			local link = data["link"]

			-- Icon
			pin:SetNormalTexture("Interface/AddOns/Breadcrumbs/Textures/Discovery/" .. (data["icon"] or "Questionmark"))
			pin:GetNormalTexture():SetTexCoord(0, 0.75, 0, 0.75) -- Crop 64×64 to 48×48
			pin:SetHighlightTexture("Interface/AddOns/Breadcrumbs/Textures/Discovery/" .. (data["icon"] or "Questionmark"))
			pin:GetHighlightTexture():SetTexCoord(0, 0.75, 0, 0.75) -- Crop 64×64 to 48×48
			pin:GetHighlightTexture():SetAlpha(0.5)

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
				if ZA and ZA.DebugMode then -- Debug
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine("|cff3ba5ffQuest ID:|r |cffffffff" .. (id or "unknown") .. "|r")
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

			Pins:AddWorldMapIconMap("Breadcrumbs", pin, map, x/100, y/100, nil, "PIN_FRAME_LEVEL_GROUP_MEMBER")
			pin:Show()
		end
	end

	-- Create Objective Pins
	if Data.Objectives and Data.Objectives[map] then
		for id in pairs(Data.Objectives[map]) do
			if C_QuestLog.IsOnQuest(id or 0) then
				for i = 1, type(Data.Objectives[map][id]) == "string" and 1 or #Data.Objectives[map][id] do
					local datastring = type(Data.Objectives[map][id]) == "string" and Data.Objectives[map][id] or Data.Objectives[map][id][i]
					-- Get data
					local icon, coordinates, title, line1, line2, line3, line4, line5, line6, line7, line8, line9 = strsplit("|", datastring)
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
								pin:SetNormalAtlas(icon)
							else
								pin:SetNormalTexture(icon)
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
									if line5 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line5)) end
									if line6 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line6)) end
									if line7 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line7)) end
									if line8 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line8)) end
									if line9 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(line9)) end

									if ZA and ZA.DebugMode then -- Debug
										GameTooltip:AddLine(" ")
										GameTooltip:AddLine("|cff3ba5ffQuest ID:|r |cffffffff" .. (id or "unknown") .. "|r")
									end

									GameTooltip:Show()
								end)

								pin:SetScript("OnLeave", function(self, motion)
									GameTooltip:Hide()
								end)
							end

							Pins:AddWorldMapIconMap("Breadcrumbs", pin, map, x/100, y/100)
							pin:Show()
						end
					end
				end
			end
		end
	end

	-- Create Vignette Pins
	if (setting_showtreasures or setting_showvignettes) and Data.Vignettes and Data.Vignettes[map] then
		for id in pairs(Data.Vignettes[map]) do
			if type(id) == "number" then -- Quest
				-- Quest must not be completed
				if not C_QuestLog.IsQuestFlaggedCompleted(id) then
					for i = 1, type(Data.Vignettes[map][id]) == "string" and 1 or #Data.Vignettes[map][id] do
						local datastring = type(Data.Vignettes[map][id]) == "string" and Data.Vignettes[map][id] or Data.Vignettes[map][id][i]
						-- Check if we meet the quest requirements
						local eligible, title, x, y, xx, yy, source, flags, tip1, tip2, tip3, tip4, tip5, tip6, tip7, tip8, tip9 = Breadcrumbs:CheckQuest(map, id, datastring)
						
						if eligible and x and y then
							-- Build the flags table
							local link, flag_icon, hyperlink = nil, nil, nil
							flags = flags and { strsplit(" ", flags) } or {}
							for _, v in ipairs(flags) do
								if string.match(v, "link:([%d]+)") then
									link = tonumber(string.match(v, "link:([%d]+)"))
									flags["link"] = true
								elseif string.match(v, "icon:([%d]+)") then
									flag_icon = tonumber(string.match(v, "icon:([%d]+)"))
									flags["icon"] = true
								elseif string.match(v, "item:([%d]+)") or string.match(v, "spell:([%d]+)") then
									hyperlink = v
								elseif setting_showitemtooltipcurrency and string.match(v, "currency:([%d]+)") then
									hyperlink = v
								else
									flags[v] = true
								end
							end

							if (flags["treasure"] and setting_showtreasures) or ((flags["event"] or flags["rare"]) and setting_showvignettes) then
								-- Pin size
								local size = setting_vignettesize

								-- Create quest marker pin
								local pin = NewPin()
								pin:SetSize(flags["elsewhere"] and size*0.7647 or size, size)

								if flags["icon"] and flag_icon then
									pin:SetNormalTexture(flag_icon)
									pin:SetHighlightTexture(flag_icon)
								else
									pin:SetNormalAtlas(flags["elsewhere"] and "poi-traveldirections-arrow" or (flags["elite"] and flags["event"]) and "vignetteeventelite" or (flags["elite"] and flags["treasure"]) and "vignettelootelite" or flags["treasure"] and "vignetteloot" or flags["elite"] and "vignettekillelite" or "vignettekill")
									pin:SetHighlightAtlas(flags["elsewhere"] and "poi-traveldirections-arrow" or (flags["elite"] and flags["event"]) and "vignetteeventelite" or (flags["elite"] and flags["treasure"]) and "vignettelootelite" or flags["treasure"] and "vignetteloot" or flags["elite"] and "vignettekillelite" or "vignettekill")
								end

								pin:GetHighlightTexture():SetAlpha(0.5)

								if flags["down"] or flags["up"] then
									pin:GetNormalTexture():SetDesaturated(true)
									pin:GetHighlightTexture():SetDesaturated(true)
									pin.arrow:SetAtlas(flags["up"] and "minimap-positionarrowup" or "minimap-positionarrowdown")
									pin.arrow:SetSize(size*1.5, size*1.5)
									pin.arrow:Show()
								end

								pin:SetScript("OnEnter", function(self, motion)
									GameTooltip:Hide()
									ItemTooltip:Hide()
									GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
									--local title = title or C_QuestLog.GetTitleForQuestID(id) or " "
									if flags["up"] or flags["down"] then -- Position arrow and grey text color
										GameTooltip:AddLine((flags["up"] and "|TInterface/MINIMAP/Minimap-PositionArrows:12:12:-2:0:16:32:0:16:0:16|t" or "|TInterface/MINIMAP/Minimap-PositionArrows:12:12:-2:0:16:32:0:16:16:32|t") .. Breadcrumbs:FormatTooltip(title, flags), 0.65, 0.65, 0.65)
									elseif flags["legendary"] or flags["artifact"] then -- Legendary text color
										GameTooltip:AddLine(Breadcrumbs:FormatTooltip(title, flags), 1, 0.5, 0)
									else -- Normal quest
										GameTooltip:AddLine(Breadcrumbs:FormatTooltip(title, flags))
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
									if flags["link"] and link then -- The pin is a link, indicate where it takes us, replacing source
										local mapinfo = C_Map.GetMapInfo(link)
										GameTooltip:AddLine(Breadcrumbs:FormatTooltip("{newplayertutorial-icon-mouse-leftbutton} ") .. (mapinfo.name or link), 1, 1, 1)
									elseif source then
										GameTooltip:AddLine(Breadcrumbs:FormatTooltip(source), nil, nil, nil, true)
									end
									if setting_showhelp and tip1 then -- Help tip
										GameTooltip:AddLine(" ")
										if tip1 then if strlen(tip1) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip1, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
										if tip2 then if strlen(tip2) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip2, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
										if tip3 then if strlen(tip3) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip3, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
										if tip4 then if strlen(tip4) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip4, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
										if tip5 then if strlen(tip5) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip5, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
										if tip6 then if strlen(tip6) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip6, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
										if tip7 then if strlen(tip7) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip7, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
										if tip8 then if strlen(tip8) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip8, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
										if tip9 then if strlen(tip9) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip9, flags), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
									end
									if ZA and ZA.DebugMode then -- Debug
										GameTooltip:AddLine(" ")
										GameTooltip:AddLine("|cff3ba5ffQuest ID:|r |cffffffff" .. (id or "unknown") .. "|r")
									end
									GameTooltip:Show()

									if setting_showitemtooltip and hyperlink then
										ItemTooltip:SetOwner(GameTooltip, "ANCHOR_NONE")
										if setting_itemtooltipposition == "bottom" then
											ItemTooltip:SetPoint("TOPLEFT", GameTooltip, "BOTTOMLEFT", 0, -2)
										else
											ItemTooltip:SetPoint("TOPLEFT", GameTooltip, "TOPRIGHT")
										end
										ItemTooltip:SetHyperlink(hyperlink)
										ItemTooltip:Show()
									end
								end)

								pin:SetScript("OnLeave", function(self, motion)
									GameTooltip:Hide()
									ItemTooltip:Hide()
								end)

								if flags["link"] then
									pin:SetScript("OnMouseUp", function(self, button)
										if button == "LeftButton" then
											WorldMapFrame:SetMapID(link)
										end
									end)
								end

								Pins:AddWorldMapIconMap("Breadcrumbs", pin, map, x/100, y/100, nil, setting_vignetteframelevel or "PIN_FRAME_LEVEL_VIGNETTE")
								pin:Show()
							end
						end
					end
				end
			elseif type(id) == "string" then
				-- NYI
				-- https://wowpedia.fandom.com/wiki/API_C_Garrison.GetFollowers
			end
		end
	end

	-- Create Point of Interest Pins
	if setting_showpoi and Data.POI and Data.POI[map] then
		for id, data in ipairs(Data.POI[map]) do
			for i = 1, type(data) == "string" and 1 or #data do
				local datastring = type(data) == "string" and data or data[i]
				-- Check if we meet the quest requirements
				local eligible, texture, title, x, y, flags, tip1, tip2, tip3, tip4, tip5, tip6, tip7, tip8, tip9 = Breadcrumbs:CheckPOI(map, datastring)

				if eligible and x and y then
					-- Pin size
					local texture, texturesize = strsplit(":", texture or "")
					local size = (texturesize == "objective") and setting_objectivesize or (texturesize == "small") and setting_poisizesmall or (texturesize == "large") and (setting_poisize*1.5) or setting_poisize

					-- Build the flags table
					local link = nil
					flags = flags and { strsplit(" ", flags) } or {}
					for _, v in ipairs(flags) do
						if string.match(v, "link:([%d]+)") then
							link = tonumber(string.match(v, "link:([%d]+)"))
							flags["link"] = true
						else
							flags[v] = true
						end
					end

					-- Create quest marker pin
					local pin = NewPin()

					if texture == "-" then
						pin:SetNormalTexture("")
						pin:SetHighlightAtlas("BonusChest-CircleGlow")
						pin:GetHighlightTexture():SetAlpha(0.3)
					elseif (tonumber(texture or 0) or 0) > 0 then
						pin:SetNormalTexture(texture)
						pin:SetHighlightTexture(texture)
						pin:GetHighlightTexture():SetAlpha(0.5)
					elseif string.match(texture, "Discovery/[%w]+") then
						pin:SetNormalTexture("Interface/AddOns/Breadcrumbs/Textures/" .. texture)
						pin:SetHighlightTexture("Interface/AddOns/Breadcrumbs/Textures/" .. texture)
						pin:GetNormalTexture():SetTexCoord(0, 0.75, 0, 0.75) -- Crop 64×64 to 48×48
						pin:GetHighlightTexture():SetTexCoord(0, 0.75, 0, 0.75) -- Crop 64×64 to 48×48
						pin:GetHighlightTexture():SetAlpha(0.5)
					elseif string.match(texture, "POI/[%w]+") then
						pin:SetNormalTexture("Interface/AddOns/Breadcrumbs/Textures/" .. texture)
						pin:SetHighlightTexture("Interface/AddOns/Breadcrumbs/Textures/" .. texture)
						pin:GetHighlightTexture():SetAlpha(0.5)
					elseif string.match(texture, "[%w%p]+") then
						pin:SetNormalAtlas(texture)
						pin:SetHighlightAtlas(texture)
						pin:GetHighlightTexture():SetAlpha(0.5)
					else
						pin:SetNormalTexture(texture)
						pin:SetHighlightTexture(texture)
						pin:GetHighlightTexture():SetAlpha(0.5)
					end

					pin:SetSize(size, size)

					pin:SetScript("OnEnter", function(self, motion)
						GameTooltip:Hide()

						if flags["tooltip"] or flags["combo"] then
							GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
							GameTooltip:AddLine(Breadcrumbs:FormatTooltip(flags["combo"] and tip2 or title))
							if tip1 or flags["combo"] then
								if tip1 and not flags["combo"] then if strlen(tip1) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip1), nil, nil, nil, true) elseif not flags["combo"] then GameTooltip:AddLine(" ") end end
								if tip2 and not flags["combo"] then if strlen(tip2) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip2), nil, nil, nil, true) elseif not flags["combo"] then GameTooltip:AddLine(" ") end end
								if tip3 then if strlen(tip3) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip3), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
								if tip4 then if strlen(tip4) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip4), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
								if tip5 then if strlen(tip5) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip5), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
								if tip6 then if strlen(tip6) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip6), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
								if tip7 then if strlen(tip7) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip7), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
								if tip8 then if strlen(tip8) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip8), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
								if tip9 then if strlen(tip9) > 0 then GameTooltip:AddLine(Breadcrumbs:FormatTooltip(tip9), nil, nil, nil, true) else GameTooltip:AddLine(" ") end end
							end
							GameTooltip:Show()
						end
						if not flags["tooltip"] then
							WorldMapFrame:TriggerEvent("SetAreaLabel", 4, Breadcrumbs:FormatTooltip(title), Breadcrumbs:FormatTooltip(tip1))
						end
					end)

					pin:SetScript("OnLeave", function(self, motion)
						if flags["tooltip"] or flags["combo"] then
							GameTooltip:Hide()
						end
						if not flags["tooltip"] then
							WorldMapFrame:TriggerEvent("ClearAreaLabel", 4)
						end
					end)

					if link then
						pin:SetScript("OnMouseUp", function(self, button)
							if button == "LeftButton" then
								WorldMapFrame:SetMapID(link)
							end
						end)
					end

					Pins:AddWorldMapIconMap("Breadcrumbs", pin, map, x/100, y/100, nil, setting_poiframelevel or "PIN_FRAME_LEVEL_AREA_POI")
					pin:Show()
				end
			end
		end
	end

	Breadcrumbs:FixBonusObjectives()
end

Breadcrumbs:RegisterEvent("QUEST_ACCEPTED", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_AUTOCOMPLETE", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_COMPLETE", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_REMOVED", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_TURNED_IN", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_ACCEPT_CONFIRM", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_WATCH_UPDATE", "UpdateMap")
Breadcrumbs:RegisterEvent("PLAYER_LEVEL_UP", "UpdateMap")
Breadcrumbs:RegisterEvent("BAG_UPDATE", "UpdateMap")
Breadcrumbs:RegisterEvent("ZONE_CHANGED", "UpdateMap")
Breadcrumbs:RegisterEvent("ZONE_CHANGED_INDOORS", "UpdateMap")
Breadcrumbs:RegisterEvent("ZONE_CHANGED_NEW_AREA", "UpdateMap")
Breadcrumbs:RegisterEvent("WORLD_MAP_OPEN", "UpdateMap")
Breadcrumbs:RegisterEvent("QUEST_LOG_UPDATE", "UpdateMap")

Breadcrumbs:RegisterEvent("QUEST_WATCH_LIST_CHANGED", "FixBonusObjectivesDelayed")


function Breadcrumbs:CheckQuest(map, quest, datastring)
	-- Check requirements
	local title, requirements, coordinates, source, flags, help, help2, help3, help4, help5, help6, help7, help8, help9 = strsplit("|", datastring)
	local data = { strsplit(" ", strlower(requirements)) }
	local x, y, xx, yy = strsplit(" ", coordinates or "")

	local class = select(2, UnitClass("player"))
	class = strlower(class)
	local race = strlower(select(2, UnitRace("player")))
	local faction = strlower(UnitFactionGroup("player"))
	local level = UnitLevel("player") or 1
	local garrison = C_Garrison and C_Garrison.GetGarrisonInfo(Enum.GarrisonType.Type_6_0) or 0
	local covenant = C_Covenants and C_Covenants.GetActiveCovenantID() or 0
	if covenant == 1 then covenant = "kyrian" end
	if covenant == 2 then covenant = "venthyr" end
	if covenant == 3 then covenant = "nightfae" end
	if covenant == 4 then covenant = "necrolord" end
	prof1, prof2, archaeology, fishing, cooking = GetProfessions()
	if prof1 then prof1 = strlower(GetProfessionInfo(prof1)) end -- This won't work on non-English clients
	if prof2 then prof2 = strlower(GetProfessionInfo(prof2)) end
	local flying = IsSpellKnown(34090) or IsSpellKnown(34091) or IsSpellKnown(90265) and true or false

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

					-- Must have picked up quest but not completed it (§n)
					if string.match(v, "§(%d+)") and not (C_QuestLog.IsQuestFlaggedCompleted(tonumber(string.match(v, "§(%d+)") or 0)) and C_QuestLog.IsOnQuest(tonumber(string.match(v, "§(%d+)") or 0))) then pass = true end

					-- Must have researched Garrison talent (research:n)
					if string.match(v, "research:(%d+)") and C_Garrison.GetTalentInfo(tonumber(string.match(v, "research:(%d+)") or 0)).researched then pass = true end

					-- Must not have researched Garrison talent (-research:n)
					if string.match(v, "%-research:(%d+)") and not C_Garrison.GetTalentInfo(tonumber(string.match(v, "research:(%d+)") or 0)).researched then pass = true end

					-- Map must have Art ID (phase:n)
					if string.match(v, "phase:(%d+)") and (C_Map.GetMapArtID(map) == tonumber(string.match(v, "phase:(%d+)") or 0)) then pass = true end

					-- Map must not have Art ID (-phase:n)
					if string.match(v, "%-phase:(%d+)") and (C_Map.GetMapArtID(map) ~= tonumber(string.match(v, "%-phase:(%d+)") or 0)) then pass = true end

					-- Must have flying

					-- Must match...
					if v == class or v == faction or v == covenant or v == prof1 or v == prof2 or v == race then pass = true end
					if v == "garrison" and garrison >= 1 then pass = true end
					if v == "garrison:1" and garrison == 1 then pass = true end
					if v == "garrison:2" and garrison == 2 then pass = true end
					if v == "garrison:3" and garrison == 3 then pass = true end
					if v == "flying" and flying then pass = true end
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
						if w == "garrison" and garrison >= 1 then pass = false end
						if w == "garrison:1" and garrison == 1 then pass = false end
						if w == "garrison:2" and garrison == 2 then pass = false end
						if w == "garrison:3" and garrison == 3 then pass = false end
						if flying and w == "flying" then pass = false end
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

	-- eligible, title, x, y, xx, yy, source, flags, help, ...
	return pass, title, x, y, xx, yy, source, flags, help, help2, help3, help4, help5, help6, help7, help8, help9
end

function Breadcrumbs:CheckPOI(map, datastring)
	-- Check requirements
	local texture, title, requirements, coordinates, flags, help, help2, help3, help4, help5, help6, help7, help8, help9 = strsplit("|", datastring)
	local data = { strsplit(" ", strlower(requirements)) }
	local x, y = strsplit(" ", coordinates or "")

	local class = select(2, UnitClass("player"))
	class = strlower(class)
	local race = strlower(select(2, UnitRace("player")))
	local faction = strlower(UnitFactionGroup("player"))
	local level = UnitLevel("player") or 1
	local garrison = C_Garrison and C_Garrison.GetGarrisonInfo(Enum.GarrisonType.Type_6_0) or 0
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

					-- Must have picked up quest but not completed it (§n)
					if string.match(v, "§(%d+)") and not (C_QuestLog.IsQuestFlaggedCompleted(tonumber(string.match(v, "§(%d+)") or 0)) and C_QuestLog.IsOnQuest(tonumber(string.match(v, "§(%d+)") or 0))) then pass = true end

					-- Must have researched Garrison talent (research:n)
					if string.match(v, "research:(%d+)") and C_Garrison.GetTalentInfo(tonumber(string.match(v, "research:(%d+)") or 0)).researched then pass = true end

					-- Must not have researched Garrison talent (-research:n)
					if string.match(v, "%-research:(%d+)") and not C_Garrison.GetTalentInfo(tonumber(string.match(v, "research:(%d+)") or 0)).researched then pass = true end

					-- Map must have Art ID (phase:n)
					if string.match(v, "phase:(%d+)") and (C_Map.GetMapArtID(map) == tonumber(string.match(v, "phase:(%d+)") or 0)) then pass = true end

					-- Map must not have Art ID (-phase:n)
					if string.match(v, "%-phase:(%d+)") and (C_Map.GetMapArtID(map) ~= tonumber(string.match(v, "%-phase:(%d+)") or 0)) then pass = true end

					-- Mailbox
					if v == "mailbox" and setting_showmailboxes then pass = true end

					-- Must match...
					if v == class or v == faction or v == covenant or v == prof1 or v == prof2 or v == race then pass = true end
					if v == "garrison" and garrison >= 1 then pass = true end
					if v == "garrison:1" and garrison == 1 then pass = true end
					if v == "garrison:2" and garrison == 2 then pass = true end
					if v == "garrison:3" and garrison == 3 then pass = true end
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

	-- eligible, texture, title, x, y, help, ...
	return pass, texture, title, tonumber(x), tonumber(y), flags, help, help2, help3, help4, help5, help6, help7, help8, help9
end