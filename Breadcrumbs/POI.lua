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
		"POI/Alchemy|Elric Whalgrene|alliance alchemy|74.2 6.54|[Alchemy Trainer]",
		"POI/Blacksmithing|Grix \"Ironfists\" Barlow|alliance blacksmithing|73.4 8.46|[Blacksmithing Trainer]",
		"POI/Enchanting|Emily Fairweather|alliance enchanting|74.03 11.55|[Enchanting Trainer]",
		"POI/Engineering|Layla Evenkeel|alliance engineering|77.62 14.33|[Engineering Trainer]",
		"POI/Herbalism|Declan Senal|alliance herbalism|70.8 5.4|[Herbalism Trainer]",
		"POI/Inscription|Zooey Inksprocket|alliance inscription|73.39 6.33|[Inscription Trainer]",
		"POI/Jewelcrafting|Samuel D. Colton III|alliance jewelcrafting|75.2 9.88|[Jewelcrafting Trainer]",
		"POI/Leatherworking|Cassandra Brennor|alliance leatherworking|75.47 12.6|[Leatherworking Trainer]",
		"POI/Mining|Myra Cabot|alliance mining|75.22 7.56|[Mining Trainer]",
		"POI/Skinning|Camilla Darksky|alliance skinning|75.66 13.39|[Skinning Trainer]",
		"POI/Tailoring|Daniel Brineweaver|alliance tailoring|76.93 11.16|[Tailoring Trainer]",
		"POI/Cooking|\"Cap'n\" Byron Mehlsack|alliance|71.21 10.69|[Cooking Trainer]",
		"POI/Fishing|Alan Goyle|alliance|74.16 5.58|[Fishing Trainer]",
		"POI/Archaeology|Jane Hudson|alliance|68.33 8.47|[Archaeology Trainer]",
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
		"taxinode_neutral small|Aludane Whitecloud|1+|69.84 51.13|[Flight Master]",
		"groupfinder-icon-class-hunter|[Trueshot Lodge]|10+ hunter 40953|72.85 41.21|Eagle to Trueshot Lodge, Home of the Unseen Path",

		-- Profession Trainer
		"POI/Alchemy|The Agronomical Apothecary|10+ alchemy|41.44 31.75|[Alchemy]",
		{"POI/Blacksmithing|Tanks for Everything|10+ blacksmithing mining|45.1 28.3|[Blacksmithing and Mining]", "POI/Blacksmithing|Tanks for Everything|10+ blacksmithing -mining|45.1 28.3|[Blacksmithing]", "POI/Mining|Tanks for Everything|10+ mining -blacksmithing|45.1 28.3|[Mining]",},
		"POI/Enchanting|Simply Enchanting|10+ enchanting|38.64 40.93|[Enchanting]",
		"POI/Engineering|Like Clockwork|10+ engineering|38.75 25.38|[Engineering]",
		"POI/Herbalism|Dalaran Greenhouse|10+ herbalism|43 34.72|[Herbalism]",
		"POI/Inscription|The Scribe's Sacellum|10+ inscription|43.29 34.21|[Inscription]",
		"POI/Jewelcrafting|Cartier & Co. Fine Jewelry|10+ jewelcrafting|39.74 34.84|[Jewelcrafting]",
		{"POI/Leatherworking|Legendary Leathers|10+ leatherworking skinning|35.41 29.02|[Leatherworking and Skinning]", "POI/Leatherworking|Legendary Leathers|leatherworking -skinning|35.41 29.02|[Leatherworking]", "POI/Skinning|Legendary Leathers|skinning -leatherworking|35.41 29.02|[Skinning]",},
		"POI/Tailoring|Talismanic Textiles|10+ tailoring|36.04 33.51|[Tailoring]",
		{"POI/Cooking|A Hero's Welcome|10+ alliance|40.07 65.98|[Cooking]", "POI/Cooking|The Filthy Animal|10+ horde|69.77 38.77|[Cooking]",},
		"POI/Fishing|Marcia Chase|10+|52.81 65.59|[Fishing Trainer]",
		"POI/Archaeology|Things of the Past|10+|41.26 25.36|[Archaeology]",
	},


	--[[ Legion Order Halls ]]--

	-- Death Knight - Acherus: The Ebon Hold - The Heart of Acherus
	[647] = {
		-- Rune Forge
		"upgradeitem-32x32|Rune Forge|deathknight|56.44 35.43",
		"upgradeitem-32x32|Rune Forge|deathknight|44.07 66.44",

		-- Work Order
		"poi-workorders small|Korgaz Deadaxe|10+ deathknight 44082|53.36 68.55|[Ebon Soldier Recruiter]",
	},

	-- Death Knight - Acherus: The Ebon Hold - Hall of Command
	[648] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|deathknight|24.73 33.7",

		-- Flight Master
		"taxinode_neutral small|Grimwing|deathknight|25.49 28.81|[Flight Master]",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|deathknight|50.3 50.8",

		-- Research
		"class small|Archivist Zubashi|10+ deathknight +43268|47.76 53.77|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Dark Summoner Marogh|10+ deathknight +43266|41.05 74.02|[Risen Horde Recruiter]",
	},

	-- Demon Hunter - The Fel Hammer - Upper Command Center
	[720] = {
		-- Portal
		"poi-rift1|[Dalaran]|10+ demonhunter 42872|59.28 91.73|Illidari Gateway",
		"poi-rift1|[Dalaran]|10+ demonhunter 42872|58.37 16.48|Illidari Gateway",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|demonhunter|58.92 53.9",

		-- Work Order
		"poi-workorders small|Battlelord Gaardoun|10+ demonhunter +42679|56.18 54.27|[Ashtongue Captain]",
	},

	-- Demon Hunter - The Fel Hammer - Lower Command Center
	[721] = {
		-- Research
		"class small|Loramus Thalipedes|10+ demonhunter +42683|55.2 63.2|[Class Hall Upgrades]",
	},

	-- Druid - The Dreamgrove
	[747] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|55.4 22.06",
		"POI/Portal|Portal to Dalaran|druid|56.5 43.1",

		-- Flight Master
		"taxinode_neutral small|Danise Satargazer|druid|61.74 33.99|[Flight Master]",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|druid|52.48 50.82",

		-- Research
		"class small|Leafbeard the Storied|10+ druid +42588|32.77 29.34|[Ancient of Lore]",

		-- Work Order
		"poi-workorders small|Sister Lillith|10+ druid +42585|36.31 25.35|[Recruiter]",
		"poi-workorders small|Yaris Darkclaw|10+ druid +40654|38.48 34.2|[Recruiter]",
	},

	-- Hunter - Trueshot Lodge
	[739] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|hunter|48.63 43.49",

		-- Flight Master
		"taxinode_neutral small|Odan Battlebow|hunter|35.82 27.61|[Flight Master]",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|hunter|42.4 46.68",

		-- Research
		"class small|Survivalist Bahn|10+ hunter +42526|58.68 51.13|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Lenara|10+ hunter +42524|42.85 37.7|[Recruiter]",
		"poi-workorders small|Sampson|10+ hunter +42134|57.73 32.62|[Recruiter]",
	},

	-- Mage - Hall of the Guardian - The Guardian's Library
	[735] = {},

	-- Mage - Hall of the Guardian
	[734] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|mage|57.4 90.3",

		-- Teleportation Nexus
		"POI/Portal|Teleportation Nexus: Azsuna|mage research:386|55.04 39.54",
		"POI/Portal|Teleportation Nexus: Val'sharah|mage research:386|66.77 46.73",
		"POI/Portal|Teleportation Nexus: Highmountain|mage research:386|54.64 44.59",
		"POI/Portal|Teleportation Nexus: Stormheim|mage research:386|67.18 41.58",
		"POI/Portal|Teleportation Nexus: Suramar|mage research:386|60.4 50.6",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|mage|81.7 61.4",

		-- Research
		"class small|Chronicler Elrianne|10+ mage +42696|74.91 28.91|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Archmage Omniara|10+ mage +42127|87.88 47.43|[Recruiter]",
		"poi-workorders small|Grand Conjurer Mimic|10+ mage +44098|47.78 32.15|[Mage Recruiter Extraordinaire]",
	},

	-- Monk - Wandering Isle
	[709] = {
		-- Scouting Map
		{"ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk -41946 -42191|52.9 60.3", "ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk +41946 -42191|52.9 60.3||Tianji|[Ox Troop Trainer]", "ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk 41946 +42191|52.9 60.3||Number Nine Jia|[Class Hall Upgrades]||Tianji|[Ox Troop Trainer]",},

		-- Work Order
		"poi-workorders small|Gin Lai|10+ monk 43319|54.44 57.16|[Tiger Troop Trainer]",
	},

	-- Paladin - Sanctum of Light
	[24] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|paladin|37.59 64.09",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|paladin|53.5 78.7",

		-- Research
		"class small|Sir Alamande Graythorn|10+ paladin +42850|39.89 56.56|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Commander Ansela|10+ paladin +42848|53.27 56.21|[Silver Hand Recruiter]",
		"poi-workorders small|Commander Born|10+ paladin +43494|58.92 39.04|[Silver Hand Officer Recruiter]",
	},

	-- Priest - Netherlight Temple
	[702] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|1+|49.8 80.7",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|priest|49.84 47.37",

		-- Research
		"class small|Archon Torias|10+ priest +43277|55.97 40.67|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Grand Anchorite Gesslar|10+ priest +43275|40.92 27.63|[Recruiter]",
	},

	-- Rogue - The Hall of Shadows
	[626] = {
		-- Knocker
		"poi-door-up small|Knocker|rogue|29.58 21.84|[Exit to Tanks for Everything]",
		"poi-door-up small|Knocker|rogue|39.61 21.42|[Exit to One More Glass]",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|rogue|36.71 45.54",

		-- Research
		"class small|Winstone Wolfe|10+ rogue +43015|46.02 69.16|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Lonika Stillblade|10+ rogue +43013|31.92 26.73|[Rogue Academy Proprietor]",
		"poi-workorders small|Yancey Grillsen|10+ rogue +43852|48.24 41.34|[Bloodsail Recruiter]",
	},

	-- Shaman - The Heart of Azeroth
	[726] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|shaman|29.8 51.95",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|shaman|33.93 59.55",

		-- Research
		"class small|Journeyman Goldmine|10+ shaman +41740|33.12 57.57|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Summoner Morn|10+ shaman +42142|30.51 58.77|[Elemental Summoner]",
		"poi-workorders small|Felinda Frye|10+ shaman +44465|29.25 42.75|[Earthwarden Recruiter]",
	},

	-- Warlock - Dreadscar Rift
	[717] = {
		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Dreadscar Battle Plan|warlock|66.92 48.62",

		-- Research
		"class small|Archivist Melinda|10+ warlock +42601|55.35 41.03|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Imp Mother Dyala|10+ warlock +41797|66.6 31.1|[Recruiter]",
		"poi-workorders small|Jared|10+ warlock +41798|61.47 51.8|[Recruiter]",
	},

	-- Warrior - Skyhold
	[695] = {
		-- Stormflight Master
		"taxinode_neutral small|Aerylia|warrior|58.35 24.93|[Stormflight Master]",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Eye of Odyn|warrior|59.22 12.52",

		-- Research
		"class small|Einar the Runecaster|10+ warrior +42611|46.53 28.9|[Class Hall Upgrades]",

		-- Work Order
		"poi-workorders small|Captain Hjalmar Stahlstrom|10+ warrior +42609|62.34 15.09|[Recruiter]",
		"poi-workorders small|Savyn Valorborn|10+ warrior +43975|55.96 15.01|[Recruiter]",
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
		"taxinode_neutral small|Windtamer Nalt|1+|44.74 38.55|[Flight Master]",

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
		"POI/Portal|Portal to Ashran|45+ horde garrison:3|75.2 48.4",
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
		"POI/Portal|Temple of the Moon|alliance|43 74",

		-- Profession
		"POI/Alchemy|Ainethil|alliance alchemy|53.91 38.52|[Alchemy Trainer]",
		"POI/Engineering|Tana Lentner|alliance engineering|49.62 32.37|[Engineering Trainer]",
		"POI/Cooking|Alegorn|alliance|49.89 36.63|[Cooking Trainer]",
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


	--[[ Elwynn Forest ]]--

	-- Stormwind
	[84] = {
		-- Portal
		"POI/Portal|The Eastern Earthshrine|30+ alliance|74.85 17.65",
		{"POI/Portal|Portal to Darnassus|49- alliance|23.86 56.09", "POI/Portal|Portal to Darkshore|50+ alliance|23.86 56.09",},
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