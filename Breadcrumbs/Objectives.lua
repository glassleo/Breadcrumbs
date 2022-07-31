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
	-- Maldraxxus
	[1536] = {
		-- Read Between the Lines
		[58619] = "questturnin|43.08 25.1|Read Between the Lines",
	},

	-- Monk - Wandering Isle
	[709] = {
		[41728] = "questobjective|47.16 47.75|The Defense of Tian Monastery|[Tak-Tak]",
	},

	-- Nar'thalas Academy, Azsuna
	[631] = {
		-- Into the Academy
		[37468] = "questturnin|53.38 47.57|Into the Academy",
	},

	-- Val'sharah
	[641] = {
		-- Jarod's Mission
		[38691] = "poi-door-left|38.88 53.05|Entrance to Ravencrest Mausoleum",
	},

	-- Hall of Chieftains, Thunder Totem
	[652] = {
		-- Keepers of the Hammer
		[38907] = "questturnin|54.81 63.18|Keepers of the Hammer",
		[39989] = "questturnin|54.81 63.18|Keepers of the Hammer",
	},

	-- Stormheim
	[634] = {
		-- Pins and Needles
		[38059] = {
			"questobjective|30.26 53|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|28.22 52.93|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|28.54 55.38|Pins and Needles|[7th Legion Dragoon]",
		},
	},

	-- Broken Shore
	[646] = {
		-- Excavations
		[46499] = "questobjective|43.33 31.39|Spiders, Huh?|[Spider-Covered Treasure Chest]",
		[46501] = "questobjective|49.7 46.7|Grave Robbin'|[Dusty Treasure Chest]",
		[46509] = "questobjective|67.61 16.16|Tomb Raidering|[Grandiose Treasure Chest]",
		[46510] = "questobjective|54.69 77.89|Ship Graveyard|[Sunken Treasure Chest]",
		[46511] = "questobjective|75.75 21.7|We're Treasure Hunters|[Sandy Treasure Chest]",
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

	-- The Jade Forest
	[371] = {
		-- Slowing the Spread
		[41729] = {
			"questobjective|38.99 23.24|Slowing the Spread|[Fel Spreader]",
			"questobjective|41.62 23.75|Slowing the Spread|[Fel Spreader]",
			"questobjective|41.39 27.36|Slowing the Spread|[Fel Spreader]",
		},
	},

	-- Stillpine Hold, Azuremyst Isle
	[99] = {
		-- Stillpine Hold
		[9573] = "questobjective|38.49 52.89|Chieftain Oomooroo|[Chieftain Oomooroo]",
		[9565] = "questturnin|65.18 30.89|Search Stillpine Hold",
	},

	-- Stormwind
	[84] = {
		-- The Nation of Kul Tiras
		[46728] = "questobjective|22.8 24.7|The Nation of Kul Tiras|[Jaina Proudmoore]",
		[59641] = "questobjective|22.8 24.7|The Nation of Kul Tiras|[Jaina Proudmoore]",
	},
}


-- Quest Objective Steps

--[[
	Data Structure

	[MapID] = {
		[QuestID] = "Icon|Coordinates|Title|Objective", -- Quest Name
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

	Title: Quest Name

	Objective: Objective text to match, excluding "0/X"
]]--

Data.ObjectiveSteps = {
	-- Zereth Mortis
	[1970] = {
		[64889] = {
			"questobjective|48.43 26.38|Match Made in Zereth Mortis|Ascend to Primus Locus",
			"questobjective|47.95 27.9|Match Made in Zereth Mortis|Ascend to Secundus Locus",
			"questobjective|51.91 27.11|Match Made in Zereth Mortis|Ascend to Tertius Locus",
			"questobjective|48.51 29.67|Match Made in Zereth Mortis|Ascend to Quartus Locus",
			"questobjective|50.77 32.55|Match Made in Zereth Mortis|Ascend to Quintus Locus",
			"questobjective|48.71 31.97|Match Made in Zereth Mortis|Ascend to Ultimus Locus",
		},
	},
}