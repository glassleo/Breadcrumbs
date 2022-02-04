local _, Data = ...

-- Vignettes

--[[
	Data Structure
	
	[MapID] = {
		[QuestID] = "Icon|Coordinates|Title|Description|Description|...", -- Quest Name
	},

	Icon: Texture or Atlas to use as the pin's icon (use "questobjective" for a yellow dot)
	https://www.townlong-yak.com/framexml/9.1.0/Helix/AtlasInfo.lua
		questobjective	Yellow dot
		poi-door-down	Entrance (above)
		poi-door-up		Exit (below)
		poi-door-left	Entrance (inside)
		poi-door-right	Exit (outside)
		questturnin		Quest turn-in question mark (?)

	Coordinates: Coordinates for the map pin
		X Y				Coordinates for the map pin

	Title: Tooltip text
		{!}				Quest bang
		{n}				Texture/icon with ID n
		{atlas}			Atlas
		[text]			White (common) colored text
		[color]text]	Colored text where color is either a hex (like ff0800) or a named color (friendly neutral hostile poor uncommon rare epic legendary artifact heirloom)

	Description: Additional line(s) of tooltip text
		{!}				Quest bang
		{n}				Texture/icon with ID n
		{atlas}			Atlas
		[text]			White (common) colored text
		[color]text]	Colored text where color is either a hex (like ff0800) or a named color (friendly neutral hostile poor uncommon rare epic legendary artifact heirloom)
]]--

Data.Vignettes = {
	-- Elwynn Forest
	[37] = {
		-- Waterlogged Chest (Mirror Lake)
		--[38691] = "poi-door-left|38.88 53.05|Entrance to Ravencrest Mausoleum",
	},
}