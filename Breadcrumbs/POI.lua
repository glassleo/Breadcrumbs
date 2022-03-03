local _, Data = ...

-- Points of Interest

--[[
	Data Structure

	[MapID] = {
		"Texture|Title|Requirements|Coordinates|Tooltip|Tooltip|Tooltip|...", -- Comments
	},
]]--

Data.POI = {

	--[[ Tiragarde Sound ]]--

	-- Boralus
	[1161] = {
		-- Portal
		-- To do: Add Nazjatar portal
		"POI/Portal|Sanctum of the Sages|10+ alliance -kultiran 47186|70.52 17.28",
		"POI/Portal|Sanctum of the Sages|10+ alliance kultiran|70.52 17.28",

		-- Scrapper
		"poi-scrapper|Scrap-O-Matic 1000|alliance|77.13 16.31",

		-- Profession Trainer
		"POI/Alchemy|[Alchemy Trainer]|alliance alchemy|74.2 6.54|Elric Whalgrene",
		"POI/Blacksmithing|[Blacksmithing Trainer]|alliance blacksmithing|73.4 8.46|Grix \"Ironfists\" Barlow",
		"POI/Enchanting|[Enchanting Trainer]|alliance enchanting|74.03 11.55|Emily Fairweather",
		"POI/Engineering|[Engineering Trainer]|alliance engineering|77.62 14.33|Layla Evenkeel",
		"POI/Herbalism|[Herbalism Trainer]|alliance herbalism|70.8 5.4|Declan Senal",
		"POI/Inscription|[Inscription Trainer]|alliance inscription|73.39 6.33|Zooey Inksprocket",
		"POI/Jewelcrafting|[Jewelcrafting Trainer]|alliance jewelcrafting|75.2 9.88|Samuel D. Colton III",
		"POI/Leatherworking|[Leatherworking Trainer]|alliance leatherworking|75.47 12.6|Cassandra Brennor",
		"POI/Mining|[Mining Trainer]|alliance mining|75.22 7.56|Myra Cabot",
		"POI/Skinning|[Skinning Trainer]|alliance skinning|75.66 13.39|Camilla Darksky",
		"POI/Tailoring|[Tailoring Trainer]|alliance tailoring|76.93 11.16|Daniel Brineweaver",
		"POI/Cooking|[Cooking Trainer]|alliance|71.21 10.69|\"Cap'n\" Byron Mehlsack",
		"POI/Fishing|[Fishing Trainer]|alliance|74.16 5.58|Alan Goyle",
		"POI/Archaeology|[Archaeology Trainer]|alliance|68.33 8.47|Jane Hudson",
	},


	--[[ Dalaran, Broken Isles ]]--

	-- Dalaran
	[627] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|39.55 63.19",
		"POI/Portal|Portal to Orgrimmar|horde|55.31 24.02",
		"groupfinder-icon-class-demonhunter|[The Fel Hammer]|10+ demonhunter 42872|97.5 68.73|Gateway to the Fel Hammer in Mardum, Home of the Illidari",
		"groupfinder-icon-class-rogue|[Hall of Shadows]|10+ rogue 40832|46.8 25.4|Home of the Uncrowned",

		-- Flight Master
		"taxinode_neutral small|[Flight Master]|1+|69.84 51.13|Aludane Whitecloud",
		"groupfinder-icon-class-hunter|[Trueshot Lodge]|10+ hunter 40953|72.85 41.21|Eagle to Trueshot Lodge, Home of the Unseen Path",

		-- Profession Trainer
		"POI/Alchemy|[Alchemy]|10+ alchemy|41.44 31.75|The Agronomical Apothecary",
		"POI/Blacksmithing|[Blacksmithing and Mining]|10+ blacksmithing mining|45.1 28.3|Tanks for Everything",
		"POI/Blacksmithing|[Blacksmithing]|10+ blacksmithing -mining|45.1 28.3|Tanks for Everything",
		"POI/Enchanting|[Enchanting]|10+ enchanting|38.64 40.93|Simply Enchanting",
		"POI/Engineering|[Engineering]|10+ engineering|38.75 25.38|Like Clockwork",
		"POI/Herbalism|[Herbalism]|10+ herbalism|43 34.72",
		"POI/Inscription|[Inscription]|10+ inscription|43.29 34.21|The Scribe's Sacellum",
		"POI/Jewelcrafting|[Jewelcrafting]|10+ jewelcrafting|39.74 34.84|Cartier & Co. Fine Jewelry",
		"POI/Leatherworking|[Leatherworking and Skinning]|10+ leatherworking skinning|35.41 29.02|Legendary Leathers",
		"POI/Leatherworking|[Leatherworking]|leatherworking -skinning|35.41 29.02|Legendary Leathers",
		"POI/Mining|[Mining]|10+ mining -blacksmithing|45.1 28.3|Tanks for Everything",
		"POI/Skinning|[Skinning]|skinning -leatherworking|35.41 29.02|Legendary Leathers",
		"POI/Tailoring|[Tailoring]|10+ tailoring|36.04 33.51|Talismanic Textiles",
		"POI/Cooking|[Cooking]|10+ alliance|40.07 65.98|A Hero's Welcome",
		"POI/Cooking|[Cooking]|10+ horde|69.77 38.77|The Filthy Animal",
		"POI/Fishing|[Fishing Trainer]|10+|52.81 65.59|Marcia Chase",
		"POI/Archaeology|[Archaeology]|10+|41.26 25.36|Things of the Past",
	},


	--[[ Legion Order Halls ]]--

	-- Death Knight - Acherus: The Ebon Hold - The Heart of Acherus
	[647] = {
		-- Teleport Pad
		"- link:648|[Hall of Command]|1+|33.2 35.3",

		-- Rune Forge
		"upgradeitem-32x32|Rune Forge|deathknight|56.44 35.43",
		"upgradeitem-32x32|Rune Forge|deathknight|44.07 66.44",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ deathknight 44082|53.36 68.55|Korgaz Deadaxe",
	},

	-- Death Knight - Acherus: The Ebon Hold - Hall of Command
	[648] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|deathknight|24.73 33.7",

		-- Teleport Pad
		"- link:647|[The Heart of Acherus]|1+|34.6 36.6",

		-- Flight Master
		"taxinode_neutral small|[Flight Master]|deathknight|25.49 28.81|Grimwing",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|deathknight|50.3 50.8",

		-- Research
		"class small|[Class Hall Upgrades]|10+ deathknight +43268|47.76 53.77|Archivist Zubashi",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ deathknight +43266|41.05 74.02|Dark Summoner Marogh",
	},

	-- Demon Hunter - The Fel Hammer - Upper Command Center
	[720] = {
		-- Portal
		"poi-rift1|[Dalaran]|10+ demonhunter 42872|59.28 91.73|Illidari Gateway",
		"poi-rift1|[Dalaran]|10+ demonhunter 42872|58.37 16.48|Illidari Gateway",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|demonhunter|58.92 53.9",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ demonhunter +42679|56.18 54.27|Battlelord Gaardoun",
	},

	-- Demon Hunter - The Fel Hammer - Lower Command Center
	[721] = {
		-- Research
		"class small|[Class Hall Upgrades]|10+ demonhunter +42683|55.2 63.2|Loramus Thalipedes",
	},

	-- Druid - The Dreamgrove
	[747] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|55.4 22.06",
		"POI/Portal|Portal to Dalaran|druid|56.5 43.1",

		-- Flight Master
		"taxinode_neutral small|[Flight Master]|druid|61.74 33.99|Danise Satargazer",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|druid|52.48 50.82",

		-- Research
		"class small|[Ancient of Lore]|10+ druid +42588|32.77 29.34|Leafbeard the Storied",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ druid +42585|36.31 25.35|Sister Lillith",
		"poi-workorders small|[Recruiter]|10+ druid +40654|38.48 34.2|Yaris Darkclaw",
	},

	-- Druid - Emerald Dreamway
	[715] = {
		-- Portal
		"- large|[The Dreamgrove]|druid|44.9 23.8",
		"- large|[Grizzly Hills]|druid|31.8 25",
		"- large|[Feralas]|druid|22.5 39.4",
		"- large|[Moonglade]|druid|26.2 82.2",
		"- large|[Duskwood]|druid|39.4 70.4",
		"- large|[The Hinterlands]|druid|49.1 63.9",
		"- large|[Mount Hyjal]|druid|53.1 52",
	},

	-- Hunter - Trueshot Lodge
	[739] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|hunter|48.63 43.49",

		-- Flight Master
		"taxinode_neutral small|[Flight Master]|hunter|35.82 27.61|Odan Battlebow",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|hunter|42.4 46.68",

		-- Research
		"class small|[Class Hall Upgrades]|10+ hunter +42526|58.68 51.13|Survivalist Bahn",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ hunter +42524|42.85 37.7|Lenara",
		"poi-workorders small|[Recruiter]|10+ hunter +42134|57.73 32.62|Sampson",
	},

	-- Mage - Hall of the Guardian - The Guardian's Library
	[735] = {},

	-- Mage - Hall of the Guardian
	[734] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|mage|57.4 90.3",

		-- Teleportation Nexus
		"POI/Portal|[Azsuna]|mage research:386|55.04 39.54|Teleportation Nexus",
		"POI/Portal|[Val'sharah]|mage research:386|66.77 46.73|Teleportation Nexus",
		"POI/Portal|[Highmountain]|mage research:386|54.64 44.59|Teleportation Nexus",
		"POI/Portal|[Stormheim]|mage research:386|67.18 41.58|Teleportation Nexus",
		"POI/Portal|[Suramar]|mage research:386|60.4 50.6|Teleportation Nexus",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|mage|81.7 61.4",

		-- Research
		"class small|[Class Hall Upgrades]|10+ mage +42696|74.91 28.91|Chronicler Elrianne",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ mage +42127|87.88 47.43|Archmage Omniara",
		"poi-workorders small|[Recruiter]|10+ mage +44098|47.78 32.15|Grand Conjurer Mimic",
	},

	-- Monk - Wandering Isle
	[709] = {
		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk -41946 -42191|52.9 60.3",
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk +41946 -42191|52.9 60.3||[Recruiter]|Tianji",
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk 41946 +42191|52.9 60.3||[Class Hall Upgrades]Number Nine Jia||[Recruiter]|Tianji",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ monk 43319|54.44 57.16|Gin Lai",
	},

	-- Paladin - Sanctum of Light
	[24] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|paladin|37.59 64.09",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|paladin|53.5 78.7",

		-- Research
		"class small|[Class Hall Upgrades]|10+ paladin +42850|39.89 56.56|Sir Alamande Graythorn",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ paladin +42848|53.27 56.21|Commander Ansela",
		"poi-workorders small|[Recruiter]|10+ paladin +43494|58.92 39.04|Commander Born",
	},

	-- Priest - Netherlight Temple
	[702] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|1+|49.8 80.7",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|priest|49.84 47.37",

		-- Research
		"class small|[Class Hall Upgrades]|10+ priest +43277|55.97 40.67|Archon Torias",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ priest +43275|40.92 27.63|Grand Anchorite Gesslar",
	},

	-- Rogue - The Hall of Shadows
	[626] = {
		-- Knocker
		"poi-door-up small|[Tanks for Everything]|rogue|29.58 21.84|Knocker",
		"poi-door-up small|[One More Glass]|rogue|39.61 21.42|Knocker",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|rogue|36.71 45.54",

		-- Research
		"class small|[Class Hall Upgrades]|10+ rogue +43015|46.02 69.16|Winstone Wolfe",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ rogue +43013|31.92 26.73|Lonika Stillblade",
		"poi-workorders small|[Recruiter]|10+ rogue +43852|48.24 41.34|Yancey Grillsen",
	},

	-- Shaman - The Heart of Azeroth
	[726] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|shaman|29.8 51.95",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|shaman|33.93 59.55",

		-- Research
		"class small|[Class Hall Upgrades]|10+ shaman +41740|33.12 57.57|Journeyman Goldmine",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ shaman +42142|30.51 58.77|Summoner Morn",
		"poi-workorders small|[Recruiter]|10+ shaman +44465|29.25 42.75|Felinda Frye",
	},

	-- Warlock - Dreadscar Rift
	[717] = {
		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Dreadscar Battle Plan|warlock|66.92 48.62",

		-- Research
		"class small|[Class Hall Upgrades]|10+ warlock +42601|55.35 41.03|Archivist Melinda",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ warlock +41797|66.6 31.1|Imp Mother Dyala",
		"poi-workorders small|[Recruiter]|10+ warlock +41798|61.47 51.8|Jared",
	},

	-- Warrior - Skyhold
	[695] = {
		-- Stormflight Master
		"taxinode_neutral small|[Stormflight Master]|warrior|58.35 24.93|Aerylia",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Eye of Odyn|warrior|59.22 12.52",

		-- Research
		"class small|[Class Hall Upgrades]|10+ warrior +42611|46.53 28.9|Einar the Runecaster",

		-- Recruiter
		"poi-workorders small|[Recruiter]|10+ warrior +42609|62.34 15.09|Captain Hjalmar Stahlstrom",
		"poi-workorders small|[Recruiter]|10+ warrior +43975|55.96 15.01|Savyn Valorborn",
	},


	--[[ Azsuna ]]--

	-- Azsuna
	[630] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|46.66 41.42",
		"POI/Portal|Portal to Orgrimmar|horde|46.67 41.3",
		"teleportationnetwork-32x32 small|Teleportation Nexus|mage research:386|57.95 15.15",
		"groupfinder-icon-class-warrior small|[Skyhold]|10+ warrior 40585|47.58 28.09|Entrance to Skyhold, Home of the Valarjar",
	},


	--[[ Val'sharah ]]--

	-- Val'sharah
	[641] = {
		-- Portal
		"teleportationnetwork-32x32 small|Teleportation Nexus|mage research:386|51.25 56.11",
		"teleportationnetwork-32x32 small|Teleportation Nexus|mage research:386|75.09 27.48",
	},


	--[[ Highmountain ]]--

	-- Highmountain
	[650] = {
		-- Portal
		"teleportationnetwork-32x32 small|Teleportation Nexus|mage research:386|31.41 63.81",
		"groupfinder-icon-class-warrior small|[Skyhold]|10+ warrior 40585|46.11 59.95|Entrance to Skyhold, Home of the Valarjar",
	},

	-- Thunder Totem
	[750] = {
		-- Flight Master
		"taxinode_neutral small|[Flight Master]|1+|44.74 38.55|Windtamer Nalt",

		-- Portal
		"groupfinder-icon-class-warrior|[Skyhold]|10+ warrior 40585 41359|39.83 41.97|Entrance to Skyhold, Home of the Valarjar",
		"groupfinder-icon-class-warrior|[Skyhold]|10+ warrior 40585 -41359|39.83 41.97|Entrance to Skyhold, Home of the Valarjar||\"Speak to {flightmaster} Windtamer Nalt if you cannot see the Gaze of Odyn\"",
	},

	-- Hall of Chieftains, Thunder Totem
	[652] = {},


	--[[ Stormheim ]]--

	-- Stormheim
	[634] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|1+|30.08 40.7",
		"teleportationnetwork-32x32 small|Teleportation Nexus|mage research:386|31.34 60.51",
		"groupfinder-icon-class-warrior small|[Skyhold]|10+ warrior 40585|60.17 52.23|Entrance to Skyhold, Home of the Valarjar",
	},


	--[[ Suramar ]]--

	-- Suramar
	[680] = {
		-- Portal
		"teleportationnetwork-32x32 small|Teleportation Nexus|mage research:386|33.42 50.41",
	},


	--[[ Frostfire Ridge ]]--

	-- Frostwall
	[590] = {
		-- Portal
		"POI/Portal|Portal to Ashran|horde garrison:3|75.2 48.4",
	},


	--[[ Grizzly Hills ]]--
	[116] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|50.32 29.2",
	},


	--[[ Teldrassil ]]--

	-- Teldrassil
	[57] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|55.03 93.71",
		"POI/Portal|Portal to Exodar|alliance|52.27 89.47",
	},

	-- Darnassus
	[89] = {
		-- Portal
		"POI/Portal|Portals to Exodar and Hellfire Peninsula|alliance|43 74",
	},


	--[[ Azuremyst Isle ]]--

	-- Azuremyst Isle
	[97] = {
		-- Portal
		"POI/Portal|Portal to Darnassus|alliance|20.4 54.18",
	},

	-- The Exodar
	[103] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|48.34 62.93",
	},


	--[[ Moonglade ]]--

	[80] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|68.11 60.28",
	},


	--[[ Feralas ]]--

	[69] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|51.34 10.6",
	},


	--[[ Mount Hyjal ]]--

	[198] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|59 26.24",
	},


	--[[ Orgrimmar ]]--

	[85] = {
		-- Portal
		"- large|[Cataclysm Portals]|horde|50.4 37.3|The Western Earthshrine",
		"POI/Portal|Portal to Undercity|49- horde|50.75 55.59",
		"POI/Portal|Portal to Tirisfal Glades|50+ horde|50.75 55.59",
		"POI/Portal|Portal to Tol Barad|30+ horde|47.39 39.26",
	},


	--[[ Elwynn Forest ]]--

	-- Stormwind
	[84] = {
		-- Portal
		"- large|[Cataclysm Portals]|alliance|74.85 17.65|The Eastern Earthshrine",
		"POI/Portal|Portal to Darnassus|49- alliance|23.86 56.09",
		"POI/Portal|Portal to Darkshore|50+ alliance|23.86 56.09",
	},

	--[[ Tirisfal Glades ]]--

	-- Undercity
	[90] = {
		-- Portal
		"POI/Portal|Portal to Hellfire Peninsula|10+ horde|85.27 17.05",

		-- Heirloom Vendor
		"timewalkingvendor-32x32|[Heirloom Vendor]|horde|78.14 76.3|Estelle Gendry",

		-- Profession Trainer
		"POI/Alchemy|[Alchemy Trainer]|5+ horde alchemy|47.77 73.32|Doctor Herbert Halsey",
		"POI/Blacksmithing|[Blacksmithing Trainer]|5+ horde blacksmithing|61.26 30.62|James Van Brunt",
		"POI/Enchanting|[Enchanting Trainer]|5+ horde enchanting|61.87 61.4|Lavinia Crowe",
		"POI/Engineering|[Engineering Trainer]|5+ horde engineering|76.13 74.03|Franklin Lloyd",
		"POI/Herbalism|[Herbalism Trainer]|5+ horde herbalism|54 49.54|Martha Alliestar",
		"POI/Inscription|[Inscription Trainer]|5+ horde inscription|61.05 57.95|Margaux Parchley",
		"POI/Jewelcrafting|[Jewelcrafting Trainer]|5+ horde jewelcrafting -mining|56.53 36.3|Neller Fayne",
		"POI/Jewelcrafting|[Jewelcrafting and Mining Trainers]|5+ horde jewelcrafting mining|56.3 36.91|Neller Fayne|Brom Killian",
		"POI/Leatherworking|[Leatherworking and Skinning Trainers]|5+ horde leatherworking skinning|70.16 58.29|Arthur Moore|Killian Hagey",
		"POI/Leatherworking|[Leatherworking Trainer]|5+ horde leatherworking -skinning|70.16 57.43|Arthur Moore",
		"POI/Mining|[Mining Trainer]|5+ horde mining -jewelcrafting|56.04 37.45|Brom Killian",
		"POI/Skinning|[Skinning Trainer]|5+ horde skinning -leatherworking|70.18 59.21|Killian Hagey",
		"POI/Tailoring|[Bandage Trainer]|5+ horde tailoring|73.15 55.16|Mary Edras",
		"POI/Tailoring|[Tailoring Trainer]|5+ horde tailoring|70.76 30.72|Josef Gregorian",
		"POI/Cooking|[Cooking Trainer]|5+ horde|62.15 44.9|Eunice Burch",
		"POI/Fishing|[Fishing Trainer]|5+ horde|80.7 31.27|Armand Cromwell",
		"POI/Archaeology|[Archaeology Trainer]|10+ horde|75.41 37.71|Adam Hossack",
	},

	-- Tirisfal Glades
	[18] = {
		-- Phases: 19 (before BfA), 1136 (BfA)

		-- Portal
		"POI/Portal|Portals to Orgrimmar and Stranglethorn Vale|horde phase:19|61.2 58.6",
		"POI/Portal|Portal to Howling Fjord|10+ horde phase:19|59.09 58.9",
	},


	--[[ Duskwood ]]--

	[47] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|46.57 35.63",
	},


	--[[ The Hinterlands ]]--

	[26] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|62.28 22.67",
	},

}