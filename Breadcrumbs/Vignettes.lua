local _, Data = ...

-- Vignettes

--[[
	Data Structure

	[MapID] = {
		[QuestID|"follower:id"] = "Title|Requirements|Coordinates|Flags|Tooltip|Tooltip|Tooltip|...", -- Comments
	},
]]--

Data.Vignettes = {

	--[[ Bastion ]]--

	[1533] = {
		[58329] = "Purifying Draught|10+|52.04 86.07|treasure item:174007||Contains:|{1528676} [Purifying Draught]",
	},


	--[[ Azsuna ]]--

	-- Azsuna
	[630] = {
		[42278] = "Small Treasure Chest|10+|62.99 54.18|treasure currency:1220||Contains:|{1397630} [Order Resources]||Inside Gloombound Barrow",
		[42290] = "Small Treasure Chest|10+ ~37538|50.2 50.29|treasure currency:1220||Contains:|{1397630} [Order Resources]||Inside cave",
		[37829] = "Small Treasure Chest|10+|53.17 64.46|treasure currency:1220||Contains:|{1397630} [Order Resources]",
		[42273] = "Small Treasure Chest|10+|62.38 58.4|treasure currency:1220||Contains:|{1397630} [Order Resources]",

		-- Oceanus Cove
		[37649] = "? Treasure Chest|10+|50.41 54.38|treasure currency:1220 down link:632||Contains:|{1397630} [Order Resources]",
		[42291] = "Small Treasure Chest|10+|48.01 56.24|treasure currency:1220 down link:632||Contains:|{1397630} [Order Resources]",
	},

	-- Oceanus Cove
	[632] = {
		[37649] = "? Treasure Chest|10+|69.68 48|treasure currency:1220||Contains:|{1397630} [Order Resources]",
		[42291] = "Small Treasure Chest|10+|45.36 66.86|treasure currency:1220||Contains:|{1397630} [Order Resources]",
	},


	--[[ Val'sharah ]]--

	-- Val'sharah
	[641] = {
		[38366] = "Small Treasure Chest|10+|48.68 73.79|treasure currency:1220||Contains:|{1397630} [Order Resources]||Inside a tree trunk",
		[39080] = "Small Treasure Chest|10+ §38644|38.4 65.32|treasure currency:1220||Contains:|{1397630} [Order Resources]||Inside Heathrow Cellar", -- approx coords -- Door can only be opened while doing quest 38644
		[38369] = "Small Treasure Chest|10+|39.95 54.6|treasure currency:1220||Contains:|{1397630} [Order Resources]||Might not be visible due to phasing", -- has phasing issues with some quests

		-- Darkpens
		[39085] = "Small Treasure Chest|10+|40.51 44.69|treasure currency:1220 down link:642||Contains:|{1397630} [Order Resources]",
	},

	-- Darkpens
	[642] = {
		[39085] = "Small Treasure Chest|10+|41.94 88.35|treasure currency:1220||Contains:|{1397630} [Order Resources]",
	},


	--[[ Shadowmoon Valley ]]--

	-- Lunarfall
	[582] = {
		[35383] = {"Pipper's Buried Supplies|10+ alliance garrison:1|30.9 27.7|treasure currency:824||Contains:|{1005027} [Garrison Resources]",},
	},


	--[[ Elwynn Forest ]]--

	[37] = {
		--[] = "Waterlogged Chest|1+|32.2 63.5|treasure item:3678||Contains:|{135274} [Pitted Defias Shortsword]|{134939} [Recipe: Crocolisk Steak]|{133694} [poor]Red Defias Mask]|{133994} [Stormwind Brie]",
	},

}