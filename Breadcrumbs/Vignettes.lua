local _, Data = ...

-- Vignettes

--[[
	Data Structure

	[MapID] = {
		[QuestID|"follower:id"] = "Name|Requirements|Coordinates|Location|Flags|Tooltip|Tooltip|Tooltip|...", -- Comments
	},
]]--

Data.Vignettes = {

	--[[ Bastion ]]--

	[1533] = {
		[58329] = "Purifying Draught|10+|52.04 86.07|treasure item:174007||Contains:|{1528676} [Purifying Draught]",
	},


	--[[ Tiragarde Sound ]]--

	-- Boralus
	[1161] = {
		[52870] = "Scrimshaw Cache|10+|63.21 6.5|Boralus|treasure currency:1560|Contains:|{2032600} [War Resources]",
		[53407] = "Jay's Songbook|10+|53.15 17.67|Hops, Lines & Sinker Brewing|treasure item:163716|Contains:|{1500866} [poor]Forbidden Sea Shanty of Inebriation]",
	},

	-- Tiragarde Sound
	[895] = {
		[52870] = "Scrimshaw Cache|10+|72.65 21.34|Boralus|treasure currency:1560|Contains:|{2032600} [War Resources]",
	},


	--[[ Azsuna ]]--

	-- Azsuna
	[630] = {
		[42278] = "Small Treasure Chest|10+|62.99 54.18|Gloombound Barrow|treasure currency:1220|Contains:|{1397630} [Order Resources]",
		[42290] = "Small Treasure Chest|10+ ~37538|50.2 50.29|Oceanus Cove|treasure currency:1220|Contains:|{1397630} [Order Resources]",
		[37829] = "Small Treasure Chest|10+|53.17 64.46|A|treasure currency:1220|Contains:|{1397630} [Order Resources]",
		[42273] = "Small Treasure Chest|10+|62.38 58.4|The Ruined Sanctum|treasure currency:1220|Contains:|{1397630} [Order Resources]",
		[42293] = "Small Treasure Chest|10+|63.64 39.17|Hatecoil Warcamp|treasure currency:1220|Contains:|{1397630} [Order Resources]",

		-- Oceanus Cove
		[37649] = "? Treasure Chest|10+|50.41 54.38|Oceanus Cove|treasure currency:1220 down link:632|Contains:|{1397630} [Order Resources]",
		[42291] = "Small Treasure Chest|10+|48.01 56.24|Oceanus Cove|treasure currency:1220 down link:632|Contains:|{1397630} [Order Resources]",
	},

	-- Oceanus Cove
	[632] = {
		[37649] = "? Treasure Chest|10+|69.68 48|Oceanus Cove|treasure currency:1220|Contains:|{1397630} [Order Resources]",
		[42291] = "Small Treasure Chest|10+|45.36 66.86|Oceanus Cove|treasure currency:1220|Contains:|{1397630} [Order Resources]",
	},


	--[[ Val'sharah ]]--

	-- Val'sharah
	[641] = {
		[38366] = "Small Treasure Chest|10+|48.68 73.79|A|treasure currency:1220|Contains:|{1397630} [Order Resources]",
		[39080] = "Small Treasure Chest|10+ §38644|38.4 65.32|Heathrow Cellar|treasure currency:1220|Contains:|{1397630} [Order Resources]", -- approx coords -- Door can only be opened while doing quest 38644
		[38369] = "Small Treasure Chest|10+|39.95 54.6|Black Rook Hold|treasure currency:1220|Contains:|{1397630} [Order Resources]||Might not be visible due to phasing", -- has phasing issues with some quests

		-- Darkpens
		[39085] = "Small Treasure Chest|10+|40.51 44.69|Darkpens|treasure currency:1220 down link:642|Contains:|{1397630} [Order Resources]",
	},

	-- Darkpens
	[642] = {
		[39085] = "Small Treasure Chest|10+|41.94 88.35|Darkpens|treasure currency:1220|Contains:|{1397630} [Order Resources]",
	},


	--[[ Shadowmoon Valley ]]--

	-- Lunarfall
	[582] = {
		[35383] = {"Pipper's Buried Supplies|10+ alliance garrison:1|30.9 27.7|Lunarfall|treasure currency:824|Contains:|{1005027} [Garrison Resources]",},
	},


	--[[ Elwynn Forest ]]--

	[37] = {
		--[] = "Waterlogged Chest|1+|32.2 63.5|Mirror Lake|treasure item:3678|Contains:|{135274} [Pitted Defias Shortsword]|{134939} [Recipe: Crocolisk Steak]|{133694} [poor]Red Defias Mask]|{133994} [Stormwind Brie]",
	},

}