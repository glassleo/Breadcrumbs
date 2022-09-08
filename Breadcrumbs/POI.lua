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
		[text]			White text (common)
		[color]text]	Colored text where color is either a hex (like ff0800) or a named color (spell, friendly, neutral, hostile, daily, poor, rare, epic, legendary, artifact, heirloom)
]]--

Data.POI = {


	--[[ Oribos ]]--

	-- Ring of Transference
	[1671] = {
		-- Portal
		"POI/Portal|Portals|1+|56.27 75.98||Gorgrond, Karazhan, Mechagon",

		-- Teleport Pad
		"teleportationnetwork-32x32:small|Ring of Fates|1+|49.52 60.92|link:1670",
		"teleportationnetwork-32x32:small|Ring of Fates|1+|55.66 51.62|link:1670",
		"teleportationnetwork-32x32:small|Ring of Fates|1+|49.55 42.33|link:1670",
		"teleportationnetwork-32x32:small|Ring of Fates|1+|43.4 51.59|link:1670",

		-- Heirloom Vendor
		"timewalkingvendor-32x32|[Heirloom Vendor]|59770|59.97 72|tooltip",
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
		"upgradeitem-32x32|[Item Upgrades]|60+|34.56 56.52",

		-- Professions
		"POI/Alchemy|[Alchemy]|48+ alchemy|39.23 40.38",
		"POI/Blacksmithing|[Blacksmithing]|48+ blacksmithing|40.48 31.5",
		"POI/Enchanting|[Enchanting]|48+ enchanting|48.41 29.44",
		"POI/Engineering|[Engineering]|48+ engineering|38.06 44.66",
		"POI/Herbalism|[Herbalism]|48+ herbalism|40.23 38.26",
		"POI/Inscription|[Inscription]|48+ inscription|36.52 36.7",
		"POI/Jewelcrafting|[Jewelcrafting]|48+ jewelcrafting|35.2 41.35",
		"POI/Leatherworking|[Leatherworking]|48+ leatherworking -skinning|42.27 26.58",
		"POI/Leatherworking|[Leatherworking and Skinning]|48+ leatherworking skinning|42.14 27.31",
		"POI/Mining|[Mining]|48+ mining|39.3 32.94",
		"POI/Skinning|[Skinning]|48+ skinning -leatherworking|42.13 28.08",
		"POI/Tailoring|[Tailoring]|48+ tailoring|45.47 31.76",
		"POI/Cooking|[Cooking]|48+|46.82 22.66",
		"POI/Fishing|[Fishing]|48+|46.14 26.35",
	},


	--[[ Zereth Mortis ]]--

	[1970] = {
		-- Door
		"poi-door-down:small|Gravid Repose|1+|50.54 32.22|link:2029",

		-- Protoform Synthesis
		"POI/ProtoformSynthesis|[Protoform Synthesis (Battle Pet)]|60+ 65419|60.53 59.39|tooltip|Gather schematics and craft battle pets with components found across Zereth Mortis.",
		"POI/ProtoformSynthesis|[Protoform Synthesis (Mount)]|60+ 65427|70.21 28.56|tooltip|Gather schematics and craft mounts with components found across Zereth Mortis.",

		-- Creation Catalyst
		"creationcatalyst-32x32|[Creation Catalyst]|60+ 65305|47.44 88.68|tooltip|Transform a regular item from Shadowlands Season 3 or 4 into a set item.",
	},

	-- Crystal Wards
	[2066] = {
		-- Teleporter
		"progenitorflightmaster-32x32:small|Teleporter|65589 65590 65591 65592|42.89 50.34",
	},

	-- Nexus of Actualization
	[2030] = {
		-- Teleporter
		"teleportationnetwork-32x32:small|Teleporter|1+|54.85 86.15",
	},

	-- Gravid Repose
	[2029] = {
		-- Door
		"poi-door-up|Zereth Mortis|1+|69.9 8.43|link:1970",

		-- Locus Shift
		"flightmaster_progenitorobelisk-taxinode_neutral:small|Gravid Repose Locus|60+|59.42 41.33",
		"flightmaster_progenitorobelisk-taxinode_neutral:small|Interior Locus|60+|40.34 34.36",
		"flightmaster_progenitorobelisk-taxinode_neutral:small|Arcae Locus|60+ 65378|36.51 31.61",
		"flightmaster_progenitorobelisk-taxinode_neutral:small|Repertory Alcove|60+ 65344|34.58 67.16",
		"flightmaster_progenitorobelisk-taxinode_neutral:small|Camber Alcove|60+ 65343|48.19 76.67",

		-- Requisites Originator
		"creationcatalyst-32x32|[Requisites Originator]|60+ 65344 65328 research:1901 research:1904 -65532|30.77 64.43|tooltip|Repertory Alcove||Requisition something once per week.||[green]Available]||1. {3950365} [uncommon]Thrumming Powerstone]|2. {3528288} [Reservoir Anima]|3. {3950362} [Cyphers of the First Ones]|4. {4287471} [green]Genesis Mote]|5. {/Random} Random|6. {/Random} [epic]Cypher Equipment]",
		"creationcatalyst-32x32|[Requisites Originator]|60+ 65344 65328 research:1901 research:1904 65532|30.77 64.43|tooltip|Repertory Alcove||Requisition something once per week.||[red]Already used this week]",
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
		--"236572:objective|[Overpriced Art]|1+|36.6 32.9|tooltip|Xy'aro", -- Not used
	},


	--[[ Bastion ]]--

	-- Elysian Hold - Archon's Rise
	[1707] = {
		-- Portal
		"POI/Portal|Portal to Oribos|research:1058|48.84 64.79", -- Requires Eternal Paths (Tier 3 Transport Network) (1058)

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|48.64 58.21",
		"mailbox:objective|Mailbox|mailbox|24.62 32.17",
	},


	--[[ Maldraxxus ]]--

	-- Seat of the Primus
	[1698] = {
		-- Portal
		"POI/Portal|Portal to Oribos|research:1052|56.37 31.5", -- Requires Flying Fortress (Tier 3 Transport Network) (1052)

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|48.33 28.16",

		-- Item Upgrades
		"upgradeitem-32x32|[Item Upgrades]|60+|56.26 48.1",
	},


	--[[ Ardenweald ]]--

	-- Heart of the Forest
	[1701] = {
		-- Mailbox
		"mailbox:objective|Mailbox|mailbox nightfae|52.42 56.33",
	},


	--[[ Revendreth ]]--

	-- Sinfall - Sinfall Reaches
	[1699] = {
		-- Mirror
		"teleportationnetwork-revendreth-32x32:small|Sinfall Depths|1+|36.2 48.2|link:1700",

		-- Sinfall Surface Flyer
		"taxinode_neutral:small|Sinfall Surface Flyer|1+|41.92 48.49",

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|60.04 28.75",
	},

	-- Sinfall - Sinfall Depths
	[1700] = {
		-- Mirror
		"teleportationnetwork-revendreth-32x32:small|Sinfall Reaches|1+|70.9 38.1|link:1699",

		-- Sinfall Surface Flyer
		"taxinode_neutral:small|Sinfall Surface Flyer|1+|67.18 47.39",

		-- Item Upgrades
		"upgradeitem-32x32|[Item Upgrades]|60+|73.45 24.83",
	},

	-- Revendreth
	[1525] = {
		-- NPC
		"banker|Deadfoot|item:182744 -item:182746|48.73 68.52|tooltip|\"Purchase an All-In-One Belt Repair Kit from Deadfoot to repair your Ornate Belt Buckle\"",
	},


	--[[ Nazjatar ]]--

	-- Nazjatar
	[1355] = {
		-- NPC
		"banker|Gloomseeker Yarga|item:170191,item:170472,item:170189|39.02 57.99|tooltip|\"Yarga will trade any cursed items for gold. She can be found in an underwater cave.\"||Accepts|{1500930} [rare]Blind Eye]|{2744751} [rare]Encrusted Coin]|{615099} [rare]Skeletal Hand]",
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

		-- Professions
		"POI/Alchemy|[Alchemy]|alliance alchemy|74.2 6.54",
		"POI/Blacksmithing|[Blacksmithing]|alliance blacksmithing|73.4 8.46",
		"POI/Enchanting|[Enchanting]|alliance enchanting|74.03 11.55",
		"POI/Engineering|[Engineering]|alliance engineering|77.62 14.33",
		"POI/Herbalism|[Herbalism]|alliance herbalism|70.8 5.4",
		"POI/Inscription|[Inscription]|alliance inscription|73.39 6.33",
		"POI/Jewelcrafting|[Jewelcrafting]|alliance jewelcrafting|75.2 9.88",
		"POI/Leatherworking|[Leatherworking]|alliance leatherworking|75.47 12.6",
		"POI/Mining|[Mining]|alliance mining|75.22 7.56",
		"POI/Skinning|[Skinning]|alliance skinning|75.66 13.39",
		"POI/Tailoring|[Tailoring]|alliance tailoring|76.93 11.16",
		"POI/Cooking|[Cooking]|alliance|71.21 10.69",
		"POI/Fishing|[Fishing]|alliance|74.16 5.58",
		"POI/Archaeology|[Archaeology]|alliance|68.33 8.47",
	},


	--[[ Dalaran, Broken Isles ]]--

	-- Dalaran
	[627] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|39.55 63.19",
		"POI/Portal|Portal to Orgrimmar|horde|55.31 24.02",
		"groupfinder-icon-class-demonhunter|[The Fel Hammer]|10+ demonhunter 42872|97.5 68.73|tooltip|Gateway to the Fel Hammer in Mardum, Home of the Illidari",
		"groupfinder-icon-class-rogue|[Hall of Shadows]|10+ rogue 40832|46.8 25.4|tooltip|Home of the Uncrowned",

		-- Teleport Pad
		"teleportationnetwork-32x32:small|Aegwynn's Gallery|1+|49.4 47.6|link:629",

		-- Flight Master
		"taxinode_neutral:small|Dalaran|1+|69.84 51.13",
		"groupfinder-icon-class-hunter|[Trueshot Lodge]|10+ hunter 40953|72.85 41.21|tooltip|Eagle to Trueshot Lodge, Home of the Unseen Path",

		-- Professions
		"POI/Alchemy|[Alchemy]|10+ alchemy|41.44 31.75||The Agronomical Apothecary",
		"POI/Blacksmithing|[Blacksmithing]|10+ blacksmithing -mining|45.51 28.3||Tanks for Everything",
		"POI/Mining|[Mining]|10+ mining -blacksmithing|46.42 26.82||Tanks for Everything",
		"POI/Blacksmithing|[Blacksmithing and Mining]|10+ blacksmithing mining|45.51 28.3||Tanks for Everything",
		"POI/Enchanting|[Enchanting]|10+ enchanting|38.64 40.93||Simply Enchanting",
		"POI/Engineering|[Engineering]|10+ engineering|38.75 25.38||Like Clockwork",
		"POI/Herbalism|[Herbalism]|10+ herbalism|43 34.72",
		"POI/Inscription|[Inscription]|10+ inscription|41.28 37.03||The Scribe's Sacellum",
		"POI/Jewelcrafting|[Jewelcrafting]|10+ jewelcrafting|39.74 34.84||Cartier & Co. Fine Jewelry",
		"POI/Leatherworking|[Leatherworking]|leatherworking -skinning|35.41 29.02||Legendary Leathers",
		"POI/Skinning|[Skinning]|skinning -leatherworking|35.41 29.02||Legendary Leathers",
		"POI/Leatherworking|[Leatherworking and Skinning]|10+ leatherworking skinning|35.41 29.02||Legendary Leathers",
		"POI/Tailoring|[Tailoring]|10+ tailoring|36.04 33.51||Talismanic Textiles",
		"POI/FirstAid|[Bandage Trainer]|10+ tailoring|36.6 37.11||First to Your Aid",
		"POI/Cooking|[Cooking]|10+ alliance|40.07 65.98||A Hero's Welcome",
		"POI/Cooking|[Cooking]|10+ horde|69.77 38.77||The Filthy Animal",
		"POI/Fishing|[Fishing Trainer]|10+|52.81 65.59",
		"POI/Archaeology|[Archaeology]|10+|41.26 25.36||Things of the Past",
	},

	-- Aegwynn's Gallery
	[629] = {
		-- Teleport Pad
		"teleportationnetwork-32x32:small|Dalaran|1+|65 21.2|link:627",
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
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid +40645|55.4 22.06",
		"POI/Portal|Portal to Dalaran|10+ druid 40653|56.5 43.1",

		-- Flight Master
		"taxinode_neutral:small|The Dreamgrove, Val'sharah|druid|61.74 33.99",

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|40.44 26.03",

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

	-- Neltharion's Vault
	[657] = {
		-- Teleport Pad
		"teleportationnetwork-32x32:small|Titan Waygate|1+|52.02 28.65",
		"teleportationnetwork-32x32:small|Titan Waygate|1+|59.09 42.78",
	},


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


	--[[ Ashran ]]--

	-- Stormshield
	[622] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|60.81 37.9",

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ alliance alchemy|36.7 68.6",
		"POI/Blacksmithing|[Blacksmithing]|5+ alliance blacksmithing|49.5 47.69",
		"POI/Enchanting|[Enchanting]|5+ alliance enchanting|56.79 65.11",
		"POI/Engineering|[Engineering]|5+ alliance engineering|47.8 39.94||Engineering Works",
		"POI/Herbalism|[Herbalism]|5+ alliance herbalism|37.78 70.31",
		"POI/Inscription|[Inscription]|5+ alliance inscription|62.64 33.53||Andromath's Rise",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ alliance jewelcrafting|43.68 35.13",
		"POI/Leatherworking|[Leatherworking and Skinning]|5+ alliance leatherworking skinning|52.25 42.46",
		"POI/Leatherworking|[Leatherworking]|5+ alliance leatherworking -skinning|52.25 42.46",
		"POI/Mining|[Mining]|5+ alliance mining|47.28 43.68",
		"POI/Skinning|[Skinning]|5+ alliance skinning -leatherworking|52.24 43.2",
		"POI/Tailoring|[Tailoring]|5+ alliance tailoring|51.32 36.65",
		"POI/FirstAid|[Bandage Trainer]|5+ alliance tailoring|45.61 30.71||Stormshield Barracks",
		"POI/Cooking|[Cooking]|5+ alliance|35.12 76.19||Hero's Rest Inn",
		"POI/Fishing|[Fishing]|5+ alliance|55.47 78.48",
		"POI/Archaeology|[Archaeology]|10+ alliance|48.84 33.39",
	},


	--[[ The Jade Forest ]]--

	[371] = {
		-- Professions
		"POI/Enchanting|[Enchanting]|10+ enchanting|46.85 42.94",
		"POI/Inscription|[Inscription]|10+ inscription|54.91 45.12",
		"POI/Mining|[Mining]|10+ mining|46.07 29.41",
	},


	--[[ Valley of the Four Winds ]]--

	[376] = {
		-- Professions
		"POI/Engineering|[Engineering]|10+ engineering|16.06 83.15",
		"POI/Tailoring|[Tailoring]|10+ tailoring|62.66 59.75",
	},


	--[[ Kun-Lai Summit ]]--

	[379] = {
		-- Professions
		"POI/Leatherworking|[Leatherworking]|10+ leatherworking|64.66 60.86",
	},


	--[[ Vale of Eternal Blossoms ]]--

	-- Shrine of Two Moons - The Imperial Mercantile
	[392] = {
		-- Portal
		"POI/Portal|Portal to Orgrimmar|horde|73.37 42.64",
	},

	-- Shrine of Two Moons - Hall of the Crescent Moon
	[391] = {
		"POI/Engineering|[Engineering]|10+ horde engineering|61.05 41.76|tooltip",
		"POI/FirstAid|[Bandage Trainer]|10+ horde tailoring|29.38 75.69|tooltip",
	},


	--[[ Crystalsong Forest ]]--

	-- Dalaran
	[125] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|40.11 62.81",
		"POI/Portal|Portal to Orgrimmar|horde|55.31 24.02",

		-- Flight Master
		"taxinode_neutral:small|Dalaran|1+|72.18 45.78",

		-- Professions
		"POI/Alchemy|[Alchemy]|10+ alchemy|41.44 31.75||The Agronomical Apothecary",
		"POI/Blacksmithing|[Blacksmithing]|10+ blacksmithing|45.51 28.3||Tanks for Everything",
		"POI/Mining|[Mining]|10+ mining|41.26 25.36||All That Glitters Prospecting Co.",
		"POI/Enchanting|[Enchanting]|10+ enchanting|38.64 40.93||Simply Enchanting",
		"POI/Engineering|[Engineering]|10+ engineering|38.75 25.38||Like Clockwork",
		"POI/Herbalism|[Herbalism]|10+ herbalism|43 34.72",
		"POI/Inscription|[Inscription]|10+ inscription|41.28 37.03||The Scribe's Sacellum",
		"POI/Jewelcrafting|[Jewelcrafting]|10+ jewelcrafting|39.74 34.84||Cartier & Co. Fine Jewelry",
		"POI/Leatherworking|[Leatherworking]|leatherworking -skinning|35.41 29.02||Legendary Leathers",
		"POI/Skinning|[Skinning]|skinning -leatherworking|35.41 29.02||Legendary Leathers",
		"POI/Leatherworking|[Leatherworking and Skinning]|10+ leatherworking skinning|35.41 29.02||Legendary Leathers",
		"POI/Tailoring|[Tailoring]|10+ tailoring|36.04 33.51||Talismanic Textiles",
		"POI/FirstAid|[Bandage Trainer]|10+ tailoring|36.6 37.11||First to Your Aid",
		"POI/Cooking|[Cooking]|10+ alliance|40.07 65.98||A Hero's Welcome",
		"POI/Cooking|[Cooking]|10+ horde|69.77 38.77||The Filthy Animal",
		"POI/Fishing|[Fishing Trainer]|10+|52.81 65.59",
		"POI/Archaeology|[Archaeology Trainer]|10+|48.37 38.21||The Legerdemain Lounge",
	},


	--[[ Grizzly Hills ]]--

	[116] = {
		-- Portal
		"POI/DreamwayPortal|Emerald Dreamway|10+ druid 40645|50.32 29.2",
	},


	--[[ Terokkar Forest ]]--

	-- Shattrath
	[111] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|57.21 48.27",
		"POI/Portal|Portal to Orgrimmar|horde|56.82 48.87",
		"POI/Portal|Portal to Isle of Quel'Danas|25+|48.59 42.02",

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ aldor alchemy -herbalism|38.46 30.11||Aldor Rise",
		"POI/Alchemy|[Alchemy and Herbalism]|5+ aldor alchemy herbalism|38.46 30.11||Aldor Rise",
		"POI/Herbalism|[Herbalism]|5+ aldor herbalism -alchemy|38.46 30.11||Aldor Rise",
		"POI/Blacksmithing|[Blacksmithing]|5+ aldor blacksmithing -engineering|37.49 31.72||Aldor Rise",
		"POI/Blacksmithing|[Engineering and Blacksmithing]|5+ aldor blacksmithing engineering|37.49 31.72||Aldor Rise",
		"POI/Engineering|[Engineering]|5+ aldor engineering -blacksmithing|37.49 31.72||Aldor Rise",
		"POI/Enchanting|[Enchanting]|5+ aldor enchanting -inscription|36.28 43.95||Aldor Rise",
		"POI/Enchanting|[Enchanting and Inscription]|5+ aldor enchanting inscription|36.28 43.95||Aldor Rise",
		"POI/Inscription|[Inscription]|5+ aldor inscription -enchanting|36.28 43.95||Aldor Rise",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ aldor jewelcrafting|35.86 20.09||Aldor Rise",
		"POI/Mining|[Mining]|5+ aldor mining|35.89 48.38||Aldor Rise",
		"POI/Skinning|[Skinning]|5+ aldor skinning -leatherworking -tailoring|37.47 27.21||Aldor Rise",
		"POI/Leatherworking|[Leatherworking]|5+ aldor leatherworking -skinning -tailoring|37.47 27.21||Aldor Rise",
		"POI/Leatherworking|[Leatherworking and Skinning]|5+ aldor leatherworking skinning|37.47 27.21||Aldor Rise",
		"POI/Tailoring|[Tailoring]|5+ aldor tailoring -leatherwokring -skinning|37.47 27.21||Aldor Rise",
		"POI/Tailoring|[Tailoring and Leatherworking]|5+ aldor tailoring leatherwokring|37.47 27.21||Aldor Rise",
		"POI/Tailoring|[Tailoring and Skinning]|5+ aldor tailoring skinning|37.47 27.21||Aldor Rise",
		"POI/FirstAid|[Bandage Trainer]|5+ aldor tailoring|66.5 13.44||Shattrath Infirmary",
		--"POI/Cooking|[Cooking]|5+ aldor|35.12 76.19||Aldor Rise",
		--"POI/Fishing|[Fishing]|5+ aldor|55.47 78.48||Aldor Rise",
		--"POI/Archaeology|[Archaeology]|10+ aldor|48.84 33.39||Aldor Rise",
		"profession|[Profession Trainers]|10+ scryer|43.65 90.87||The Seer's Library",
	},


	--[[ Teldrassil ]]--

	-- Darnassus
	[89] = {
		-- Portal
		"POI/Portal|Portals|alliance|43 74||Exodar, Hellfire Peninsula",
	},

	-- Teldrassil
	[57] = {
		-- Portal
		"POI/Portal|Portal to Stormwind|alliance|55.03 93.71",
		"POI/Portal|Portal to Exodar|alliance|52.27 89.47",
	},

	-- Ban'ethil Barrow Den - Upper Den
	[60] = {
		-- Door
		"poi-door-up|Teldrassil|1+|54.1 22.1|link:57",
		"poi-door-down|Lower Den|1+|55 33.6|link:61",
		"poi-door-down|Lower Den|1+|25.2 88.8|link:61",
	},

	-- Ban'ethil Barrow Den - Lower Den
	[61] = {
		"poi-door-up|Upper Den|1+|44.4 42.6|link:60",
		"poi-door-up|Upper Den|1+|29.1 75.4|link:60",
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


	--[[ Mulgore ]]--

	-- Thunder Bluff
	[88] = {
		-- Professions
		"POI/Alchemy|[Alchemy]|5+ horde alchemy|46.61 33.2",
		"POI/Blacksmithing|[Blacksmithing]|5+ horde blacksmithing|39.38 55.1",
		"POI/Enchanting|[Enchanting]|5+ horde enchanting|45.3 38.47",
		"POI/Engineering|[Engineering]|5+ horde engineering|36.05 59.62",
		"POI/Herbalism|[Herbalism]|5+ horde herbalism|49.96 40.39",
		"POI/Inscription|[Inscription]|5+ horde inscription|28.69 20.85|down",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ horde jewelcrafting|34.83 54",
		"POI/Leatherworking|[Leatherworking]|5+ horde leatherworking|41.51 42.58",
		"POI/Mining|[Mining]|5+ horde mining|34.39 57.88",
		"POI/Skinning|[Skinning]|5+ horde skinning|44.45 43.14",
		"POI/Tailoring|[Tailoring]|5+ horde tailoring|44.54 45.33",
		"POI/FirstAid|[Bandage Trainer]|5+ horde tailoring|29.67 21.18",
		"POI/Cooking|[Cooking]|5+ horde|50.74 53.1",
		"POI/Fishing|[Fishing]|5+ horde|56.12 46.4",
		"POI/Archaeology|[Archaeology]|10+ horde|75.05 28.12",
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


	--[[ Durotar ]]--

	-- Orgrimmar
	[85] = {
		-- Portal
		"-:large|The Western Earthshrine|horde|50.4 37.3||Cataclysm Portals",
		"POI/Portal|Portal to Undercity|art:18:19 horde|50.75 55.59",
		"POI/Portal|Portal to Tirisfal Glades|art:18:1136 horde|50.75 55.59",
		"POI/Portal|Portal to Tirisfal Glades|50+ horde|50.75 55.59",
		"POI/Portal|Portal to Tol Barad|30+ horde|47.39 39.26",

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ horde alchemy|55.68 45.75||Yelmak's Alchemy and Potions",
		"POI/Blacksmithing|[Blacksmithing]|5+ horde blacksmithing|76.5 34.52||The Burning Anvil",
		"POI/Enchanting|[Enchanting]|5+ horde enchanting|53.49 49.55||Godan's Runeworks",
		"POI/Engineering|[Engineering]|5+ horde engineering|56.83 56.55||Nogg's Machine Shop",
		"POI/Herbalism|[Herbalism]|5+ horde herbalism|54.6 50.44||The Arboretum",
		"POI/Inscription|[Inscription]|5+ horde inscription|55.07 55.88||The Mighty Pen",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ horde jewelcrafting|72.49 34.32||Red Canyon Mining & Jewelcrafting",
		"POI/Leatherworking|[Leatherworking and Skinning]|5+ horde leatherworking skinning|61.04 54.81||Kodohide Leatherworkers",
		"POI/Leatherworking|[Leatherworking]|5+ horde leatherworking -skinning|60.89 54.89||Kodohide Leatherworkers",
		"POI/Mining|[Mining]|5+ horde mining|39.04 85.52",
		"POI/Skinning|[Skinning]|5+ horde skinning -leatherworking|61.16 54.65||Kodohide Leatherworkers",
		"POI/Tailoring|[Tailoring]|5+ horde tailoring|60.75 59.13||Magar's Cloth Goods",
		"POI/FirstAid|[Bandage Trainer]|5+ horde tailoring|38.51 86.41",
		"POI/Cooking|[Cooking]|5+ horde|56.53 62.48||Borstan's Firepit",
		"POI/Fishing|[Fishing]|5+ horde|66.44 41.93",
		"POI/Archaeology Trainer|[Archaeology]|10+ horde|49.06 70.56||Grommash Hold",
	},

	-- Durotar
	[1] = {
		-- Legion Intro
		"Speak:small|[Holgar Stormaxe]|10+ 43926 _40518 -44663 -44184 horde|46.01 13.78|tooltip|Skip the Legion introductory quests and begin your journey in Dalaran.",
	},


	--[[ Silithus ]]--

	-- Silithus
	[81] = {
		-- Classic: art:86
		-- BfA: art:962

		-- Portal
		"POI/Portal:small|Portal to Tiragarde|art:962 50+ alliance|41.49 44.85",
		"POI/Portal:small|Portal to Zuldazar|art:962 50+ horde|41.49 44.85",

		-- Teleport Pad
		"teleportationnetwork-32x32:small|Chamber of Heart|art:962 40+ +51211|43.2 44.49|link:1021",
	},

	-- Chamber of Heart
	[1021] = {
		-- Teleport Pad
		"teleportationnetwork-32x32|Silithus|1+|50.1 30.62|link:81",
	},


	--[[ Elwynn Forest ]]--

	-- Stormwind
	[84] = {
		-- Portal
		"-:large|The Eastern Earthshrine|alliance|74.85 17.65||Cataclysm Portals",
		"POI/Portal|Portal to Darnassus|10+ art:62:67 alliance|24.5 55.6", -- Requires level 10 to use; phased to Cataclysm
		"POI/Portal|Portal to Darkshore|10+ art:62:1176 alliance|24.5 55.6", -- Phased to BfA

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ alliance alchemy|55.66 86.08",
		"POI/Blacksmithing|[Blacksmithing]|5+ alliance blacksmithing|63.66 37.01",
		"POI/Enchanting|[Enchanting]|5+ alliance enchanting|52.9 74.46",
		"POI/Engineering|[Engineering]|5+ alliance engineering|62.84 31.96",
		"POI/Herbalism|[Herbalism]|5+ alliance herbalism|54.28 84.1",
		"POI/Inscription|[Inscription]|5+ alliance inscription|49.82 74.82",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ alliance jewelcrafting|63.48 61.84",
		"POI/Leatherworking|[Leatherworking and Skinning]|5+ alliance leatherworking skinning|71.88 62.55||The Protective Hide",
		"POI/Leatherworking|[Leatherworking]|5+ alliance leatherworking -skinning|71.68 63||The Protective Hide",
		"POI/Mining|[Mining]|5+ alliance mining|59.52 37.78",
		"POI/Skinning|[Skinning]|5+ alliance skinning -leatherworking|72.14 62.21||The Protective Hide",
		"POI/Tailoring|[Tailoring]|5+ alliance tailoring|53.08 81.35",
		"POI/FirstAid|[Bandage Trainer]|5+ alliance tailoring|52.18 45.38",
		"POI/Cooking|[Cooking]|5+ alliance|50.57 71.9",
		"POI/Fishing|[Fishing]|5+ alliance|54.79 69.6",
		"POI/Archaeology|[Archaeology]|10+ alliance|85.81 25.94",

		-- Legion Intro
		"Speak:small|[Recruiter Lee]|10+ 40519 _42740 -44663 -44184 alliance|37.01 42.53|tooltip|Skip the Legion introductory quests and begin your journey in Dalaran.",
	},


	--[[ Dun Morogh ]]--

	-- Ironforge
	[87] = {
		-- Door
		"poi-door-down:small|Old Ironforge|1+|44.56 51.98|link:1361",

		-- Heirloom Vendor
		"timewalkingvendor-32x32|[Heirloom Vendor]|alliance|73.9 8.5|tooltip",

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ alliance alchemy|66.3 55.05||Berryfizz's Potions and Mixed Drinks",
		"POI/Blacksmithing|[Blacksmithing]|5+ alliance blacksmithing|50.95 41.86||The Great Forge",
		"POI/Enchanting|[Enchanting]|5+ alliance enchanting -inscription|60.78 44.56||Thistlefuzz Arcanery",
		"POI/Inscription|[Inscription]|5+ alliance -enchanting inscription|60.78 44.56||Thistlefuzz Arcanery",
		"POI/Enchanting|[Enchanting and Inscription]|5+ alliance enchanting inscription|60.78 44.56||Thistlefuzz Arcanery",
		"POI/Engineering|[Engineering]|5+ alliance engineering|67.59 43.18||Springspindle's Gadgets",
		"POI/FirstAid|[Bandage Trainer]|5+ alliance -herbalism tailoring|54.92 58.35||Ironforge Physician",
		"POI/Herbalism|[Herbalism and Bandage Trainer]|5+ alliance herbalism tailoring|54.92 58.35||Ironforge Physician",
		"POI/Mining|[Mining]|5+ alliance mining -jewelcrafting|50.64 26.89||Deepmountain Mining & Jewelcrafting",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ alliance -mining jewelcrafting|50.64 26.89||Deepmountain Mining & Jewelcrafting",
		"POI/Jewelcrafting|[Jewelcrafting and Mining]|5+ alliance mining jewelcrafting|50.64 26.89||Deepmountain Mining & Jewelcrafting",
		"POI/Skinning|[Skinning]|5+ alliance skinning -leatherworking|40.38 33.68||Finespindle's Leather Goods",
		"POI/Leatherworking|[Leatherworking]|5+ alliance -skinning leatherworking|40.38 33.68||Finespindle's Leather Goods",
		"POI/Leatherworking|[Leatherworking and Skinning]|5+ alliance skinning leatherworking|40.38 33.68||Finespindle's Leather Goods",
		"POI/Tailoring|[Tailoring]|5+ alliance tailoring|43.53 28.83||Stonebrow's Clothier",
		"POI/Cooking|[Cooking]|5+ alliance|60.28 37.19||The Bronze Kettle",
		"POI/Fishing|[Fishing]|5+ alliance|48.25 7.01||Traveling Fisherman",
		"POI/Archaeology|[Archaeology]|10+ alliance|75.59 11.12||The Library",
	},

	-- Old Ironforge
	[1361] = {
		-- Door
		"poi-door-up|Ironforge|1+|76.4 82.1|link:87",
	},


	--[[ Tirisfal Glades ]]--

	-- Undercity
	[90] = {
		-- Portal
		"POI/Portal|Portal to Hellfire Peninsula|10+ horde|85.27 17.05",

		-- Heirloom Vendor
		"timewalkingvendor-32x32|[Heirloom Vendor]|horde|78.14 76.3|tooltip",

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ horde alchemy|47.77 73.32",
		"POI/Blacksmithing|[Blacksmithing]|5+ horde blacksmithing|61.26 30.62",
		"POI/Enchanting|[Enchanting]|5+ horde enchanting|61.87 61.4",
		"POI/Engineering|[Engineering]|5+ horde engineering|76.13 74.03",
		"POI/Herbalism|[Herbalism]|5+ horde herbalism|54 49.54",
		"POI/Inscription|[Inscription]|5+ horde inscription|61.05 57.95",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ horde jewelcrafting -mining|56.53 36.3",
		"POI/Jewelcrafting|[Jewelcrafting and Mining]|5+ horde jewelcrafting mining|56.3 36.91",
		"POI/Leatherworking|[Leatherworking and Skinning]|5+ horde leatherworking skinning|70.16 58.29",
		"POI/Leatherworking|[Leatherworking]|5+ horde leatherworking -skinning|70.16 57.43",
		"POI/Mining|[Mining]|5+ horde mining -jewelcrafting|56.04 37.45",
		"POI/Skinning|[Skinning]|5+ horde skinning -leatherworking|70.18 59.21",
		"POI/Tailoring|[Tailoring]|5+ horde tailoring|70.76 30.72",
		"POI/FirstAid|[Bandage Trainer]|5+ horde tailoring|73.15 55.16",
		"POI/Cooking|[Cooking]|5+ horde|62.15 44.9",
		"POI/Fishing|[Fishing]|5+ horde|80.7 31.27",
		"POI/Archaeology|[Archaeology]|10+ horde|75.41 37.71",
	},

	-- Tirisfal Glades
	[18] = {
		-- art:19 - Cataclysm
		-- art:1136 - Battle for Azeroth

		-- Portal
		--"POI/Portal|Portals to Orgrimmar and Stranglethorn Vale|horde art:19|61.2 58.6",
		"POI/Portal:small|Portal to Orgrimmar|horde art:19|60.74 58.68",
		"POI/Portal:small|Portal to Stranglethorn Vale|horde art:19|61.88 59.01",
		"POI/Portal:small|Portal to Howling Fjord|10+ horde art:19|59.09 58.9",
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