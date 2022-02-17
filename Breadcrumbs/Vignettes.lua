local _, Data = ...

-- Vignettes

--[[
	Data Structure

	[MapID] = {
		[QuestID|"follower:id"] = "Title|Requirements|Coordinates|Flags|Description|Description|...", -- Comments
	},
]]--

Data.Vignettes = {
	--[[ Shadowmoon Valley ]]--

	-- Lunarfall
	[582] = {
		[35383] = {"Pipper's Buried Supplies|10+ alliance garrison:1|30.9 27.7|treasure|Contains {1005027} [Garrison Resources]",},
	},

	--[[ Elwynn Forest ]]--

	[37] = {
		-- Waterlogged Chest (Mirror Lake)
		--[38691] = "poi-door-left|38.88 53.05|Entrance to Ravencrest Mausoleum",
	},
}