local _, Data = ...


-- Quest Objectives

--[[
	Data Structure

	[MapID] = {
		[QuestID] = "Icon|Coordinates|Title|Description|Description|...", -- Quest Name
	},

	Icon: Texture or Atlas to use as the pin's icon (use "questobjective" for a yellow dot)
	https://www.townlong-yak.com/framexml/live/Helix/AtlasInfo.lua
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
	
	--[[ Maldraxxus ]]--

	[1536] = {
		[58619] = "questturnin|43.08 25.1|Read Between the Lines",
		[61095] = "questturnin|50.76 53.39|Supplies from The Undying Army", -- This quest is hidden on the world map normally for some reason
	},


	--[[ Legion Order Halls ]]--

	-- Monk - Wandering Isle
	[709] = {
		[41728] = "questobjective|47.16 47.75|The Defense of Tian Monastery|[Tak-Tak]",
	},


	--[[ Azsuna ]]--

	-- Nar'thalas Academy
	[631] = {
		[37468] = "questturnin|53.38 47.57|Into the Academy",
	},


	--[[ Val'sharah ]]--

	[641] = {
		[38691] = "poi-door-left|38.88 53.05|Entrance to Ravencrest Mausoleum",
	},


	--[[ Highmountain ]]--

	-- Thunder Totem - Hall of Chieftains
	[652] = {
		[38907] = "questturnin|54.81 63.18|Keepers of the Hammer",
		[39989] = "questturnin|54.81 63.18|Keepers of the Hammer",
	},


	--[[ Stormheim ]]--

	-- Stormheim
	[634] = {
		[38059] = {
			"questobjective|30.26 53|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|28.22 52.93|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|28.54 55.38|Pins and Needles|[7th Legion Dragoon]",
		},
	},

	-- Stormscale Cavern
	[636] = {
		[38059] = {
			"questobjective|69.6 65.77|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|45.19 66.93|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|26.71 65.56|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|25.55 47.37|Pins and Needles|[7th Legion Dragoon]",
			"questobjective|54.21 31.96|Pins and Needles|[7th Legion Dragoon]",
		},
	},


	--[[ Broken Shore ]]--

	[646] = {
		[46499] = "questobjective|43.33 31.39|Spiders, Huh?|[Spider-Covered Treasure Chest]",
		[46501] = "questobjective|49.7 46.7|Grave Robbin'|[Dusty Treasure Chest]",
		[46509] = "questobjective|67.61 16.16|Tomb Raidering|[Grandiose Treasure Chest]",
		[46510] = "questobjective|54.69 77.89|Ship Graveyard|[Sunken Treasure Chest]",
		[46511] = "questobjective|75.75 21.7|We're Treasure Hunters|[Sandy Treasure Chest]",
	},


	--[[ The Jade Forest ]]--

	[371] = {
		[41729] = {
			"questobjective|38.99 23.24|Slowing the Spread|[Fel Spreader]",
			"questobjective|41.62 23.75|Slowing the Spread|[Fel Spreader]",
			"questobjective|41.39 27.36|Slowing the Spread|[Fel Spreader]",
		},
	},


	--[[ Azshara ]]--

	[76] = {
		[14391] = {
			"questobjective:override|27.1 40.86|Turning the Tables|[Portal to Xylem's Retreat]",
			"questobjective:override|22.46 43.58|Turning the Tables|[Portal to Arcane Pinnacle]",
		},
	},


	--[[ Elwynn Forest ]]--

	-- Stormwind
	[84] = {
		[46728] = "questobjective|22.8 24.7|The Nation of Kul Tiras|[Jaina Proudmoore]",
		[59641] = "questobjective|22.8 24.7|The Nation of Kul Tiras|[Jaina Proudmoore]",
	},


	--[[ Dun Morogh ]]--

	[27] = {
		[25998] = "questobjective:override|75.22 52.77|Get to the Airfield|[Mathel's Flying Machine]",
		[26094] = "questobjective|77.14 18.52|Striking Back|[Repaired Bomber]",
		[26112] = "questobjective:override|75.94 16.81|Demanding Answers|[Rixa's Flying Machine]",
	},


	--[[ Teldrassil ]]--

	-- Teldrassil
	[57] = {
		[931] = {
			"questturnin|59.94 59.77|The Shimmering Frond|[green]You will be able to get the follow-up quest [The Sprouted Fronds] if you turn in this quest here.]",
			"services-icon-warning:super|43.9 44|[red]Warning]|[red]You might not want to turn in [The Shimmering Frond] here!]||\"Due to a bug, you will only be able to get the follow-up quest [The Sprouted Fronds] if you turn in the quest at Lake Al'ameth instead.\"",
		},
	},


	--[[ Azuremyst Isle ]]--

	-- Stillpine Hold
	[99] = {
		[9573] = "questobjective|38.49 52.89|Chieftain Oomooroo|[Chieftain Oomooroo]",
		[9565] = "questturnin|65.18 30.89|Search Stillpine Hold",
	},

}


-- --------------------------------------------------


-- Quest Objective Steps

--[[
	Data Structure

	[MapID] = {
		[QuestID] = "Icon|Coordinates|Title|Objective|Description", -- Quest Name
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

	Objective: Objective text to match, excluding "0/X" OR item:id:n

	Description: Optional description text, only used for items
]]--

Data.ObjectiveSteps = {
	
	--[[ Thaldraszus ]]--

	[2025] = {
		[67079] = "questobjective|57.81 53.64|Hard Lock Life|Primary Security Disc",
	},

	
	--[[ Ohn'ahran Plains ]]--

	[2023] = {
		[66658] = {
			"questobjective|40.08 58.36|The Nokhud Offensive: Founders Keepers|Place Teera's Bow",
			"questobjective|39.59 59.07|The Nokhud Offensive: Founders Keepers|Place Maruuk's Spear",
		},
	},

	
	--[[ Zereth Mortis ]]--

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


	--[[ Redridge Mountains ]]--

	[49] = {
		[26646] = "questobjective|69.52 76.31|Prisoners of War|item:59261|Blackrock Holding Pen Key",
	},


	--[[ Dun Morogh ]]--

	-- Gnomeregan
	[30] = {
		[27635] = "questobjective|58.81 81.71|Decontamination|Decontamination Process started",
		[27674] = "questobjective|67.3 84.15|To the Surface|Speak to Torben Zapblast",
	},

	-- The Grizzled Den
	[29] = {
		[313] = {
			"questobjective|51.83 48.37|Forced to Watch from Afar|Convey orders to Mountaineer Dunstan",
			"questobjective|60.28 56.21|Forced to Watch from Afar|Convey orders to Mountaineer Lewin",
			"questobjective|61.54 22.27|Forced to Watch from Afar|Convey orders to Mountaineer Valgrum",
		},
	},

	
	--[[ Loch Modan ]]--

	[48] = {
		[13650] = {
			"questobjective|70.69 67.59|Keep Your Hands Off The Goods!|Artifact of the Broken Tablet Inspected",
			"questobjective|72.72 65.47|Keep Your Hands Off The Goods!|Artifact of the Overdressed Woman Inspected",
		},
	},


	--[[ Teldrassil ]]--

	-- Ban'ethil Barrow Den - Lower Den
	[61] = {
		[483] = {
			"questobjective|64.48 19.59|The Relics of Wakening|Raven Claw Talisman",
			"questobjective|51.93 86.46|The Relics of Wakening|Black Feather Quill",
			"questobjective|49.84 36.54|The Relics of Wakening|Sapphire of Sky",
			"questobjective|54.88 75.42|The Relics of Wakening|Rune of Nesting",
		},
	},


	--[[ Elwynn Forest ]]--

	-- Stormwind City
	[84] = {
		[29412] = {
			"questobjective|43 58.5|Blown Away|Windswept Balloon",
			"questobjective|44.5 87.8|Blown Away|Windswept Balloon",
			"questobjective|46.2 64.8|Blown Away|Windswept Balloon",
			"questobjective|47.5 62.5|Blown Away|Windswept Balloon",
			"questobjective|47.5 84.1|Blown Away|Windswept Balloon",
			"questobjective|48.1 86|Blown Away|Windswept Balloon",
			"questobjective|48.5 76.5|Blown Away|Windswept Balloon",
			"questobjective|48.8 89.7|Blown Away|Windswept Balloon",
			"questobjective|49.5 79.9|Blown Away|Windswept Balloon",
			"questobjective|50.9 43.5|Blown Away|Windswept Balloon",
			"questobjective|51 84.5|Blown Away|Windswept Balloon",
			"questobjective|51.3 88.8|Blown Away|Windswept Balloon",
			"questobjective|52.5 62.8|Blown Away|Windswept Balloon",
			"questobjective|52.6 82.7|Blown Away|Windswept Balloon",
			"questobjective|52.7 77.1|Blown Away|Windswept Balloon",
			"questobjective|55.2 58.6|Blown Away|Windswept Balloon",
			"questobjective|56.1 44.5|Blown Away|Windswept Balloon",
			"questobjective|56.5 63.5|Blown Away|Windswept Balloon",
			"questobjective|58 43.5|Blown Away|Windswept Balloon",
			"questobjective|59.7 35.9|Blown Away|Windswept Balloon",
			"questobjective|59.8 68.3|Blown Away|Windswept Balloon",
			"questobjective|60.6 73.6|Blown Away|Windswept Balloon",
			"questobjective|61 42.9|Blown Away|Windswept Balloon",
			"questobjective|61.5 33.5|Blown Away|Windswept Balloon",
			"questobjective|61.5 66.2|Blown Away|Windswept Balloon",
			"questobjective|61.7 77|Blown Away|Windswept Balloon",
			"questobjective|61.9 51.5|Blown Away|Windswept Balloon",
			"questobjective|62.6 76.5|Blown Away|Windswept Balloon",
			"questobjective|62.9 40.5|Blown Away|Windswept Balloon",
			"questobjective|63 29|Blown Away|Windswept Balloon",
			"questobjective|63 68.8|Blown Away|Windswept Balloon",
			"questobjective|63.1 28.4|Blown Away|Windswept Balloon",
			"questobjective|63.1 41.9|Blown Away|Windswept Balloon",
			"questobjective|63.5 65.6|Blown Away|Windswept Balloon",
			"questobjective|64.5 38.9|Blown Away|Windswept Balloon",
			"questobjective|64.6 44.7|Blown Away|Windswept Balloon",
			"questobjective|64.6 44.7|Blown Away|Windswept Balloon",
			"questobjective|64.6 68.3|Blown Away|Windswept Balloon",
			"questobjective|64.8 51|Blown Away|Windswept Balloon",
			"questobjective|64.9 76.6|Blown Away|Windswept Balloon",
			"questobjective|65.7 46.5|Blown Away|Windswept Balloon",
			"questobjective|66 33.5|Blown Away|Windswept Balloon",
			"questobjective|66.6 39.5|Blown Away|Windswept Balloon",
			"questobjective|66.8 38.8|Blown Away|Windswept Balloon",
			"questobjective|68 44.5|Blown Away|Windswept Balloon",
			"questobjective|69.8 43.5|Blown Away|Windswept Balloon",
			"questobjective|70.5 57.5|Blown Away|Windswept Balloon",
			"questobjective|71.6 47.7|Blown Away|Windswept Balloon",
			"questobjective|72.8 67.9|Blown Away|Windswept Balloon",
			"questobjective|72.9 61.6|Blown Away|Windswept Balloon",
			"questobjective|73.6 54.6|Blown Away|Windswept Balloon",
			"questobjective|74 45.2|Blown Away|Windswept Balloon",
			"questobjective|74.2 49.4|Blown Away|Windswept Balloon",
			"questobjective|75.5 56.5|Blown Away|Windswept Balloon",
			"questobjective|75.5 64.5|Blown Away|Windswept Balloon",
			"questobjective|76.2 61.5|Blown Away|Windswept Balloon",
			"questobjective|79.6 37.9|Blown Away|Windswept Balloon",
			"questobjective|81.6 41.5|Blown Away|Windswept Balloon",
		},
	},


	--[[ Durotar ]]--

	-- Orgrimmar
	[85] = {
		[29401] = {
			"questobjective|70.5 10.8|Blown Away|Windswept Balloon",
			"questobjective|66.8 13.3|Blown Away|Windswept Balloon",
			"questobjective|66.5 13.7|Blown Away|Windswept Balloon",
			"questobjective|64.8 17.5|Blown Away|Windswept Balloon",
			"questobjective|65.8 23.9|Blown Away|Windswept Balloon",
			"questobjective|63.7 23.5|Blown Away|Windswept Balloon",
			"questobjective|68.5 30.1|Blown Away|Windswept Balloon",
			"questobjective|68.1 36.6|Blown Away|Windswept Balloon",
			"questobjective|71.5 35.8|Blown Away|Windswept Balloon",
			"questobjective|66.7 39.5|Blown Away|Windswept Balloon",
			"questobjective|70.9 48.1|Blown Away|Windswept Balloon",
			"questobjective|68.5 50.5|Blown Away|Windswept Balloon",
			"questobjective|60.5 52.1|Blown Away|Windswept Balloon",
			"questobjective|58.6 49.4|Blown Away|Windswept Balloon",
			"questobjective|58.5 49.9|Blown Away|Windswept Balloon",
			"questobjective|53.9 46.3|Blown Away|Windswept Balloon",
			"questobjective|52.2 39.5|Blown Away|Windswept Balloon",
			"questobjective|53.2 33.1|Blown Away|Windswept Balloon",
			"questobjective|50.2 49.8|Blown Away|Windswept Balloon",
			"questobjective|52.5 49.5|Blown Away|Windswept Balloon",
			"questobjective|55.1 53|Blown Away|Windswept Balloon",
			"questobjective|56.9 57.5|Blown Away|Windswept Balloon",
			"questobjective|56.7 62.7|Blown Away|Windswept Balloon",
			"questobjective|59 63.4|Blown Away|Windswept Balloon",
			"questobjective|57 65.3|Blown Away|Windswept Balloon",
			"questobjective|53.6 62.9|Blown Away|Windswept Balloon",
			"questobjective|53.8 65.5|Blown Away|Windswept Balloon",
			"questobjective|52.5 66|Blown Away|Windswept Balloon",
			"questobjective|52.5 68.9|Blown Away|Windswept Balloon",
			"questobjective|50.1 68.7|Blown Away|Windswept Balloon",
			"questobjective|52.4 73.8|Blown Away|Windswept Balloon",
			"questobjective|53.5 76.5|Blown Away|Windswept Balloon",
			"questobjective|52.7 79.7|Blown Away|Windswept Balloon",
			"questobjective|53.7 82.5|Blown Away|Windswept Balloon",
			"questobjective|53.6 83.7|Blown Away|Windswept Balloon",
			"questobjective|50 84.8|Blown Away|Windswept Balloon",
			"questobjective|50 82.5|Blown Away|Windswept Balloon",
			"questobjective|49.5 77.5|Blown Away|Windswept Balloon",
			"questobjective|47.55 81.8|Blown Away|Windswept Balloon",
			"questobjective|40 39.6|Blown Away|Windswept Balloon",
			"questobjective|40.1 43.3|Blown Away|Windswept Balloon",
			"questobjective|35.8 49.6|Blown Away|Windswept Balloon",
			"questobjective|42.1 52.5|Blown Away|Windswept Balloon",
			"questobjective|42.8 60.6|Blown Away|Windswept Balloon",
			"questobjective|38.5 86.7|Blown Away|Windswept Balloon",
			"questobjective|40.5 80.7|Blown Away|Windswept Balloon",
			"questobjective|40.5 71.8|Blown Away|Windswept Balloon",
			"questobjective|37.5 77.6|Blown Away|Windswept Balloon",
			"questobjective|34.8 73.25|Blown Away|Windswept Balloon",
			"questobjective|35 67.4|Blown Away|Windswept Balloon",
			"questobjective|31.5 68.6|Blown Away|Windswept Balloon",
			"questobjective|30.8 61.5|Blown Away|Windswept Balloon",
			"questobjective|25.75 61.55|Blown Away|Windswept Balloon",
		},
	},
	
}