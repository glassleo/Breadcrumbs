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

		-- Profession
		"poi-scrapper|Scrap-O-Matic 1000|alliance|77.13 16.31",
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


	--[[ Teldrassil ]]--

	-- Teldrassil
	[57] = {
		-- Portal
		"mageportalalliance|Portal to Stormwind|alliance|55.03 93.71",
		"mageportalalliance|Portal to Exodar|alliance|52.27 89.47",
	},

	-- Darnassus
	[89] = {
		-- Portal
		"mageportalalliance|Portal to Exodar|alliance|44.24 78.68",

		-- Profession
		"POI/Alchemy|Ainethil|alliance alchemy|53.91 38.52|[Alchemy Trainer]",
		"POI/Engineering|Tana Lentner|alliance engineering|49.62 32.37|[Engineering Trainer]",
		"POI/Cooking|Alegorn|alliance|49.89 36.63|[Cooking Trainer]",
	},


	--[[ Azuremyst Isle ]]--

	-- Azuremyst Isle
	[97] = {
		-- Portal
		"mageportalalliance|Portal to Darnassus|alliance|20.4 54.18",
	},

	-- The Exodar
	[103] = {
		-- Portal
		"mageportalalliance|Portal to Stormwind|alliance|48.34 62.93",
	},

}