local _, Data = ...

-- Quest Objectives

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

Data.Objectives = {
	-- Val'sharah
	[641] = {
		-- Jarod's Mission
		[38691] = "poi-door-left|38.88 53.05|Entrance to Ravencrest Mausoleum",
	},

	-- Stormheim
	[634] = {
		-- Pins and Needles
		[38059] = {
			"questobjective|30.26 53|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|28.22 52.93|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|28.54 55.38|Pins and Needles|[7th Legion Dragoon]",
		},

		-- Plight of the Blackfeather
		[42444] = "poi-door-left|50.69 31.06|Cave Entrance", -- Plight of the Blackfeather
		[42446] = "poi-door-left|50.69 31.06|Cave Entrance", -- Singed Feathers
		[42445] = "poi-door-left|50.69 31.06|Cave Entrance", -- Nithogg's Tributem
	},

	-- Stormscale Cavern, Stormheim
	[636] = {
		-- Pins and Needles
		[38059] = {
			"questobjective|69.6 65.77|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|45.19 66.93|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|26.71 65.56|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|25.55 47.37|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|54.21 31.96|Pins and Needles|[7th Legion Dragoon]",
		},
	},

	-- Stillpine Hold, Azuremyst Isle
	[99] = {
		-- Stillpine Hold
		[9573] = "questobjective|38.49 52.89|Chieftain Oomooroo|[Chieftain Oomooroo]",
		[9565] = "questturnin|65.18 30.89|Search Stillpine Hold",
	},
}