local _, Data = ...

-- Points of Interest

--[[
	Data Structure

	[MapID] = {
		"Texture:Size|Title|Requirements|Coordinates|Flags|Description/Tooltip1|Tooltip2|Tooltip3|...", -- Comments
	},


	Texture: Texture used as the pin icon
		texture			Atlas name or texture ID; or file name for a texture inside the Breadcrumbs/Textures directory

	Size: Optional flag to scale the pin icon; if omitted the normal size for POI pins is used (default: 25)
		objective		Scales the pin to the same size as a quest objective (default: 15)
		small			Scales the pin to the same size as a quest marker (default: 20)
		large			Scales the pin to be 1.5 times the size of a normal POI pin

	Title: Title of the POI

	Requirements: Conditions that must be met for the pin to be displayed
		Inherits all requirements from Quests, see Quests.lua

		mailbox			Only display this pin if the user has enabled the option to show mailboxes on the map

	Coordinates: Coordinates for the map pin(s)
		X Y				Coordinates for the map pin

	Flags: Additional optional flags
		tooltip			Gives the map pin a tooltip instead of a map label
		combo			Gives the map pin both a tooltip and a map label; with this flag Tooltip2 is used as the tooltip's title
		
		link:n			Pin becomes clickable to open map with ID n

	Description/Tooltip: Description text or tooltip lines
		{!}				Quest bang
		{n}				Texture/icon with ID n
		{atlas}			Atlas
		[text]			White text
		[color]text]	Colored text where color is either a hex (like ff0800) or a named color (spell, friendly, neutral, hostile, daily, poor, uncommon, rare, epic, legendary, artifact, heirloom)
]]--

Data.POI = {


	--[[ Oribos ]]--

	-- Ring of Transference
	[1671] = {
		-- Teleport Pad
		"teleportationnetwork-32x32:small|Ring of Fates|1+|49.52 60.92|link:1670",
		"teleportationnetwork-32x32:small|Ring of Fates|1+|55.66 51.62|link:1670",
		"teleportationnetwork-32x32:small|Ring of Fates|1+|49.55 42.33|link:1670",
		"teleportationnetwork-32x32:small|Ring of Fates|1+|43.4 51.59|link:1670",

		-- Heirloom Vendor
		"timewalkingvendor-32x32|[Heirloom Vendor]|1+|59.97 72|tooltip|Au'Dara",
	},

	-- Ring of Fates
	[1670] = {
		-- Portal
		"POI/Portal|Portal to Orgrimmar|horde 60151|20.85 54.83",
		"POI/Portal|Portal to Stormwind|alliance 60151|20.89 45.69",

		-- Teleport Pad
		"teleportationnetwork-32x32:small|Ring of Transference|1+|52.07 57.9|link:1671",
		"teleportationnetwork-32x32:small|Ring of Transference|1+|57.14 50.36|link:1671",
		"teleportationnetwork-32x32:small|Ring of Transference|1+|52.09 42.81|link:1671",
		"teleportationnetwork-32x32:small|Ring of Transference|1+|47.04 50.32|link:1671",

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|58.16 36.08",
		"mailbox:objective|Mailbox|mailbox|62.92 51.74",
		"mailbox:objective|Mailbox|mailbox|30.63 52.24",
		"mailbox:objective|Mailbox|mailbox|73.74 49.11",

		-- Item Upgrades
		"upgradeitem-32x32|[Item Upgrades]|60+|34.56 56.52|tooltip|Aggressor Zo'dash",

		-- Profession Trainer
		"POI/Alchemy|[Alchemy Trainer]|48+ alchemy|39.23 40.38|tooltip|Elixirist Au'pyr",
		"POI/Blacksmithing|[Blacksmithing Trainer]|48+ blacksmithing|40.48 31.5|tooltip|Smith Au'berk",
		"POI/Enchanting|[Enchanting Trainer]|48+ enchanting|48.41 29.44|tooltip|Imbuer Au'vresh",
		"POI/Engineering|[Engineering Trainer]|48+ engineering|38.06 44.66|tooltip|Machinist Au'gur",
		"POI/Herbalism|[Herbalism Trainer]|48+ herbalism|40.23 38.26|tooltip|Selector Au'mar",
		"POI/Inscription|[Inscription Trainer]|48+ inscription|36.52 36.7|tooltip|Scribe Au'tehshi",
		"POI/Jewelcrafting|[Jewelcrafting Trainer]|48+ jewelcrafting|35.2 41.35|tooltip|Appraiser Au'vesk",
		"POI/Leatherworking|[Leatherworking Trainer]|48+ leatherworking -skinning|42.27 26.58|tooltip|Tanner Au'qil",
		"POI/Leatherworking|[Leatherworking and Skinning Trainers]|48+ leatherworking skinning|42.14 27.31|tooltip|Tanner Au'qil|Flayer Au'khem",
		"POI/Mining|[Mining Trainer]|48+ mining|39.3 32.94|tooltip|Excavationist Au'fer",
		"POI/Skinning|[Skinning Trainer]|48+ skinning -leatherworking|42.13 28.08|tooltip|Flayer Au'khem",
		"POI/Tailoring|[Tailoring Trainer]|48+ tailoring|45.47 31.76|tooltip|Stitcher Au'phes",
		"POI/Cooking|[Cooking Trainer]|48+|46.82 22.66|tooltip|Chef Au'krut",
		"POI/Fishing|[Fishing Trainer]|48+|46.14 26.35|tooltip|Retriever Au'prin",
	},


	--[[ Zereth Mortis ]]--

	[1970] = {
		-- Protoform Synthesis
		"POI/ProtoformSynthesis|[Protoform Synthesis (Battle Pet)]|60+ 65419|60.53 59.39|tooltip|Allows you to gather schematics and craft battle pets with components found across Zereth Mortis.",
		"POI/ProtoformSynthesis|[Protoform Synthesis (Mount)]|60+ 65427|70.21 28.56|tooltip|Allows you to gather schematics and craft mounts with components found across Zereth Mortis.",
	},


	--[[ Tazavesih, the Veiled Market ]]--

	-- The Veiled Market
	[1989] = {
		-- Myza's Oasis Merchants
		"134062:objective|[Fine Cuisine]|1+|48.8 39.3|tooltip|Xy'tadir||Wants|{237358} [Kleia's Special Cake]|{3562479} [Plate of Ripe Purians]|{134051} [Stale Bread]",
		"133731:objective|[Fossil Collector]|1+|45.3 39.3|tooltip|Xy'zaro||Wants|{1325308} [Bones of Mortanis]|{970584} [Demon Skull]|{133731} [Dusty Skull]",
		"463479:objective|[Fancy Instruments]|1+|42.2 36.7|tooltip|Xy'har||Wants|{133841} [Common Drum]|{463479} [Harp of Marasmius]|{1928595} [Vulpera Flute]",
		"132913:objective|[Expert Tailor]|1+|44.6 27.8|tooltip|Xy'aqida||Wants|{1686583} [Bolt of Kyrian Brightweave]|{132906} [Bolt of Silk]|{132913} [Threadbare Cloth]",
		"975743:objective|[Magical Weapons]|1+|51.7 27.2|tooltip|Xy'jahid||Wants|{3308248} [Balanced Sword]|{133046} [Cracked Warhammer]|{3486356} [Perfect Replica of Remornia]",
		"463519:objective|[Precious Gemstones]|1+|51.9 32.8|tooltip|Xy'ghana||Wants|{237201} [Chunk of Jade]|{1990978} [Dull Opal]|{1995542} [Eye of Valinor]",
		"136240:objective|[Alchemist]|1+|46.2 35.7|tooltip|Xy'mal||Wants|{132380} [Damaged Flask]|{132378} [Potion of Invisibility]|{1385244} [Vial of Nurgash's Blood]",
		"133210:objective|[Exotic Spices]|1+|44.5 33.1|tooltip|Xy'nara||Wants|{1392949} [Aromatic Spices]|{2178530} [Cheap Spices]|{2178533} [Myza's Special Spice]",
		"134332:objective|[Rare Texts]|1+|45.7 30.7|tooltip|Xy'kitab||Wants|{133739} [A History of Maldraxxus]|{442732} [Denathrius' Private Diary]|{133740} [Worn Journal]",
		--"236572:objective|[Overpriced Art]|1+|36.6 32.9|tooltip|Xy'aro",
	},


	--[[ Bastion ]]--

	-- Elysian Hold - Archon's Rise
	[1707] = {
		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|48.64 58.21",
		"mailbox:objective|Mailbox|mailbox|24.62 32.17",
	},


	--[[ Tiragarde Sound ]]--

	-- Boralus
	[1161] = {
		-- Portal
		-- To do: Add Nazjatar portal
		"POI/Portal|Sanctum of the Sages|10+ alliance -kultiran 47186|70.52 17.28",
		"POI/Portal|Sanctum of the Sages|10+ alliance kultiran|70.52 17.28",

		-- Scrapper
		"poi-scrapper|[Scrap-O-Matic 1000]|alliance|77.13 16.31",

		-- Profession Trainer
		"POI/Alchemy|[Alchemy Trainer]|alliance alchemy|74.2 6.54|tooltip|Elric Whalgrene",
		"POI/Blacksmithing|[Blacksmithing Trainer]|alliance blacksmithing|73.4 8.46|tooltip|Grix \"Ironfists\" Barlow",
		"POI/Enchanting|[Enchanting Trainer]|alliance enchanting|74.03 11.55|tooltip|Emily Fairweather",
		"POI/Engineering|[Engineering Trainer]|alliance engineering|77.62 14.33|tooltip|Layla Evenkeel",
		"POI/Herbalism|[Herbalism Trainer]|alliance herbalism|70.8 5.4|tooltip|Declan Senal",
		"POI/Inscription|[Inscription Trainer]|alliance inscription|73.39 6.33|tooltip|Zooey Inksprocket",
		"POI/Jewelcrafting|[Jewelcrafting Trainer]|alliance jewelcrafting|75.2 9.88|tooltip|Samuel D. Colton III",
		"POI/Leatherworking|[Leatherworking Trainer]|alliance leatherworking|75.47 12.6|tooltip|Cassandra Brennor",
		"POI/Mining|[Mining Trainer]|alliance mining|75.22 7.56|tooltip|Myra Cabot",
		"POI/Skinning|[Skinning Trainer]|alliance skinning|75.66 13.39|tooltip|Camilla Darksky",
		"POI/Tailoring|[Tailoring Trainer]|alliance tailoring|76.93 11.16|tooltip|Daniel Brineweaver",
		"POI/Cooking|[Cooking Trainer]|alliance|71.21 10.69|tooltip|\"Cap'n\" Byron Mehlsack",
		"POI/Fishing|[Fishing Trainer]|alliance|74.16 5.58|tooltip|Alan Goyle",
		"POI/Archaeology|[Archaeology Trainer]|alliance|68.33 8.47|tooltip|Jane Hudson",
	},


	--[[ Dalaran, Broken Isles ]]--

	-- Dalaran
	[627] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|39.55 63.19",
		"POI/Portal|Portal to Orgrimmar|horde|55.31 24.02",
		"groupfinder-icon-class-demonhunter|[The Fel Hammer]|10+ demonhunter 42872|97.5 68.73|tooltip|Gateway to the Fel Hammer in Mardum, Home of the Illidari",
		"groupfinder-icon-class-rogue|[Hall of Shadows]|10+ rogue 40832|46.8 25.4|tooltip|Home of the Uncrowned",

		-- Flight Master
		"taxinode_neutral:small|Dalaran|1+|69.84 51.13",
		"groupfinder-icon-class-hunter|[Trueshot Lodge]|10+ hunter 40953|72.85 41.21|tooltip|Eagle to Trueshot Lodge, Home of the Unseen Path",

		-- Profession Trainer
		"POI/Alchemy|[Alchemy]|10+ alchemy|41.44 31.75|tooltip|The Agronomical Apothecary",
		"POI/Blacksmithing|[Blacksmithing and Mining]|10+ blacksmithing mining|45.1 28.3|tooltip|Tanks for Everything",
		"POI/Blacksmithing|[Blacksmithing]|10+ blacksmithing -mining|45.1 28.3|tooltip|Tanks for Everything",
		"POI/Enchanting|[Enchanting]|10+ enchanting|38.64 40.93|tooltip|Simply Enchanting",
		"POI/Engineering|[Engineering]|10+ engineering|38.75 25.38|tooltip|Like Clockwork",
		"POI/Herbalism|[Herbalism]|10+ herbalism|tooltip|43 34.72",
		"POI/Inscription|[Inscription]|10+ inscription|43.29 34.21|tooltip|The Scribe's Sacellum",
		"POI/Jewelcrafting|[Jewelcrafting]|10+ jewelcrafting|39.74 34.84|tooltip|Cartier & Co. Fine Jewelry",
		"POI/Leatherworking|[Leatherworking and Skinning]|10+ leatherworking skinning|35.41 29.02|tooltip|Legendary Leathers",
		"POI/Leatherworking|[Leatherworking]|leatherworking -skinning|35.41 29.02|tooltip|Legendary Leathers",
		"POI/Mining|[Mining]|10+ mining -blacksmithing|45.1 28.3|tooltip|Tanks for Everything",
		"POI/Skinning|[Skinning]|skinning -leatherworking|35.41 29.02|tooltip|Legendary Leathers",
		"POI/Tailoring|[Tailoring]|10+ tailoring|36.04 33.51|tooltip|Talismanic Textiles",
		"POI/Cooking|[Cooking]|10+ alliance|40.07 65.98|tooltip|A Hero's Welcome",
		"POI/Cooking|[Cooking]|10+ horde|69.77 38.77|tooltip|The Filthy Animal",
		"POI/Fishing|[Fishing Trainer]|10+|52.81 65.59|tooltip|Marcia Chase",
		"POI/Archaeology|[Archaeology]|10+|41.26 25.36|tooltip|Things of the Past",
	},


	--[[ Legion Order Halls ]]--

	-- Death Knight - Acherus: The Ebon Hold - The Heart of Acherus
	[647] = {
		-- Teleport Pad
		"-|Hall of Command|1+|33.2 35.3|link:648",

		-- Rune Forge
		"upgradeitem-32x32|Rune Forge|deathknight|56.44 35.43",
		"upgradeitem-32x32|Rune Forge|deathknight|44.07 66.44",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ deathknight 44082|53.36 68.55|tooltip|Korgaz Deadaxe",
	},

	-- Death Knight - Acherus: The Ebon Hold - Hall of Command
	[648] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|deathknight|24.73 33.7",

		-- Teleport Pad
		"-|The Heart of Acherus|1+|34.6 36.6|link:647",

		-- Flight Master
		"taxinode_neutral:small|Acherus: The Ebon Hold|deathknight|25.49 28.81",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|deathknight|50.3 50.8",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ deathknight +43268|47.76 53.77|tooltip|Archivist Zubashi",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ deathknight +43266|41.05 74.02|tooltip|Dark Summoner Marogh",
	},

	-- Demon Hunter - The Fel Hammer - Upper Command Center
	[720] = {
		-- Portal
		"poi-rift1|Dalaran|10+ demonhunter 42872|59.28 91.73|Illidari Gateway",
		"poi-rift1|Dalaran|10+ demonhunter 42872|58.37 16.48|Illidari Gateway",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|demonhunter|58.92 53.9",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ demonhunter +42679|56.18 54.27|tooltip|Battlelord Gaardoun",
	},

	-- Demon Hunter - The Fel Hammer - Lower Command Center
	[721] = {
		-- Research
		"class:small|[Class Hall Upgrades]|10+ demonhunter +42683|55.2 63.2|tooltip|Loramus Thalipedes",
	},

	-- Druid - The Dreamgrove
	[747] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|55.4 22.06",
		"POI/Portal|Portal to Dalaran|druid|56.5 43.1",

		-- Flight Master
		"taxinode_neutral:small|The Dreamgrove, Val'sharah|druid|61.74 33.99",

		-- Mailbox
		"mailbox:objective|Mailbox|druid mailbox|40.44 26.03",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|druid|52.48 50.82",

		-- Research
		"class:small|[Ancient of Lore]|10+ druid +42588|32.77 29.34|tooltip|Leafbeard the Storied",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ druid +42585|36.31 25.35|tooltip|Sister Lillith",
		"poi-workorders:small|[Recruiter]|10+ druid +40654|38.48 34.2|tooltip|Yaris Darkclaw",
	},

	-- Druid - Emerald Dreamway
	[715] = {
		-- Portal
		"-:large|The Dreamgrove|druid|44.9 23.8",
		"-:large|Grizzly Hills|druid|31.8 25",
		"-:large|Feralas|druid|22.5 39.4",
		"-:large|Moonglade|druid|26.2 82.2",
		"-:large|Duskwood|druid|39.4 70.4",
		"-:large|The Hinterlands|druid|49.1 63.9",
		"-:large|Mount Hyjal|druid|53.1 52",
	},

	-- Hunter - Trueshot Lodge
	[739] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|hunter|48.63 43.49",

		-- Flight Master
		"taxinode_neutral:small|Trueshot Lodge, Highmountain|hunter|35.82 27.61",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|hunter|42.4 46.68",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ hunter +42526|58.68 51.13|tooltip|Survivalist Bahn",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ hunter +42524|42.85 37.7|tooltip|Lenara",
		"poi-workorders:small|[Recruiter]|10+ hunter +42134|57.73 32.62|tooltip|Sampson",
	},

	-- Mage - Hall of the Guardian - The Guardian's Library
	[735] = {},

	-- Mage - Hall of the Guardian
	[734] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|mage|57.4 90.3",

		-- Teleportation Nexus
		"POI/Portal|Azsuna|mage research:386|55.04 39.54||Teleportation Nexus",
		"POI/Portal|Val'sharah|mage research:386|66.77 46.73||Teleportation Nexus",
		"POI/Portal|Highmountain|mage research:386|54.64 44.59||Teleportation Nexus",
		"POI/Portal|Stormheim|mage research:386|67.18 41.58||Teleportation Nexus",
		"POI/Portal|Suramar|mage research:386|60.4 50.6||Teleportation Nexus",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|mage|81.7 61.4",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ mage +42696|74.91 28.91|tooltip|Chronicler Elrianne",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ mage +42127|87.88 47.43|tooltip|Archmage Omniara",
		"poi-workorders:small|[Recruiter]|10+ mage +44098|47.78 32.15|tooltip|Grand Conjurer Mimic",
	},

	-- Monk - Wandering Isle
	[709] = {
		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk -41946 -42191|52.9 60.3",
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk +41946 -42191|52.9 60.3|combo||[Recruiter]|Tianji",
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|monk 41946 +42191|52.9 60.3|combo||[Class Hall Upgrades]|Number Nine Jia||[Recruiter]|Tianji",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ monk 43319|54.44 57.16|tooltip|Gin Lai",
	},

	-- Paladin - Sanctum of Light
	[24] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|paladin|37.62 64.08",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|paladin|53.5 78.7",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ paladin +42850|39.89 56.56|tooltip|Sir Alamande Graythorn",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ paladin +42848|53.27 56.21|tooltip|Commander Ansela",
		"poi-workorders:small|[Recruiter]|10+ paladin +43494|58.92 39.04|tooltip|Commander Born",
	},

	-- Priest - Netherlight Temple
	[702] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|1+|49.8 80.7",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|priest|49.84 47.37",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ priest +43277|55.97 40.67|tooltip|Archon Torias",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ priest +43275|40.92 27.63|tooltip|Grand Anchorite Gesslar",
	},

	-- Rogue - The Hall of Shadows
	[626] = {
		-- Knocker
		"poi-door-up:small|Tanks for Everything|rogue|29.58 21.84||Secret Exit",
		"poi-door-up:small|One More Glass|rogue|39.61 21.42||Secret Exit",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|rogue|36.71 45.54",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ rogue +43015|46.02 69.16|tooltip|Winstone Wolfe",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ rogue +43013|31.92 26.73|tooltip|Lonika Stillblade",
		"poi-workorders:small|[Recruiter]|10+ rogue +43852|48.24 41.34|tooltip|Yancey Grillsen",
	},

	-- Shaman - The Heart of Azeroth
	[726] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|shaman|29.8 51.95",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|shaman|33.93 59.55",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ shaman +41740|33.12 57.57|tooltip|Journeyman Goldmine",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ shaman +42142|30.51 58.77|tooltip|Summoner Morn",
		"poi-workorders:small|[Recruiter]|10+ shaman +44465|29.25 42.75|tooltip|Felinda Frye",
	},

	-- Warlock - Dreadscar Rift
	[717] = {
		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Dreadscar Battle Plan|warlock|66.92 48.62",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ warlock +42601|55.35 41.03|tooltip|Archivist Melinda",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ warlock +41797|66.6 31.1|tooltip|Imp Mother Dyala",
		"poi-workorders:small|[Recruiter]|10+ warlock +41798|61.47 51.8|tooltip|Jared",
	},

	-- Warrior - Skyhold
	[695] = {
		-- Stormflight Master
		"taxinode_neutral:small|Skyhold|warrior|58.35 24.93",

		-- Scouting Map
		"ShipMissionIcon-Bonus-MapBadge|Eye of Odyn|warrior|59.22 12.52",

		-- Research
		"class:small|[Class Hall Upgrades]|10+ warrior +42611|46.53 28.9|tooltip|Einar the Runecaster",

		-- Recruiter
		"poi-workorders:small|[Recruiter]|10+ warrior +42609|62.34 15.09|tooltip|Captain Hjalmar Stahlstrom",
		"poi-workorders:small|[Recruiter]|10+ warrior +43975|55.96 15.01|tooltip|Savyn Valorborn",
	},


	--[[ Azsuna ]]--

	-- Azsuna
	[630] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|46.66 41.42",
		"POI/Portal|Portal to Orgrimmar|horde|46.67 41.3",
		"teleportationnetwork-32x32:small|Teleportation Nexus|mage research:386|57.95 15.15",
		"groupfinder-icon-class-warrior:small|[Skyhold]|10+ warrior 40585 44060|47.45 28.22|tooltip|Entrance to Skyhold, Home of the Valarjar",
		"groupfinder-icon-class-warrior:small|[Skyhold]|10+ warrior 40585 -44060|47.45 28.22|tooltip|Entrance to Skyhold, Home of the Valarjar||\"Speak to {flightmaster} Dagrona if you cannot see the Gaze of Odyn\"",
	},


	--[[ Val'sharah ]]--

	-- Val'sharah
	[641] = {
		-- Portal
		"teleportationnetwork-32x32:small|Teleportation Nexus|mage research:386|51.25 56.11",
		"teleportationnetwork-32x32:small|Teleportation Nexus|mage research:386|75.09 27.48",
	},


	--[[ Highmountain ]]--

	-- Highmountain
	[650] = {
		-- Portal
		"teleportationnetwork-32x32:small|Teleportation Nexus|mage research:386|31.41 63.81",
		"groupfinder-icon-class-warrior:small|[Skyhold]|10+ warrior 40585|46.11 59.95|tooltip|Entrance to Skyhold, Home of the Valarjar",
	},

	-- Thunder Totem
	[750] = {
		-- Flight Master
		"taxinode_neutral:small|Thunder Totem, Highmountain|1+|44.74 38.55",

		-- Portal
		"groupfinder-icon-class-warrior|[Skyhold]|10+ warrior 40585 41359|39.83 41.97|tooltip|Entrance to Skyhold, Home of the Valarjar",
		"groupfinder-icon-class-warrior|[Skyhold]|10+ warrior 40585 -41359|39.83 41.97|tooltip|Entrance to Skyhold, Home of the Valarjar||\"Speak to {flightmaster} Windtamer Nalt if you cannot see the Gaze of Odyn\"",
	},

	-- Hall of Chieftains, Thunder Totem
	[652] = {},


	--[[ Stormheim ]]--

	-- Stormheim
	[634] = {
		-- Portal
		"POI/Portal|Portal to Dalaran|1+|30.08 40.7",
		"teleportationnetwork-32x32:small|Teleportation Nexus|mage research:386|31.34 60.51",
		"groupfinder-icon-class-warrior:small|[Skyhold]|10+ warrior 40585|60.17 52.23|tooltip|Entrance to Skyhold, Home of the Valarjar",
	},


	--[[ Suramar ]]--

	-- Suramar
	[680] = {
		-- Portal
		"teleportationnetwork-32x32:small|Teleportation Nexus|mage research:386|33.42 50.41",
	},


	--[[ Frostfire Ridge ]]--

	-- Frostwall
	[590] = {
		-- Portal
		"POI/Portal|Portal to Ashran|horde garrison:3|75.2 48.4",
	},


	--[[ The Jade Forest ]]--

	[371] = {
		-- Profession Trainer
		"POI/Enchanting|[Enchanting Trainer]|10+ enchanting|46.85 42.94|tooltip|Lai the Spellpaw",
	},


	--[[ Kun-Lai Summit ]]--

	[379] = {
		-- Profession Trainer
		"POI/Leatherworking|[Leatherworking Trainer]|10+ leatherworking|64.66 60.86|tooltip|Clean Pelt",
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
		"-:large|The Western Earthshrine|horde|50.4 37.3||Cataclysm Portals",
		"POI/Portal|Portal to Undercity|49- horde|50.75 55.59",
		"POI/Portal|Portal to Tirisfal Glades|50+ horde|50.75 55.59",
		"POI/Portal|Portal to Tol Barad|30+ horde|47.39 39.26",
	},


	--[[ Elwynn Forest ]]--

	-- Stormwind
	[84] = {
		-- Portal
		"-:large|The Eastern Earthshrine|alliance|74.85 17.65||Cataclysm Portals",
		"POI/Portal|Portal to Darnassus|49- alliance|23.86 56.09",
		"POI/Portal|Portal to Darkshore|50+ alliance|23.86 56.09",

		-- Profession Trainer
		"POI/Alchemy|[Alchemy Trainer]|5+ alliance alchemy|55.66 86.08|tooltip|Lilyssia Nightbreeze",
		"POI/Blacksmithing|[Blacksmithing Trainer]|5+ alliance blacksmithing|63.66 37.01|tooltip|Therum Deepforge",
		"POI/Enchanting|[Enchanting Trainer]|5+ alliance enchanting|52.9 74.46|tooltip|Lucan Cordell",
		"POI/Engineering|[Engineering Trainer]|5+ alliance engineering|62.84 31.96|tooltip|Lilliam Sparkspindle",
		"POI/Herbalism|[Herbalism Trainer]|5+ alliance herbalism|54.28 84.1|tooltip|Tannysa",
		"POI/Inscription|[Inscription Trainer]|5+ alliance inscription|49.82 74.82|tooltip|Catarina Stanford",
		"POI/Jewelcrafting|[Jewelcrafting Trainer]|5+ alliance jewelcrafting|63.48 61.84|tooltip|Theresa Denman",
		"POI/Leatherworking|[Leatherworking and Skinning Trainers]|5+ alliance leatherworking skinning|71.88 62.55|tooltip|The Protective Hide",
		"POI/Leatherworking|[Leatherworking Trainer]|5+ alliance leatherworking -skinning|71.68 63|tooltip|Simon Tanner",
		"POI/Mining|[Mining Trainer]|5+ alliance mining|59.52 37.78|tooltip|Gelman Stonehand",
		"POI/Skinning|[Skinning Trainer]|5+ alliance skinning -leatherworking|72.14 62.21|tooltip|Maris Granger",
		"POI/Tailoring|[Tailoring Trainer]|5+ alliance tailoring|53.08 81.35|tooltip|Georgio Bolero",
		"POI/Tailoring|[Bandage Trainer]|5+ alliance tailoring|52.18 45.38|tooltip|Angela Leifeld",
		"POI/Cooking|[Cooking Trainer]|5+ alliance|50.57 71.9|tooltip|Robby Flay",
		"POI/Fishing|[Fishing Trainer]|5+ alliance|54.79 69.6|tooltip|Arnold Leland",
		"POI/Archaeology|[Archaeology Trainer]|10+ alliance|85.81 25.94|tooltip|Harrison Jones",
	},

	--[[ Tirisfal Glades ]]--

	-- Undercity
	[90] = {
		-- Portal
		"POI/Portal|Portal to Hellfire Peninsula|10+ horde|85.27 17.05",

		-- Heirloom Vendor
		"timewalkingvendor-32x32|[Heirloom Vendor]|horde|78.14 76.3|tooltip|Estelle Gendry",

		-- Profession Trainer
		"POI/Alchemy|[Alchemy Trainer]|5+ horde alchemy|47.77 73.32|tooltip|Doctor Herbert Halsey",
		"POI/Blacksmithing|[Blacksmithing Trainer]|5+ horde blacksmithing|61.26 30.62|tooltip|James Van Brunt",
		"POI/Enchanting|[Enchanting Trainer]|5+ horde enchanting|61.87 61.4|tooltip|Lavinia Crowe",
		"POI/Engineering|[Engineering Trainer]|5+ horde engineering|76.13 74.03|tooltip|Franklin Lloyd",
		"POI/Herbalism|[Herbalism Trainer]|5+ horde herbalism|54 49.54|tooltip|Martha Alliestar",
		"POI/Inscription|[Inscription Trainer]|5+ horde inscription|61.05 57.95|tooltip|Margaux Parchley",
		"POI/Jewelcrafting|[Jewelcrafting Trainer]|5+ horde jewelcrafting -mining|56.53 36.3|tooltip|Neller Fayne",
		"POI/Jewelcrafting|[Jewelcrafting and Mining Trainers]|5+ horde jewelcrafting mining|56.3 36.91|tooltip|Neller Fayne|Brom Killian",
		"POI/Leatherworking|[Leatherworking and Skinning Trainers]|5+ horde leatherworking skinning|70.16 58.29|tooltip|Arthur Moore|Killian Hagey",
		"POI/Leatherworking|[Leatherworking Trainer]|5+ horde leatherworking -skinning|70.16 57.43|tooltip|Arthur Moore",
		"POI/Mining|[Mining Trainer]|5+ horde mining -jewelcrafting|56.04 37.45|tooltip|Brom Killian",
		"POI/Skinning|[Skinning Trainer]|5+ horde skinning -leatherworking|70.18 59.21|tooltip|Killian Hagey",
		"POI/Tailoring|[Tailoring Trainer]|5+ horde tailoring|70.76 30.72|tooltip|Josef Gregorian",
		"POI/Tailoring|[Bandage Trainer]|5+ horde tailoring|73.15 55.16|tooltip|Mary Edras",
		"POI/Cooking|[Cooking Trainer]|5+ horde|62.15 44.9|tooltip|Eunice Burch",
		"POI/Fishing|[Fishing Trainer]|5+ horde|80.7 31.27|tooltip|Armand Cromwell",
		"POI/Archaeology|[Archaeology Trainer]|10+ horde|75.41 37.71|tooltip|Adam Hossack",
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