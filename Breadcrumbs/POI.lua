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
		-- To do: Add check for Nazjatar portal
		{"mageportalalliance|Sanctum of the Sages|10+ 49- alliance 47186|70.52 17.28||Portals to:|{mageportalalliance} [Stormwind]|{mageportalalliance} [The Exodar]|{mageportalalliance} [Ironforge]", "mageportalalliance|Sanctum of the Sages|50+ alliance 47186|70.52 17.28||Portals to:|{mageportalalliance} [Stormwind]|{mageportalalliance} [The Exodar]|{mageportalalliance} [Ironforge]|{mageportalalliance} [Silithus]",},

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
		"mageportalalliance|Portal to Stormwind|alliance|39.55 63.19",

		-- Flight Master
		"taxinode_neutral|Aludane Whitecloud|1+|69.84 51.13|[Flight Master]",

		-- Profession Trainer
		"POI/Alchemy|The Agronomical Apothecary|10+ alchemy|41.44 31.75|[Alchemy]",
		"POI/Blacksmithing|Tanks for Everything|10+ blacksmithing|44.96 29.27|[Blacksmithing]",
		"POI/Enchanting|Simply Enchanting|10+ enchanting|38.64 40.93|[Enchanting]",
		"POI/Engineering|Like Clockwork|10+ engineering|38.75 25.38|[Engineering]",
		"POI/Herbalism|Dalaran Greenhouse|10+ herbalism|43 34.72|[Herbalism]",
		"POI/Inscription|The Scribe's Sacellum|10+ inscription|43.29 34.21|[Inscription]",
		"POI/Jewelcrafting|Cartier & Co. Fine Jewelry|10+ jewelcrafting|39.74 34.84|[Jewelcrafting]",
		{"POI/Leatherworking|Legendary Leathers|10+ leatherworking skinning|35.41 29.02|[Leatherworking and Skinning]", "POI/Leatherworking|Legendary Leathers|leatherworking -skinning|35.41 29.02|[Leatherworking]", "POI/Skinning|Kondal Huntsworn|skinning -leatherworking|36.05 27.97|[Skinning Trainer]",},
		"POI/Mining|Mama Diggs|10+ mining|46.45 26.35|[Mining Trainer]",
		"POI/Tailoring|Talismanic Textiles|10+ tailoring|36.04 33.51|[Tailoring]",
		"POI/Cooking|Catherine Lee|10+ alliance|39.7 66.5|[Cooking Trainer]",
		"POI/Fishing|Marcia Chase|10+|52.81 65.59|[Fishing Trainer]",
		"POI/Archaeology|Things of the Past|10+|41.26 25.36|[Archaeology]",
	},


	-- [[ Legion Order Halls ]]--

	[647] = {
		-- Work Order
		"POI/EbonKnights|Korgaz Deadaxe|10+ deathknight 44082|53.36 68.55|[Ebon Soldier Recruiter]",
	},

	-- Death Knight - Acherus: The Ebon Hold - Hall of Command
	[648] = {
		-- Portal
		{"mageportalalliance|Portal to Dalaran|deathknight alliance|24.73 33.7", "mageportalhorde|Portal to Dalaran|deathknight horde|24.73 33.7",},

		-- Flight Master
		"taxinode_neutral|Grimwing|deathknight|25.49 28.81|[Flight Master]",

		-- Class Hall
		"ShipMissionIcon-Bonus-MapBadge|Scouting Map|deathknight|50.3 50.8",
		"class|Archivist Zubashi|deathknight|47.76 53.77|[Class Hall Upgrades]",

		-- Work Order
		"POI/PackOfGhouls|Dark Summoner Marogh|10+ deathknight|41.05 74.02|[Risen Horde Recruiter]",
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
		"mageportalalliance|Temple of the Moon|alliance|43 74||Portals to:|{mageportalalliance} [The Exodar]|{mageportalalliance} [Hellfire Peninsula]",

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


	--[[ Elwynn Forest ]]--

	-- Stormwind
	[84] = {
		-- Portal
		"mageportalalliance|The Eastern Earthshrine|30+ alliance|74.85 17.65||Portals to:|{mageportalalliance} [Mount Hyjal]|{mageportalalliance} [Vashj'ir]|{mageportalalliance} [Deepholm]|{mageportalalliance} [Uldum]|{mageportalalliance} [Twilight Highlands]|{mageportalalliance} [Tol Barad]",
		{"mageportalalliance|Portal to Darnassus|49- alliance|23.86 56.09", "mageportalalliance|Portal to Darkshore|50+ alliance|23.86 56.09",},
	},

}