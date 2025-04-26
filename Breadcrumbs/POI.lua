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

		low				Sets frame level to be lower than other POI pins
		high			Sets frame level to be on top of all other pins
		
		link:n			Pin becomes clickable to open map with ID n

	Description/Tooltip: Description text or tooltip lines
		{!}				Quest bang
		{n}				Texture/icon with ID n
		{atlas}			Atlas
		[text]			White text (common)
		[color]text]	Colored text where color is either a hex (like ff0800) or a named color (spell, friendly, neutral, hostile, daily, poor, rare, epic, legendary, artifact, heirloom)
]]--

Data.POI = {


	--[[ Undermine ]]--

	[2346] = {
		-- Item Turn-In
		"QuestRepeatableTurnin:small|Angelo Rustbin|item:233246|25.75 38.14|tooltip item:233558|{348555} [uncommon]Gunk-Covered Thingy] (<itemcount:233246>)",

		-- Cartel Headquarters
		"poi-hub|[The Scapshop]|1+|39.15 22.19|tooltip|Bilgewater Cartel",
		"poi-hub|[Port Authority]|1+|63.42 16.74|tooltip|Blackwater Cartel",
		"poi-hub|[Venture Plaza]|1+|53.3 72.72|tooltip|Venture Company",
		"poi-hub|[Steamwheedle Laboratories]|1+|27.13 72.58|tooltip|Steamwheedle Cartel",
		"poi-hub|[Hovel Hill]|86961|29.74 41.1|tooltip|Darkfuse Solutions",
	},


	--[[ Isle of Dorn ]]--

	-- Dornogal
	[2339] = {
		-- Travel
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|38.18 27.22",
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|41.17 22.68",

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|58.06 55.58|high", -- The Forgegrounds
		"mailbox:objective|Mailbox|mailbox|45.68 68.71|high", -- The Forgegrounds
		"mailbox:objective|Mailbox|mailbox|55.67 50.07|high", -- Gilded Exchange
		"mailbox:objective|Mailbox|mailbox|51.72 45.94|high", -- Council's Treasury
		"mailbox:objective|Mailbox|mailbox|58.15 32.46|high", -- Stoneshaper's Atrium
		"mailbox:objective|Mailbox|mailbox|64.97 17.45|high", -- Stoneward's Rise
		"mailbox:objective|Mailbox|mailbox|48.48 26.16|high", -- Keepers Terrace
		"mailbox:objective|Mailbox|mailbox|37.64 40.88|high", -- Keepers Terrace
		"mailbox:objective|Mailbox|mailbox|45.36 48.23|high", -- Stonelight Rest

		-- Innkeeper
		"Innkeeper|Stonelight Rest|1+|44.72 46.4",

		-- Crafting Orders
		"Professions-Crafting-Orders-Icon|Crafting Orders|1+|59.74 55.73",

		-- Item Upgrades
		"upgradeitem-32x32|[Item Upgrades]|60+|52.08 42.1||Mythic Aspirations",
		"upgradeitem-32x32|[Item Upgrades]|60+|59.98 69.73||Contender's Gate",

		-- PvP
		"poi-alliance|[Conquest & Honor Quartermaster]|70+ alliance|55.25 76.81",
		"poi-horde|[Conquest & Honor Quartermaster]|70+ horde|55.25 76.81",

		-- Professions
		"POI/Alchemy|[Alchemy]|68+ alchemy|47.14 70.71|low",
		"POI/Blacksmithing|[Blacksmithing]|68+ blacksmithing|49.05 63.22|low",
		"POI/Enchanting|[Enchanting]|68+ enchanting|52.48 71.36|low",
		"POI/Engineering|[Engineering]|68+ engineering|49.04 56.07|low",
		"POI/Herbalism|[Herbalism]|68+ herbalism|44.76 69.3|low",
		"POI/Inscription|[Inscription]|68+ inscription|48.75 71.18|low",
		"POI/Jewelcrafting|[Jewelcrafting]|68+ jewelcrafting|49.48 71.15|low",
		"POI/Leatherworking|[Leatherworking]|68+ leatherworking|54.45 58.97|low",
		"POI/Mining|[Mining]|68+ mining|52.62 52.53|low",
		"POI/Skinning|[Skinning]|68+ skinning|54.27 56.66|low",
		"POI/Tailoring|[Tailoring]|68+ tailoring|54.58 63.43|low",
		"POI/Cooking|[Cooking]|68+|43.91 45.48|low|Stonelight Rest",
		"POI/Fishing|[Fishing]|68+|50.55 26.81|low",

		-- Rostrum of Transformation
		"dragon-rostrum|[Rostrum of Transformation]|skyriding|47.97 67.88",

		-- Barber
		"Barbershop-32x32|[Barber]|1+|59.05 51.39",

		-- Pets
		"WildBattlePet|[Pet Charm Trader]|1+|58.51 64.86",
		"Stablemaster|[Stable Master]|1+|55.37 67.1",

		-- Vendor
		"poi-transmogrifier|Osidion|item:223951|57.26 60.84|tooltip item:223951|\"Exchange your {4555612} [Earth-Encrusted Gem] for an Ensemble of choice here\"",
	},


	--[[ Azj-Kahet ]]--
	
	-- Azj-Kahet
	[2255] = {
		-- Vendor
		"TimewalkingVendor-32x32|[neutral]Ab'xal] & [neutral]Ip'xal]|item:226206|51.28 81.06|tooltip item:226206 link:2216|\"Exchange your {5789325} [epic]Mark of the Spelunker Supreme] for a Nerub-ar Palace set item of choice here\"",
	},

	-- City of Threads
	[2213] = {
		-- Vendor
		"TimewalkingVendor-32x32|[neutral]Ab'xal] & [neutral]Ip'xal]|item:226206|57.17 45.96|tooltip item:226206 link:2216|\"Exchange your {5789325} [epic]Mark of the Spelunker Supreme] for a Nerub-ar Palace set item of choice here\"",
	},

	-- City of Threads - Lower (The Burrows)
	[2216] = {
		-- Vendor
		"TimewalkingVendor-32x32|[neutral]Ab'xal] & [neutral]Ip'xal]|item:226206|57.17 45.96|tooltip item:226206|\"Exchange your {5789325} [epic]Mark of the Spelunker Supreme] for a Nerub-ar Palace set item of choice here\"",
	},


	--[[ Amirdrassil ]]--

	[2239] = {
		-- Portal
		"-:large|Emerald Dream [gold](70)]|1+|90 34.79|link:2200",
	},


	--[[ Emerald Dream ]]--

	-- Emerald Dream
	[2200] = {
		-- Door
		"poi-door-down:small|Sor'theril Barrow Den|1+|51.06 42.77|link:2253",
		"poi-door-down:small|Barrows of Reverie|1+|63.5 71.75|link:2254",

		-- Portal
		"-:large|Ohn'ahran Plains [gold](10-70)]|1+|73.35 51.08|link:2023|Pet Level [gold](25)]",

		-- Vendor
		"poi-transmogrifier|Theozhaklos the Curious|item:210944|36.69 33.29|tooltip item:210944|\"Exchange your {4555670} [epic]Emerald Mark of Mastery] for an Amirdrassil set item of choice here\"",
		"poi-transmogrifier|Kirasztia|item:210947|36.73 33.32|tooltip item:210947|\"Exchange your {1020381} [epic]Flame-Warped Curio] for an Amirdrassil set item of choice here\"",
	},

	-- Sor'theril Barrow Den
	[2253] = {
		-- Door
		"poi-door-up|Emerald Dream|1+|72.29 88.16|link:2200",
	},

	-- Barrows of Reverie
	[2254] = {
		-- Door
		"poi-door-up|Emerald Dream|1+|66.46 16.24|link:2200",
	},


	--[[ The Forbidden Reach ]]--

	-- The War Creche
	[2102] = {
		-- Teleport Pad
		"Vehicle-TempleofKotmogu-PurpleBall|Gemstone of Return|1+|65.32 62.52",
		"Vehicle-TempleofKotmogu-PurpleBall|Gemstone of Return|1+|47.82 81.5",
		"flightmaster_ancientwaygate-taxinode_neutral:small|Spellsworn Gateway|1+|46.99 47.34",
		"flightmaster_ancientwaygate-taxinode_neutral:small|Spellsworn Gateway|1+|49.91 54.24",
		"dragonriding-winds:small|Updraft|1+|67.92 49.48",
	},


	--[[ Thaldraszus ]]--

	-- Valdrakken
	[2112] = {
		-- Portal
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|56.64 38.3",
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|59.79 41.71",
		"TaxiNode_Continent_Neutral|Portal to Badlands|1+|26.09 40.98",
		"TaxiNode_Continent_Neutral|Portal to Emerald Dream|70+ 77887|62.68 57.3",

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|35.44 59.67", -- Artisan's Market
		"mailbox:objective|Mailbox|mailbox|45.57 59.06", -- Auction House
		"mailbox:objective|Mailbox|mailbox|37.66 49.52", -- Obsidian Enclave
		"mailbox:objective|Mailbox|mailbox|48.45 51.03", -- The Roasted Ram
		"mailbox:objective|Mailbox|mailbox|54.58 59.5", -- Bank of Valdrakken

		-- Crafting Orders
		"Professions-Crafting-Orders-Icon|Crafting Orders|1+|34.72 62.47",

		-- Item Upgrades
		"upgradeitem-32x32|[Item Upgrades]|60+|38.65 37.11",

		-- PvP
		"poi-alliance|[Conquest & Honor Quartermaster]|70+ alliance|43.89 39.52",
		"poi-horde|[Conquest & Honor Quartermaster]|70+ horde|43.89 39.52",

		-- Professions
		"POI/Alchemy|[Alchemy]|10+ alchemy|36.39 71.73",
		"POI/Blacksmithing|[Blacksmithing]|10+ blacksmithing|36.97 47.1",
		"POI/Enchanting|[Enchanting]|10+ enchanting|31.17 61.19",
		"POI/Engineering|[Engineering]|10+ engineering|42.26 48.8",
		"POI/Herbalism|[Herbalism]|10+ herbalism|37.69 67.99",
		"POI/Inscription|[Inscription]|10+ inscription|38.85 73.39",
		"POI/Jewelcrafting|[Jewelcrafting]|10+ jewelcrafting|40.27 61.57",
		"POI/Leatherworking|[Leatherworking]|10+ leatherworking|28.83 62.12",
		"POI/Mining|[Mining]|10+ mining|38.87 51.49",
		"POI/Skinning|[Skinning]|10+ skinning|28.47 59.62",
		"POI/Tailoring|[Tailoring]|10+ tailoring|32.04 66.28",
		"POI/Cooking|[Cooking]|10+|46.51 46.26",
		"POI/Fishing|[Fishing]|10+|43.7 74.5",

		-- Rostrum of Transformation
		"dragon-rostrum|[Rostrum of Transformation]|skyriding|25.05 50.64",

		-- Pets
		"WildBattlePet|[Pet Supplies]|1+|48.3 82.51",
		"Stablemaster|[Stable Master]|1+|46.65 78.95",

		-- Item Turn-In
		"QuestRepeatableTurnin:small|Lillian Brightmoon|60+ 72261 item:201411|35.18 24.64|tooltip item:201411|{QuestRepeatableTurnin} Vault Artifacts (<itemcount:201411>)||Required Item|!{4638531} [rare]Ancient Vault Artifact]||Rewards|!{4687628} [Dragonscale Expedition] (30)|!{2065578} [Dragon Isles Supplies] (10)",
	},

	-- Thaldraszus
	[2025] = {
		-- Revival Catalyst - Season 2 prequest is 75497
		"creationcatalyst-32x32|[Revival Catalyst Console]|70+ currency:2912:1|60.69 53.71|tooltip|Transform an item from Dragonflight into a set item.||[green]<currencycount:2912> §4Charge:Charges; Available]",
		"creationcatalyst-32x32|[Revival Catalyst Console]|70+ -currency:2912:1|60.69 53.71|tooltip|Transform an item from Dragonflight into a set item.||[gray]No Charges Available]",
		
		-- Professions
		"POI/Tailoring:small|[Temporal Loom]|58+ tailoring skill:tailoring10:1 profperk:tailoring10:40050|60.92 80.21|tooltip|[spell]Chronocloth Tailoring]", -- Only show if the first node of Chronocloth Tailoring is learned
	},


	--[[ The Azure Span ]]--

	[2024] = {
		-- Professions
		"POI/Tailoring:small|[Azure Loom]|58+ tailoring skill:tailoring10:1 profperk:tailoring10:40062|38.37 60.73|tooltip|[spell]Azureweave Tailoring]", -- Only show if the first node of Azureweave Tailoring is learned
	},


	--[[ Ohn'ahran Plains ]]--

	[2023] = {
		-- Item Turn-In
		"QuestRepeatableTurnin:small|Khadin|10+ 69979 +67298 item:191784|51.77 33.02|tooltip item:190456|{QuestRepeatableTurnin} Specialized Secrets (<itemcount:191784>)||Required Item|!{4643982} [epic]Dragon Shard of Knowledge]||Rewards|!{4643977} [rare]Artisan's Mettle] (50)|!{4624728} [Dragon Isles Knowledge]",
	},


	--[[ The Waking Shores ]]--

	[2022] = {
		-- Rostrum of Transformation
		"dragon-rostrum:small|[Rostrum of Transformation]|skyriding|74.03 58.16",
	},


	--[[ Oribos ]]--

	-- Ring of Transference
	[1671] = {
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
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|20.85 54.83",
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|20.89 45.69",

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
		"POI/Alchemy|[Alchemy]|10+ alchemy|39.23 40.38",
		"POI/Blacksmithing|[Blacksmithing]|10+ blacksmithing|40.48 31.5",
		"POI/Enchanting|[Enchanting]|10+ enchanting|48.41 29.44",
		"POI/Engineering|[Engineering]|10+ engineering|38.06 44.66",
		"POI/Herbalism|[Herbalism]|10+ herbalism|40.23 38.26",
		"POI/Inscription|[Inscription]|10+ inscription|36.52 36.7",
		"POI/Jewelcrafting|[Jewelcrafting]|10+ jewelcrafting|35.2 41.35",
		"POI/Leatherworking|[Leatherworking]|10+ leatherworking -skinning|42.27 26.58",
		"POI/Leatherworking|[Leatherworking and Skinning]|10+ leatherworking skinning|42.14 27.31",
		"POI/Mining|[Mining]|10+ mining|39.3 32.94",
		"POI/Skinning|[Skinning]|10+ skinning -leatherworking|42.13 28.08",
		"POI/Tailoring|[Tailoring]|10+ tailoring|45.47 31.76",
		"POI/Cooking|[Cooking]|10+|46.82 22.66",
		"POI/Fishing|[Fishing]|10+|46.14 26.35",
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
		"TaxiNode_Continent_Neutral|Portal to Oribos|kyrian research:1058|48.84 64.79", -- Requires Eternal Paths (Tier 3 Transport Network) (1058)

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|48.64 58.21",
		"mailbox:objective|Mailbox|mailbox|24.62 32.17",
	},


	--[[ Maldraxxus ]]--

	-- Seat of the Primus
	[1698] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Portal to Oribos|necrolord research:1052|56.37 31.5", -- Requires Flying Fortress (Tier 3 Transport Network) (1052)

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|48.33 28.16",

		-- Item Upgrades
		"upgradeitem-32x32|[Item Upgrades]|60+ necrolord|56.26 48.1",
	},

	-- Maldraxxus
	[1536] = {
		-- Vendor
		"Scroll:objective|One-Eyed Joby|-item:181163|53.14 41.31|tooltip item:181163||Sells|{134943} [Scroll of Teleport: Theater of Pain]",
	},


	--[[ Ardenweald ]]--

	-- Heart of the Forest - The Trunk
	[1701] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Portal to Oribos|nightfae research:1055|56.07 12.42", -- Requires Blossoming Network (Tier 3 Transport Network) (1055)

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox nightfae|52.42 56.33",

		-- Item Upgrades
		"upgradeitem-32x32|[Item Upgrades]|60+ nightfae|46.94 56.89",
	},

	-- Heart of the Forest - The Roots
	[1702] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Portal to Oribos|nightfae research:1055|59.88 28.46", -- Requires Blossoming Network (Tier 3 Transport Network) (1055)
	},


	--[[ Revendreth ]]--

	-- Sinfall - Sinfall Reaches
	[1699] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Portal to Oribos|venthyr research:1049|62.47 26.55", -- Requires Mirror's Edge (Tier 3 Transport Network) (1049)

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
		-- Vendor
		"lootroll-icon-greed:objective|Deadfoot|mage,priest,warlock item:182744 -item:182746|48.73 68.52|tooltip item:182741|\"Deadfoot might have something to repair your [uncommon]Ornate Belt Buckle]\"||Sells|!{133875} [All-In-One Belt Repair Kit]",
		"lootroll-icon-greed:objective|Deadfoot|demonhunter,druid,monk,rogue item:182744 -item:182746|48.73 68.52|tooltip item:182742|\"Deadfoot might have something to repair your [uncommon]Ornate Belt Buckle]\"||Sells|!{133875} [All-In-One Belt Repair Kit]",
		"lootroll-icon-greed:objective|Deadfoot|evoker,hunter,shaman item:182744 -item:182746|48.73 68.52|tooltip item:182739|\"Deadfoot might have something to repair your [uncommon]Ornate Belt Buckle]\"||Sells|!{133875} [All-In-One Belt Repair Kit]",
		"lootroll-icon-greed:objective|Deadfoot|deathknight,paladin,warrior item:182744 -item:182746|48.73 68.52|tooltip item:182740|\"Deadfoot might have something to repair your [uncommon]Ornate Belt Buckle]\"||Sells|!{133875} [All-In-One Belt Repair Kit]",
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
		"TaxiNode_Continent_Alliance|Sanctum of the Sages|10+ alliance 47186,kultiran|70.52 17.28",

		-- Scrapper
		"poi-scrapper|[Scrap-O-Matic 1000]|alliance|77.13 16.31",

		-- Profession
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
		"POI/Fishing|[Fishing Trainer]|alliance|74.16 5.58",
		"POI/Archaeology|[Archaeology]|alliance|68.33 8.47",
	},


	--[[ Zuldazar ]]--

	-- Dazar'alor
	[1165] = {
		-- Portal
		"TaxiNode_Continent_Horde|Hall of Ancient Paths|10+ horde 46931,zandalari|51.2 46.11|link:1163",

		-- Scrapper
		"poi-scrapper|[Shred-Master Mk1]|horde|45.05 40.03",

		-- Profession
		"POI/Alchemy|[Alchemy]|horde alchemy|42.22 37.95",
		"POI/Blacksmithing|[Blacksmithing]|horde blacksmithing|43.65 38.3",
		"POI/Enchanting|[Enchanting]|horde enchanting|47.1 35.68|down|Hall of Glimmers",
		--"POI/Engineering|[Engineering]|horde engineering|45.21 40.81",
		"POI/Herbalism|[Herbalism]|horde herbalism|42.1 35.83",
		"POI/Inscription|[Inscription]|horde inscription|42.33 39.73",
		"POI/Jewelcrafting|[Jewelcrafting]|horde jewelcrafting|47.05 37.92|down|Hall of Glimmers",
		"POI/Leatherworking|[Leatherworking]|horde leatherworking|44.07 34.64",
		"POI/Mining|[Mining]|horde mining|44.12 38.97",
		"POI/Skinning|[Skinning]|horde skinning|43.76 34.66",
		"POI/Tailoring|[Tailoring]|horde tailoring|44.5 33.89",
		"POI/Cooking|[Cooking]|horde|48.65 44.63|link:1164|The Royal Meat Rack",
		"POI/Fishing|[Fishing Trainer]|horde|50.51 23.36",
	},

	-- The Great Seal
	[1163] = {
		-- Portal
		"TaxiNode_Continent_Horde|Portal to Silvermoon City|10+ horde 46931,zandalari|73.85 62.2",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|10+ horde 46931,zandalari|73.85 69.92",
		"TaxiNode_Continent_Horde|Portal to Thunder Bluff|10+ horde 46931,zandalari|73.85 77.38",
		"TaxiNode_Continent_Neutral|Portal to Silithus|50+ horde 46931|73.85 85.35",
		"TaxiNode_Continent_Neutral|Portal to Nazjatar|50+ horde 55053|62.97 85.44",

		-- Profession
		"POI/Archaeology|[Archaeology]|horde|31.75 35.36||Vault of Kings",

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|44.45 13.55",
	},

	-- Hall of Chroniclers
	[1164] = {
		-- Professions
		"POI/Cooking|[Cooking]|horde|28.51 50.17||The Royal Meat Rack",

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox|44.45 13.55",
	},


	--[[ Dalaran, Broken Isles ]]--

	-- Dalaran
	[627] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|39.55 63.19",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|55.31 24.02",
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
		"POI/Bandage|[Bandage Trainer]|10+ tailoring|36.6 37.11||First to Your Aid",
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
		"TaxiNode_Continent_Neutral|Portal to Dalaran|deathknight|24.73 33.7",

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
		"TaxiNode_Continent_Neutral|Emerald Dreamway|10+ druid +40645|55.4 22.06",
		"TaxiNode_Continent_Neutral|Portal to Dalaran|10+ druid 40653|56.5 43.1",

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
		"TaxiNode_Continent_Neutral|Portal to Dalaran|hunter|48.63 43.49",

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
		"TaxiNode_Continent_Neutral|Portal to Dalaran|mage|57.4 90.3",

		-- Teleportation Nexus
		"TaxiNode_Continent_Neutral|Azsuna|mage research:386|55.04 39.54||Teleportation Nexus",
		"TaxiNode_Continent_Neutral|Val'sharah|mage research:386|66.77 46.73||Teleportation Nexus",
		"TaxiNode_Continent_Neutral|Highmountain|mage research:386|54.64 44.59||Teleportation Nexus",
		"TaxiNode_Continent_Neutral|Stormheim|mage research:386|67.18 41.58||Teleportation Nexus",
		"TaxiNode_Continent_Neutral|Suramar|mage research:386|60.4 50.6||Teleportation Nexus",

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
		"TaxiNode_Continent_Neutral|Portal to Dalaran|paladin|37.62 64.08",

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
		"TaxiNode_Continent_Neutral|Portal to Dalaran|1+|49.8 80.7",

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
		"TaxiNode_Continent_Neutral|Portal to Dalaran|shaman|29.8 51.95",

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
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|46.66 41.42",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|46.67 41.3",
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

	-- Hall of Chieftains, Thunder Totem
	[652] = {
		-- Portal
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde Highmountain|46.01 63.85", -- Highmountain Tauren only
	},

	-- Thunder Totem
	[750] = {
		-- Flight Master
		"taxinode_neutral:small|Thunder Totem, Highmountain|1+|44.74 38.55",

		-- Portal
		"groupfinder-icon-class-warrior|[Skyhold]|10+ warrior 40585 41359|39.83 41.97|tooltip|Entrance to Skyhold, Home of the Valarjar",
		"groupfinder-icon-class-warrior|[Skyhold]|10+ warrior 40585 -41359|39.83 41.97|tooltip|Entrance to Skyhold, Home of the Valarjar||\"Speak to {flightmaster} Windtamer Nalt if you cannot see the Gaze of Odyn\"",
	},

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
		"TaxiNode_Continent_Neutral|Portal to Dalaran|1+|30.08 40.7",
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
		"TaxiNode_Continent_Horde|Portal to Ashran|horde garrison:3|75.2 48.4",
	},


	--[[ Shadowmoon Valley ]]--

	-- Lunarfall
	[582] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Ashran|alliance garrison:3|70.1 27.3",
	},


	--[[ Ashran ]]--

	-- Stormshield
	[622] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|60.81 37.9",

		-- Flight Master
		"taxinode_alliance:small|Stormshield, Ashran|alliance|30.58 48.45",

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ alliance alchemy|36.7 68.6",
		"POI/Blacksmithing|[Blacksmithing]|5+ alliance blacksmithing|49.5 47.69",
		"POI/Enchanting|[Enchanting]|5+ alliance enchanting|56.79 65.11",
		"POI/Engineering|[Engineering]|5+ alliance engineering|47.8 39.94||Engineering Works",
		"POI/Inscription|[Inscription]|5+ alliance inscription|62.64 33.53||Andromath's Rise",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ alliance jewelcrafting|43.68 35.13",
		"POI/Leatherworking|[Leatherworking]|5+ alliance leatherworking|52.25 42.46",
		"POI/Tailoring|[Tailoring]|5+ alliance tailoring|51.32 36.65",
		"POI/Fishing|[Fishing Trainer]|5+ alliance|55.47 78.48",
		"POI/Archaeology|[Archaeology]|10+ alliance|48.84 33.39",
	},

	-- Warspear
	[624] = {
		-- Portal
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|60.81 51.61",

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ horde alchemy|61.17 27.14||Alchemy Lab",
		"POI/Blacksmithing|[Blacksmithing]|5+ horde blacksmithing|74.41 37.36",
		"POI/Enchanting|[Enchanting]|5+ horde enchanting|78.4 53.03||Enchanter's Study",
		"POI/Engineering|[Engineering]|5+ horde engineering|71.19 39.61||Gallywix's Garage",
		"POI/Inscription|[Inscription]|5+ horde inscription|76.54 47.29",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ horde jewelcrafting|60.03 40.25||Gem Boutique",
		"POI/Leatherworking|[Leatherworking]|5+ horde leatherworking|49.97 27.84||The Tannery",
		"POI/Tailoring|[Tailoring]|5+ horde tailoring|59.35 43.09",
		"POI/Fishing|[Fishing Trainer]|5+ horde|69.12 16.52",
		"POI/Archaeology|[Archaeology]|10+ horde|73.99 31.6",
	},

	-- Ashran
	[588] = {
		-- Flight Master
		"taxinode_alliance:small|Stormshield, Ashran|alliance|37.21 90.85|link:622",
	},


	--[[ Tanaan Jungle ]]--

	[534] = {
		-- Apexis Gemcutter
		"POI/Jewelcrafting|[Apexis Gemcutter]|40+ 39177 jewelcrafting,item:127773,item:127775,item:127771,item:127772|25.82 39.84",
	},


	--[[ The Jade Forest ]]--

	[371] = {
		-- Portal
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|28.52 14.02",

		-- Professions
		"POI/Enchanting|[Enchanting]|10+ enchanting|46.85 42.94",
		"POI/Inscription|[Inscription]|10+ inscription|54.91 45.12",
		"POI/Mining|[Mining]|10+ mining|46.07 29.41",
		"POI/Herbalism|[Herbalism]|10+ herbalism alliance|45.4 86",
		"POI/Herbalism|[Herbalism]|10+ herbalism horde|27.79 15.53",
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
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|73.37 42.64",
	},

	-- Shrine of Two Moons - Hall of the Crescent Moon
	[391] = {
		"POI/Engineering|[Engineering]|10+ horde engineering|61.05 41.76",
		"POI/Bandage|[Bandage Trainer]|10+ horde tailoring|29.38 75.69",
	},


	--[[ Crystalsong Forest ]]--

	-- Dalaran
	[125] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|40.11 62.81",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|55.33 25.44",

		-- Flight Master
		"taxinode_neutral:small|Dalaran, Crystalsong Forest|1+|72.18 45.78",

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
		"POI/Bandage|[Bandage Trainer]|10+ tailoring|36.6 37.11||First to Your Aid",
		"POI/Cooking|[Cooking]|10+ alliance|40.07 65.98||A Hero's Welcome",
		"POI/Cooking|[Cooking]|10+ horde|69.77 38.77||The Filthy Animal",
		"POI/Fishing|[Fishing Trainer]|10+|52.81 65.59",
		"POI/Archaeology|[Archaeology Trainer]|10+|48.37 38.21||The Legerdemain Lounge",
	},


	--[[ Grizzly Hills ]]--

	[116] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Emerald Dreamway|10+ druid 40645|50.32 29.2",
	},


	--[[ Terokkar Forest ]]--

	-- Shattrath City
	[111] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|57.21 48.27",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|56.82 48.87",
		"TaxiNode_Continent_Neutral|Portal to Isle of Quel'Danas|25+|48.59 42.02",

		-- Mailbox
		"mailbox:objective|Mailbox|mailbox reputation:932:4|28.92 47.52", -- Aldor Rise Inn
		"mailbox:objective|Mailbox|mailbox reputation:932:4|46.96 25.43", -- Aldor Bank
		"mailbox:objective|Mailbox|mailbox reputation:932:4|48 24.64", -- Aldor Bank
		"mailbox:objective|Mailbox|mailbox reputation:934:4|55.41 80.62", -- Scryer's Tier Inn
		"mailbox:objective|Mailbox|mailbox reputation:934:4|60.07 65.05", -- Scryer Bank
		"mailbox:objective|Mailbox|mailbox reputation:934:4|61.15 64.24", -- Scryer Bank
		"mailbox:objective|Mailbox|mailbox reputation:934:4|73.77 34.4", -- World's End Tavern

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ reputation:932:4 alchemy -herbalism|38.46 30.11||Aldor Rise", -- Aldor
		"POI/Alchemy|[Alchemy and Herbalism]|5+ reputation:932:4 alchemy herbalism|38.46 30.11||Aldor Rise", -- Aldor
		"POI/Herbalism|[Herbalism]|5+ reputation:932:4 herbalism -alchemy|38.46 30.11||Aldor Rise", -- Aldor
		"POI/Blacksmithing|[Blacksmithing]|5+ reputation:932:4 blacksmithing -engineering|37.49 31.72||Aldor Rise", -- Aldor
		"POI/Blacksmithing|[Engineering and Blacksmithing]|5+ reputation:932:4 blacksmithing engineering|37.49 31.72||Aldor Rise", -- Aldor
		"POI/Engineering|[Engineering]|5+ reputation:932:4 engineering -blacksmithing|37.49 31.72||Aldor Rise", -- Aldor
		"POI/Enchanting|[Enchanting]|5+ reputation:932:4 enchanting -inscription|36.28 43.95||Aldor Rise", -- Aldor
		"POI/Enchanting|[Enchanting and Inscription]|5+ reputation:932:4 enchanting inscription|36.28 43.95||Aldor Rise", -- Aldor
		"POI/Inscription|[Inscription]|5+ reputation:932:4 inscription -enchanting|36.28 43.95||Aldor Rise", -- Aldor
		"POI/Jewelcrafting|[Jewelcrafting]|5+ reputation:932:4 jewelcrafting|35.86 20.09||Aldor Rise", -- Aldor
		"POI/Mining|[Mining]|5+ reputation:932:4 mining|35.89 48.38||Aldor Rise", -- Aldor
		"POI/Skinning|[Skinning]|5+ reputation:932:4 skinning -leatherworking -tailoring|37.47 27.21||Aldor Rise", -- Aldor
		"POI/Leatherworking|[Leatherworking]|5+ reputation:932:4 leatherworking -skinning -tailoring|37.47 27.21||Aldor Rise", -- Aldor
		"POI/Leatherworking|[Leatherworking and Skinning]|5+ reputation:932:4 leatherworking skinning|37.47 27.21||Aldor Rise", -- Aldor
		"POI/Tailoring|[Tailoring]|5+ reputation:932:4 tailoring -leatherwokring -skinning|37.47 27.21||Aldor Rise", -- Aldor
		"POI/Tailoring|[Tailoring and Leatherworking]|5+ reputation:932:4 tailoring leatherwokring|37.47 27.21||Aldor Rise", -- Aldor
		"POI/Tailoring|[Tailoring and Skinning]|5+ reputation:932:4 tailoring skinning|37.47 27.21||Aldor Rise", -- Aldor
		"POI/Bandage|[Bandage Trainer]|5+ reputation:932:4 tailoring|66.5 13.44||Shattrath Infirmary", -- Aldor
		"POI/Cooking|[Cooking]|5+|62.39 67.17",
		"POI/Archaeology|[Archaeology]|10+|62.72 70.58",
		"profession|[Profession Trainers]|10+ reputation:934:4|43.65 90.87||The Seer's Library", -- Scryer
	},

	-- Terokkar Forest
	[108] = {
		-- Professions
		"POI/Fishing|[Fishing]|5+|38.72 12.8",
	},


	--[[ Teldrassil ]]--

	-- Darnassus
	[89] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portals|alliance|43 74||Exodar, Hellfire Peninsula",
	},

	-- Teldrassil
	[57] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|55.03 93.71",
		"TaxiNode_Continent_Alliance|Portal to Exodar|alliance|52.27 89.47",
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
		"TaxiNode_Continent_Alliance|Portal to Darnassus|alliance|20.4 54.18",
	},

	-- The Exodar
	[103] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|48.34 62.93",
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
		"POI/Bandage|[Bandage Trainer]|5+ horde tailoring|29.67 21.18",
		"POI/Cooking|[Cooking]|5+ horde|50.74 53.1",
		"POI/Fishing|[Fishing]|5+ horde|56.12 46.4",
		"POI/Archaeology|[Archaeology]|10+ horde|75.05 28.12",
	},


	--[[ Moonglade ]]--

	[80] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Emerald Dreamway|10+ druid 40645|68.11 60.28",
	},


	--[[ Feralas ]]--

	[69] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Emerald Dreamway|10+ druid 40645|51.34 10.6",
	},


	--[[ Mount Hyjal ]]--

	[198] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|62.62 23.13",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|63.49 24.44",
		"TaxiNode_Continent_Neutral|Emerald Dreamway|10+ druid 40645|59 26.24",
	},


	--[[ Durotar ]]--

	-- Orgrimmar
	[85] = {
		-- Portal
		"-:large|The Western Earthshrine|horde|50.4 37.3||Cataclysm Portals",
		"TaxiNode_Continent_Horde|Portal to Undercity|art:18:19 horde|50.75 55.59",
		"TaxiNode_Continent_Horde|Portal to Tirisfal Glades|art:18:1136 horde|50.75 55.59",
		"TaxiNode_Continent_Horde|Portal to Tol Barad|30+ horde|47.39 39.26",
		"TaxiNode_Continent_Horde|Orgrimmar Embassy Portals|horde|38.37 75.59",

		-- Heirloom Vendor
		"timewalkingvendor-32x32|[Heirloom Vendor]|59770|57.1 89.95|tooltip",

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
		"POI/Bandage|[Bandage Trainer]|5+ horde tailoring|38.51 86.41",
		"POI/Cooking|[Cooking]|5+ horde|56.53 62.48||Borstan's Firepit",
		"POI/Fishing|[Fishing]|5+ horde|66.44 41.93",
		"POI/Archaeology|[Archaeology Trainer]|10+ horde|49.06 70.56||Grommash Hold",
	},

	-- Durotar
	[1] = {
		-- Legion Intro
		"Speak:small|[Holgar Stormaxe]|10+ 43926 _40518 -44663 -44184 horde|46.01 13.78|tooltip|Skip the Legion introductory quests and begin your journey in Dalaran.",
	},


	--[[ Azshara ]]--

	[76] = {
		-- Quest
		"questobjective:small|[spell]Ambitious Reach]|5+ horde 14389 -14391 -24467|25.73 37.97|tooltip|Xylem's Tower"
	},


	--[[ Silithus ]]--

	-- Silithus
	[81] = {
		-- art:86 - Cataclysm
		-- art:962 - Battle for Azeroth

		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Tiragarde|art:81:962 50+ alliance|41.49 44.85",
		"TaxiNode_Continent_Horde|Portal to Zuldazar|art:81:962 50+ horde|41.49 44.85",

		-- Teleport Pad
		"teleportationnetwork-32x32:small|Chamber of Heart|art:81:962 40+ +51211|43.2 44.49|link:1021",
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
		"TaxiNode_Continent_Alliance|Portal to Darnassus|10+ art:62:67 alliance|24.5 55.6", -- Requires level 10 to use; phased to Cataclysm
		"TaxiNode_Continent_Alliance|Portal to Darkshore|10+ art:62:1176 alliance|24.5 55.6", -- Phased to BfA
		"TaxiNode_Continent_Alliance|Stormwind Embassy Portals|alliance|49.17 9.64|high",

		-- Professions
		"POI/Alchemy|[Alchemy]|5+ alliance alchemy|55.66 86.08||Alchemy Needs",
		"POI/Blacksmithing|[Blacksmithing]|5+ alliance blacksmithing|63.66 37.01",
		"POI/Enchanting|[Enchanting]|5+ alliance enchanting|52.9 74.46||Cordell's Enchanting",
		"POI/Engineering|[Engineering]|5+ alliance engineering|62.84 31.96",
		"POI/Herbalism|[Herbalism Trainer]|5+ alliance herbalism|54.28 84.1",
		"POI/Inscription|[Inscription]|5+ alliance inscription|49.82 74.82||The Scribe of Stormwind",
		"POI/Jewelcrafting|[Jewelcrafting]|5+ alliance jewelcrafting|63.48 61.84||Denman Family Jewelers",
		"POI/Leatherworking|[Leatherworking and Skinning]|5+ alliance leatherworking skinning|71.88 62.55||The Protective Hide",
		"POI/Leatherworking|[Leatherworking]|5+ alliance leatherworking -skinning|71.68 63||The Protective Hide",
		"POI/Mining|[Mining]|5+ alliance mining|59.52 37.78||Stonehand Mining",
		"POI/Skinning|[Skinning]|5+ alliance skinning -leatherworking|72.14 62.21||The Protective Hide",
		"POI/Tailoring|[Tailoring]|5+ alliance tailoring|53.08 81.35||Duncan's Textiles",
		"POI/Bandage|[Bandage Trainer]|5+ alliance tailoring|52.18 45.38||Cathedral of Light",
		"POI/Cooking|[Cooking]|5+ alliance|50.6 73.86",
		"POI/Fishing|[Fishing]|5+ alliance|54.79 69.6",
		"POI/Archaeology|[Archaeology]|10+ alliance|85.81 25.94||Royal Library",

		-- Legion Intro
		"Speak:small|[Recruiter Lee]|10+ 40519 _42740 -44663 -44184 alliance|37.01 42.53|tooltip|Skip the Legion introductory quests and begin your journey in Dalaran.",
	},

	-- Telogrus Rift
	[971] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Rift to Stormwind|alliance|27.99 21.51",
		"TaxiNode_Continent_Neutral|Rift to Fathom's Edge|1+|27.9 28.61",
		"TaxiNode_Continent_Neutral|Rift to Telogrus|1+|29.45 37.79",
		"TaxiNode_Continent_Neutral|Rift to Cosmic Horizon|1+|30.05 44.11",
		"TaxiNode_Continent_Neutral|Rift to Fathom's Edge|1+|40.02 49.31",
		"TaxiNode_Continent_Neutral|Rift to Equinox Reach|1+|43.93 63.74",
		"TaxiNode_Continent_Neutral|Rift to Cosmic Horizon|1+|48.95 72.06",
	},

	-- Mechagon City
	[1573] = {
		-- Portal
		"TaxiNode_Continent_Alliance|Stormwind Teleportation Unit|alliance|20.5 59.8",
		--"TaxiNode_Continent_Neutral|Mechagon City Teleporter|alliance|31 87.75", -- Inactive
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
		"POI/Bandage|[Bandage Trainer]|5+ alliance -herbalism tailoring|54.92 58.35||Ironforge Physician",
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


	--[[ Eversong Woods ]]--

	-- Silvermoon City
	[110] = {
		-- Portal
		"TaxiNode_Continent_Horde|Translocator to Tirisfal Glades|horde|49.46 15.05",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|58.54 18.65",
	},


	--[[ Tirisfal Glades ]]--

	-- Undercity
	[90] = {
		-- Portal
		"TaxiNode_Continent_Horde|Portal to Hellfire Peninsula|10+ horde|85.27 17.05",

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
		"POI/Bandage|[Bandage Trainer]|5+ horde tailoring|73.15 55.16",
		"POI/Cooking|[Cooking]|5+ horde|62.15 44.9",
		"POI/Fishing|[Fishing]|5+ horde|80.7 31.27",
		"POI/Archaeology|[Archaeology]|10+ horde|75.41 37.71",
	},

	-- Tirisfal Glades
	[18] = {
		-- art:19 - Cataclysm
		-- art:1136 - Battle for Azeroth

		-- Portal
		"TaxiNode_Continent_Horde|Translocator to Silvermoon City|horde|59.41 67.44",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde art:18:19|60.74 58.68",
		"TaxiNode_Continent_Horde|Portal to Stranglethorn Vale|horde art:18:19|61.88 59.01",
		"TaxiNode_Continent_Horde|Portal to Howling Fjord|10+ horde art:18:19|59.09 58.9",
	},


	--[[ Duskwood ]]--

	[47] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Emerald Dreamway|10+ druid 40645|46.57 35.63",
	},


	--[[ The Hinterlands ]]--

	[26] = {
		-- Portal
		"TaxiNode_Continent_Neutral|Emerald Dreamway|10+ druid 40645|62.28 22.67",
	},


	--[[ Darkmoon Island ]]--

	[407] = {
		-- Portal
		"TaxiNode_Continent_Al'|Portal to Elwynn Forest|alliance|50.56 90.7",
		"TaxiNode_Continent_Alliance|Portal to Elwynn Forest|alliance|51.22 23.1",
		"TaxiNode_Continent_Horde|Portal to Mulgore|horde|50.56 90.7",
		"TaxiNode_Continent_Horde|Portal to Mulgore|horde|51.22 23.1",
	},


	--[[ Tanaris ]]--

	-- Tanaris
	[71] = {
		-- Door
		"poi-door-down:small|Caverns of Time|1+|64.98 49.97|link:74",
	},

	-- Timeless Tunnel
	[74] = {
		-- Door
		"poi-door-up:small|Tanaris|1+|52.85 29.52|link:71",
		"poi-door-down:small|Caverns of Time|1+|30.94 73.52|link:75",

		-- Portal
		"TaxiNode_Continent_Alliance|Portal to Stormwind|alliance|58.98 26.73",
		"TaxiNode_Continent_Horde|Portal to Orgrimmar|horde|58.18 26.68",
	},

	-- Caverns of Time
	[75] = {
		-- Door
		"poi-door-up:small|Timeless Tunnel|1+|73.74 50.86|link:74",
	},

}