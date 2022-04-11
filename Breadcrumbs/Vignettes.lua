local _, Data = ...

-- Vignettes

--[[
	Data Structure

	[MapID] = {
		[QuestID|"follower:id"] = "Name|Requirements|Coordinates|Location|Flags|Tooltip|Tooltip|Tooltip|...", -- Comments
	},
]]--

Data.Vignettes = {

	--[[ Ardenweald ]]--

	[1565] = {
		-- Treasure
		[61073] = "Faerie Trove|48+|49.71 55.89||treasure item:182673|Contains|{3749005} [uncommon]Shimmerbough Hoarder]",
	},


	--[[ Bastion ]]--

	[1533] = {
		-- Treasure
		[58329] = "Purifying Draught|48+|52.04 86.07||treasure item:174007|Contains|{1528676} [Purifying Draught]",
	},


	--[[ Tiragarde Sound ]]--

	-- Boralus
	[1161] = {
		-- Treasure
		[52870] = "Scrimshaw Cache|10+|63.21 6.5|\"Inside a cave\"|treasure down|Contains|{2032600} [War Resources]",

		-- Vignette
		[51877] = {"Sawtooth|10+ -paladin -shaman -monk|\"Swims around the area\"|vignette", "Sawtooth|10+ paladin,shaman,monk|\"Swims around the area\"|vignette item:155273|Rewards|{1698637} [rare]Sharktooth Hatchet]",},
	},

	-- Tiragarde Sound
	[895] = {
		-- Treasure
		[49963] = "Hay Covered Chest|10+ 49983|67.36 51.64||treasure item:155571|Contains|{1726328} [rare]Garyl's Riding Blanket]", -- Boralus
		[49983] = {"Guardian of the Spring|10+|61.37 51.28|\"Bring him to Roan Berthold for a reward\"|event", "Roan Berthold|10+|67.4 51.66|\"Bring Guardian of the Spring to Roan for a reward\"|treasure item:155571|Hay Covered Chest|{1726328} [rare]Garyl's Riding Blanket]",},
		[52866] = "Cutwater Treasure Chest|10+|72.49 58.14|\"Inside a cave\"|treasure down item:155381|Contains|{1048292} [rare]Cutwater-Captain's Sapphire Ring]",
		[52866] = "Precarious Noble Cache|10+|56.03 33.19||treasure|Contains|{2004597} [Polished Pet Charm] (5)|{2032600} [War Resources]",
		[52867] = "Forgotten Smuggler's Stash|10+|61.78 62.75|\"Inside a cave\"|treasure down|Contains|{2032600} [War Resources]",
		[52870] = "Scrimshaw Cache|10+|72.65 21.34|\"Inside a cave\"|treasure down link:1161|Contains|{2032600} [War Resources]", -- Boralus
	},


	--[[ Drustvar ]]--

	[896] = {
		-- Treasure
		[53356] = "Web-Covered Chest|10+|33.71 30.08||treasure|Contains|{2032600} [War Resources]",
		[53357] = "Merchant's Chest|10+|25.75 19.94|\"Nearby Gorging Ravens have a chance to drop the [Merchant's Key]\"|treasure|Contains|{2004597} [Polished Pet Charm] (5)|{2032600} [War Resources]",
		[53385] = "Runebound Cache|10+|63.3 65.85||treasure item:163743|Unlock Sequence|{1323037} [spell]Left]|{1323035} [spell]Bottom]|{1323038} [spell]Top]|{1323039} [spell]Right]||Contains|{896907} [rare]Drust Soulcatcher]|{2032600} [War Resources]",
		[53386] = "Runebound Chest|10+|44.22 27.7||treasure item:163742|Unlock Sequence|{1323038} [spell]Left]|{1323037} [spell]Right]|{1323035} [spell]Bottom]|{1323039} [spell]Top]||Contains|{2101967} [rare]Heartsbane Grimoire]|{2032600} [War Resources]",
		[53387] = "Runebound Coffer|10+|33.69 71.73||treasure item:163740|Unlock Sequence|{1323035} [spell]Right]|{1323039} [spell]Top]|{1323038} [spell]Left]|{1323037} [spell]Bottom]||Contains|{940537} [rare]Drust Ritual Knife]|{2032600} [War Resources]",
		[53471] = "Hexed Chest|10+|18.53 51.32||treasure item:163789|Contains|{135437} [uncommon]Bundle of Wicker Sticks]|{2032600} [War Resources]",
		[53472] = "Bespelled Chest|10+|55.59 51.83||treasure item:163790|Contains|{134937} [uncommon]Spooky Incantation]|{2032600} [War Resources]",
		[53473] = "Ensorcelled Chest|10+|67.77 73.67||treasure item:163791|Contains|{1516565} [uncommon]Miniature Stag Skull]|{2032600} [War Resources]",
		[53474] = "Enchanted Chest|10+|25.45 24.18||treasure item:163796|Contains|{133720} [uncommon]Wolf Pup Spine]|{2032600} [War Resources]",
		[53475] = "Stolen Thornspeaker Cache|10+|24.26 48.31||treasure|Contains|{2004597} [Polished Pet Charm] (5)|{2032600} [War Resources]",
	},


	--[[ Stormsong Valley ]]--

	-- Stormsong Valley
	[942] = {
		-- Treasure
		[49811] = "Smuggler's Stash|10+|58.6 83.88|\"Underneath the docks\"|treasure|Contains|{2032600} [War Resources]",
		[50089] = "Old Ironbound Chest|10+|42.86 47.23|\"Inside a cave\"|treasure down|Contains|{2032600} [War Resources]",
		[50526] = "Frosty Treasure Chest|10+|48.97 84.1||treasure|Contains|{2032600} [War Resources]",
		[50734] = "Sunken Strongbox|10+|67.21 43.21|\"In the water underneath the ship\"|treasure|Contains|{2004597} [Polished Pet Charm] (5)|{2032600} [War Resources]",
		[50937] = "Hidden Scholar's Chest|10+|59.91 39.06||treasure|Contains|{2032600} [War Resources]",
		[51449] = "Weathered Treasure Chest|10+|66.93 12.06|\"Inside a cave\"|treasure down|Contains|{2032600} [War Resources]",
		[52429] = "Carved Wooden Chest|10+|44.44 73.53|\"Inside a cave on top of a platform\"|treasure down item:162000|Contains|{2114667} [uncommon]Pig Nose]|{2032600} [War Resources]",
		[52976] = "Venture Co. Supply Chest|10+|36.69 23.23||treasure|Contains|{2032600} [War Resources]",
		[52980] = "Forgotten Chest|10+|46 30.69||treasure|Contains|{2032600} [War Resources]",
		-- Discarded Lunchbox
	},

	-- Thornheart
	[1183] = {
		-- Treasure
		[52429] = "Carved Wooden Chest|10+|59.6 29.2|\"Inside a cave on top of a platform\"|treasure item:162000|Contains|{2114667} [uncommon]Pig Nose]|{2032600} [War Resources]",
	},


	--[[ Zuldazar ]]--

	-- Dazar'alor
	[1165] = {
		[48938] = "Offerings of the Chosen|10+|38.28 7.14||treasure|Contains|{2032600} [War Resources]",
		[50947] = "Da White Shark's Bounty|10+|59.31 88.66|\"Revealed after killing Da White Shark\"|treasure|Contains|{2032600} [War Resources]",
		[51338] = "Cache of Secrets|10+|44.47 26.91|\"Inside a cave behind a waterfall\"|treasure down|Contains|{2032600} [War Resources]",
		[51624] = "Riches of Tor'nowa|10+|34.93 54.4||treasure|Contains|{2032600} [War Resources]",
	},

	-- Zuldazar
	[862] = {
		-- Treasure
		[48938] = "Offerings of the Chosen|10+|54.08 31.48||treasure link:1165|Contains|{2032600} [War Resources]", -- Dazar'alor
		[49257] = "Warlord's Cache|10+|49.5 65.26||treasure|Contains|{2032600} [War Resources]",
		[49936] = "Spoils of Pandaria|10+|51.71 86.88|Breath of Pa'ku|treasure down link:1177|Contains|{2032600} [War Resources]", -- Breath of Pa'ku
		[50259] = "Witch Doctor's Hoard|10+|64.71 21.67||treasure|Contains|{2032600} [War Resources]",
		[50582] = "Gift of the Brokenhearted|10+|51.43 26.61|Incense|treasure|Contains|{2032600} [War Resources]",
		[50707] = "Dazar's Forgotten Chest|10+|38.79 34.44||treasure item:153702|Contains|{2003614} [uncommon]Kubiline]|{2032600} [War Resources]",
		[50947] = "Da White Shark's Bounty|10+|61.07 58.6|Da White Shark|treasure link:1165|Contains|{2032600} [War Resources]",
		[50949] = "The Exile's Lament|10+|71.9 16.8|The Exile's Hideaway|treasure down|Contains|{2004597} [Polished Pet Charm] (5)|{2032600} [War Resources]", -- check exact coords
		[51338] = "Cache of Secrets|10+|56.14 38.05|\"Inside a cave behind a waterfall\"|treasure link:1165|Contains|{2032600} [War Resources]", -- Dazar'alor
		[51624] = "Riches of Tor'nowa|10+|52.96 47.2||treasure|Contains|{2032600} [War Resources]",
	},

	-- Breath of Pa'ku - Upper Deck
	[1176] = {
		-- Treasure
		[49936] = "Spoils of Pandaria|10+|23.02 23.82||treasure down link:1177|Contains|{2032600} [War Resources]",
	},

	-- Breath of Pa'ku - Lower Deck
	[1177] = {
		-- Treasure
		[49936] = "Spoils of Pandaria|10+|23.02 23.82||treasure|Contains|{2032600} [War Resources]",
	},


	--[[ Nazmir ]]--

	[863] = {
		-- Treasure
		[49313] = "Wunja's Trove|10+|35.43 54.99|Burial Mound|treasure down|Contains|{2032600} [War Resources]",
		[49483] = "Shipwrecked Chest|10+|66.79 17.33||treasure|Contains|{2032600} [War Resources]",
		[49484] = "Offering to Bwonsamdi|10+|42.77 26.2||treasure|Contains|{2032600} [War Resources]",
		[49867] = "Lucky Horace's Lucky Chest|10+|77.68 36.15||treasure|Contains|{2032600} [War Resources]",
		[49885] = "\"Cleverly\" Disguised Chest|10+|35.64 85.61||treasure|Contains|{2032600} [War Resources]",
		[49889] = "Venomous Seal|10+|46.23 82.95||treasure|Contains|{2032600} [War Resources]",
		[49891] = "Lost Nazmani Treasure|10+|62.1 34.86|\"Inside an underwater cave\"|treasure down|Contains|{2032600} [War Resources]",
		[49979] = "Cursed Nazmani Chest|10+|43.06 50.79||treasure down|Contains|{2032600} [War Resources]",
		[50045] = "Swallowed Chest|10+|76.88 62.15||treasure|Contains|{2032600} [War Resources]",
		[50061] = "Partially-Digested Treasure|10+|77.9 46.36||treasure|Contains|{2032600} [War Resources]",
	},


	--[[ Vol'dun ]]--

	[864] = {
		-- Treasure
		[51093] = "Grayal's Last Offering|10+|48.17 64.7|Ancient Altar\nAtul'Aman|treasure down|Contains|{2032600} [War Resources]",
		[50237] = {"Ashvane Spoils|10+ -47326|46.59 88.01|Mine Cart|treasure|Contains|{2032600} [War Resources]", "Ashvane Spoils|10+ 47326|44.33 92.22||treasure|Contains|{2032600} [War Resources]",}, -- 47326 tracks the Mine Cart
		[51132] = "Lost Explorer's Bounty|10+|49.78 79.39||treasure|Contains|{2032600} [War Resources]",
		[51133] = "Sandfury Reserve|10+|47.19 58.46||treasure|Contains|{2032600} [War Resources]",
		[51135] = "Stranded Cache|10+|44.51 26.15||treasure|Contains|{2032600} [War Resources]",
		[51136] = "Excavator's Greed|10+|57.74 64.63||treasure down|Contains|{2032600} [War Resources]",
		[51137] = "Zem'lan's Buried Treasure|10+|29.38 87.42|Disturbed Sand|treasure|Contains|{2032600} [War Resources]",
		[52992] = "Lost Offerings of Kimbul|10+|57.06 11.2||treasure|Contains|{2032600} [War Resources]",
		[52994] = "Deadwood Chest|10+|40.57 85.75||treasure|Contains|{2004597} [Polished Pet Charm] (10)|{2032600} [War Resources]",
		[53004] = "Sandsunken Treasure|10+|26.48 45.35|Abandoned Bobber|treasure|Contains|{2004597} [Polished Pet Charm] (5)|{2032600} [War Resources]",
	},


	--[[ Azsuna ]]--

	-- Azsuna
	[630] = {
		-- Treasure
		[37596] = "Small Treasure Chest|10+|53.03 37.26||treasure|Contains|{1397630} [Order Resources]",
		[37649] = "Glimmering Treasure Chest|10+|50.41 54.38||treasure down link:632|Contains|{1397630} [Order Resources]", -- Oceanus Cove
		[37829] = "Small Treasure Chest|10+|53.17 64.46||treasure|Contains|{1397630} [Order Resources]",
		[37831] = "Small Treasure Chest|10+|49.64 34.47||treasure|Contains|{1397630} [Order Resources]",
		[38367] = "Glimmering Treasure Chest|10+|42.63 8.08||treasure|Contains|{1397630} [Order Resources]",
		[40711] = {"Small Treasure Chest|10+ -flying|55.62 18.53|\"Take the Ley Portal inside the tower\"|treasure up|Contains|{1397630} [Order Resources]", "Small Treasure Chest|10+ flying|55.62 18.53|\"On top of the tower\"|treasure|Contains|{1397630} [Order Resources]",},
		[42273] = "Small Treasure Chest|10+|62.38 58.4||treasure|Contains|{1397630} [Order Resources]",
		[42278] = "Small Treasure Chest|10+|62.99 54.18|\"Inside Gloombound Barrow\"|treasure down|Contains|{1397630} [Order Resources]",
		[42284] = "Small Treasure Chest|10+|53.64 39.82||treasure down link:631|Contains|{1397630} [Order Resources]", -- Nar'thalas Academy
		[42285] = "Small Treasure Chest|10+ 37730|54.3 39||treasure down link:631|Contains|{1397630} [Order Resources]", -- Nar'thalas Academy - door is open after completing 37730
		[42290] = {"Small Treasure Chest|10+ -37536|50.2 50.29|\"Inside the Shipwreck Arena cave\"|treasure down|Contains|{1397630} [Order Resources]", "Small Treasure Chest|10+ 37538|50.2 50.29|\"Inside the Shipwreck Arena cave\"|treasure down|Contains|{1397630} [Order Resources]",}, -- Phased out once 37536 completes and comes back after 37538 is turned in
		[42291] = "Small Treasure Chest|10+|48.01 56.24||treasure down link:632|Contains|{1397630} [Order Resources]", -- Oceanus Cove
		[42293] = "Small Treasure Chest|10+|63.64 39.17||treasure|Contains|{1397630} [Order Resources]",
		[44104] = "Small Treasure Chest|10+|53.61 18.14||treasure down|Contains|{1397630} [Order Resources]",
	},

	-- Nar'thalas Academy
	[631] = {
		-- Treasure
		[42284] = "Small Treasure Chest|10+|62.02 83.77||treasure|Contains|{1397630} [Order Resources]",
		[42285] = "Small Treasure Chest|10+ 37730|71.73 21.62||treasure|Contains|{1397630} [Order Resources]", -- door is open after completing 37730
	},

	-- Oceanus Cove
	[632] = {
		-- Treasure
		[37649] = "Glimmering Treasure Chest|10+|69.68 48||treasure|Contains|{1397630} [Order Resources]",
		[42291] = "Small Treasure Chest|10+|45.36 66.86||treasure|Contains|{1397630} [Order Resources]",
	},


	--[[ Val'sharah ]]--

	-- Val'sharah
	[641] = {
		-- Treasure
		[38366] = "Small Treasure Chest|10+|48.68 73.79|\"Inside a tree trunk\"|treasure|Contains|{1397630} [Order Resources]",
		[38369] = "Small Treasure Chest|10+|39.95 54.6||treasure|Contains|{1397630} [Order Resources]", -- has phasing issues with the healer Broken Shore quest line
		[39079] = "Small Treasure Chest|10+|38.64 67.18||treasure|Contains|{1397630} [Order Resources]",
		[39080] = {"Small Treasure Chest|10+ §38644|38.4 65.32|Heathrow Cellar|treasure|Contains|{1397630} [Order Resources]", "Small Treasure Chest|10+ 38644|38.4 65.32|Heathrow Cellar|treasure hardcore|Contains|{1397630} [Order Resources]||[ff0000]To get inside Heathrow Cellar you will have to die near the door and resurrect on the other side]",}, -- approx coords -- Door can only be opened while doing quest 38644
		[39084] = "Small Treasure Chest|10+|43.22 54.88||treasure|Contains|{1397630} [Order Resources]",
		[39085] = "Small Treasure Chest|10+|40.51 44.69||treasure down link:642|Contains|{1397630} [Order Resources]", -- Darkpens
		[38355] = "Small Treasure Chest|10+|64.7 51.26||treasure|Contains|{1397630} [Order Resources]",
		[38386] = "Small Treasure Chest|10+|67.39 53.41||treasure|Contains|{1397630} [Order Resources]",
		[44139] = "Small Treasure Chest|10+|63.91 45.57||treasure|Contains|{1397630} [Order Resources]",
	},

	-- Darkpens
	[642] = {
		-- Treasure
		[39085] = "Small Treasure Chest|10+|41.94 88.35||treasure|Contains|{1397630} [Order Resources]",
	},


	--[[ Highmountain ]]--

	-- Highmountain
	[650] = {
		-- Treasure
		[39531] = "A Steamy Jewelry Box|10+|63.49 59.32||treasure link:750|Contains|{454054} [Shiny Silver Necklace]", -- Thunder Totem
		[40471] = "Treasure Chest|10+ 38909|47.1 61.32||treasure link:652|Contains|{1397630} [Order Resources]", -- double check prereq 38909 -- Hall of Chieftains
		[40475] = "Highmountain Clan Chest|10+|45.13 59.92||treasure link:750|Contains|{1397630} [Order Resources]", -- Thunder Totem
		[40475] = "Small Treasure Chest|10+|45.13 59.92||treasure link:750|Contains|{1397630} [Order Resources]", -- Thunder Totem
		[40476] = "Glimmering Treasure Chest|10+|38.3 61.01||treasure down link:655|Contains|{1397630} [Order Resources]", -- Lifespring Cavern
		[40484] = "Small Treasure Chest|10+|53.04 52.23|\"Inside Candle Rock\"|treasure down|Contains|{1397630} [Order Resources]", -- Candle Rock
		[40489] = "Treasure Chest|10+|85.23 37.96||treasure down link:651|Contains|{1397630} [Order Resources]", -- Bitestone Enclave
		[40493] = "Small Treasure Chest|10+|53.04 52.23|\"On the furthest ledge inside Crystal Fissure\"|treasure down|Contains|{1397630} [Order Resources]", -- Crystal Fissure
		[40506] = "Small Treasure Chest|10+|50.81 35.04||treasure|Contains|{1397630} [Order Resources]",

		-- Vignette
		[39606] = "Treasures of Deathwing|10+|49.66 71.17|Highmountain Brazier|vignette down link:657|Glimmering Treasure Chest|{1397630} [Order Resources]", -- Neltharion's Vault

		-- Rare
		[48381] = "Obsidian Deathwarder|10+|49.08 83.35||rare down link:658|Drops|{634013} [poor]Curio of Neltharion]", -- Path of Huln
	},

	-- Thunder Totem
	[750] = {
		-- Treasure
		[40475] = "Small Treasure Chest|10+|32.36 41.72||treasure|Contains|{1397630} [Order Resources]",
		[40471] = "Treasure Chest|10+ 38909|47.34 52.34||treasure down link:652|Contains|{1397630} [Order Resources]", -- double check prereq 38909 -- Hall of Chieftains
		[39531] = "A Steamy Jewelry Box|10+|63.49 59.32||treasure|Contains|{454054} [Shiny Silver Necklace]",
	},

	-- Hall of Chieftains, Thunder Totem
	[652] = {
		-- Treasure
		[40471] = "Treasure Chest|10+ 38909|62.95 67.85||treasure|Contains|{1397630} [Order Resources]", -- double check prereq 38909
	},

	-- Lifespring Lower Cavern
	[656] = {
		-- Treasure
		[40476] = "Glimmering Treasure Chest|10+|52.87 23.96||treasure down link:655|Contains|{1397630} [Order Resources]",
	},

	-- Lifespring Upper Cavern
	[655] = {
		-- Treasure
		[40476] = "Glimmering Treasure Chest|10+|52.87 23.96||treasure|Contains|{1397630} [Order Resources]",
	},

	-- Bitestone Enclave
	[651] = {
		-- Treasure
		[40489] = "Treasure Chest|10+|85.23 37.96||treasure|Contains|{1397630} [Order Resources]",
	},

	-- Neltharion's Vault
	[657] = {
		-- Vignette
		[39606] = "Treasures of Deathwing|10+|63.78 37.51|Highmountain Brazier|vignette|Glimmering Treasure Chest|{1397630} [Order Resources]",
	},

	-- Path of Huln
	[658] = {
		-- Rare
		[48381] = "Obsidian Deathwarder|10+|54.67 84.03||rare|Drops|{634013} [poor]Curio of Neltharion]",
	},


	--[[ Stormheim ]]--

	-- Stormheim
	[634] = {
		-- Treasure
		[42628] = "Small Treasure Chest|10+|72.13 54.89||treasure|Contains|{1397630} [Order Resources]",
		[42629] = "Small Treasure Chest|10+|75.15 49.47||treasure|Contains|{1397630} [Order Resources]",
		[42632] = "Small Treasure Chest|10+|73.96 52.23||treasure|Contains|{1397630} [Order Resources]",
		[43237] = "Small Treasure Chest|10+|73.98 58.58||treasure|Contains|{1397630} [Order Resources]",
		[43307] = "Small Treasure Chest|10+|78.42 71.39||treasure|Contains|{1397630} [Order Resources]",
	},


	--[[ Frostfire Ridge ]]--

	-- Frostfire Ridge
	[525] = {
		[33942] = "Supply Dump|10+|16.12 49.72||treasure|Contains|{1005027} [Garrison Resources]",
	},


	--[[ Shadowmoon Valley ]]--

	-- Lunarfall
	[582] = {
		-- Treasure
		[35383] = {"Pipper's Buried Supplies|10+ alliance garrison:1|30.9 27.7||treasure|Contains|{1005027} [Garrison Resources]",},
	},


	--[[ Elwynn Forest ]]--

	[37] = {
		-- Treasure
		[54131] = "Waterlogged Chest|1+|32.2 63.5||treasure item:3678|Contains|{135274} [Pitted Defias Shortsword]|{134939} [Recipe: Crocolisk Steak]|{133694} [poor]Red Defias Mask]|{133994} [Stormwind Brie]",
	},

}