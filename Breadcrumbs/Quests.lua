local _, Data = ...

-- Hidden Bonus Objective Quests
-- Pins for quests in this table are removed from Blizzard's Bonus Objective Data Provider if the "Hide Storylines" setting is enabled
-- This is used to remove broken bonus objectives or to replace them with our own quest pins
Data.HiddenBonusObjectiveQuests = {
	[57301] = true, -- Maldraxxus - Callous Concoctions
	[65649] = true, -- Oribos - A New Deal
	[66042] = true, -- Zereth Mortis - Patterns Within Patterns
	[65749] = true, -- Zereth Mortis - The Necessity Of Equipment
	[64641] = true, -- Zereth Mortis - Mysterious Greenery
}

-- Quests

--[[
	Data Structure
	
	-- Quest
	[MapID] = {
		[QuestID] = "Name|Requirements|Coordinates|Source|Flags|Help", -- Comments
	},

	-- Quest with multiple markers
	[MapID] = {
		[QuestID] = {
			"Name|Requirements|Coordinates|Source|Flags|Help", -- First marker
			"Name|Requirements|Coordinates|Source|Flags|Help", -- Second marker
		},
	},

	-- Disovery Quest
	[MapID] = {
		[QuestID] = "Name|Requirements|Priority Texture|Source|Flags|Help", -- Comments
	},


	Separate multiple sets with a space (for example: "10+ gnome mage" would match only a level 10+ Gnome Mage)
	Multiple possible values are separated with a comma (for example: "warlock,mage" would match either a Warlock or a Mage)
	
	Demon Hunters who picked Altruis have 40375 completed and those who picked Kayn have 40374 completed

	
	Name: Name of the quest, as displayed in-game

	Requirements: Conditions that must be met for the pin to be displayed
		n+				Must be level n or higher
		n-				Must be level n or lower

		n				Must have completed quest ID n
		+n				Must have either completed or picked up quest ID n
		!n				Quest ID n must be ready for turn in or completed
		-n				Must not have completed or picked up quest ID n
		~n				Must not have picked up quest ID n
		§n				Must have picked up quest ID n but not completed it
		_n				Must not have completed quest ID n

		class			Must be any of following classes (deathknight demonhunter druid hunter mage monk paladin, priest, rogue, shaman, warlock, warrior)
		profession		Must have any of the following professions learned (alchemy, blacksmithing, enchanting, engineering, herbalism, inscription, jewelcrafting, leatherworking, mining, skinning, tailoring, archaeology, cooking, fishing)
		race			Must be any of the following races (bloodelf, draenei darkiron dwarf gnome goblin highmountain human kultiran lightforged maghar mechagnome nightborne nightelf orc pandaren undead tauren troll voidelf vulpera worgen zandalari)
		alliance		Must be Alliance
		horde			Must be Horde
		covenant		Must belong to any of the following covenants (kyrian, venthyr, nightfae, necrolord)
		-x				Inverse of above

		reset:n			Quest ID n must not have been completed during today's daily quest reset

		active:n		World Quest/Task Quest with ID n must be active
		-active:n		World Quest/Task Quest with ID n must not be active

		flying			Must have learned flying
		-flying			Must not have learned flying

		garrison		Must have unlocked WoD Garrison (any tier)
		-garrison		Must not have unlocked WoD Garrison
		garrison:n		Must have a WoD Garrison at tier n
		-garrison:n		Must not have WoD Garrison at tier n

		research:n		Must have researched GarrTalent ID n (see https://wow.tools/dbc/?dbc=garrtalent)
		-research:n		Must not have researched GarrTalent ID n

		renown:n		Must have attained renown level n with their current covenant
		-renown:n		Must not have attained renown level n with their current covenant

		toy:n			Must have learned toy with item ID n
		-toy:n			Must not have learned toy with item ID n

		item:n			Must have at least one item with ID n in bags (includes bank)
		-item:n			Must not have any items with ID n in bags (includes bank)
		item:n:x		Must have at least x items with ID n in bags (includes bank)
		-item:n:x		Must not have x or more items with ID n in bags (includes bank)

		currency:n:x	Must have at least x or more of currency with ID n
		-currency:n:x	Must not have x or more of currency with ID n

		art:n			Map must currently have UiMapArtID n (see https://wow.tools/dbc/?dbc=uimapxmapart) - used to determine which phase of the map the player is currently on
		-art:n			Map must not currently have UiMapArtID n

		broken			Quest is broken and cannot be completed, it will be hidden unless the user has decided to display broken quests
		broken:n		Quest is broken if you are level n or higher and cannot be completed, it will be hidden unless the user has decided to display broken quests

	Coordinates: Coordinates for the map pin(s)
		X Y				Coordinates for the map pin indicating where to pick up the quest

	Priority: Priority number used for sorting Discovery Quests
		X				Priority, number between 1-99; the lowest number appears on top of the list

	Texture: Texture used as pin icon for Discovery Quests
		texture			File name for a texture in the Breadcrumbs/Textures/Discovery folder

	Source: Name of the item, NPC or object that starts the quest - please follow the following format:
		NPC or Object	Name							Use the full name of the NPC or object that starts the quest as displayed in-game
		Item			{Icon} [quality]Item Name]		Icon should be the texture ID for the item's icon. For common (white) quality items, the quality can be omitted like so: [Item Name]
		Auto Accept		[Auto Accept]					Used for Auto Accept quests that pop up automatically when you enter an area

	Flags: Additional optional flags
		campaign		Campaign quest, changes the pin icon to the campaign shield bang
		dailycampaign	Daily campaign quest, changes the pin icon the blue campaign shield bang
		legendary		Legendary quest, changes the pin icon to an orange bang and the tooltip header color to orange
		artifact		Artifact quest, changes the pin icon to an orange bang and the tooltip header color to orange
		daily			Daily quest, changes the pin icon to a blue bang
		red				Quest is started by killing a mob, changes the pin icon to a red bang
		warboard		Quest is obtained from a Warboard, changes the pin icon to a warboard
		elsewhere		Quest is obtained in a different location, changes the pin icon to an arrow - a link flag should always be provided with this flag

		dungeon			Dungeon quest
		raid			Raid quest
		profession		Profession quest (alchemy, blacksmithing, enchanting, engineering, herbalism, inscription, jewelcrafting, leatherworking, mining, skinning, tailoring, archaeology, cooking, fishing)
		petbattle		Pet Battle quest
		
		link:n			Pin becomes clickable to open map with ID n, should be used if the quest takes place on a different map
		
		up				Quest is on a different map above the current map, also changes the XX YY pin to an exit marker if provided
		down			Quest is on a different map below the current map, also changes the XX YY pin to an entrance marker if provided

		discovery		Quest can be discovered from a non-fixed location in the zone, for example by mining a node; places the pin in the Discovery Quest list (top left corner of the map) sorted by other flags and priority number
	
		chromietime		Quest can only be picked up during a Timewalking Campaign (Chromie Time); adds a dynamic help tip depending on level and Chromie Time status
		chromiesync		Quest can only be picked up during a Timewalking Campaign (Chromie Time) or in Party Sync; adds a dynamic help tip depending on level and Chromie Time status

	Help: Tooltip help text
		{!}				Quest bang
		{n}				Texture/icon with ID n
		{atlas}			Atlas
		[text]			White text
		[color]text]	Colored text where color is either a hex (like ff0800) or a named color (spell, friendly, neutral, hostile, daily, poor, uncommon, rare, epic, legendary, artifact, heirloom)

	--------------------------------------------------

	Notes

	Exile's Reach - Use the first quest, Warming Up, to check if a player started in Exile's Reach
		56775 - Warming Up (Alliance)
		59926 - Warming Up (Horde)

	World Quests
		45727,43341 - Legion World Quests unlocked

	Death Knight Artifact Choice
		40722 - Maw of the Damned (Blood)
		40723 - Blades of the Fallen Prince (Frost)
		40724 - Apocalypse (Unholy)

		39017 - Rise to the Occasion

	Demon Hunter Story Choice
		40375 - Altruis the Sufferer
		40374 - Kayn Sunfury
	Demon Hunter Artifact Choice
		40817,44381 - Twinblades of the Deceiver (Havoc)
		40818 - Aldrachi Warblades (Vengeance)

	Legion Order Halls
		38894 - Founded Order Hall
		41099,41069 - Demon Hunter, frist zone chosen
		39799 - Death Knight, first zone chosen

	Shadowlands
		59770 - Maw Intro Completed (including through skip)
		62704 - Threads of Fate chosen
		60293 - Pride or Unit, Phalynx chosen (Pelodis)
		60294 - Pride or Unit, Larion chosen (Nemea)
		-60259 -60260 -60261 -60262 -60263 - No Steward chosen
		62704,57904,59609,62899,62921 - World Quests Unlocked
]]--

Data.Quests = {

	--[[ Oribos ]]--

	-- Ring of Transference
	[1671] = {
		-- Zereth Mortis - Into the Unknown
		[64958] = "The Forces Gather|60+ 64957|49.56 37.67|Highlord Bolvar Fordragon|campaign",
	},

	-- Ring of Fates
	[1670] = {
		-- The Threads of Fate
		[62716] = "Re-Introductions|59- 62704|20.74 50.29|Fatescribe Roh-Tahl|campaign",
		[62000] = "Choosing Your Purpose|62716|38.89 70|Tal-Inara|campaign",
		-- Threads of Fate breadcrumb quests are only available after completing a zone quest (not Torghast/Battlegrounds)
		[62159] = "Aiding the Shadowlands|59- 62716 ~65030 ~65032 ~65033 ~65034 ~64846 ~64849 ~64850 ~65035|38.89 70|Tal-Inara|campaign", -- #1
		-- Vevica HQT 64067,64073,64405
		[63208] = "The Next Step|50+ 59- 62159 62729,62761,62776,62779|38.89 70|Tal-Inara|campaign", -- #2
		-- HQT 64137
		--[63209] = "Furthering the Purpose|59- 63208 64137 ~65030 ~65032 ~65033 ~65034 ~64846 ~64849 ~64850 ~65035|38.89 70|Tal-Inara|campaign", -- #3
		[63210] = {"The Last Step|50+ 59- 63209 -62729 62761 62776 62779 ~65030 ~65032 ~65033 ~65034 ~64846 ~64849 ~64850 ~65035|38.89 70|Tal-Inara|campaign", "The Last Step|50+ 59- 63209 62729 -62761 62776 62779|38.89 70|Tal-Inara|campaign", "The Last Step|50+ 59- 63209 62729 62761 -62776 62779|38.89 70|Tal-Inara|campaign", "The Last Step|50+ 59- 63209 62729 62761 62776 -62779|38.89 70|Tal-Inara|campaign",}, -- #4

		-- Threads of Fate: Bastion
		-- 62151 Bastion chosen - Also given optional breadcrumb 62275
		[63034] = "The Elysian Fields|62151 ~62275 kyrian|38.89 70|Tal-Inara|campaign", -- Kyrian
		[62707] = "The Elysian Fields|62151 ~62275 -kyrian|38.89 70|Tal-Inara|campaign", -- Not Kyrian

		-- Threads of Fate: Maldraxxus
		-- 62152 Maldraxxus chosen - Also given optional breadcrumb 62278
		[63035] = "A Fresh Blade|62152 ~62278 necrolord|38.89 70|Tal-Inara|campaign", -- Necrolord
		[62738] = "A Fresh Blade|62152 ~62278 -necrolord|38.89 70|Tal-Inara|campaign", -- Not Necrolord

		-- Threads of Fate: Ardenweald
		-- 62153 Ardenweald chosen - Also given optional breadcrumb 62277
		[63036] = "Restoring Balance|62153 ~62277 nightfae|38.89 70|Tal-Inara|campaign", -- Night Fae
		[62739] = "Restoring Balance|62153 ~62277 -nightfae|38.89 70|Tal-Inara|campaign", -- Not Night Fae

		-- Threads of Fate: Revendreth
		-- 62154 Revendreth chosen - Also given optional breadcrumb 62279
		[63037] = "Dark Aspirations|62154 ~62279 venthyr|38.89 70|Tal-Inara|campaign", -- Venthyr
		[62740] = "Dark Aspirations|62154 ~62279 -venthyr|38.89 70|Tal-Inara|campaign", -- Not Venthyr

		-- Threads of Fate: Battlegrounds
		-- 65030 Battlegrounds chosen - Also given optional breadcrumb 65031 (Battlegrounds)
		[65032] = "Battleground Observers|65030 ~65031|38.89 70|Tal-Inara|campaign",
		-- 65033 Observing Victory - this daily quest is displayed by the Bonus Objectives Data Provider so we don't have to
		-- HQT 53409 resets with daily
		[65034] = "Return to Oribos|65032 65033|34.24 55.9|Strategist Zo'rak|campaign",

		-- Threads of Fate: Torghast
		-- 64848 Torghast chosen - Also given optional breadcrumb 64846 (Torghast)
		-- Also autocompletes 64557 (In Darkness, Found), 64210 (The Box of Many Things), 64216 (Tower Knowledge)
		[64849] = "Tower of the Damned|64848 ~64846|38.89 70|Tal-Inara|campaign",

		-- Kyrian - Among the Kyrian
		[63211] = "Report to Adrestes|60+ kyrian -60491|38.89 70|Tal-Inara|campaign", -- Breadcrumb for 60491
		[60491] = "Among the Kyrian|60+ kyrian ~63211|36.13 64.22|Polemarch Adrestes|campaign", -- Invalidates 63211
		[62796] = "Return to Adrestes|60+ kyrian 62837|39.96 68.6|Highlord Bolvar Fordragon|campaign",

		-- Necrolord - Loyal to the Primus
		[62844] = "Return to Draka|60+ necrolord 62837|39.96 68.6|Highlord Bolvar Fordragon|campaign",

		-- Night Fae - For Queen and Grove!
		[63214] = "Report to Moonberry|60+ nightfae -61475|38.89 70|Tal-Inara|campaign", -- Breadcrumb for 61475
		[61475] = "The Heart of the Forest|60+ nightfae ~63214|39.75 60.89|Lady Moonberry|campaign", -- Invalidates 63214
		[62894] = "Flutterback|60+ nightfae 62837|39.96 68.6|Highlord Bolvar Fordragon|campaign",

		-- Night Fae - Daughter of the Night Warrior
		[59181] = "Into the Maw|60+ nightfae 59179,59246|39.07 66.95|Shandris Feathermoon|campaign",

		-- Venthyr - Sinfall
		[62870] = "Souls for Sinfall|60+ venthyr 62837|39.96 68.6|Highlord Bolvar Fordragon|campaign",

		-- Torghast
		[60136] = {"Into Torghast|60+ kyrian 63029|39.96 68.6|Highlord Bolvar Fordragon|campaign", "Into Torghast|60+ necrolord 63032|39.96 68.6|Highlord Bolvar Fordragon|campaign", "Into Torghast|60+ nightfae 63030|39.96 68.6|Highlord Bolvar Fordragon|campaign", "Into Torghast|60+ venthyr 63033|39.96 68.6|Highlord Bolvar Fordragon|campaign",},
		[61099] = "The Search for Baine|60+ 60136|39.96 68.6|Ve'nari|campaign elsewhere link:1543",
		[65625] = "The Jailer's Gauntlet|60+ 65305 ~65250 ~65260|55.61 49.32|Ve'nyo",

		-- Trading Favors
		[60274] = "Trading Favors|60+,62704|67.47 50.31|Host Ta'rela",

		-- The Great Vault
		[62457] = "The Great Vault|60+|64.51 36.01|Ba'vol",

		-- Chains of Domination - Battle of Ardenweald
		[63576] = "The First Move|60+ 60272|40.25 68.14|[Auto Accept]|campaign",
		[63856] = "A Gathering of Covenants|60+ 63576|38.89 70|Tal-Inara|campaign",

		-- Zereth Mortis
		[65649] = "A New Deal|60+ 64958|34.46 57.46|Zo'sorg|weekly",

		-- Zereth Mortis - Into the Unknown
		--[64942] = "Call of the Primus|60+ ???|38.89 70|[Auto Accept]|campaign", -- Requires chapter 2 of Chains of Domination (incl skip)
		[64944] = "A Hasty Voyage|60+ 64942|38.89 70|[Auto Accept]|campaign elsewhere link:2042|\"Tal-Inara can take you to the Crucible\"",
		[64958] = "The Forces Gather|60+ 64957|49.56 37.67|Highlord Bolvar Fordragon|campaign up link:1671",

		-- Epilogue: Judgment
		[65260] = "A Long Walk|60+ 65250|52.38 39.84|Uther",
		[65263] = "The Fate of Sylvanas|60+ 65260|38.89 70|Arbiter Pelagos|elsewhere link:1673|\"Tal-Inara can take you to the Crucible\"",
		[65297] = "Penance and Renewal|60+ 65263|38.89 70|Arbiter Pelagos|elsewhere link:1673|\"Tal-Inara can take you to the Crucible\"",
		[66170] = "Silent Vigil|60+ 65297|48.93 55.01|Dori'thur|up link:1671",
	},

	-- Ring of Transference
	[1671] = {
		-- Epilogue: Judgment
		[66170] = "Silent Vigil|60+ 65297|46.56 55.93|Dori'thur",
	},

	-- The Crucible
	[1673] = {
		-- Zereth Mortis - Starting Over
		[65329] = "Safe Haven|60+ 65238 -65249|59.38 55.86|Kleia|campaign", -- Breadcrumb; cannot be picked up again if you leave the area/abadondon the quest

		-- Epilogue: Judgment
		[65263] = "The Fate of Sylvanas|60+ 65260|67.7 48.98|Arbiter Pelagos",
		[65297] = "Penance and Renewal|60+ 65263|67.7 48.98|Arbiter Pelagos",
	},

	-- Scenario: The Crucible
	[2042] = {
		-- Into the Unknown
		[64944] = "A Hasty Voyage|60+ 64942|34.17 52.32|The Primus|campaign",
	},


	--[[ Bastion ]]--

	-- Elysian Hold - Archon's Rise
	[1707] = {
		-- Threads of Fate: Bastion
		-- 62723 Bolstering Bastion (Auto Accept) - shows on map even with Storylines hidden
		[62729] = "Return to Oribos|62723 kyrian|37.09 61.18|Kalisthene|campaign", -- Kyrian

		-- Kyrian Combatant
		[64323] = "Kyrian Veteran|60+,62704 kyrian renown:43|42.74 70.25|Iona Skyblade|legendary", -- Kyrian, Renown 43
		[64086] = "Kyrian Tactician|60+,62704 kyrian renown:59|42.74 70.25|Iona Skyblade|legendary", -- Kyrian, Renown 59

		-- Transport Network
		[63052] = "Step of Faith|60+ kyrian research:1056|42.62 53.06|Haephus", -- Requires Step of Faith (1056)
		[63053] = "At a Moment's Notice|60+ kyrian 63052|48.86 62.7|Khamsius",

		-- Anima Conductor
		[57901] = "All That Remains|60+ kyrian research:1062|42.62 53.06|Haephus", -- Requires Flowing Tendrils (1062)
		[57903] = "Power in the Sky|60+ kyrian 57901|37.91 67.49|Capheus",

		-- Command Table
		[57899] = "More Work?|60+ kyrian research:1077|42.62 53.06|Haephus", -- Requires Tactical Insight (1077)
		[57900] = "Across the Shadowlands|60+ kyrian 57899|43.83 40.71|Koros",
		[61859] = "Adventurer: Nemea|60+ kyrian 57900 60294 renown:4|43.83 40.71|Koros|legendary", -- Requires Renown 4 and Larion chosen during Pride or Unit
		[61860] = "Adventurer: Pelodis|60+ kyrian 57900 60293 renown:4|43.83 40.71|Koros|legendary", -- Requires Renown 4 and Phalynx chosen during Pride or Unit
		[61861] = "Adventurer: Sika|60+ kyrian 57900 renown:12|43.83 40.71|Koros|legendary", -- Requires Renown 12
		[61862] = "Adventurer: Clora|60+ kyrian 57900 renown:17|43.83 40.71|Koros|legendary", -- Requires Renown 17
		[61863] = "Adventurer: Apolon|60+ kyrian 57900 renown:27|43.83 40.71|Koros|legendary", -- Requires Renown 27
		[61864] = "Adventurer: Bron|60+ kyrian 57900 renown:33|43.83 40.71|Koros|legendary", -- Requires Renown 33
		[61865] = "Adventurer: Disciple Kosmas|60+ kyrian 57900 renown:38|43.83 40.71|Koros|legendary", -- Requires Renown 38
		[64461] = "Adventurer: Hermestes|60+ kyrian 57900 renown:44|43.83 40.71|Koros|legendary", -- Requires Renown 44
		[64462] = "Adventurer: Cromas the Mystic|60+ kyrian 57900 renown:62|43.83 40.71|Koros|legendary", -- Requires Renown 62
		[64463] = "Adventurer: Auric Spiritguide|60+ kyrian 57900 renown:71|43.83 40.71|Koros|legendary", -- Requires Renown 71
	},

	-- Elysian Hold - Sanctum of Binding
	[1708] = {
		-- Threads of Fate: Bastion
		-- 62723 Bolstering Bastion (Auto Accept) - shows on map even with Storylines hidden
		[62729] = "Return to Oribos|62723 kyrian|37.09 61.18|Kalisthene|campaign", -- Kyrian

		-- Kyrian Combatant
		[64323] = "Kyrian Veteran|60+,62704 kyrian renown:43|42.74 70.25|Iona Skyblade|legendary", -- Kyrian, Renown 43
		[64086] = "Kyrian Tactician|60+,62704 kyrian renown:59|42.74 70.25|Iona Skyblade|legendary", -- Kyrian, Renown 59
	},

	-- Bastion
	[1533] = {
		-- Threads of Fate: Bastion
		-- 62723 Bolstering Bastion (Auto Accept) - shows on map even with Storylines hidden
		[62729] = {"Return to Oribos|62723|51 46.8|Kalisthene|campaign", "Return to Oribos|62723 kyrian|64 19.11|Kalisthene|campaign",},

		-- Among the Kyrian
		[60492] = "A Proper Reception|60+ kyrian 60491|56.76 31.44|Polemarch Adrestes|campaign",
		[57895] = "Elysian Hold|60+ kyrian 60491|58.44 28.92|Polemarch Adrestes|campaign",

		-- Kyrian - Steward
		[62916] = "Your Next Best Friend|60+,62704 kyrian 59426 -60259 -60260 -60261 -60262 -60263|52.98 47.56|Sika", -- Weekly quest - only show if no Steward choice has been made

		-- Kyrian - Kyrian Combatant
		[64323] = "Kyrian Veteran|60+,62704 kyrian renown:43|64.76 20.33|Iona Skyblade|legendary", -- Kyrian, Renown 43
		[64086] = "Kyrian Tactician|60+,62704 kyrian renown:59|64.76 20.33|Iona Skyblade|legendary", -- Kyrian, Renown 59

		-- Kyrian - Transport Network
		[63052] = "Step of Faith|60+ kyrian research:1056|64.75 18.01|Haephus", -- Requires Step of Faith (1056)
		[63053] = "At a Moment's Notice|60+ kyrian 63052|65.59 19.32|Khamsius",

		-- Kyrian - Anima Conductor
		[57901] = "All That Remains|60+ kyrian research:1062|64.75 18.01|Haephus", -- Requires Flowing Tendrils (1062)
		[57903] = "Power in the Sky|60+ kyrian 57901|64.11 19.96|Capheus",

		-- Kyrian - Command Table
		[57899] = "More Work?|60+ kyrian research:1077|64.75 18.01|Haephus", -- Requires Tactical Insight (1077)
		[57900] = "Across the Shadowlands|60+ kyrian 57899|64.91 16.35|Koros",
		[61859] = "Adventurer: Nemea|60+ kyrian 57900 60294 renown:4|64.91 16.35|Koros|legendary", -- Requires Renown 4 and Larion chosen during Pride or Unit
		[61860] = "Adventurer: Pelodis|60+ kyrian 57900 60293 renown:4|64.91 16.35|Koros|legendary", -- Requires Renown 4 and Phalynx chosen during Pride or Unit
		[61861] = "Adventurer: Sika|60+ kyrian 57900 renown:12|64.91 16.35|Koros|legendary", -- Requires Renown 12
		[61862] = "Adventurer: Clora|60+ kyrian 57900 renown:17|64.91 16.35|Koros|legendary", -- Requires Renown 17
		[61863] = "Adventurer: Apolon|60+ kyrian 57900 renown:27|64.91 16.35|Koros|legendary", -- Requires Renown 27
		[61864] = "Adventurer: Bron|60+ kyrian 57900 renown:33|64.91 16.35|Koros|legendary", -- Requires Renown 33
		[61865] = "Adventurer: Disciple Kosmas|60+ kyrian 57900 renown:38|64.91 16.35|Koros|legendary", -- Requires Renown 38
		[64461] = "Adventurer: Hermestes|60+ kyrian 57900 renown:44|64.91 16.35|Koros|legendary", -- Requires Renown 44
		[64462] = "Adventurer: Cromas the Mystic|60+ kyrian 57900 renown:62|64.91 16.35|Koros|legendary", -- Requires Renown 62
		[64463] = "Adventurer: Auric Spiritguide|60+ kyrian 57900 renown:71|64.91 16.35|Koros|legendary", -- Requires Renown 71

		-- Pride or Unit
		[59674] = "A Friendly Rivalry|52+,62704|57.44 54.25|Pelodis",
		[57931] = "Phalynx Malfunction|52+,62704 ~58185|54.78 41.16|Pelodis", -- Invalidates breadcrumb 58185
		[57932] = "Resource Drain|52+,62704|54.79 41.25|Hopo",
		[57933] = "We Can Rebuild Him|52+,62704 57931 57932|54.78 41.16|Pelodis",
		[57934] = "Combat Drills|52+,62704 57933|54.78 41.16|Pelodis",
		[57935] = "Laser Location|52+,62704 57933|54.78 41.16|Pelodis",
		[57936] = "Superior Programming|52+,62704 57933|54.79 41.25|Hopo",
		[57937] = "Tactical Formation|52+,62704 57934 57935 57936|54.78 41.16|Pelodis",
		[58184] = "Antiquated Methodology|52+,62704 57937 -58037|54.78 41.16|Pelodis", -- Breadcrumb for 58037
		[58037] = "Part of the Pride|52+,62704 ~58184|57.27 39.21|Nemea", -- Invalidates breadcrumb 58184
		[58038] = "All Natural Chews|52+,62704 58037|57.27 39.21|Nemea",
		[58039] = "Larion at Large|52+,62704 58037|57.27 39.21|Nemea",
		[58040] = "With Lance and Larion|52+,62704 58038 58039|57.27 39.21|Nemea",
		[58041] = "Providing for the Pack|52+,62704 58038 58039|57.27 39.21|Nemea",
		[58042] = "On Larion Wings|52+,62704 58040 58041|57.27 39.21|Nemea",
		[58185] = "Success Without Soul|52+,62704 58042 -57931|57.27 39.21|Nemea", -- Breadcrumb for 57931
		[58103] = "Pride or Unit|52+,62704 57937 58042 -60296|54.78 41.16|Pelodis",
		[60296] = "Pride or Unit|52+,62704 57937 58042 -58103|57.27 39.21|Nemea",

		-- In the Garden of Respite
		[57529] = "Garden in Turmoil|52+,62704 -57538|52.32 61.36|Tamesis", -- Breadcrumb for 57538
		[57538] = "Disturbing the Peace|52+,62704 ~57529|51.33 59.54|Zosime", -- Invalidates breadcrumb 57529
		[57545] = "Distractions for Kala|52+,62704|51.33 59.54|Zosime",
		[57547] = "A Test of Courage|52+,62704 57538 57545|51.33 59.54|Zosime",
		[57568] = "Tough Love|52+,62704 57547|51.21 56.8|Zosime",

		-- An Act of Service
		[60466] = "The Old Ways|51+,62704|47.88 73.5|Klystere", -- Prereq 57677?
		[62714] = "A Gift for an Acolyte|51+,62704 60466|47.88 73.5|Klystere",
		[62715] = "More Than A Gift|51+,62704 62714|53.87 73.95|Acolyte Amalthina",

		-- In Agthia's Memory
		[59554] = {"A Fine Journey|52+,62704 -57549|45.27 59.86|Notice", "A Fine Journey|52+,62704 -57549|51.95 47.67|Notice",}, -- Breadcrumb for 57549
		[57549] = "In Agthia's Memory|52+,62704 ~59554|46.99 63.45|Keeper Mnemis", -- Invalidates breadcrumb 59554
		[57551] = "Agthia's Path|52+,62704 57549|46.99 63.45|Keeper Mnemis",
		[57552] = "Warriors of the Void|52+,62704 57551|46.55 63.42|Agthia||\"Ring the [spell]Vesper of History] nearby if you cannot see Agthia\"",
		[57554] = "Wicked Gateways|52+,62704 57551|46.55 63.42|Agthia||\"Ring the [spell]Vesper of History] nearby if you cannot see Agthia\"",
		[57553] = "On Wounded Wings|52+,62704 57551|46.27 63.79|Agthian Defender||\"Ring the [spell]Vesper of History] nearby if you cannot see Agthia\"",
		[57555] = "Shadow's Fall|52+,62704 57552 57554 57553|46.55 63.42|Agthia||\"Ring the [spell]Vesper of History] nearby if you cannot see Agthia\"",

		-- Hero's Rest
		[60315] = "WANTED: Gorgebeak|52+,62704|53.27 46.43|Wanted Scroll",
		[60366] = "WANTED: Darkwing|52+,62704|53.27 46.43|Wanted Scroll",

		-- Aspirant's Rest
		[60316] = "WANTED: Altered Sentinel|51+,62704|49.14 72.82|Wanted Scroll",

		-- Purity's Reflection
		[57444] = {"An Inspired Moral Inventory|51+,62704|54.03 73.94|Acolyte Galistos", "An Inspired Moral Inventory|51+,62704|57.97 75.88|Acolyte Galistos",},

		-- Aspirant's Crucible
		[57712] = "Suggested Reading|51+,62704|55.39 83.43|Aspirant Akimos", -- Prereq 57709?

		-- The Necrotic Wake
		[60057] = "Necrotic Wake: A Paragon's Plight|51+,62704|40.94 55.35|Disciple Artemede|dungeon", -- Need story mode prereq

		-- Zereth Mortis - Crown of Wills
		[64807] = "What We Wish to Forget|60+ 64806|59.25 88.19|Highlord Bolvar Fordragon|campaign",
		[64808] = "What Makes Us Strong|60+ 64807|59.1 88.49|Anduin Wrynn|campaign",
		[64798] = "What We Overcome|60+ 64808|59.1 88.49|Anduin Wrynn|campaign",
		[64812] = "Forge of Domination|60+ 64798|59.25 88.19|Highlord Bolvar Fordragon|campaign",
	},

	-- Dungeon: The Necrotic Wake
	[1666] = {
		-- The Necrotic Wake
		[60057] = "Necrotic Wake: A Paragon's Plight|51+,62704|82.8 39.9|Disciple Artemede|elsewhere link:1533", -- Need story mode prereq
	},


	--[[ Maldraxxus ]]--

	-- Seat of the Primus
	[1698] = {
		-- Threads of Fate: Maldraxxus
		-- 62748 Rallying Maldraxxus (Auto Accept) - shows on map even with Storylines hidden
		--[62761] = "Return to Oribos|62748 necrolord|X Y|Secutor Mevix|campaign",

		-- Necrolord Combatant
		[64324] = "Necrolord Veteran|60+,62704 necrolord renown:43|46.41 40.19|Elspeth Larink|legendary", -- Necrolord, Renown 43
		[64084] = "Necrolord Tactician|60+,62704 necrolord renown:59|46.41 40.19|Elspeth Larink|legendary", -- Necrolord, Renown 59
	},

	-- Maldraxxus
	[1536] = {
		-- Necrolord Combatant
		[64324] = "Necrolord Veteran|60+,62704 necrolord renown:43|50.03 71.32|Elspeth Larink|legendary", -- Necrolord, Renown 43
		[64084] = "Necrolord Tactician|60+,62704 necrolord renown:59|50.03 71.32|Elspeth Larink|legendary", -- Necrolord, Renown 59

		-- Threads of Fate: Maldraxxus
		-- 62748 Rallying Maldraxxus (Auto Accept) - shows on map even with Storylines hidden
		[62761] = {"Return to Oribos|62748|52.85 68.28|Secutor Mevix|campaign", -- check if NL can take quest from both locations or not
			--"Return to Oribos|62748 necrolord|X Y|Secutor Mevix|campaign", -- Add Seat of the Primus location
		},

		-- Theater of Pain
		[62785] = "I Could Be A Contender|54+,62704 -59781|50.58 51.63|Anzio the Infallible", -- Breadcrumb for 59781
		[59781] = "The Last Guy|54+,62704 ~62785|54.48 48.59|Louison",
		[59750] = "How to Get a Head|54+,62704|54.48 48.59|Louison",
		[58575] = "Stuff We All Get|54+,62704 59781 59750|54.48 48.59|Louison",
		[59800] = "Team Spirit|54+,62704 59781 59750|54.48 48.59|Louison",
		[58947] = "Test Your Mettle|54+,62704 58575 59800|54.48 48.59|Louison",
		[58068] = "...Even The Most Ridiculous Request!|54+,62704|54.14 50.6|Overseer Kalvaros",
		[58088] = "Juicing Up|53+,62704 58068|53.81 50.53|Scrapper Minoire",
		[58090] = "Side Effects|54+,62704 58088|53.7 47.92|So'narynar",
		[58095] = "Theater of Pain: Help Wanted|60+ 58090|54.14 50.6|Overseer Kalvaros|dungeon",
		[59879] = "This Thing of Ours|54+,62704 58947 58090|54.48 48.59|Louison",
		[59203] = "Leave Me a Loan|55+,62704 59879|53.6 47.51|Au'narim",
		[59837] = "Working for the Living|54+,62704 59203|53.6 47.51|Au'narim",
		[58900] = "A Sure Bet|54+,62704 59837|54.48 48.59|Louison",
		[57316] = "The Ladder|53+,62704 58900|50.58 51.63|Anzio the Infallible",
		[59867] = "WANTED: Appraiser Vix|60+,62704 62704,57904,59609,62899,62921|54.14 47.47|Wanted: Appraiser Vix",

		-- Wasteland Work
		[58785] = "Smack and Grab|53+,62704|46.99 49.04|Caleesy",
		[58750] = "Take the Bull by the Horns|53+,62704|46.88 48.58|Dundae",
		[58794] = "Stabbing Wasteward|53+,62704 58785 58750|46.99 49.04|Caleesy",

		-- Mixing Monstrosities
		[59430] = "A Plague on Your House|54+,62704|58.06 72.11|Judas Sneap",
		[59520] = "Plaguefall: Knee Deep In It|54+,62704 +59430|59.45 72.97|Vial Master Lurgy|dungeon",
		[58431] = "Pool of Potions|54+,62704 59430|59.45 72.97|Boil Master Yetch",
		[57301] = "Callous Concoctions|54+,62704 58431|58.52 73.45|Foul-Tongue Cyrlix|weekly",

		-- Archival Protection
		[62605] = "Broker Business|54+,62704 -58619|38.21 31.3|Forgotten Supplies", -- Breadcrumb for 58619
		[58619] = "Read Between the Lines|54+,62704 ~62605|40.66 33.07|Ta'eran", -- Invalidates breadcrumb 62605
		[58621] = "Repeat After Me|54+,62704 58619|43.08 25.1|Ta'eran",
		[59917] = "Kill Them, Of Course|54+,62704 58619|43.08 25.1|Ta'eran",
		[58620] = "Slaylines|54+,62704 58621|43.08 25.1|Ta'eran",
		[58622] = "Secrets Among the Shelves|54+,62704 59917 58620|43.08 25.1|Ta'eran",
		[60900] = "Archival Protection|54+,62704 58622|41.8 23.65|Ta'eran",
		[59994] = "Trust Fall|54+,62704 60900|43.08 25.1|Ta'eran",
		[58623] = "A Complete Set|54+,62704 59994|43.14 25.39|Ta'eran||\"Use the Library Teleporter to get back to Tal'eran\"",
	},


	--[[ Ardenweald ]]--

	-- Heart of the Forest - The Canopy
	[1703] = {
		-- For Queen and Grove!
		[62883] = "Keeper of Great Renown|60+ nightfae 58160|51.2 27.72|Winter Queen|campaign",

		-- Da Boss
		[59809] = "On De Other Side|60+ nightfae renown:8 59242|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59811] = "Taking Inventory|60+ nightfae renown:8 59809|1 MaskOfBwonsamdi|Bwonsamdi|discovery campaign|\"Mask of Bwonsamdi can take you to the Other Side\"",
		[59812] = "Following the Trail|60+ nightfae 59811|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59813] = "Minions of Mueh'zala|60+ nightfae 59812|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59815] = "Stolen Loa|60+ nightfae 59812|2 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59817] = "Winter Be Comin'|60+ nightfae 59813 59815|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59818] = "Gathering The Hunt|60+ nightfae 59817|51.2 27.72|Winter Queen|campaign",
	},

	-- Heart of the Forest - The Trunk
	[1701] = {
		-- Threads of Fate: Ardenweald
		-- 62763 Support the Court (Auto Accept) - shows on map even with Storylines hidden
		--[62776] = "Return to Oribos|62763 nightfae|X Y|Lady Moonberry|campaign",

		-- Night Fae Combatant
		[64322] = "Night Fae Veteran|60+,62704 nightfae renown:43|33.54 37|Laurel|legendary", -- Night Fae, Renown 43
		[64085] = "Night Fae Tactician|60+,62704 nightfae renown:59|33.54 37|Laurel|legendary", -- Night Fae, Renown 59

		-- For Queen and Grove!
		[61475] = "The Heart of the Forest|60+ nightfae ~63214|49.24 39.97|Lady Moonberry|campaign elsewhere link:1670",
		[62560] = "Growing in Power|60+ nightfae 61479|49.24 39.97|Lady Moonberry",
		[58104] = "Show, Don't Tell|60+ nightfae 61479|49.24 39.97|Lady Moonberry|campaign",
		[62883] = "Keeper of Great Renown|60+ nightfae 58160|53.71 38.36|Winter Queen|campaign elsewhere link:1703|\"Attendant Sparkledew can take you to the Queen's audience chamber\"",
		[62884] = "The Forest Will Sing Your Name|60+ nightfae 62883|33.57 36.99|Laurel|campaign",
		[62697] = "A Call to Service|60+ nightfae 62884|33.57 36.99|Laurel|campaign",
		-- 2693 A Calling in Ardenweald (Bonus Objective)
		[62890] = "Who Shapes the Forest|60+ nightfae 62697|53.8 5.99|Blodwyn|campaign",
		[62891] = "Into the Reservoir|60+ nightfae 62890|40.71 33|Zayhad, The Builder|campaign",
		[62892] = "Recover the Lost|60+ nightfae 62891|40.71 33|Zayhad, The Builder|campaign",
		[62893] = "Do What We Cannot|60+ nightfae 62892|33.9 43.52|Flutterby|campaign",
		[62894] = "Flutterback|60+ nightfae 62837|33.9 43.52|Highlord Bolvar Fordragon|campaign elsewhere link:1670",
		[62897] = "Recovered Souls|60+ nightfae 62894|33.9 43.52|Flutterby|campaign",
		[62898] = "The First New Growth|60+ nightfae 62894|40.71 33|Zayhad, The Builder|campaign",
		[61541] = "The Forge of Bonds|60+ nightfae 62898|49.24 39.97|Lady Moonberry|campaign",
		[61542] = "The Boon of Binding|60+ nightfae 61541|33.9 43.52|Flutterby|campaign",
		[61550] = "Strengthening the Bond|60+ nightfae 61542|33.46 45.29|Niya|campaign",
		[62900] = "A Conduit for Growth|60+ nightfae 61550|33.46 45.29|Niya|campaign",
		[61058] = "Bound in Dreams|60+ nightfae 62900|35.39 48.22|Dreamweaver",
		[61057] = "By Trials Forged|60+ nightfae 62900|35.18 47.46|Hunt-Captain Korayn",
		[62899] = "The Endless Forest|60+ nightfae 62900|33.9 43.52|Flutterby|campaign", -- Unlocks Callings
		[62860] = "Return Lost Souls|60+ nightfae 62894 -61331 -62858 -62859|33.9 43.52|Flutterby|campaign weekly", -- Combined with 61331 (5 souls), 62858 (10 souls) and 62859 (15 souls)
		[61984] = "Replenish the Reservoir|60+ 62899|49.06 39.06|Sesselie|campaign weekly",
		[63030] = "The Highlord Calls|60+ nightfae 62899|47.54 36.51|Lady Moonberry|campaign",

		-- Daughter of the Night Warrior
		[59179] = "Daughter of the Night Warrior|60+ nightfae renown:5 60272 alliance|44.77 38.98|Ysera|campaign", -- Alliance
		[59246] = "Daughter of the Night Warrior|60+ nightfae renown:5 60272 horde|44.77 38.98|Ysera|campaign", -- Horde
		[59181] = "Into the Maw|60+ nightfae 59179,59246|44.77 38.98|Shandris Feathermoon|campaign elsewhere link:1670",
		[60508] = "On the Trail|60+ nightfae 59181|44.77 38.98|Shandris Feathermoon|campaign elsewhere link:1543",
		[60530] = "The Sea of Souls|60+ nightfae 60508|44.77 38.98|Shandris Feathermoon|campaign elsewhere link:1543",
		[59189] = "The Recovery of Tyrande Whisperwind|60+ nightfae 60530|44.77 38.98|Shandris Feathermoon|campaign elsewhere link:1543",
		[59242] = "Their New Home|60+ nightfae 59189|44.77 38.98|Shandris Feathermoon|campaign elsewhere link:1543",

		-- Da Boss
		[59809] = "On De Other Side|60+ nightfae renown:8 59242|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59811] = "Taking Inventory|60+ nightfae renown:8 59809|1 MaskOfBwonsamdi|Bwonsamdi|discovery campaign|\"Mask of Bwonsamdi can take you to the Other Side\"",
		[59812] = "Following the Trail|60+ nightfae 59811|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59813] = "Minions of Mueh'zala|60+ nightfae 59812|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59815] = "Stolen Loa|60+ nightfae 59812|2 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59817] = "Winter Be Comin'|60+ nightfae 59813 59815|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59818] = "Gathering The Hunt|60+ nightfae 59817|53.71 38.36|Winter Queen|campaign elsewhere link:1703|\"Attendant Sparkledew can take you to the Queen's audience chamber\"",

		-- Night Warrior's Curse
		[58610] = "The Speaker of Elune|60+ nightfae renown:11 59821|44.77 38.98|Ysera|campaign",

		-- Drust to Drust
		-- Renown 13

		-- The Horned HUnter
		-- Renown 17

		-- Deal for a Loa
		-- Renown 20

		-- Drust and Ashes
		-- Renown 22

		-- Command Table
		[61552] = "The Hunt Watches|60+ nightfae research:1074|40.71 33|Zayhad, The Builder", -- Requires Tactical Insight
		[61553] = "Know Where to Strike|60+ nightfae 61552|30.6 79.1|Watcher Vesperbloom",
		[61852] = "Adventurer: Guardian Kota|60+ nightfae 61553 renown:4|30.6 79.1|Watcher Vesperbloom|legendary",
		[61853] = "Adventurer: Te'zan|60+ nightfae 61553 renown:12|30.6 79.1|Watcher Vesperbloom|legendary",
		[61854] = "Adventurer: Master Sha'lor|60+ nightfae 61553 renown:17|30.6 79.1|Watcher Vesperbloom|legendary",
		[61855] = "Adventurer: Qadarin|60+ nightfae 61553 renown:27|30.6 79.1|Watcher Vesperbloom|legendary",
		[61856] = "Adventurer: Watcher Vesperbloom|60+ nightfae 61553 renown:33|30.6 79.1|Watcher Vesperbloom|legendary",
		[61857] = "Adventurer: Groonoomcrooek|60+ nightfae 61553 renown:38|30.6 79.1|Watcher Vesperbloom|legendary",
		[64458] = "Adventurer: Sulanoom|60+ nightfae 61553 renown:44|30.6 79.1|Watcher Vesperbloom|legendary",
		[64459] = "Adventurer: Elwyn|60+ nightfae 61553 renown:62|30.6 79.1|Watcher Vesperbloom|legendary",
		[64460] = "Adventurer: Yanlar|60+ nightfae 61553 renown:71|30.6 79.1|Watcher Vesperbloom|legendary",

		-- Thread of Hope
		[57661] = "Silk Shortage|60+ nightfae|59.45 31.82|Aithlyn",
	},

	-- Heart of the Forest - The Roots
	[1702] = {
		-- For Queen and Grove!
		[62891] = "Into the Reservoir|60+ nightfae 62890|39.36 54.38|Zayhad, The Builder|campaign",
		[62892] = "Recover the Lost|60+ nightfae 62891|39.36 54.38|Zayhad, The Builder|campaign",
		[62898] = "The First New Growth|60+ nightfae 62894|39.36 54.38|Zayhad, The Builder|campaign",
		[61984] = "Replenish the Reservoir|60+ 62899|50.6 62.63|Sesselie|campaign weekly",

		-- Da Boss
		[59809] = "On De Other Side|60+ nightfae renown:8 59242|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59811] = "Taking Inventory|60+ nightfae renown:8 59809|1 MaskOfBwonsamdi|Bwonsamdi|discovery campaign|\"Mask of Bwonsamdi can take you to the Other Side\"",
		[59812] = "Following the Trail|60+ nightfae 59811|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59813] = "Minions of Mueh'zala|60+ nightfae 59812|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59815] = "Stolen Loa|60+ nightfae 59812|2 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59817] = "Winter Be Comin'|60+ nightfae 59813 59815|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",

		-- Command Table
		[61552] = "The Hunt Watches|60+ nightfae research:1074|39.36 54.38|Zayhad, The Builder", -- Requires Tactical Insight
	},

	-- Ardenweald
	[1565] = {
		-- Threads of Fate: Ardenweald
		-- 62763 Support the Court (Auto Accept) - shows on map even with Storylines hidden
		[62776] = {"Return to Oribos|62763 -nightfae|49.34 52.36|Lady Moonberry|campaign",
			--"Return to Oribos|62763 nightfae|X Y|Lady Moonberry|campaign", -- Add NF location
		},

		-- Night Fae - Night Fae Combatant
		[64322] = "Night Fae Veteran|60+,62704 nightfae renown:43|44.95 52.98|Laurel|legendary", -- Night Fae, Renown 43
		[64085] = "Night Fae Tactician|60+,62704 nightfae renown:59|44.95 52.98|Laurel|legendary", -- Night Fae, Renown 59

		-- Night Fae - For Queen and Grove!
		[61475] = "The Heart of the Forest|60+ nightfae ~63214|49.34 52.36|Lady Moonberry|campaign elsewhere link:1670",
		[61479] = "The Boon of Shapes|60+ nightfae 61475|49.34 52.36|Lady Moonberry|campaign",
		[58157] = "Break a Leg|60+ nightfae 58104|40.71 42.78|Featherlight|campaign",
		[58158] = "The Fourth Wall, er, War|60+ nightfae 58157|40.71 42.78|Featherlight|campaign",
		[58159] = "What's My Motivation?|60+ nightfae 58158|40.71 42.78|Featherlight|campaign",
		[58160] = "For Queen and Grove!|60+ nightfae 58159|42.48 45.26|Ysera|campaign",
		[58104] = "Show, Don't Tell|60+ nightfae 61479|46.11 53.29|Lady Moonberry|campaign",
		[62883] = "Keeper of Great Renown|60+ nightfae 58160|46.44 53.07|Winter Queen|campaign elsewhere|\"Attendant Sparkledew can take you to the Queen's audience chamber\"",
		[62884] = "The Forest Will Sing Your Name|60+ nightfae 62883|44.95 52.98|Laurel|campaign",
		[62697] = "A Call to Service|60+ nightfae 62884|44.95 52.98|Laurel|campaign",
		-- 2693 A Calling in Ardenweald (Bonus Objective)
		[62890] = "Who Shapes the Forest|60+ nightfae 62697|46.45 50.68|Blodwyn|campaign",
		[62891] = "Into the Reservoir|60+ nightfae 62890|45.48 52.69|Zayhad, The Builder|campaign",
		[62892] = "Recover the Lost|60+ nightfae 62891|45.48 52.69|Zayhad, The Builder|campaign",
		[62893] = "Do What We Cannot|60+ nightfae 62892|44.98 53.46|Flutterby|campaign",
		[62894] = "Flutterback|60+ nightfae 62837|44.98 53.46|Highlord Bolvar Fordragon|campaign elsewhere link:1670",
		[62897] = "Recovered Souls|60+ nightfae 62894|44.98 53.46|Flutterby|campaign",
		[62898] = "The First New Growth|60+ nightfae 62894|45.48 52.69|Zayhad, The Builder|campaign",
		[61541] = "The Forge of Bonds|60+ nightfae 62898|46.11 53.29|Lady Moonberry|campaign",
		[61542] = "The Boon of Binding|60+ nightfae 61541|44.98 53.46|Flutterby|campaign",
		[61550] = "Strengthening the Bond|60+ nightfae 61542|44.95 53.59|Niya|campaign",
		[62900] = "A Conduit for Growth|60+ nightfae 61550|44.95 53.59|Niya|campaign",
		[61058] = "Bound in Dreams|60+ nightfae 62900|45.09 53.81|Dreamweaver",
		[61057] = "By Trials Forged|60+ nightfae 62900|45.07 53.75|Hunt-Captain Korayn",
		[62899] = "The Endless Forest|60+ nightfae 62900|44.98 53.46|Flutterby|campaign",
		[62860] = "Return Lost Souls|60+ nightfae 62894 -61331 -62858 -62859|44.98 53.46|Flutterby|campaign weekly", -- Combined with 61331 (5 souls), 62858 (10 souls) and 62859 (15 souls)
		[61984] = "Replenish the Reservoir|60+ 62899|46.1 53.14|Sesselie|campaign weekly",
		[63030] = "The Highlord Calls|60+ nightfae 62899|45.99 52.94|Lady Moonberry|campaign",

		-- Night Fae - Daughter of the Night Warrior
		[59179] = "Daughter of the Night Warrior|60+ nightfae renown:5 60272 alliance|45.78 53.12|Ysera|campaign", -- Alliance
		[59246] = "Daughter of the Night Warrior|60+ nightfae renown:5 60272 horde|45.78 53.12|Ysera|campaign", -- Horde
		[59181] = "Into the Maw|60+ nightfae 59179,59246|45.78 53.12|Shandris Feathermoon|campaign elsewhere link:1670",
		[60508] = "On the Trail|60+ nightfae 59181|45.78 53.12|Shandris Feathermoon|campaign elsewhere link:1543",
		[60530] = "The Sea of Souls|60+ nightfae 60508|45.78 53.12|Shandris Feathermoon|campaign elsewhere link:1543",
		[59189] = "The Recovery of Tyrande Whisperwind|60+ nightfae 60530|45.78 53.12|Shandris Feathermoon|campaign elsewhere link:1543",
		[59242] = "Their New Home|60+ nightfae 59189|45.78 53.12|Shandris Feathermoon|campaign elsewhere link:1543",

		-- Night Fae - Da Boss
		[59809] = "On De Other Side|60+ nightfae renown:8 59242|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59811] = "Taking Inventory|60+ nightfae 59809|1 MaskOfBwonsamdi|Bwonsamdi|discovery campaign|\"Mask of Bwonsamdi can take you to the Other Side\"",
		[59812] = "Following the Trail|60+ nightfae 59811|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59813] = "Minions of Mueh'zala|60+ nightfae 59812|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59815] = "Stolen Loa|60+ nightfae 59812|2 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59817] = "Winter Be Comin'|60+ nightfae 59813 59815|1 MaskOfBwonsamdi|Mask of Bwonsamdi|discovery campaign",
		[59818] = "Gathering The Hunt|60+ nightfae 59817|46.44 53.07|Winter Queen|campaign elsewhere link:1703|\"Attendant Sparkledew can take you to the Queen's audience chamber\"",
		[59819] = "Cleansing the Forest|60+ nightfae 59818|66.66 55.6|Lady Moonberry|campaign",
		[59821] = "Report to the Queen|60+ nightfae 59819|68.37 65.07|Lady Moonberry|campaign",

		-- Night Fae - Night Warrior's Curse
		[58610] = "The Speaker of Elune|60+ nightfae renown:11 59821|45.78 53.12|Ysera|campaign",

		-- Night Fae - Drust to Drust
		-- Renown 13

		-- Night Fae - The Horned HUnter
		-- Renown 17

		-- Night Fae - Deal for a Loa
		-- Renown 20

		-- Night Fae - Drust and Ashes
		-- Renown 22

		-- Night Fae - Command Table
		[61552] = "The Hunt Watches|60+ nightfae research:1074|45.48 52.69|Zayhad, The Builder", -- Requires Tactical Insight
		[61553] = "Know Where to Strike|60+ nightfae 61552|44.67 56.28|Watcher Vesperbloom",
		[61852] = "Adventurer: Guardian Kota|60+ nightfae 61553 renown:4|44.67 56.28|Watcher Vesperbloom|legendary",
		[61853] = "Adventurer: Te'zan|60+ nightfae 61553 renown:12|44.67 56.28|Watcher Vesperbloom|legendary",
		[61854] = "Adventurer: Master Sha'lor|60+ nightfae 61553 renown:17|44.67 56.28|Watcher Vesperbloom|legendary",
		[61855] = "Adventurer: Qadarin|60+ nightfae 61553 renown:27|44.67 56.28|Watcher Vesperbloom|legendary",
		[61856] = "Adventurer: Watcher Vesperbloom|60+ nightfae 61553 renown:33|44.67 56.28|Watcher Vesperbloom|legendary",
		[61857] = "Adventurer: Groonoomcrooek|60+ nightfae 61553 renown:38|44.67 56.28|Watcher Vesperbloom|legendary",
		[64458] = "Adventurer: Sulanoom|60+ nightfae 61553 renown:44|44.67 56.28|Watcher Vesperbloom|legendary",
		[64459] = "Adventurer: Elwyn|60+ nightfae 61553 renown:62|44.67 56.28|Watcher Vesperbloom|legendary",
		[64460] = "Adventurer: Yanlar|60+ nightfae 61553 renown:71|44.67 56.28|Watcher Vesperbloom|legendary",

		-- Heart of the Forest
		[62371] = "Tirna Scithe: A Warning Silence|56+,62704|48.38 50.46|Flwngyrr|dungeon",

		-- An Ominous Stone
		[58161] = "Forest Disappearances|56+,62704|64.39 35.19|Brigdin", -- Prereq outside ToF?
		[58164] = "Cult of Personality|56+,62704 58161|70.35 32.6|Partik",
		[58162] = "Mysterious Masks|56+,62704 58161|70.35 32.6|Partik",
		[58163] = "A Desperate Solution|56+,62704 58161|72.19 33.86|Battered Journal",
		[59802] = "The Crumbling Village|56+,62704 58164 58162 58163|70.35 32.6|Partik",
		[58165] = "Cut the Roots|56+,62704 59802|74.32 32.36|Partik",
		[59801] = "Take the Power|56+,62704 59802|74.32 32.36|Partik",
		[58166] = "Unknown Assailants|56+,62704 58165 59801|74.32 32.36|Partik",

		-- When a Gorm Eats a God
		[57952] = "In Need of Gorm Gris|56+,62704|62.61 36.09|Guardian Kota",
		[57818] = "Nothing Goes to Waste|56+,62704 57952|64.86 38.94|Master Sha'lor",
		[57824] = "Collection Day|56+,62704 57818|64.86 38.94|Master Sha'lor",
		[57825] = "Delivery for Guardian Kota|56+,62704 57824|64.86 38.94|Master Sha'lor",
		[61051] = "The Absent-Minded Artisan|56+,62704 57825|62.61 36.09|Guardian Kota",
		[58022] = "Finish What He Started|56+,62704 61051 _58023|62.89 32.14|Guardian Kota", -- Cannot be picked up after completing 58023, bug has been reported to Blizzard (you can use Party Sync to get it again though)
		[58023] = "One Big Problem|56+,62704 61051|62.89 32.14|Guardian Kota",
		[58024] = "Burrows Away|56+,62704 61051 +58022,+58023|62.17 30|Gorm Burrow",
		[58025] = "Queen of the Underground|56+,62704 58023|59.59 33.44|Guardian Kota|down link:1824",
		[58026] = "When a Gorm Eats a God|56+,62704 58025|59.59 33.44|Guardian Kota|down link:1824",

		-- Trouble at the Gormling Corral
		[57652] = "Supplies Needed: Amber Grease|56+,62704|46.92 27.66|Muddy Scroll",
		[57660] = "The Grove of Creation|56+,62704 58026 -57651|62.92 36.23|Master Sha'lor", -- Breadcrumb for 57651
		[57651] = "Trouble in the Banks|56+,62704 ~57660|51.11 33.88|Lady of the Falls", -- Invalidates 57660
		[59621] = "Breaking a Few Eggs|56+,62704 57651|46.67 29.41|Foreman Thorodir",
		[59622] = "Tending to the Tenders|56+,62704 57651|46.67 29.41|Foreman Thorodir",
		[57653] = "Unsafe Workplace|56+,62704 59621 59622|46.67 29.41|Foreman Thorodir",
		[57655] = "Supplies Needed: More Husks!|56+,62704 +57653|47.51 26.36|Discarded Scroll",
		[57656] = "Gifts of the Forest|56+,62704 59621 59622|48.07 24.34|Fluttercatch", -- Check if this is available earlier (unlikely)
		[57657] = "Tied Totem Toter|56+,62704 57656|48.07 24.34|Fluttercatch",
		[59656] = "Well, Tell the Lady|56+,62704 57653 57657|46.67 29.41|Foreman Thorodir",
		[59623] = "What a Buzzkill|56+,62704 57652 57655|51.58 33.99|Gormsmith Cavina", -- Check if 57655 is needed (57652 confirmed to be req)

		-- Ages-Echoing Wisdom
		[57865] = "Ages-Echoing Wisdom|56+,62704 59656|51.11 33.88|Lady of the Falls",
		[57866] = "Idle Hands|56+,62704 59656|51.11 33.88|Lady of the Falls",
		[57867] = {"The Sweat of Our Brow|56+,62704 59656|55.5 29.92|Helpful Faerie", "The Sweat of Our Brow|56+,62704 59656|55.96 23.42|Helpful Faerie",},
		[57869] = "Spirit-Gathering Labor|56+,62704 59656|56.44 29.27|Groonoomcrooek",
		[57868] = "Craftsman Needs No Tools|56+,62704 59656|55.82 23.42|Elder Finnan",
		[57870] = "The Games We Play|56+,62704 59656|59.07 24.35|Elder Gwenna",
		[57871] = "Outplayed|56+,62704 57870|59.07 24.35|Elder Gwenna",

		-- Wicked Plan
		[58265] = "Blooming Villains|57+,62704 60905|60.68 51.33|Guardian Molan",
		[58266] = "Break It Down|57+,62704 60905|53.48 58.71|Primrose",
		[58264] = "Wake Up, Get Up, Get Out There|57+,62704 60905|53.48 58.71|Primrose",
		[58267] = "Beneath the Mask|57+,62704 58266 58264|53.48 58.71|Primrose",

		-- Hibernal Hollow
		[62807] = "Forest Refugees|57+,62704|60.08 53.94|Droman Aliothe",

		-- Thread of Hope
		[57661] = "Silk Shortage|60+|48.48 50.42|Aithlyn",
	},

	-- Matriarch's Den
	[1824] = {
		-- When a Gorm Eats a God
		[58025] = "Queen of the Underground|56+,62704 58023|60.21 45.13|Guardian Kota",
		[58026] = "When a Gorm Eats a God|56+,62704 58025|60.21 45.13|Guardian Kota",
	},


	--[[ Revendreth ]]--

	-- Sinfall - Sinfall Reaches
	[1699] = {
		-- Threads of Fate: Revendreth
		-- 62778 Reinforcing Revendreth (Auto Accept) - shows on map even with Storylines hidden
		--[62779] = "Return to Oribos|62778 venthyr|X Y|Prince Renathal|campaign",

		-- Sinfall Combatant
		[64325] = "Sinfall Veteran|60+,62704 venthyr renown:43|54.33 26.46|Rahel|legendary", -- Venthyr, Renown 43
		[64083] = "Sinfall Tactician|60+,62704 venthyr renown:59|54.33 26.46|Rahel|legendary", -- Venthyr, Renown 59
	},

	-- Sinfall - Sinfall Depths
	[1700] = {
		-- Threads of Fate: Revendreth
		-- 62778 Reinforcing Revendreth (Auto Accept) - shows on map even with Storylines hidden
		--[62779] = "Return to Oribos|62778 venthyr|X Y|Prince Renathal|campaign",
	},

	-- Revendreth
	[1525] = {
		-- Threads of Fate: Revendreth
		-- 62778 Reinforcing Revendreth (Auto Accept) - shows on map even with Storylines hidden
		[62779] = {"Return to Oribos|62778 -venthyr|61.47 60.43|Prince Renathal|campaign", -- check if Venthyr can take quest from both locations or not
			--"Return to Oribos|62778 venthyr|X Y|Prince Renathal|campaign", -- Add Sinfall location
		},

		-- Venthyr - Sinfall Combatant
		[64325] = "Sinfall Veteran|60+,62704 venthyr renown:43|31.57 40.45|Rahel|legendary link:1699", -- Venthyr, Renown 43
		[64083] = "Sinfall Tactician|60+,62704 venthyr renown:59|31.57 40.45|Rahel|legendary link:1699", -- Venthyr, Renown 59

		-- Tithes of Darkhaven
		[60176] = "Bring Out Your Tithe|58+,62704|61.32 63.78|Mistress Mihaela",
		[60177] = "Reason for the Treason|58+,62704|62.22 61.36|Lajos",
		[60178] = "And Then There Were None|58+,62704 60177|62.22 61.36|Lajos",
		[60279] = "WANTED: The Pale Doom|60+|62.19 63.54|Wanted: The Pale Doom",
		[58272] = "Words Have Power|58+,62704|67.74 67.66|Join the Rebellion!",

		-- The Banewood
		[58936] = "Beast Control|58+,62704|49.61 75.96|Bounty: Beast Control",
		[60514] = "Hunting Trophies|58+,62704|48.51 68.44|Huntmaster Constantin",
		[58996] = "Abel's Fate|58+,62704|48.51 68.44|Huntmaster Constantin",

		-- The Duelist's Debt
		[60277] = "WANTED: Aggregate of Doom|58+,62704|59.08 69.2|Bounty: Beast Control",
		[59710] = "A Curious Invitation|58+,62704|60.71 62.5|Dimwiddle",
		[59712] = "The Lay of the Land|58+,62704 59710|59.5 66.73|Courier Araak",
		[59846] = "Finders-Keepers, Sinners-Weepers|58+,62704 59712|59.9 68.89|Nadjia the Mistblade",
		[59713] = "Active Ingredients|58+,62704 59846|59.9 68.89|Nadjia the Mistblade",
		[59714] = "A Fine Vintage|58+,62704 59846|59.9 68.89|Nadjia the Mistblade",
		[59715] = "Message for Matyas|58+,62704 59713 59714|59.9 68.89|Nadjia the Mistblade",
		[59716] = "Comfortably Numb|58+,62704 59715|60.17 69.45|Taskmaster Matyas",
		[59724] = "The Field of Honor|58+,62704 59716|60.2 69.32|Nadjia the Mistblade",
		[59868] = "Offer of Freedom|58+,62704 59716|60.2 69.32|Nadjia the Mistblade",
		[59726] = "It's a Trap|58+,62704 59724 59868|60.21 78.63|Nadjia the Mistblade",

		-- The Endmire
		[60480] = "The Endmire|58+,62704|65.12 63.52|Tessle the Snitch",

		-- Dirty Jobs
		[60509] = "Not My Job|58+,62704 -57471|67.54 68.53|Rendle", -- Breadcrumb for 57471
		[57471] = "It's a Dirty Job|58+,62704 ~60509|72.57 73.21|Rendle", -- Invalidates 60509
		[57474] = "Dredger Duty|58+,62704 57471|72.57 73.21|Rendle",
		[57477] = "We're Gonna Need a Bigger Dredger|58+,62704 57474|72.57 73.21|Rendle",
		[57481] = "Running a Muck|58+,62704 57477|72.84 73.92|Bootus",

		-- The Final Atonement
		[58093] = "Our Forgotten Purpose|58+,62704 -57919|72.99 52|Archivist Fane", -- Breadcrumb for 57919
		[57919] = "An Abuse of Power|58+,62704 ~58093|71.76 40.41|The Accuser", -- Invalidates 58093
		[60487] = "It Used to Be Quiet Here|58+,62704|69.53 53.38|Chiselgrump",
		[57920] = "The Proper Souls|58+,62704 57919|71.76 40.41|The Accuser",
		[57921] = "The Proper Tools|58+,62704 57919|71.76 40.41|The Accuser",
		[57922] = "The Proper Punishment|58+,62704 57919|71.76 40.41|The Accuser",
		[57923] = "Ritual of Absolution|58+,62704 57920 57921 57922|70.7 46.96|The Accuser",
		[57924] = "Ritual of Judgment|58+,62704 57923|71.96 46.23|The Accuser",
		[57925] = "Archivist Fane|58+,62704 57924|74.3 49.72|The Accuser",
		[57928] = "Atonement Crypt Key|58+,62704 57925|69.48 54.42|{135828} [Atonement Crypt Key]||Has a chance to drop from any Depraved Venthyr",
		[57926] = "The Sinstone Archive|58+,62704 57925|72.99 52|Archivist Fane",
		[60127] = "Missing Stone Fiend|58+,62704 57925|72.99 52|Archivist Fane",
		[57927] = "Rebuilding Temel|58+,62704 60127|70.15 56.21|Cryptkeeper Kassir",
		[60128] = "Ready to Serve|58+,62704 57927|70.15 56.21|Cryptkeeper Kassir",
		[57929] = "Hunting an Inquisitor|58+,62704 57926 60128|72.99 52|Archivist Fane", -- check if 60128 is req (it probably is)
		[58092] = "Halls of Atonement: Your Absolution|58+,62704 57929|72.99 52|Archivist Fane|dungeon", -- check if 60128 is req (it probably is)

		-- Revelations of the Light
		[60467] = "A Rousing Aroma|59+,62704|35.07 53.88|Sabina",
		[60469] = "Safe in the Shadows|59+,62704 60467|35.07 53.88|Sabina",
		[60468] = "Rubble Rummaging|59+,62704 60467|35.07 53.88|Sabina",
		[60470] = "Setting Sabina Free|59+,62704 60469 60468|35.07 53.88|Sabina",

		-- Mirror Maker of the Master
		[57531] = "An Unfortunate Situation|59+,62704|26.42 48.95|Laurent",
		[57532] = "Foraging for Fragments|59+,62704 57531|26.42 48.95|Laurent",
		[57571] = "Moving Mirrors|59+,62704 57532|24.25 49.42|Laurent",
		[57534] = "When Only Ash Remains|59+,62704 57571|24.25 49.42|Laurent",
		[57533] = "Light Punishment|59+,62704 57571|24.22 49.48|Simone",
		[57535] = "Escaping the Master|59+,62704 57534 57533|24.25 49.42|Laurent",
		[59427] = "We Need More Power|59+,62704 57534 57533|24.22 49.48|Simone",
		[57536] = "Mirror Making, Not Breaking|59+,62704 57535 59427|24.25 49.42|Laurent",

		-- Sanctuary of the Mad
		[60276] = "WANTED: Summoner Marcelis|59+,62704|30.87 49.05|Wanted: Summoner Marcelis",
		[60275] = "WANTED: Enforcer Kristof|60+|30.68 48.99|Wanted: Enforcer Kristof",
	},


	--[[ The Maw ]]--

	-- The Maw
	[1543] = {
		-- Ve'nari
		[62882] = {"Setting the Ground Rules|60+ kyrian 62832|46.91 41.69|Ve'nari|campaign", "Setting the Ground Rules|60+ necrolord 62843|46.91 41.69|Ve'nari|campaign", "Setting the Ground Rules|60+ nightfae 62893|46.91 41.69|Ve'nari|campaign", "Setting the Ground Rules|60+ venthyr 62905|46.91 41.69|Ve'nari|campaign",},
		[60287] = "Rule 1: Have an Escape Plan|60+ 62882|46.91 41.69|Ve'nari|campaign",
		[61355] = "Rule 2: Keep a Low Profile|60+ 60287|46.91 41.69|Ve'nari|campaign",
		[60289] = "Rule 3: Trust is Earned|60+ 61355|46.91 41.69|Ve'nari|campaign",
		[62837] = "Hopeful News|60+ 60289|46.91 41.69|Ve'nari|campaign",

		-- Torghast
		[61099] = "The Search for Baine|60+ 60136|46.91 41.69|Ve'nari|campaign",
		-- 60267 Prison of the Forgotten
		[62967] = "Prison of the Forgotten|60+ 61099 -60267|46.91 41.69|Ve'nari|campaign", -- You only get this if you missed looting Warden Arkoban (and thus missed 60267)
		[60268] = "Deep Within|60+ 60267,62967|48.2 39.4|Runecarver|campaign elsewhere link:1912",
		[60269] = "Reawakening|60+ 60268|48.2 39.4|Runecarver|campaign elsewhere link:1912",
		[60270] = "A Damned Pact|60+ 60269|48.2 39.4|Runecarver|campaign elsewhere link:1912",
		[60271] = "A Grave Chance|60+ 60270|46.91 41.69|Ve'nari|campaign",
		[60272] = "The Weak Link|60+ 60271|46.91 41.69|Ve'nari|campaign", -- Unlocks the Runecarver

		-- Night Fae - Daughter of the Night Warrior
		[60508] = "On the Trail|60+ nightfae 59181|44.37 41.18|Shandris Feathermoon|campaign",
		[60530] = "The Sea of Souls|60+ nightfae 60508|30.11 36.43|Shandris Feathermoon|campaign",
		[59189] = "The Recovery of Tyrande Whisperwind|60+ nightfae 60530|46.86 41.69|Shandris Feathermoon|campaign",
		[59242] = "Their New Home|60+ nightfae 59189|46.86 41.69|Shandris Feathermoon|campaign",
	},

	-- Torghast - Entrance
	[1911] = {
		-- Torghast
		[60268] = "Deep Within|60+ 60267,62967|15.98 61.2|Runecarver|campaign elsewhere link:1912",
		[60269] = "Reawakening|60+ 60268|15.98 61.2|Runecarver|campaign elsewhere link:1912",
		[60270] = "A Damned Pact|60+ 60269|15.98 61.2|Runecarver|campaign elsewhere link:1912",
	},

	-- The Runecarver's Oubliette
	[1912] = {
		-- Torghast
		[60268] = "Deep Within|60+ 60267,62967|50.3 53.73|Runecarver|campaign",
		[60269] = "Reawakening|60+ 60268|50.3 53.73|Runecarver|campaign",
		[60270] = "A Damned Pact|60+ 60269|50.3 53.73|Runecarver|campaign",

		-- Legendary Crafting
		[62700] = "Ashes of the Tower|60+ 60272|50.3 53.73|Runecarver|legendary",
		[62719] = "The Final Pieces|60+ 60272|50.3 53.73|Runecarver|legendary",
		[62799] = "The Vessels of Thread|60+ tailoring 60272|50.3 53.73|Runecarver|legendary tailoring",
		[62798] = "The Vessels of Leather and Bone|60+ leatherworking 60272|50.3 53.73|Runecarver|legendary leatherworking",
		[62797] = "The Vessels of Metal|60+ blacksmithing 60272|50.3 53.73|Runecarver|legendary blacksmithing",
		[62800] = "The Vessels of Jewels|60+ jewelcrafting 60272|50.3 53.73|Runecarver|legendary jewelcrafting",

		-- Zereth Mortis - Crown of Wills
		[64813] = "The Crown of Wills|60+ 64812|50.28 54.11|The Primus|campaign",
		[64816] = "Reality's Doorstep|60+ 64813 -64875|49.27 69.71|Highlord Bolvar Fordragon|campaign", -- Breadcrumb for 64875 (Something Wonderful); does technically not have the campaign flag in-game
	},


	--[[ Zereth Mortis ]]--

	-- Zereth Mortis
	[1970] = {
		-- Into the Unknown
		[64945] = "Strangers in a Strange Land|60+ 64944|24.91 53.61|Pelagos|campaign",
		[65456] = "Long Lost Firim|60+ 64945|28.51 53.51|Firim|campaign",
		[64947] = "Give Me A Hand|60+ 65456|28.51 53.51|Firim|campaign",
		[64950] = "A Mutual Exchange|60+ 64947|31.24 51.25|Firim|campaign",
		[64949] = "For Research Purposes|60+ 64947|31.24 51.25|Firim|campaign",
		[64951] = "The Road to Haven|60+ 64950 64949|31.24 51.25|Firim|campaign",
		[65271] = "Forging Connections|60+ 64951|33.99 60.85|Pelagos|campaign",
		[64953] = "Defending Haven|60+ 65271|34.85 64.87|Elder Kreth|campaign",
		[64952] = "Destroying the Destructors|60+ 65271|34.78 64.82|Elder Ara|campaign",
		[64957] = "This Old Waystone|60+ 64953 64952|34.78 64.82|Elder Ara|campaign",
		[64958] = "The Forces Gather|60+ 64957|33.17 68.91|Highlord Bolvar Fordragon|campaign elsewhere link:1671",

		-- We Battle Onward
		[66383] = "Legendary Assistance|60+ 64958 alchemy,engineering,tailoring,leatherworking,blacksmithing,jewelcrafting|34.99 64.76|Highlord Bolvar Fordragon",
		[65748] = "You Supply the Effort|60+ 64958|35.16 65.75|Hadja",
		[65735] = "WANTED: Custos|60+ 64958|35.41 65.53|Wanted: Custos",
		[65768] = "Our Forward Scouts|60+ 64958|34.99 64.76|Highlord Bolvar Fordragon|campaign",
		[65771] = "Favor of the First Ones|60+ 64958|34.84 64.99|Elder Zoor|campaign",
		[65772] = "Necessary Harvest|60+ 64958|34.78 64.82|Elder Ara|campaign",
		[64794] = "Knowing is Half the Battle|60+ 65768 65771 65772|34.99 64.76|Highlord Bolvar Fordragon|campaign",
		[64796] = "Scour the Sands|60+ 64794|48.62 49.15|Shandris Feathermoon|campaign",
		[64797] = "Harmony and Discord|60+ 64796|48.62 49.15|Shandris Feathermoon|campaign",
		[64814] = "Battle for the Forge|60+ 64797|41.9 48.11|Highlord Darion Mograine|campaign",
		[64815] = "Together, We Ride|60+ 64797|41.9 48.11|Highlord Darion Mograine|campaign",
		[64817] = "In Plain Sight|60+ 64814 64815|41.9 48.11|Highlord Darion Mograine|campaign",
		[64818] = "Reinforcements May Be Necessary|60+ 64817|41.43 53.54|Highlord Darion Mograine|campaign",
		[64820] = "This is Your Fault, Fix It|60+ 64818|34.85 64.87|Elder Kreth|campaign",
		[64822] = "A Break in Communication|60+ 64818|34.99 64.76|Highlord Bolvar Fordragon|campaign",
		[64821] = "Nothing is True|60+ 64818|34.99 64.76|Highlord Bolvar Fordragon|campaign",
		[64823] = "Doppelganger Duel|60+ 64820 64822 64821|34.99 64.76|Highlord Bolvar Fordragon|campaign",
		[64824] = "Fighting for the Forge|60+ 64823|47.3 63.61|Lady Jaina Proudmoore|campaign",
		[64825] = "Seeking Haven|60+ 64824|57.32 53.62|Lady Jaina Proudmoore|campaign",

		-- Forming an Understanding
		[64218] = "Danger Near and Far|60+ 64825|35.23 65.07|Pelagos|campaign",
		[64219] = "A Mysterious Voice|60+ 64218|40.15 76.63|Pelagos|campaign",
		[64223] = "Core of the Matter|60+ 64219|39.83 78.06|Pelagos|campaign",
		[64224] = "Seeking the Unknown|60+ 64223|34.92 64.79|Pelagos|campaign",
		[64225] = "Finding Firim|60+ 64224|34.92 64.79|Pelagos|campaign",
		[64227] = "Unseen Agents|60+ 64225|34.59 48.15|Firim|campaign",
		[64226] = "Security Measures|60+ 64225|34.59 48.15|Firim|campaign",
		[64228] = "Now You May Speak|60+ 64227 64226|34.04 48.12|Firim|campaign",
		[65149] = "Surveying Cyphers|60+ 64228|34.04 48.12|Firim|campaign",
		[64230] = "Cyphers of the First Ones|60+ 65149|34.04 48.12|Firim|campaign",
		[65305] = "The Way Forward|60+ 64230|33.95 47.93|Pelagos|campaign",
		[66042] = "Patterns Within Patterns|60+ 64230|34.99 64.76|Highlord Bolvar Fordragon|weekly", -- Unlocks Pocopoc and Cyphers of the First Ones

		-- Forging a New Path
		[65335] = "News from Oribos|60+ 65305|34.96 64.69|Uther|campaign",
		[64830] = "Enlisting the Enlightened|60+ 65335|34.99 64.76|Highlord Bolvar Fordragon|campaign",
		[64833] = "Forging Unity from Diversity|60+ 64830|34.78 64.82|Elder Ara|campaign",
		[64831] = "Remnants of the First Ones|60+ 64833|56.2 57.88|Elder Ara|campaign",
		[64832] = "Reclaiming Provis Esper|60+ 64833|56.2 57.88|Elder Ara|campaign",
		[64837] = "The Pilgrim's Journey|60+ 64831 64832|56.2 57.88|Elder Ara|campaign",
		[64834] = "Glow and Behold|60+ 64837|61.29 51.44|Elder Ara|campaign",
		[64838] = "Where There's a Pilgrim, There's a Way|60+ 64834|64.73 53.8|Elder Ara|campaign",
		[64969] = "In the Weeds|60+ 64838|61.1 50.68|Elder Ara|campaign",
		[64836] = "Nip It in the Bud|60+ 64969|48.16 75.13|Elder Ara|campaign",
		[64839] = "Root of the Problem|60+ 64969|48.07 75.15|Feroz|campaign",
		[64835] = "Pluck from the Vines|60+ 64969|48.07 75.15|Feroz|campaign",
		[65331] = "Herbal Remedies|60+ 64836 64839 64835|47.67 79.88|Feroz|campaign",
		[64840] = "Unchecked Growth|60+ 64836 64839 64835|47.67 79.88|Feroz|campaign",
		[64841] = "Take Charge|60+ 64836 64839 64835|47.61 80.31|General Draven|campaign",
		[64842] = "Flora Frenzy|60+ 65331 64840 64841|47.67 79.88|Feroz|campaign",
		[64843] = "Key Crafting|60+ 64842|47.61 80.31|General Draven|campaign",
		[64844] = "The Pilgrimage Ends|60+ 64843|47.34 88.5|Elder Ara|campaign",
		[65774] = "The Catalyst Awakens|60+ 64844|34.75 64.13|Vilo",

		-- Sepulcher of the First Ones
		[65259] = "Heart of the Sepulcher|60+ 64844|34.99 64.76|Highlord Bolvar Fordragon|raid",

		-- Crown of Wills
		[64799] = "The Broken Crown|60+ 64844|34.99 64.76|Highlord Bolvar Fordragon|campaign",
		[64800] = "Our Last Option|60+ 64799|33.17 68.91|Highlord Bolvar Fordragon|campaign",
		[64802] = "Hello, Darkness|60+ 64800|33.29 68.73|The Primus|campaign",
		[64801] = "Elder Eru|60+ 64802|33.17 68.91|Highlord Bolvar Fordragon|campaign",
		[64803] = "Testing One Two|60+ 64802|33.29 68.73|The Primus|campaign",
		[64804] = "Cryptic Catalogue|60+ 64801|56.17 83.33|Elder Eru|campaign",
		[64805] = "The Not-Scientific Method|60+ 64803 64804|59.22 78.81|Elder Eru|campaign",
		[64853] = "Two Paths to Tread|60+ 64805|59.22 78.81|Elder Eru|campaign",
		[64809] = "One Half of the Equation|60+ 64853|33.17 68.91|Highlord Bolvar Fordragon|campaign",
		[64810] = "Oppress and Destroy|60+ 64809|57.22 31.09|Highlord Bolvar Fordragon|campaign",
		[64811] = "Aggressive Excavation|60+ 64809|57.23 31.16|Taelia Fordragon|campaign",
		[64806] = "Where the Memory Resides|60+ 64810 64811|57.22 31.09|Highlord Bolvar Fordragon|campaign",
		[64807] = "What We Wish to Forget|60+ 64806|33.17 68.91|Highlord Bolvar Fordragon|campaign elsewhere link:1533",
		[64808] = "What Makes Us Strong|60+ 64807|33.17 68.91|Anduin Wrynn|campaign elsewhere link:1533",
		[64798] = "What We Overcome|60+ 64808|33.17 68.91|Anduin Wrynn|campaign elsewhere link:1533",
		[64812] = "Forge of Domination|60+ 64798|33.17 68.91|Anduin Wrynn|campaign elsewhere link:1533",
		[64813] = "The Crown of Wills|60+ 64812|33.17 68.91|The Primus|campaign elsewhere link:1912",
		[64816] = "Reality's Doorstep|60+ 64813 -64875|33.17 68.91|Highlord Bolvar Fordragon|elsewhere link:1912", -- Breadcrumb for 64875 (Something Wonderful)

		-- A Means to an End
		[64875] = "Something Wonderful|60+ 64813|35.46 65.08|Pelagos|campaign", -- Presumably invalidates 64816 when completed (but you can strangely be on both at the same time)
		[64876] = "Music of the Spheres|60+ 64875|34.22 48.36|Firim|campaign",
		[64878] = "What A Long Strange Trip|60+ 64876|34.12 47.33|Pocopoc|campaign",
		[64888] = "Borrowed Power|60+ 64878|47.18 29.39|Pocopoc|campaign",
		[65245] = "Pop Goes the Devourer!|60+ 64878|47.18 29.39|Pocopoc|campaign",
		[64889] = "Match Made in Zereth Mortis|60+ 64888 65245|47.18 29.39|Pocopoc|campaign",
		[64935] = "Between A Rock & A Rock|60+ 64888 65245 +64889|48.44 27.19|Suspicious Rubble Pile|campaign",
		[64936] = "Searching High and Low|60+ 64889|34.12 47.33|Pocopoc|campaign",
		[64937] = "You Light Up My Life|60+ 64936|47.95 33.98|Pocopoc|campaign",
		[65237] = "Oracle, Heal Thyself|60+ 64937|34.08 48.05|Pocopoc|campaign",
		[65328] = "Arbiter in the Making|60+ 65237|34.3 38.6|Pelagos|campaign",

		-- Starting Over
		[64879] = "A Monumental Discovery|60+ 65328 -64723|34.99 64.76|Highlord Bolvar Fordragon|campaign", -- Breadcrumb for 64723 (Restoration Project); does technically not have the campaign flag in-game but we are all about fixing Blizzard's mistakes here :)
		[64723] = "Restoration Project|60+ 65328 ~64879|34.22 48.36|Firim|campaign", -- Invalidates 64879
		[64733] = "Help From Beyond|60+ 64723|33.82 48.36|Kleia|campaign",
		[64718] = "Keys To Victory|60+ 64733|57.08 31.07|Saezurah|campaign",
		[64706] = "A Matter Of Motivation|60+ 64733|56.91 31.21|Firim|campaign",
		[64720] = "Cleaving A Path|60+ 64733|56.4 31.15|Secutor Mevix|campaign",
		[64722] = "Knocking On Death's Door|60+ 64718 64706 64720|55.86 29.9|Firim|campaign",
		[64727] = "The Infinite Circle|60+ 64722|66.64 19.6|Saezurah|campaign link:2031",
		[64726] = "The Order Of Things|60+ 64727|68.58 16.12|Saezurah|campaign link:2031",
		[64725] = "Unforgivable Intrusion|60+ 64727|68.58 16.12|Saezurah|campaign link:2031",
		[64962] = "As Foretold|60+ 64726 64725|68.58 16.12|Saezurah|campaign link:2031",
		[64728] = "Acquaintances Forgotten|60+ 64962|68.58 16.12|Saezurah|campaign link:2031",
		[64730] = "The Turning Point|60+ 64728|68.58 16.12|Saezurah|campaign link:2031",
		[64731] = "For Every Soul|60+ 64730|68.49 15.96|Kleia|campaign link:2031",
		[64729] = "Lifetimes To Consider|60+ 64731|68.58 16.12|Saezurah|campaign link:2031",
		[65238] = "Souls Entwined|60+ 64729|34.36 48.49|Kleia|campaign",

		-- Epilogue: Judgment
		[65249] = "The Jailer's Defeat|60+ 65238 ~65329|34.99 64.76|Highlord Bolvar Fordragon",
		[65250] = "Prisoner of Interest|60+ 65249|34.99 64.76|Highlord Bolvar Fordragon",

		-- Exile's Hollow
		[65749] = "The Necessity Of Equipment|60+ 64230|34.22 48.36|Firim",
		[65431] = "Further Research: Aealic|60+ research:1901 currency:1979:45|34.22 48.36|Firim", -- Requires Metrial Understanding and 45+ Cyphers
		[65460] = "Your First Cantaric Protolock|60+ research:1972|34.22 48.36|Firim", -- Requires Cachial Understanding
		[65461] = "Your First Mezzonic Protolock|60+ 65460|34.22 48.36|Firim",
		[65466] = "Your First Fugueal Protolock|60+ 65461|34.22 48.36|Firim",
		[65432] = "Further Research: Dealic|60+ 65431 research:1904 currency:1979:200|33.76 49.5|Cypher Console", -- Requires Aealic Understanding and 200+ Cyphers
		[65700] = "Core Control|60+ research:1932|34.22 48.36|Firim", -- Requires Dealic Understanding
		[65419] = "Protoform Synthesis|60+ research:1932|1 Pocopoc|Pocopoc|discovery", -- Requires Dealic Understanding
		[65433] = "Further Research: Trebalim|60+ 65432 research:1932 currency:1979:260|33.76 49.5|Cypher Console", -- Requires Dealic Understanding and 260+ Cyphers

		-- Not Al Are Lost
		[64771] = "Enlightened Exodus|60+ 64958|33.73 64.65|Al'dalil",
		[64741] = "Security Check|60+ 64771|33.73 64.65|Al'dalil",
		[64742] = "Traces of Tampering|60+ 64741|33.73 64.65|Al'dalil",
		[64744] = "Broker Decloaker|60+ 64742|33.71 59.76|Al'dalil",
		[64743] = "Xy Are You Doing This?|60+ 64742|33.71 59.76|Al'dalil",
		[64758] = "Following the Leader|60+ 64744 64743|33.79 59.79|Rana",
		[64760] = "Technical Difficulties|60+ 64758|31.67 67.38|Rana",

		-- Small Pet Problems
		[65064] = "Look Who I Found!|60+ 65305|34.7 66.28|Tamra",
		[65066] = "Flora Aroma|60+ 65064|49.26 71.75|Tamra",
		[65067] = "Broker Beaker|60+ 65064|49.26 71.75|Tamra",
		[65068] = "Cascades of Magnitude|60+ 65066 65067|49.26 71.75|Tamra",
		[65069] = "Culling the Maelstrom|60+ 65068|49.26 71.75|Tamra",
		[65070] = "Can I Keep Him?|60+ 65068|49.26 71.75|Tamra",

		-- The Patient Bufonid
		[65727] = "The Burrowed Bufonid|60+ 64958|34.34 65.89|Avna",
		[65725] = "The Burrowed Bufonid|60+ 65727 reset:65727|34.34 65.89|Avna",
		[65726] = "The Burrowed Bufonid|60+ 65725 reset:65725|34.34 65.89|Avna",
		[65728] = "The Burrowed Bufonid|60+ 65726 reset:65726|34.34 65.89|Avna",
		[65729] = "The Burrowed Bufonid|60+ 65728 reset:65728|34.34 65.89|Avna",
		[65730] = "The Burrowed Bufonid|60+ 65729 reset:65729|34.34 65.89|Avna",
		[65731] = "The Burrowed Bufonid|60+ 65730 reset:65730|34.34 65.89|Avna",
		[65732] = "The Patient Bufonid|60+ 65731|34.34 65.89|Avna",

		-- The Waters of Grace
		[65463] = "The Wellspring of the First Ones|60+ 64230 -65349|61.49 49.17|Drim", -- Breadcrumb for 65349 (Lost Grace)
		[65349] = "Lost Grace|60+ 64230 ~65349|61.87 53.51|Olem", -- Invalidates 65463
		[65350] = "Restore the Flow|60+ 65349|55.12 50.2|Nadir",
		[65353] = "An Automa-free Diet|60+ 65349|55.12 50.2|Nadir",
		[65448] = "A Return to Grace|60+ 65350|58.38 55.74|Percolation Array|down link:2028",

		-- Jiro to Hero
		[64772] = "Broken Circle|60+ 64958 research:1902|40.07 42.03|Hanoa the Exile", -- Requires Altonian Understanding
		[64773] = "A Jiro Guide to Not Being Eaten|60+ 64958 research:1902|37.98 39.72|Olea Pau", -- Requires Altonian Understanding
		[64713] = "Picking Up the Pieces... Literally|60+ 64958 research:1902|36.67 37.83|Olea Novi", -- Requires Altonian Understanding
		[65370] = "Gut Check|60+ 64958 research:1902|38.18 35.32|Olea Manu", -- Requires Altonian Understanding
		[64775] = "Mawdified Behavior|60+ 64772|39.54 31.84|Hanoa the Exile",
		[64739] = "Zovaal's Grasp|60+ 64775|39.43 32.26|Hanoa the Exile",
		[64779] = "Pound of Flesh|60+ 64739|42.57 31.48|Olea Pau",
		[64780] = "Mawsteel, Maw Problems|60+ 64739|42.6 31.56|Olea Novi",
		[64778] = "Rift Recon|60+ 64739|42.66 31.57|Olea Manu",
		[65219] = "Jiro to Hero|60+ 64779 64780 64778|42.65 31.41|Hanoa the Exile",
		[66579] = "Sounds of Healing|60+ 65219|3 ResonatingDisc|{1526019} [epic]Resonating Disc]|discovery|Has a chance to drop from any creature in Zereth Mortis",

		-- Reap What You Sow
		[64641] = "Mysterious Greenery|60+ 64958 research:1931|55.28 64.39|Glimmercane", -- Requires Sopranian Understanding
		[64642] = "Clearing the Ruins|60+ 64641|60.5 70.02|Koh Shira",
		[64643] = "Scavenging a Solution|60+ 64641|60.47 70.14|Koh Riva",
		[64644] = "A Splash of the Eternal|60+ 64642 64643|60.68 69.78|Glimmercane",
		[64645] = "Moment of Truth|60+ 64644|60.5 70.02|Koh Shira",
		[64646] = "Ramping Up|60+ 64645|63.61 73.1|Koh Shira",
		[64647] = "Strange Gears|60+ 64645|63.83 74.04|Perished Automa|link:2027",
		[64648] = "Reap What We Have Sown|60+ 64646 64647|64.63 77.21|Koh Shira|down link:2027",

		-- The Final Song / A New Architect
		[64829] = "Finding Tahli|60+ 64958 research:1931|61.37 51.55|Elder Amir", -- Requires Sopranian Understanding
		[64745] = "Selfless Preservation|60+ 64829|63.94 40.78|Tahli",
		[64759] = "Junk's Not Dead|60+ 64745|61.19 37.62|Tahli",
		[64761] = "Core Competency|60+ 64745|61.19 37.62|Tahli",
		[64762] = "Revival of the Fittest|60+ 64759 64761|61.19 37.62|Tahli",
		[64763] = "Maintenance Mode|60+ 64762|61.24 37.62|Kodah",
		[64766] = "Access Request|60+ 64762|61.24 37.62|Kodah",
		[64767] = "The Final Song|60+ 64763 64766|68.77 29.71|Kodah",
		[65420] = "Judgment Call|60+ 64767|70.13 28.72|Tahli",
		[65426] = "The Lost Component|60+ 65420|61.46 51.56|Tahli",
		[65427] = "A New Architect|60+ 65426|70.21 28.57|Servitor Interface",

		-- Professions
		[65674] = "What Is This Thing?|60+ 64230 alchemy,engineering,tailoring,leatherworking,blacksmithing,jewelcrafting|2 UnformedEssence|{3950361} [Unformed Essence]|discovery|Has a chance to drop from any automa in Zereth Mortis",
	},

	-- Blooming Foundry
	[2027] = {
		-- Reap What You Sow
		[64646] = "Ramping Up|60+ 64645|26.55 3.18|Koh Shira",
		[64647] = "Strange Gears|60+ 64645|29.3 15.24|Perished Automa",
		[64648] = "Reap What We Have Sown|60+ 64646 64647|39.35 55.33|Koh Shira",
	},

	-- Locrian Esper
	[2028] = {
		-- The Waters of Grace
		[65448] = "A Return to Grace|60+ 65350|51.5 68.73|Percolation Array",
	},

	-- Crypts of the Eternal
	[2031] = {
		-- Starting Over
		[64727] = "The Infinite Circle|60+ 64722|36.66 76.97|Saezurah|campaign",
		[64726] = "The Order Of Things|60+ 64727|53.24 47.23|Saezurah|campaign",
		[64725] = "Unforgivable Intrusion|60+ 64727|53.24 47.23|Saezurah|campaign",
		[64962] = "As Foretold|60+ 64726 64725|53.24 47.23|Saezurah|campaign",
		[64728] = "Acquaintances Forgotten|60+ 64962|53.24 47.23|Saezurah|campaign",
		[64730] = "The Turning Point|60+ 64728|53.24 47.23|Saezurah|campaign",
		[64731] = "For Every Soul|60+ 64730|52.48 45.87|Kleia|campaign",
		[64729] = "Lifetimes To Consider|60+ 64731|53.24 47.23|Saezurah|campaign",
	},


	--[[ Tiragarde Sound ]]--

	-- Boralus
	[1161] = {
		-- The Heart of Azeroth
		[53028] = "A Dying World|50+ alliance|75.05 14.95|Earthen Guardian",

		-- A Nation Divided
		[47099] = "Get Your Bearings|10+ alliance 47098|75.73 23.58|Taelia",
		[46729] = "The Old Knight|10+ alliance 47099|67.57 15.24|Taelia",
		[52128] = "Ferry Pass|10+ alliance 46729|67.99 21.91|Cyrus Crestfall",
		[47186] = "Sanctum of the Sages|10+ alliance 46729|68.15 21.09|Taelia",
		[47189] = "A Nation Divided|10+ alliance 47186|68.15 21.09|Taelia",

		-- Mission from the King
		[52654] = "The War Campaign|35+ alliance 47186|68.05 22.18|Genn Greymane",

		-- Kul Tiras
		-- After picking Tiragarde Sound, the Scouting Map becomes available again once 47485 is complete
		[47960] = {"Tiragarde Sound|10+ alliance 47189 -47961 -47962|68.38 22.08|Scouting Map",},
		[47961] = {"Drustvar|20+ alliance 47189 -47960 -47962|68.38 22.08|Scouting Map", "Drustvar|20+ alliance 47189 47960 47485 -47962|68.38 22.08|Scouting Map",},
		[47962] = {"Stormsong Valley|30+ alliance 47189 -47960 -47961|68.38 22.08|Scouting Map", "Stormsong Valley|30+ alliance 47189 47960 47485 -47961|68.38 22.08|Scouting Map",},

		-- Tiragarde Sound - The Ashvane Trading Company
		[47181] = "The Smoking Gun|10+ alliance 47960|67.58 22.21|Flynn Fairwind",
		[47485] = "The Ashvane Trading Company|10+ alliance 47181|67.99 21.91|Cyrus Crestfall",

		-- Scrap-O-Matic 1000
		[52462] = "A Load of Scrap|10+ alliance|77.17 16.46|Crenzo Sparkshatter",

		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},

	-- Tiragarde Sound
	[895] = {
		-- The Heart of Azeroth
		[53028] = "A Dying World|50+ alliance|75.5 23.39|Earthen Guardian|link:1161",

		-- The Ashvane Trading Company
		[47486] = "Suspicious Shipments|10+ alliance 47485|76.84 43.43|Cagney",
		[47487] = "Labor Dispute|10+ alliance 47485|76.84 43.43|Cagney",
		[47488] = "Small Haulers|10+ alliance 47485|76.84 43.43|Olive",

		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},


	--[[ Drustvar ]]--

	[896] = {
		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},


	--[[ Stormsong Valley ]]--

	-- Stormsong Valley
	[942] = {
		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},

	-- Thornheart
	[1183] = {
		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},


	--[[ Zuldazar ]]--

	-- Dazar'alor
	[1165] = {
		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},

	-- Zuldazar
	[862] = {
		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},


	--[[ Nazmir ]]--

	[863] = {
		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},


	--[[ Vol'dun ]]--

	[864] = {
		-- The Great Sea Scrolls
		[53476] = "The Great Sea Scrolls|10+|1 Scrollcase|{454060} [Ancient Pilgrimage Scrollcasing]|discovery|Has a chance to drop from any Treasure Chest in Kul Tiras or Zandalar",
	},


	--[[ Dalaran, Broken Isles ]]--

	-- 44184,44663 - In the Blink of an Eye
	-- 44659 - Skipped intro

	-- Dalaran
	[627] = {
		-- Death Knight - The Ebon Blade
		[40714] = "The Call To War|10+ deathknight 44184,44663|73.08 46.89|[Auto Accept]|artifact", -- Auto Accept
		[40715] = "A Pact of Necessity|10+ deathknight 40714|73.08 46.89|Duke Lankral|artifact",

		-- Death Knight - Apocalypse
		[40930] = "Apocalypse|10+ deathknight 40724|73.08 46.89|[Auto Accept]|artifact", -- Auto Accept
		[40931] = "Following the Curse|10+ deathknight 40930|73.08 46.89|Revil Kost|artifact elsewhere link:47",
		[40932] = "Disturbing the Past|10+ deathknight 40931|73.08 46.89|Revil Kost|artifact elsewhere link:42",
		[40933] = "A Grisly Task|10+ deathknight 40932|73.08 46.89|Revil Kost|artifact elsewhere link:42",
		[40934] = "The Dark Riders|10+ deathknight 40933 -40986|73.08 46.89|Revil Kost|artifact elsewhere link:42", -- 40986 is used if 2nd/3rd artifact
		[40935] = "The Call of Vengeance|10+ deathknight 40934,40986 -40987|73.08 46.89|Revil Kost|artifact elsewhere link:42", -- 40987 is used if 2nd/3rd artifact

		-- Demon Hunter - The Illidari
		[39047] = "Call of the Illidari|10+ demonhunter 44184,44663 40375|57.88 45.65|Kor'vas Bloodthorn|artifact", -- Altruis
		[39261] = "Call of the Illidari|10+ demonhunter 44184,44663 40374|57.88 45.65|Kor'vas Bloodthorn|artifact", -- Kayn
		[40816] = "The Power to Survive|10+ demonhunter 39047,39261 40375|74.98 49.02|Altruis the Sufferer|artifact", -- Altruis
		[40814] = "The Power to Survive|10+ demonhunter 39047,39261 40374|74.98 49.02|Kayn Sunfury|artifact", -- Kayn
		[42869] = "Eternal Vigil|10+ demonhunter 41119,39247,41863,40249|73.85 46.05|Kor'vas Bloodthorn|artifact",
		[42872] = "Securing the Way|10+ demonhunter 42869|95.15 65.99|Jace Darkweaver|artifact",
		[41033] = "Return to Mardum|10+ demonhunter 42872 40375|94.92 66.52|Matron Mother Malevolence|artifact", -- Altruis
		[41221] = "Return to Mardum|10+ demonhunter 42872 40374|94.92 66.52|Matron Mother Malevolence|artifact", -- Kayn
		[41060] = "Unbridled Power|10+ demonhunter 41033,41221 40375|77.68 45.5|Altruis the Sufferer|artifact elsewhere link:720", -- Altruis
		[41037] = "Unbridled Power|10+ demonhunter 41033,41221 40374|77.68 45.5|Kayn Sunfury|artifact elsewhere link:720", -- Kayn
		[41070] = "Spoils of Victory|10+ demonhunter 41060,41037 40375|77.68 45.5|Altruis the Sufferer|artifact elsewhere link:720", -- Altruis
		[41062] = "Spoils of Victory|10+ demonhunter 41060,41037 40374|77.68 45.5|Kayn Sunfury|artifact elsewhere link:720", -- Altruis
		[41066] = "The Hunter's Gaze|10+ demonhunter 41070,41062|77.68 45.5|Allari the Souleater|artifact elsewhere link:721",
		[41096] = "Time is of the Essence|10+ demonhunter 41066 40375|77.68 45.5|Allari the Souleater|artifact elsewhere link:721", -- Altruis
		[41067] = "Time is of the Essence|10+ demonhunter 41066 40374|77.68 45.5|Allari the Souleater|artifact elsewhere link:721", -- Kayn
		[41099] = "Direct Our Wrath|10+ demonhunter 41096,41067 40375|77.68 45.5|Altruis the Sufferer|artifact elsewhere link:720", -- Altruis
		[41069] = "Direct Our Wrath|10+ demonhunter 41096,41067 40374|77.68 45.5|Kayn Sunfury|artifact elsewhere link:720", -- Kayn

		-- Demon Hunter - Twinblades of the Deceiver
		[41120] = "Making Arrangements|10+ demonhunter 40817,44381 40375|74.98 49.02|Altruis the Sufferer|artifact", -- Altruis
		[40819] = "Making Arrangements|10+ demonhunter 40817,44381 40374|74.98 49.02|Kayn Sunfury|artifact", -- Kayn
		[41121] = "By Any Means|10+ demonhunter 41120,40819 40375|65.63 67.27|Altruis the Sufferer|artifact", -- Altruis
		[39051] = "By Any Means|10+ demonhunter 41120,40819 40374|65.63 67.27|Kayn Sunfury|artifact", -- Kayn
		[41119] = "The Hunt|10+ demonhunter 41121,39051 40375|62.75 64.93|Altruis the Sufferer|artifact", -- Altruis
		[39247] = "The Hunt|10+ demonhunter 41121,39051 40374|62.75 64.93|Kayn Sunfury|artifact", -- Kayn

		-- Demon Hunter - Aldrachi Warblades

		-- Demon Hunter - Destiny of the Illidari
		[42594] = "Move Like No Other|10+ demonhunter 42593|26.03 52.08|Archmage Lan'dalock|artifact",

		-- Hunter - The Unseen Path
		[40953] = "On Eagle's Wings|10+ hunter|60.04 53.46|Emmarel Shadewarden|artifact",
		[40954] = "The Unseen Path|10+ hunter 40953|15 20|Emmarel Shadewarden|artifact elsewhere link:739|Visit {!}Emmarel Shadewarden in Trueshot Lodge to continue the Hunter Campaign",
		[40955] = "Oath of Service|10+ hunter 40954|15 20|Emmarel Shadewarden|artifact elsewhere link:739|Visit {!}Emmarel Shadewarden in Trueshot Lodge to continue the Hunter Campaign",
		[40958] = "Tactical Matters|10+ hunter 40955|15 20|Emmarel Shadewarden|artifact elsewhere link:739|Visit {!}Emmarel Shadewarden in Trueshot Lodge to continue the Hunter Campaign",
		[40959] = "The Campaign Begins|10+ hunter 40958|15 20|Tactician Tinderfell|artifact elsewhere link:739|Visit {!}Tactician Tinderfell in Trueshot Lodge to continue the Hunter Campaign",

		-- Azsuna - Behind Legion Lines
		[41220] = "Down to Azsuna|10+ 39718 -38834 -44137|72.5 45.63|Archmage Khadgar",

		-- Val'sharah - Nature's Call
		[39861] = "Tying Up Loose Ends|10+ 39731 -40122|70.51 44.08|Archmage Khadgar",

		-- Highmountain - The Rivermane Tribe
		[38907] = "Keepers of the Hammer|10+ 39733 -38907 -38911|70.56 44.42|Warbrave Oro",

		-- Stormheim - Greymane's Gambit
		[38035] = "A Royal Summons|10+ 39735,44700 alliance|29.09 46.86|Sky Admiral Rogers", -- Alliance
		[38307] = "The Warchief Beckons|10+ 39864,44701 horde|29.1 46.89|Nathanos Blightcaller", -- Horde
		[38206] = "Making the Rounds|10+ 38035 alliance|29.09 46.86|Sky Admiral Rogers", -- Alliance
		[39698] = "Making the Rounds|10+ 38307 horde|26.48 45.15|Lady Sylvanas Windrunner|elsewhere link:1|Portal to The Dark Lady's Fleet", -- Horde
		[39800] = "Greymane's Gambit|10+ 38206 alliance|26.48 45.15|Genn Greymane|elsewhere link:84|Portal to the Skyfire", -- Alliance
		[39801] = "The Splintered Fleet|10+ 39698 horde|26.48 45.15|Lady Sylvanas Windrunner|elsewhere link:1|Portal to The Dark Lady's Fleet", -- Horde

		-- Stormheim - Lock, Stock and Two Smoking Goblins
		[43331] = "Time to Collect|45+ 42483|50.17 22.64|Gazrix Gearlock",

		-- Stormheim - A Call to Action
		[44720] = "A Call to Action|45+ -44771|73.86 41.61|Muninn",

		-- Suramar - An Ancient Gift
		[39985] = "Khadgar's Discovery|45+ -39986 -44555|28.49 48.34|Archmage Khadgar", -- There are two versions of this quest that get marked as completed at the same time
		[39986] = "Magic Message|45+ 39985,44555|28.49 48.34|Archmage Khadgar",
		[39987] = "Trail of Echoes|45+ 39986|28.49 48.34|Archmage Khadgar",

		-- Violet Hold
		[44400] = "Assault on Violet Hold: Purple Pain|10+|66.31 67.93|Lieutenant Sinclari|dungeon",

		-- The Light's Heart
		-- Need to check prereqs for each class (Paladin done)
		[44009] = "A Falling Star|10+ -paladin|28.49 48.34|Archmage Khadgar",
		[44257] = "A Falling Star|10+ 42866 paladin|28.49 48.34|Archmage Khadgar", -- Paladin
		[44004] = "Bringer of the Light|10+ 44009,44257|49.3 47.2|Archmage Khadgar|down link:629",

		-- Uniting the Isles (Always use both 45727,43341)
		[45727] = "Uniting the Isles|45+ -43341|28.49 48.34|Archmage Khadgar", -- First time on account is 43341
		
		-- Armies of Legionfall
		[46730] = "Armies of Legionfall|45+ 45727,43341|66.22 41.99|Archmage Khadgar",
		[46734] = "Assault on Broken Shore|45+ 46730|69.35 43.88|Archmage Khadgar",

		-- The Council's Challenge
		[44782] = "Away From Prying Eyes|45+ 47000,44781|28.49 48.34|Archmage Khadgar|artifact",
		[44821] = "In Dire Need|45+ 44782|22.21 39.05|Archmage Modera|artifact",

		-- The Highlord's Return (Death Knight, Demon Hunter, Druid, Monk, Paladin, Warrior)
		[47025] = "Blood: Aid of the Illidari|45+ deathknight 44821|28.45 49.49|Archmage Ansirem Runeweaver|artifact", -- Death Knight
		[46314] = "Vengeance: Seeking Kor'vas|45+ demonhunter 44821|28.45 49.49|Archmage Ansirem Runeweaver|artifact", -- Demon Hunter
		[47023] = "Guardian: Aid of the Illidari|45+ druid 44821|28.45 49.49|Archmage Ansirem Runeweaver|artifact", -- Druid
		[47024] = "Brewmaster: Aid of the Illidari|45+ monk 44821|28.45 49.49|Archmage Ansirem Runeweaver|artifact", -- Monk
		[47022] = "Protection: Aid of the Illidari|45+ paladin 44821|28.45 49.49|Archmage Ansirem Runeweaver|artifact", -- Paladin
		[45412] = "Protection: Aid of the Illidari|45+ warrior 44821|28.45 49.49|Archmage Ansirem Runeweaver|artifact", -- Warrior

		-- The Black Rook Threat (Druid, Monk, Paladin, Priest, Shaman)
		[47004] = "Restoration: The Bradensbrook Investigation|45+ druid 44821|28.45 48.92|Archmage Modera|artifact", -- Druid
		[47005] = "Mistweaver: The Bradensbrook Investigation|45+ monk 44821|28.45 48.92|Archmage Modera|artifact", -- Monk
		[47006] = "Holy: The Bradensbrook Investigation|45+ paladin 44821|28.45 48.92|Archmage Modera|artifact", -- Paladin
		[46078] = "Holy: The Bradensbrook Investigation|45+ priest 44821|28.45 48.92|Archmage Modera|artifact", -- Priest
		[47003] = "Restoration: The Bradensbrook Investigation|45+ shaman 44821|28.45 48.92|Archmage Modera|artifact", -- Shaman

		-- God-Queen's Challenge (Mage, Paladin, Rogue, Shaman, Warlock)
		[47004] = "Arcane: Fate of the Tideskorn|45+ mage 44821|28.49 48.34|Archmage Khadgar|artifact", -- Mage
		[47052] = "Retribution: Fate of the Tideskorn|45+ paladin 44821|28.49 48.34|Archmage Khadgar|artifact", -- Paladin
		[47051] = "Assassination: Fate of the Tideskorn|45+ rogue 44821|28.49 48.34|Archmage Khadgar|artifact", -- Rogue
		[47050] = "Enhancement: Fate of the Tideskorn|45+ shaman 44821|28.49 48.34|Archmage Khadgar|artifact", -- Shaman
		[47049] = "Demonology: Fate of the Tideskorn|45+ warlock 44821|28.49 48.34|Archmage Khadgar|artifact", -- Warlock

		-- The Deaths of Chromie
		[48021] = "Chromie|45+ -47543|26.37 44.54|Image of Chromie",

		-- Whispers of a Frightened World
		[47330] = "Whispers of a Frightened World|45+ 46734 -46206|28.49 48.34|Archmage Khadgar", -- Auto-Accept version is 46206

		-- The Hand of Fate
		[48506] = "The Hand of Fate|45+ 46734 alliance -47221|28.49 48.34|Archmage Khadgar", -- Alliance - Auto-Accept version is 47221
		[48507] = "The Hand of Fate|45+ 46734 horde -47835|28.49 48.34|Archmage Khadgar", -- Horde - Auto-Accept version is 47835

		-- Wakening Essence
		[50432] = "Titanic Innovation|45+|45.21 29.1|Arcanomancer Vridiel|legendary",

		-- Cooking
		-- Nomi pops up with 40988 (Too Many Cooks) or 40989 (The Prodigal Sous Chef) automatically after learning a Legion cooking recipe
		-- There is also 44581 (Spicing Things Up) that might be obsolete as of 7.1
		[40990] = {"A Good Recipe List|10+ cooking 40988,40989,44581 alliance|40.07 65.98|Nomi|cooking", "A Good Recipe List|10+ cooking 40988,40989,44581 horde|69.77 38.77|Nomi|cooking",},
		[40991] = {"Opening the Test Kitchen|10+ cooking 40990 alliance|40.07 65.98|Nomi|cooking", "Opening the Test Kitchen|10+ cooking 40990 horde|69.77 38.77|Nomi|cooking",},

		-- Alchemy
		[39325] = "Get Your Mix On|10+ alchemy|41.33 33.39|Deucus Valdera|alchemy",
		[39326] = "Missing Shipments|10+ alchemy 39325|41.33 33.39|Deucus Valdera|alchemy",
		[39566] = "The Search for Knowledge|10+ alchemy 39326 -39390|41.33 33.39|Deucus Valdera|alchemy",
		[39390] = "A Mysterious Text|10+ alchemy 39566|41.33 33.39|Alchemy Book|alchemy elsewhere link:630",
		[39327] = "There's a Scribe for That|10+ alchemy 39390|41.33 33.39|Deucus Valdera|alchemy",

		-- Blacksmithing
		[48053] = "Weigh Anchor|45+ blacksmithing alliance|44.13 28.72|Alard Schmied|blacksmithing", -- Alliance
		[48054] = "Weigh Anchor|45+ blacksmithing horde|44.13 28.72|Alard Schmied|blacksmithing", -- Horde

		-- Engineering
		[40545] = "Aww Scrap!|10+ engineering|38.36 25.57|Hobart Grapplehammer|engineering",
		[40854] = "Endless Possibilities|10+ engineering 40545|59.84 47.87|Filgo Scrapbottom|engineering down link:628",
		[40855] = "Our Man in Azsuna|10+ engineering 40854|38.99 25.41|Didi the Wrench|engineering",
		[40859] = "The Latest Fashion: Headguns!|10+ engineering 40855|38.99 25.41|Fargo Flintlocke|engineering elsewhere link:630",
		[40856] = "It'll Cost You|10+ engineering 40855|38.99 25.41|Fargo Flintlocke|engineering elsewhere link:630",
		[40858] = "The Missing Pieces|10+ engineering 40856|38.99 25.41|Fargo Flintlocke|engineering elsewhere link:630",
		[40860] = "Resupplying the Line|10+ engineering 40858|38.36 25.57|Hobart Grapplehammer|engineering",
		[40861] = "In My Sights|10+ engineering 40860|38.36 25.57|Fargo Flintlocke|engineering elsewhere link:641",
		[40862] = "All Charged Up|10+ engineering 40860|38.36 25.57|Fargo Flintlocke|engineering elsewhere link:641",
		[40863] = "Always the Last Thing|10+ engineering 40858|38.97 25.42|Didi the Wrench|engineering",
		[40864] = "Modular Modifications|10+ engineering 40863|38.97 25.42|Didi the Wrench|engineering",
		[40865] = "It's Not Rocket Science|10+ engineering 40861 40862 40864|38.36 25.57|Hobart Grapplehammer|engineering",

		-- Enchanting
		-- ...
		[39879] = "Strong Like the Earth|10+ enchanting 39878|38.31 40.37|Guron Twaintail|enchanting elsewhere link:750",
		[39880] = "Waste Not|10+ enchanting 39878|38.31 40.37|Guron Twaintail|enchanting elsewhere link:750",
		[39883] = "Cloaked in Tradition|10+ enchanting 39879 39880|38.31 40.37|Guron Twaintail|enchanting elsewhere link:750",
		[39881] = "Fey Enchantments|10+ enchanting 39883|38.31 40.37|Enchanter Nalthanis|enchanting",
		[39884] = "No Longer Worthy|10+ enchanting 39881|38.31 40.37|Nalamya|enchanting elsewhere link:641",
		[39889] = "Led Astray|10+ enchanting 39881|38.31 40.37|Nalamya|enchanting elsewhere link:641",
		[39882] = "Darkheart Thicket: The Glamour Has Faded|10+ enchanting 39884 39889|38.31 40.37|Nalamya|enchanting dungeon elsewhere link:641",
		[39903] = "An Enchanting Home|10+ enchanting 39883|38.31 40.37|Enchanter Nalthanis|enchanting",

		-- Herbalism - Aethril
		[40013] = "Aethril Sample|10+ herbalism|1 Aethril|{1395063} [Aethril Sample]|herbalism discovery link:630|Gathered from Aethril",
		[40014] = "Spayed by the Spade|10+ herbalism 40013|43 33.36|Kuhuine Tenderstride|herbalism",
		[40015] = "Ragged Strips of Silk|10+ herbalism 40014|1 Aethril|{463527} [Ragged Strips of Silk]|herbalism discovery link:630|Gathered from Aethril",
		[40016] = "Desperation Breeds Ingenuity|10+ herbalism 40015|43 33.36|Kuhuine Tenderstride|herbalism",
		[40017] = "A Slip of the Hand|10+ herbalism 40016|1 Aethril|[Auto Accept]|herbalism discovery link:630|Has a chance to be obtained after gathering Aethril",

		-- Herbalism - Dreamleaf
		[40018] = "Dreamleaf Sample|10+ herbalism|2 Dreamleaf|{1387613} [Dreamleaf Sample]|herbalism discovery link:641|Gathered from Dreamleaf",
		[40019] = "An Empathetic Herb|10+ herbalism 40018|43 33.36|Kuhuine Tenderstride|herbalism",
		[40020] = "Twisted to Death|10+ herbalism 40019|2 Dreamleaf|{1387617} [Blight-Twisted Herb]|herbalism discovery link:641|Gathered from Dreamleaf",
		[40021] = "One Dead Plant is One Too Many|10+ herbalism 40020|43 33.36|Wildcrafter Osme|herbalism elsewhere link:641",
		[40022] = "Choked by Nightmare|10+ herbalism 40021|2 Dreamleaf|{1387617} [Blight-Choked Herb]|herbalism discovery link:641|Gathered from Dreamleaf",
		[40023] = "The Last Straw|10+ herbalism 40022|43 33.36|Wildcrafter Osme|herbalism elsewhere link:641",

		-- Herbalism - Foxflower
		[40024] = "Foxflower Sample|10+ herbalism|3 Foxflower|{1387616} [Foxflower Sample]|herbalism discovery link:650|Gathered from Foxflower",
		[40025] = "Teeny Bite Marks|10+ herbalism 40024|3 Foxflower|{960686} [Nibbled Foxflower Stem]|herbalism discovery link:650|Gathered from Foxflower",
		[40026] = "Chase the Culprit|10+ herbalism 40025|43 33.36|Kuhuine Tenderstride|herbalism",
		[40028] = "The Pied Picker|10+ herbalism 40026|3 Foxflower|{656439} [Foxflower Scent Gland]|herbalism discovery link:650|Gathered from Foxflower",

		-- Herbalism - Fjarnskaggl
		[40029] = "Fjarnskaggl Sample|10+ herbalism|4 Fjarnskaggl|{1387615} [Fjarnskaggl Sample]|herbalism discovery link:634|Gathered from Fjarnskaggl",
		[40030] = "Ram's-Horn Trowel|10+ herbalism 40029|4 Fjarnskaggl|{134436} [Ram's-Horn Trowel]|herbalism discovery link:634|Gathered from Fjarnskaggl",
		[40031] = "Vrykul Herblore|10+ herbalism 40030|43 33.36|Kuhuine Tenderstride|herbalism",
		[40032] = "The Missing Page|10+ herbalism 40031|4 Fjarnskaggl|{134938} [Runed Journal Page]|herbalism discovery link:634|Gathered from Fjarnskaggl",
		[40033] = "Fjarnskaggl|10+ herbalism 40032|43 33.36|Kuhuine Tenderstride|herbalism",

		-- Herbalism - Starlight Rose
		[40034] = "Starlight Rosedust|10+ herbalism|5 StarlightRose|{1387618} [Starlight Rosedust]|herbalism discovery link:680|Gathered from Starlight Rose",
		[40035] = "The Gentlest Touch|10+ herbalism 40034|43 33.36|Kuhuine Tenderstride|herbalism",
		[40036] = "Jeweled Spade Handle|10+ herbalism 40035|5 StarlightRose|{305163} [Jeweled Spade Handle]|herbalism discovery link:680|Gathered from Starlight Rose",
		[40037] = "The Spade's Blade|10+ herbalism 40036|43 33.36|Kuhuine Tenderstride|herbalism",
		[40038] = "Insane Ramblings|10+ herbalism 40037|5 StarlightRose|{134943} [Scribbled Ramblings]|herbalism discovery link:680|Gathered from Starlight Rose",
		[40039] = "Tharillon's Fall|10+ herbalism 40038|43 33.36|Kuhuine Tenderstride|herbalism",

		-- Herbalism - Felwort
		[40040] = "Felwort Sample|10+ herbalism 45727,43341|6 Felwort|{1387614} [Felwort Sample]|herbalism discovery link:619|Gathered from Felwort", -- Available after unlocking World Quests
		[40041] = "Felwort Analysis|10+ herbalism 40040 40014 40019 40024 40029 40035|43 33.36|Kuhuine Tenderstride|herbalism", -- Available after getting rank 1 of all other Broken Isles herbs
		[40041] = "The Emerald Nightmare: Felwort Mastery|10+ herbalism 40041 40016 40021 40026 40031 40037|43 33.36|Kuhuine Tenderstride|herbalism raid", -- Available after getting rank 2 of all other Broken Isles herbs

		-- Mining - Leystone
		[38777] = "Leystone Deposit Sample|10+ mining|1 LeystoneDeposit|{1394960} [Leystone Deposit Sample]|mining discovery link:619|Mined from Leystone Deposits",
		[38784] = "Leystone Seam Sample|10+ mining|2 LeystoneSeam|{1394960} [Leystone Seam Sample]|mining discovery link:619|Mined from Leystone Seams",
		[38785] = "Living Leystone Sample|10+ mining|3 LivingLeystone|{1394960} [Living Leystone Sample]|mining discovery link:619|Mined from Leystone creatures",
		[38888] = "The Highmountain Tauren|10+ mining 38777 38784 38785|46.09 26.66|Mama Diggs|mining", -- Available after completing all rank 1 Leystone quests
		[38786] = "Where Respect is Due|10+ mining 38888|47.7 26.66|Ronos Ironhorn|mining elsewhere link:650",
		[38787] = "The Legend of Rethu Ironhorn|10+ mining 38786|47.7 26.66|Ronos Ironhorn|mining elsewhere link:650",
		[38789] = "Rethu's Journal|10+ mining 38787|1 LeystoneDeposit|{237388} [Torn Journal Page]|mining discovery link:619|Mined from Leystone Deposits",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 LeystoneDeposit|[Auto Accept]|mining discovery link:619|Has a chance to appear after mining Leystone Deposits",
		[38790] = "Rethu's Pick|10+ mining 38787|2 LeystoneSeam|{1060565} [Battered Mining Pick]|mining discovery link:619|Mined from Leystone Seams",
		[38793] = "Rethu's Experience|10+ mining 38790|2 LeystoneSeam|[Auto Accept]|mining discovery link:619|Has a chance to appear after mining Leystone Seams",
		[38791] = "Rethu's Horn|10+ mining 38787|3 LivingLeystone|{237403} [Chunk of Horn]|mining discovery link:619|Mined from Leystone creatures",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|3 LivingLeystone|[Auto Accept]|mining discovery link:619|Has a chance to appear after mining Leystone creatures",
		
		-- Mining - Felslate
		[38795] = "Felslate Deposit Sample|10+ mining|4 FelslateDeposit|{1394961} [Felslate Deposit Sample]|mining discovery link:619|Mined from Felslate Deposits",
		[38796] = "Felslate Seam Sample|10+ mining|5 FelslateSeam|{1394961} [Felslate Seam Sample]|mining discovery link:619|Mined from Felslate Seams",
		[38797] = "Living Felslate Sample|10+ mining|6 LivingFelslate|{1394961} [Living Felslate Sample]|mining discovery link:619|Mined from Felslate creatures",
		[38901] = "The Felsmiths|10+ mining 38795 38796 38797|46.09 26.66|Mama Diggs|mining", -- Available after completing all rank 1 Felslate quests
		[38798] = "A Shred of Your Humanity|10+ mining 38901|47.7 26.66|Felsmith Nal'ryssa|mining elsewhere link:680",
		[38799] = "Darkheart Thicket: Nal'ryssa's Sisters|10+ mining 38798|47.7 26.66|Felsmith Nal'ryssa|mining dungeon elsewhere link:680",
		[38800] = "Rin'thissa's Eye|10+ mining 38799|4 FelslateDeposit|{237298} [Ore-Bound Eye]|mining discovery link:619|Mined from Felslate Deposits",
		[38803] = "Rin'thissa|10+ mining 38800|4 FelslateDeposit|Rin'thissa|mining discovery link:619|Rin'thissa has a chance to appear after mining Felslate Deposits",
		[38801] = "Lyrelle's Right Arm|10+ mining 38799|5 FelslateSeam|{571556} [Severed Arm]|mining discovery link:619|Mined from Felslate Seams",
		[38804] = "Lyrelle|10+ mining 38801|5 FelslateSeam|Lyrelle|mining discovery link:619|Lyrelle has a chance to appear after mining Felslate Seams",
		[38802] = "Ondri's Still-Beating Heart|10+ mining 38799|6 LivingFelslate|{134339} [Ore-Choked Heart]|mining discovery link:619|Mined from Felslate creatures",
		[38805] = "Ondri|10+ mining 38802|6 LivingFelslate|Ondri|mining discovery link:619|Ondri has a chance to appear after mining Felslate creatures",

		-- Mining - Infernal Brimstone
		[38806] = "Infernal Brimstone Sample|45+ mining 45727,43341|7 InfernalBrimstone|{1394959} [Infernal Brimstone Sample]|mining discovery link:619|Mined from Brimstone Destroyer Core",
		[38807] = "Infernal Brimstone Analysis|10+ mining 38806 38789 38790 38791 38800 38801 38802|46.09 26.66|Mama Diggs|mining", -- Available after completing all rank 2 Leystone and Felslate quests
		[39790] = "Infernal Brimstone Theory|10+ mining 38807|46.09 26.66|Mama Diggs|mining",
		[39763] = "For Whom the Fel Tolls|10+ mining 39790|47.7 26.66|Matthew Rabis|mining elsewhere link:628",
		[39817] = "The Brimstone's Secret|10+ mining 39763|47.7 26.66|Matthew Rabis|mining elsewhere link:628",
		[39830] = "Hellfire Citadel: Hellfire and Brimstone|10+ mining 39817|46.09 26.66|Mama Diggs|mining raid",

		-- Mining - Empyrium
		--[48034] = "Empyrium Deposit Chunk|45+ mining|8 EmpyriumDeposit|{962048} [Empyrium Deposit Chunk]|mining discovery link:905|Mined from Empyrium Deposits",
		--[48035] = "Angling For a Better Strike|45+ mining 48034|8 EmpyriumDeposit|{237286} [Empyrium Dust]|mining discovery link:905|Mined from Empyrium Deposits",
		--[48036] = "Precision Perfected|45+ mining 48035|8 EmpyriumDeposit|{1097742} [Unusable Empyrium Core]|mining discovery link:905|Mined from Empyrium Deposits",
		--[48037] = "Empyrium Seam Chunk|45+ mining|9 EmpyriumSeam|{962048} [Empyrium Seam Chunk]|mining discovery link:905|Mined from Empyrium Seams",
		--[48038] = "Don't Just Pick At It|45+ mining 48037|9 EmpyriumSeam|{667492} [Embedded Empyrium Ore]|mining discovery link:905|Mined from Empyrium Seams",
		--[48039] = "Balancing the Break|45+ mining 48038|9 EmpyriumSeam|{961620} [Empyrium Bits]|mining discovery link:905|Mined from Empyrium Seams",

		-- Skinning - Stonehide Leather
		[40131] = "Stonehide Leather Sample|10+ skinning|1 StonehideLeather|{1377086} [Stonehide Leather Sample]|skinning discovery link:619|Skinned from Stonehide Leather",
		[40132] = "In One Piece|10+ skinning 40131|36.05 27.98|Kondal Huntsworn|skinning",
		[40133] = "Scrap of Pants|10+ skinning 40132|1 StonehideLeather|{237278} [Scrap of Pants]|skinning discovery link:619|Skinned from Stonehide Leather",

		-- Skinning - Stormscale
		[40141] = "Stormscale Sample|10+ skinning|2 Stormscale|{1377087} [Stormscale Sample]|skinning discovery link:619|Skinned from Stormscale",
		[40142] = "The Core of the Stormscale|10+ skinning 40141|36.05 27.98|Kondal Huntsworn|skinning",
		[40143] = "Unfinished Treatise on the Properties of Stormscale|10+ skinning 40142|2 Stormscale|{134937} [Unfinished Treatise on the Properties of Stormscale]|skinning discovery link:619|Skinned from Stormscale",
	},

	-- The Underbelly
	[628] = {
		-- Engineering
		[40854] = "Endless Possibilities|10+ engineering 40545|65.96 52.87|Filgo Scrapbottom|engineering",
	},

	-- Aegwynn's Galleru
	[629] = {
		-- The Light's Heart
		[44004] = "Bringer of the Light|10+ 44009,44257|26.8 34.97|Archmage Khadgar",
	},

	-- Dungeon: The Violet Hold
	[723] = {
		-- Demon Hunter - Twinblades of the Deceiver
		[41119] = "The Hunt|10+ demonhunter 41121,39051 40375|50.31 71.1|Altruis the Sufferer|artifact", -- Altruis
		[39247] = "The Hunt|10+ demonhunter 41121,39051 40374|50.31 71.1|Kayn Sunfury|artifact", -- Kayn
	},

	-- Broken Isles
	[619] = {
		-- Herbalism - Aethril
		[40013] = "Aethril Sample|10+ herbalism|1 Aethril|{1395063} [Aethril Sample]|herbalism discovery link:630|Gathered from Aethril",
		[40015] = "Ragged Strips of Silk|10+ herbalism 40014|1 Aethril|{463527} [Ragged Strips of Silk]|herbalism discovery link:630|Gathered from Aethril",
		[40017] = "A Slip of the Hand|10+ herbalism 40016|1 Aethril|[Auto Accept]|herbalism discovery link:630|Has a chance to be obtained after gathering Aethril",

		-- Herbalism - Dreamleaf
		[40018] = "Dreamleaf Sample|10+ herbalism|2 Dreamleaf|{1387613} [Dreamleaf Sample]|herbalism discovery link:641|Gathered from Dreamleaf",
		[40020] = "Twisted to Death|10+ herbalism 40019|2 Dreamleaf|{1387617} [Blight-Twisted Herb]|herbalism discovery link:641|Gathered from Dreamleaf",
		[40022] = "Choked by Nightmare|10+ herbalism 40021|2 Dreamleaf|{1387617} [Blight-Choked Herb]|herbalism discovery link:641|Gathered from Dreamleaf",

		-- Herbalism - Foxflower
		[40024] = "Foxflower Sample|10+ herbalism|3 Foxflower|{1387616} [Foxflower Sample]|herbalism discovery link:650|Gathered from Foxflower",
		[40025] = "Teeny Bite Marks|10+ herbalism 40024|3 Foxflower|{960686} [Nibbled Foxflower Stem]|herbalism discovery link:650|Gathered from Foxflower",
		[40028] = "The Pied Picker|10+ herbalism 40026|3 Foxflower|{656439} [Foxflower Scent Gland]|herbalism discovery link:650|Gathered from Foxflower",

		-- Herbalism - Fjarnskaggl
		[40029] = "Fjarnskaggl Sample|10+ herbalism|4 Fjarnskaggl|{1387615} [Fjarnskaggl Sample]|herbalism discovery link:634|Gathered from Fjarnskaggl",
		[40030] = "Ram's-Horn Trowel|10+ herbalism 40029|4 Fjarnskaggl|{134436} [Ram's-Horn Trowel]|herbalism discovery link:634|Gathered from Fjarnskaggl",
		[40032] = "The Missing Page|10+ herbalism 40031|4 Fjarnskaggl|{134938} [Runed Journal Page]|herbalism discovery link:634|Gathered from Fjarnskaggl",

		-- Herbalism - Starlight Rose
		[40034] = "Starlight Rosedust|10+ herbalism|5 StarlightRose|{1387618} [Starlight Rosedust]|herbalism discovery link:680|Gathered from Starlight Rose",
		[40036] = "Jeweled Spade Handle|10+ herbalism 40035|5 StarlightRose|{305163} [Jeweled Spade Handle]|herbalism discovery link:680|Gathered from Starlight Rose",
		[40038] = "Insane Ramblings|10+ herbalism 40037|5 StarlightRose|{134943} [Scribbled Ramblings]|herbalism discovery link:680|Gathered from Starlight Rose",

		-- Herbalism - Felwort
		[40040] = "Felwort Sample|10+ herbalism 45727,43341|6 Felwort|{1387614} [Felwort Sample]|herbalism discovery link:619|Gathered from Felwort", -- Available after unlocking World Quests

		-- Mining - Leystone
		[38777] = "Leystone Deposit Sample|10+ mining|1 LeystoneDeposit|{1394960} [Leystone Deposit Sample]|mining discovery|Mined from Leystone Deposits",
		[38784] = "Leystone Seam Sample|10+ mining|2 LeystoneSeam|{1394960} [Leystone Seam Sample]|mining discovery|Mined from Leystone Seams",
		[38785] = "Living Leystone Sample|10+ mining|3 LivingLeystone|{1394960} [Living Leystone Sample]|mining discovery|Mined from Leystone creatures",
		[38789] = "Rethu's Journal|10+ mining 38787|1 LeystoneDeposit|{237388} [Torn Journal Page]|mining discovery|Mined from Leystone Deposits",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 LeystoneDeposit|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Deposits",
		[38790] = "Rethu's Pick|10+ mining 38787|2 LeystoneSeam|{1060565} [Battered Mining Pick]|mining discovery|Mined from Leystone Seams",
		[38793] = "Rethu's Experience|10+ mining 38790|2 LeystoneSeam|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Seams",
		[38791] = "Rethu's Horn|10+ mining 38787|3 LivingLeystone|{237403} [Chunk of Horn]|mining discovery|Mined from Leystone creatures",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|3 LivingLeystone|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone creatures",

		-- Mining - Felslate
		[38795] = "Felslate Deposit Sample|10+ mining|4 FelslateDeposit|{1394961} [Felslate Deposit Sample]|mining discovery|Mined from Felslate Deposits",
		[38796] = "Felslate Seam Sample|10+ mining|5 FelslateSeam|{1394961} [Felslate Seam Sample]|mining discovery|Mined from Felslate Seams",
		[38797] = "Living Felslate Sample|10+ mining|6 LivingFelslate|{1394961} [Living Felslate Sample]|mining discovery|Mined from Felslate creatures",
		[38800] = "Rin'thissa's Eye|10+ mining 38799|4 FelslateDeposit|{237298} [Ore-Bound Eye]|mining discovery|Mined from Felslate Deposits",
		[38803] = "Rin'thissa|10+ mining 38800|4 FelslateDeposit|Rin'thissa|mining discovery|Rin'thissa has a chance to appear after mining Felslate Deposits",
		[38801] = "Lyrelle's Right Arm|10+ mining 38799|5 FelslateSeam|{571556} [Severed Arm]|mining discovery|Mined from Felslate Seams",
		[38804] = "Lyrelle|10+ mining 38801|5 FelslateSeam|Lyrelle|mining discovery|Lyrelle has a chance to appear after mining Felslate Seams",
		[38802] = "Ondri's Still-Beating Heart|10+ mining 38799|6 LivingFelslate|{134339} [Ore-Choked Heart]|mining discovery|Mined from Felslate creatures",
		[38805] = "Ondri|10+ mining 38802|6 LivingFelslate|Ondri|mining discovery|Ondri has a chance to appear after mining Felslate creatures",

		-- Mining - Infernal Brimstone
		[38806] = "Infernal Brimstone Sample|45+ mining 45727,43341|7 InfernalBrimstone|{1394959} [Infernal Brimstone Sample]|mining discovery|Mined from Brimstone Destroyer Core",
	},


	--[[ Legion Order Halls ]]--

	-- Death Knight - Acherus: The Ebon Hold - The Heart of Acherus
	[647] = {
		-- The Ebon Blade
		[39832] = "Plans and Preparations|10+ deathknight 39017|50.94 50.68|Highlord Darion Mograine|artifact down link:648", -- 39017 artifact quest done
		[39799] = "Our Next Move|10+ deathknight 39832|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[43962] = "Blades of Destiny|10+ deathknight 39799|57.78 60.3|Duke Lankral|artifact",

		-- The Four Horsemen
		[42449] = "Return of the Four Horsemen|10+ deathknight 39799|50.94 50.68|Highlord Darion Mograine|artifact down link:648",
		[42484] = "The Firstborn Rises|10+ deathknight 42449|33.37 35.71|Thassarian|artifact elsewhere link:1",
		[43264] = "Rise, Champions|10+ deathknight 42484|50.94 50.68|Highlord Darion Mograine|artifact down link:648",
		[39816] = "Champion: Thassarian|10+ deathknight +43264|56.01 30.72|Thassarian|artifact down link:648",
		[39818] = "Champion: Nazgrim|10+ deathknight +43264|39.48 68.26|Nazgrim|artifact down link:648",
		[43265] = "Spread the Word|10+ deathknight 43264|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[43266] = "Recruiting the Troops|10+ deathknight 43265|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[43267] = "Troops in the Field|10+ deathknight 43266|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[43268] = "Tech It Up A Notch|10+ deathknight 43267|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[43539] = "Salanar the Horseman|10+ deathknight 43268|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[42533] = "The Ruined Kingdom|10+ deathknight 43539|50.94 50.68|Highlord Darion Mograine|artifact down link:648",
		[42534] = "Our Oldest Enemies|10+ deathknight 42533|33.37 35.71|Prince Galen Trollbane|artifact elsewhere link:14",
		[42535] = "Death... and Decay|10+ deathknight 42533|33.37 35.71|Prince Galen Trollbane|artifact elsewhere link:14",
		[42536] = "Regicide|10+ deathknight 42534 42535|33.37 35.71|Thassarian|artifact elsewhere link:14",
		[42537] = "The King Rises|10+ deathknight 42536|33.37 35.71|Thassarian|artifact elsewhere link:14",
		[44243] = "Champion: Thoras Trollbane|10+ deathknight 42537|59.68 34.03|King Thoras Trollbane|artifact down link:648",
		[42708] = "A Personal Request|10+ deathknight 42537|56.03 30.61|Thassarian|artifact down link:648",
		[44244] = "Champion: Koltira Deathweaver|10+ deathknight 42708|66.34 64.6|Koltira Deathweaver|artifact down link:648",
		[44082] = "Knights of the Ebon Blade|10+ deathknight 42708|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[43899] = "Steeds of the Damned|10+ deathknight 42708|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[43571] = "Neltharion's Lair: Braid of the Underking|10+ deathknight 42708|36.28 56.02|Salanar the Horseman|artifact dungeon",
		[43572] = "Darkheart Thicket: The Nightmare Lash|10+ deathknight 43571|36.28 56.02|Salanar the Horseman|artifact dungeon",
		[42818] = "The Scarlet Assault|45+ deathknight 43899 43571 43572|50.94 50.68|Highlord Darion Mograine|artifact down link:648",
		[42882] = "The Scarlet Massacre|45+ deathknight 42818|33.37 35.71|Thassarian|artifact elsewhere link:804",
		[42821] = "Raising an Army|45+ deathknight 42818|33.37 35.71|Thassarian|artifact elsewhere link:804",
		[42823] = "The Scarlet Commander|45+ deathknight 42882 42821|33.37 35.71|Thassarian|artifact elsewhere link:805",
		[42824] = "The Zealot Rises|45+ deathknight 42823|33.37 35.71|Thassarian|artifact elsewhere link:805",
		[44245] = "Champion: High Inquisitor Whitemane|45+ deathknight 42824|44.75 72.87|High Inquisitor Whitemane|artifact down link:648",
		[44286] = "Vault of the Wardens: A Masterpiece of Flesh|45+ deathknight 42824|63.16 69.49|Lord Thorval|artifact dungeon down link:648",
		[44246] = "Champion: Rottgut|45+ deathknight 44286|63.16 69.49|Rottgut|artifact down link:648", -- needs coords
		[43573] = "Advancing the War Effort|45+ deathknight 42824|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		[43928] = "Aggregates of Anguish|45+ deathknight 42824|49.65 51.27|Siouxsie the Banshee|artifact down link:648",
		-- Ingrid-Skullcrusher 8

		-- Deathlord's Battleplate
		[44217] = "Armor Fit For A Deathlord|45+ deathknight|43.94 37.63|Quartermaster Ozorg",
	},

	-- Death Knight - Acherus: The Ebon Hold - Hall of Command
	[648] = {
		-- The Ebon Blade
		[39832] = "Plans and Preparations|10+ deathknight 39017|50.94 50.68|Highlord Darion Mograine|artifact", -- 39017 artifact quest done
		[39799] = "Our Next Move|10+ deathknight 39832|49.65 51.27|Siouxsie the Banshee|artifact",
		[43962] = "Blades of Destiny|10+ deathknight 39799|57.78 60.3|Duke Lankral|artifact up link:647",

		-- The Four Horsemen
		[42449] = "Return of the Four Horsemen|10+ deathknight 39799|50.94 50.68|Highlord Darion Mograine|artifact",
		[42484] = "The Firstborn Rises|10+ deathknight 42449|24.78 33.69|Thassarian|artifact elsewhere link:1",
		[43264] = "Rise, Champions|10+ deathknight 42484|50.94 50.68|Highlord Darion Mograine|artifact",
		[39816] = "Champion: Thassarian|10+ deathknight +43264|56.01 30.72|Thassarian|artifact",
		[39818] = "Champion: Nazgrim|10+ deathknight +43264|39.48 68.26|Nazgrim|artifact",
		[43265] = "Spread the Word|10+ deathknight 43264|49.65 51.27|Siouxsie the Banshee|artifact",
		[43266] = "Recruiting the Troops|10+ deathknight 43265|49.65 51.27|Siouxsie the Banshee|artifact",
		[43267] = "Troops in the Field|10+ deathknight 43266|49.65 51.27|Siouxsie the Banshee|artifact",
		[43268] = "Tech It Up A Notch|10+ deathknight 43267|49.65 51.27|Siouxsie the Banshee|artifact",
		[43539] = "Salanar the Horseman|10+ deathknight 43267|49.65 51.27|Siouxsie the Banshee|artifact",
		[42533] = "The Ruined Kingdom|10+ deathknight 43539|50.94 50.68|Highlord Darion Mograine|artifact",
		[42534] = "Our Oldest Enemies|10+ deathknight 42533|24.78 33.69|Prince Galen Trollbane|artifact elsewhere link:14",
		[42535] = "Death... and Decay|10+ deathknight 42533|24.78 33.69|Prince Galen Trollbane|artifact elsewhere link:14",
		[42536] = "Regicide|10+ deathknight 42534 42535|24.78 33.69|Thassarian|artifact elsewhere link:14",
		[42537] = "The King Rises|10+ deathknight 42536|24.78 33.69|Thassarian|artifact elsewhere link:14",
		[44243] = "Champion: Thoras Trollbane|10+ deathknight 42537|59.68 34.03|King Thoras Trollbane|artifact",
		[42708] = "A Personal Request|10+ deathknight 42537|56.03 30.61|Thassarian|artifact",
		[44244] = "Champion: Koltira Deathweaver|10+ deathknight 42708|66.34 64.6|Koltira Deathweaver|artifact",
		[44082] = "Knights of the Ebon Blade|10+ deathknight 42708|49.65 51.27|Siouxsie the Banshee|artifact",
		[43899] = "Steeds of the Damned|10+ deathknight 42708|49.65 51.27|Siouxsie the Banshee|artifact",
		[43571] = "Neltharion's Lair: Braid of the Underking|10+ deathknight 42708|36.28 56.02|Salanar the Horseman|artifact dungeon up link:647",
		[43572] = "Darkheart Thicket: The Nightmare Lash|10+ deathknight 43571|36.28 56.02|Salanar the Horseman|artifact dungeon up link:647",
		[42818] = "The Scarlet Assault|45+ deathknight 43899 43571 43572|50.94 50.68|Highlord Darion Mograine|artifact",
		[42882] = "The Scarlet Massacre|45+ deathknight 42818|24.78 33.69|Thassarian|artifact elsewhere link:804",
		[42821] = "Raising an Army|45+ deathknight 42818|24.78 33.69|Thassarian|artifact elsewhere link:804",
		[42823] = "The Scarlet Commander|45+ deathknight 42882 42821|24.78 33.69|Thassarian|artifact elsewhere link:805",
		[42824] = "The Zealot Rises|45+ deathknight 42823|24.78 33.69|Thassarian|artifact elsewhere link:805",
		[44245] = "Champion: High Inquisitor Whitemane|45+ deathknight 42824|44.75 72.87|High Inquisitor Whitemane|artifact",
		[44286] = "Vault of the Wardens: A Masterpiece of Flesh|45+ deathknight 42824|63.16 69.49|Lord Thorval|artifact dungeon",
		[44246] = "Champion: Rottgut|45+ deathknight 44286|63.16 69.49|Rottgut|artifact", -- needs coords
		[43573] = "Advancing the War Effort|45+ deathknight 42824|49.65 51.27|Siouxsie the Banshee|artifact",
		[43928] = "Aggregates of Anguish|45+ deathknight 42824|49.65 51.27|Siouxsie the Banshee|artifact",

		-- Deathlord's Battleplate
		[44217] = "Armor Fit For A Deathlord|45+ deathknight|43.94 37.63|Quartermaster Ozorg|up link:647",
	},

	-- Death Knight - Scarlet Monastery Scenario
	[804] = {
		-- The Four Horsemen
		[42882] = "The Scarlet Massacre|45+ deathknight 42818|72 45.87|Thassarian|artifact",
		[42821] = "Raising an Army|45+ deathknight 42818|72 45.87|Thassarian|artifact",
	},
	[805] = {
		-- The Four Horsemen
		[42823] = "The Scarlet Commander|45+ deathknight 42882 42821|49.08 77.47|Thassarian|artifact",
		[42824] = "The Zealot Rises|45+ deathknight 42823|49.08 77.47|Thassarian|artifact",
	},

	-- Demon Hunter - The Fel Hammer - Upper Command Center
	[720] = {
		-- The Illidari
		[41060] = "Unbridled Power|10+ demonhunter 41033,41221 40375|57.69 67.39|Altruis the Sufferer|artifact", -- Altruis
		[41037] = "Unbridled Power|10+ demonhunter 41033,41221 40374|57.69 67.39|Kayn Sunfury|artifact", -- Kayn
		[41070] = "Spoils of Victory|10+ demonhunter 41060,41037 40375|58.61 57.87|Altruis the Sufferer|artifact", -- Altruis
		[41062] = "Spoils of Victory|10+ demonhunter 41060,41037 40374|58.61 57.87|Kayn Sunfury|artifact", -- Altruis
		[41066] = "The Hunter's Gaze|10+ demonhunter 41070,41062|59.4 51.33|Allari the Souleater|artifact down link:721",
		[41096] = "Time is of the Essence|10+ demonhunter 41066 40375|59.4 51.33|Allari the Souleater|artifact down link:721", -- Altruis
		[41067] = "Time is of the Essence|10+ demonhunter 41066 40374|59.4 51.33|Allari the Souleater|artifact down link:721", -- Kayn
		[41099] = "Direct Our Wrath|10+ demonhunter 41096,41067 40375|58.62 57.78|Altruis the Sufferer|artifact", -- Altruis
		[41069] = "Direct Our Wrath|10+ demonhunter 41096,41067 40374|58.62 57.78|Kayn Sunfury|artifact", -- Kayn
		[44379] = "In Pursuit of Power|10+ demonhunter 41099,41069 40375|58.62 57.78|Altruis the Sufferer|artifact", -- Altruis
		[44383] = "In Pursuit of Power|10+ demonhunter 41099,41069 40374|58.62 57.78|Kayn Sunfury|artifact", -- Kayn
		
		-- Destiny of the Illidari
		[42670] = "Rise, Champions|10+ demonhunter 41099,41069 40375|56.18 54.27|Battlelord Gaardoun|artifact", -- Altruis
		[42671] = "Rise, Champions|10+ demonhunter 41099,41069 40374|56.18 54.27|Battlelord Gaardoun|artifact", -- Kayn
		[42677] = "Things Gaardoun Needs|10+ demonhunter 42670,42671|59.33 57.67|Kor'vas Bloodthorn|artifact",
		[42679] = "Broken Warriors|10+ demonhunter 42677|59.33 57.67|Kor'vas Bloodthorn|artifact",
		[42681] = "Loramus, Is That You?|10+ demonhunter 42679|59.33 57.67|Kor'vas Bloodthorn|artifact",
		[42683] = "Demonic Improvements|10+ demonhunter 42681|59.33 57.67|Kor'vas Bloodthorn|artifact",
		[42682] = "Additional Accoutrements|10+ demonhunter 42683|60.07 48.87|Matron Mother Malevolence|artifact",
		[37447] = "The Blood of Demons|10+ demonhunter 42682|59.33 57.67|Kor'vas Bloodthorn|artifact",
		[42510] = {"Immortal Soul|10+ demonhunter 37447 40375|58.38 51.53|Altruis the Sufferer|artifact down link:721", "Immortal Soul|10+ demonhunter 37447 40374|58.38 51.53|Kayn Sunfury|artifact down link:721",},
		[42522] = {"Leader of the Illidari|10+ demonhunter 42510 40375|58.38 51.53|Altruis the Sufferer|artifact down link:721", "Leader of the Illidari|10+ demonhunter 42510 40374|58.38 51.53|Kayn Sunfury|artifact down link:721",},
		[42593] = "The Arcane Way|10+ demonhunter 42522|60.07 48.87|Matron Mother Malevolence|artifact",
		[42594] = "Move Like No Other|10+ demonhunter 42593|59.25 91.48|Archmage Lan'dalock|artifact elsewhere link:627",
		[42801] = "Back in Black|10+ demonhunter 42594|57.57 52.24|Belath Dawnblade|artifact",
		[42634] = "Confrontation at the Black Temple|10+ demonhunter 42801 40375|60.07 48.87|Matron Mother Malevolence|artifact", -- Altruis
		[42921] = "Confrontation at the Black Temple|10+ demonhunter 42801 40374|60.07 48.87|Matron Mother Malevolence|artifact", -- Kayn
		[39741] = "Into Our Ranks|10+ demonhunter 42634,42921 40375|58.6 57.89|Altruis the Sufferer|artifact", -- Altruis
		[42665] = "Into Our Ranks|10+ demonhunter 42634,42921 40374|58.6 57.89|Kayn Sunfury|artifact", -- Kayn
		[42131] = "Unexpected Visitors|10+ demonhunter 39741,42665|60.07 48.87|Matron Mother Malevolence|artifact",
		[42802] = "Securing Mardum|10+ demonhunter 39741,42665|60.07 48.87|Matron Mother Malevolence|artifact",
		[42808] = "Green Adepts|10+ demonhunter 42802|57.57 52.24|Belath Dawnblade|artifact",
		[42731] = "Working With the Wardens|10+ demonhunter 42131|57.57 52.24|Belath Dawnblade|artifact",
		[42787] = "Deal With It Personally|10+ demonhunter 42802 42731|57.57 52.24|Belath Dawnblade|artifact",
		-- Mayhem-Skullcrusher 8

		-- Battlegear of the Shattered Abyss
		[44213] = "You Will Be Prepared!|45+ demonhunter 41066|57.8 43.44|Falara Nightsong",
	},

	-- Demon Hunter - The Fel Hammer - Lower Command Center
	[721] = {
		-- The Illidari
		[41060] = "Unbridled Power|10+ demonhunter 41033,41221 40375|57.69 67.39|Altruis the Sufferer|artifact up link:720", -- Altruis
		[41037] = "Unbridled Power|10+ demonhunter 41033,41221 40374|57.69 67.39|Kayn Sunfury|artifact up link:720", -- Kayn
		[41070] = "Spoils of Victory|10+ demonhunter 41060,41037 40375|58.61 57.87|Altruis the Sufferer|artifact up link:720", -- Altruis
		[41062] = "Spoils of Victory|10+ demonhunter 41060,41037 40374|58.61 57.87|Kayn Sunfury|artifact up link:720", -- Altruis
		[41066] = "The Hunter's Gaze|10+ demonhunter 41070,41062|59.4 51.33|Allari the Souleater|artifact",
		[41096] = "Time is of the Essence|10+ demonhunter 41066 40375|59.4 51.33|Allari the Souleater|artifact", -- Altruis
		[41067] = "Time is of the Essence|10+ demonhunter 41066 40374|59.4 51.33|Allari the Souleater|artifact", -- Kayn
		[41099] = "Direct Our Wrath|10+ demonhunter 41096,41067 40375|58.62 57.78|Altruis the Sufferer|artifact up link:720", -- Altruis
		[41069] = "Direct Our Wrath|10+ demonhunter 41096,41067 40374|58.62 57.78|Kayn Sunfury|artifact up link:720", -- Kayn
		[44379] = "In Pursuit of Power|10+ demonhunter 41099,41069 40375|58.62 57.78|Altruis the Sufferer|artifact up link:720", -- Altruis
		[44383] = "In Pursuit of Power|10+ demonhunter 41099,41069 40374|58.62 57.78|Kayn Sunfury|artifact up link:720", -- Kayn
		
		-- Destiny of the Illidari
		[42670] = "Rise, Champions|10+ demonhunter 41099,41069 40375|56.18 54.27|Battlelord Gaardoun|artifact up link:720", -- Altruis
		[42671] = "Rise, Champions|10+ demonhunter 41099,41069 40374|56.18 54.27|Battlelord Gaardoun|artifact up link:720", -- Kayn
		[42677] = "Things Gaardoun Needs|10+ demonhunter 42670,42671|59.33 57.67|Kor'vas Bloodthorn|artifact up link:720",
		[42679] = "Broken Warriors|10+ demonhunter 42677|59.33 57.67|Kor'vas Bloodthorn|artifact up link:720",
		[42681] = "Loramus, Is That You?|10+ demonhunter 42679|59.33 57.67|Kor'vas Bloodthorn|artifact up link:720",
		[42683] = "Demonic Improvements|10+ demonhunter 42681|59.33 57.67|Kor'vas Bloodthorn|artifact up link:720",
		[42682] = "Additional Accoutrements|10+ demonhunter 42683|60.07 48.87|Matron Mother Malevolence|artifact up link:720",
		[37447] = "The Blood of Demons|10+ demonhunter 42682|59.33 57.67|Kor'vas Bloodthorn|artifact up link:720",
		[42510] = {"Immortal Soul|10+ demonhunter 37447 40375|58.38 51.53|Altruis the Sufferer|artifact", "Immortal Soul|10+ demonhunter 37447 40374|58.38 51.53|Kayn Sunfury|artifact",},
		[42522] = {"Leader of the Illidari|10+ demonhunter 42510 40375|58.38 51.53|Altruis the Sufferer|artifact", "Leader of the Illidari|10+ demonhunter 42510 40374|58.38 51.53|Kayn Sunfury|artifact",},
		[42593] = "The Arcane Way|10+ demonhunter 42522|60.07 48.87|Matron Mother Malevolence|artifact up link:720",
		[42594] = "Move Like No Other|10+ demonhunter 42593|59.25 91.48|Archmage Lan'dalock|artifact elsewhere link:627",
		[42801] = "Back in Black|10+ demonhunter 42594|57.57 52.24|Belath Dawnblade|artifact up link:720",
		[42634] = "Confrontation at the Black Temple|10+ demonhunter 42801 40375|60.07 48.87|Matron Mother Malevolence|artifact up link:720", -- Altruis
		[42921] = "Confrontation at the Black Temple|10+ demonhunter 42801 40374|60.07 48.87|Matron Mother Malevolence|artifact up link:720", -- Kayn
		[39741] = "Into Our Ranks|10+ demonhunter 42634,42921 40375|58.6 57.89|Altruis the Sufferer|artifact up link:720", -- Altruis
		[42665] = "Into Our Ranks|10+ demonhunter 42634,42921 40374|58.6 57.89|Kayn Sunfury|artifact up link:720", -- Kayn
		[42131] = "Unexpected Visitors|10+ demonhunter 39741,42665|60.07 48.87|Matron Mother Malevolence|artifact up link:720",
		[42802] = "Securing Mardum|10+ demonhunter 39741,42665|60.07 48.87|Matron Mother Malevolence|artifact up link:720",
		[42808] = "Green Adepts|10+ demonhunter 42802|57.57 52.24|Belath Dawnblade|artifact up link:720",
		[42731] = "Working With the Wardens|10+ demonhunter 42131|57.57 52.24|Belath Dawnblade|artifact up link:720",
		[42787] = "Deal With It Personally|10+ demonhunter 42802 42731|57.57 52.24|Belath Dawnblade|artifact up link:720",

		-- Battlegear of the Shattered Abyss
		[44213] = "You Will Be Prepared!|45+ demonhunter 41066|57.8 43.44|Falara Nightsong|up link:720",
	},

	-- Druid - The Dreamgrove
	[747] = {
		-- Dreamgrove Raiment
		[44232] = "The Grove Provides|45+ druid|40.03 17.76|Amurra Thistledew",
	},

	-- Hunter - Trueshot Lodge
	[739] = {
		-- The Unseen Path
		[40954] = "The Unseen Path|10+ hunter 40953|36.66 29.14|Emmarel Shadewarden|artifact",
		[40955] = "Oath of Service|10+ hunter 40954|43.51 24.67|Emmarel Shadewarden|artifact",
		[40958] = "Tactical Matters|10+ hunter 40955|43.51 24.67|Emmarel Shadewarden|artifact",
		[40959] = "The Campaign Begins|10+ hunter 40958|42.78 46.94|Tactician Tinderfell|artifact",
		[44043] = "Continuing the Legend|10+ hunter 40959|43.42 26.36|Emmarel Shadewarden|artifact",
		[44366] = "One Last Adventure|10+ hunter 44043|43.42 26.36|Emmarel Shadewarden|artifact|Available only after you have obtained your second Artifact Weapon",

		-- Watchers in the Wild
		[42519] = "Rise, Champions|10+ hunter 40959|47.28 53.98|Altar Keeper Biehn|artifact",
		[42523] = "Making Contact|10+ hunter 42519|42.78 46.94|Tactician Tinderfell|artifact",
		[42524] = "Recruiting The Troops|10+ hunter 42523|42.78 46.94|Tactician Tinderfell|artifact",
		[42525] = "Troops in the Field|10+ hunter 42524|42.78 46.94|Tactician Tinderfell|artifact",
		[42526] = "Tech It Up A Notch|10+ hunter 42525|42.78 46.94|Tactician Tinderfell|artifact",
		[42384] = "Scouting Reports|10+ hunter 42526|42.78 46.94|Tactician Tinderfell|artifact",
		-- ...
		[42389] = "Calling Hilaire Home|10+ hunter +42388|43.39 26.32|Emmarel Shadewarden|artifact",
		[42390] = "Recruiting Rexxar|10+ hunter +42388|43.39 26.32|Emmarel Shadewarden|artifact",
		[42395] = "Signaling Trouble|10+ hunter 42393|43.39 26.32|Emmarel Shadewarden|artifact",
		[42134] = "Recruiting More Troops|10+ hunter 42395|42.78 46.94|Tactician Tinderfell|artifact",
		[42394] = {"Unseen Protection|10+ hunter 42395|43.39 26.32|Emmarel Shadewarden|artifact", "Unseen Protection|10+ hunter 42395|41.59 74.72|Emmarel Shadewarden|artifact",},
		[42436] = {"Aiding Our Allies|10+ hunter +42394|43.39 26.32|Emmarel Shadewarden|artifact", "Aiding Our Allies|10+ hunter +42394|41.59 74.72|Emmarel Shadewarden|artifact",},

		-- Guise of the Unseen Path
		[44233] = "Walk This Way|45+ hunter 40954|44.57 48.87|Outfitter Reynolds",
	},

	-- Mage - Hall of the Guardian - The Guardian's Library
	[735] = {
		-- Vesture of Tirisgarde
		[44240] = "Orange is the New Purple|45+ mage|44.77 57.88|Jackson Watkins", -- Add prereq quest
	},

	-- Mage - Hall of the Guardian
	[734] = {
		-- Vesture of Tirisgarde
		[44240] = "Orange is the New Purple|45+ mage|44.77 57.88|Jackson Watkins|up link:735", -- Add prereq quest
	},

	-- Monk - Wandering Isle
	[709] = {
		-- The Defense of Tian Monastery
		[41728] = "The Defense of Tian Monastery|10+ monk 41905|51.41 48.39|Iron-Body Ponshu|artifact",
		[41729] = "Slowing the Spread|10+ monk 41728|47.16 47.75|Instructor Myang|artifact elsewhere link:371|Speak to Tak-Tak to travel to Tian Monastery",
		[41731] = "Storm, Earth, and Fire|10+ monk 41728|47.16 47.75|Taran Zhu|artifact elsewhere link:371|Speak to Tak-Tak to travel to Tian Monastery",
		[41730] = "Desperate Strike|10+ monk 41728|47.16 47.75|Taran Zhu|artifact elsewhere link:371|Speak to Tak-Tak to travel to Tian Monastery",
		[41732] = "The Hand of Keletress|10+ monk 41729 41731 41730|47.16 47.75|The Monkey King|artifact elsewhere link:371|Speak to Tak-Tak to travel to Tian Monastery",
		[41733] = "Rebuilding the Order|10+ monk 41732|47.16 47.75|High Elder Cloudfall|artifact elsewhere link:371|Speak to Tak-Tak to travel to Tian Monastery",

		-- Rebuilding the Order
		[43319] = "The Way of the Tiger|10+ monk 41733|51.41 48.39|Iron-Body Ponshu|artifact",
		[41734] = "Champion: Taran Zhu|10+ monk 43901,+43319|51.14 49.65|Taran Zhu|artifact", -- 43901 Tracking Quest: All - Troop B Enabled
		[41735] = "Champion: The Monkey King|10+ monk 43901,+43319|51.14 49.65|The Monkey King|artifact", -- 43901 Tracking Quest: All - Troop B Enabled
		[43062] = "Further Training|10+ monk 41733|52.53 57.82|High Elder Cloudfall|artifact",
		[41907] = "Appropriations|10+ monk 41733|52.53 57.82|High Elder Cloudfall|artifact",
		[43054] = "An Ample Stockpile|10+ monk 41907|48.89 58.36|Lao Shu|artifact",
		[41909] = "Tracking the Tideskorn|10+ monk 41733|52.53 57.82|High Elder Cloudfall|artifact",

		-- Grandmaster's Finery
		[44249] = "Inner Sanctuary|45+ monk|50.33 59.13|Caydori Brightstar",
	},

	-- Paladin - Sanctum of Light
	[24] = {
		-- Battleplate of the Silver Hand
		[44250] = "Champion of the Light|45+ paladin|41.35 61.09|Eadric the Pure",

		-- Chose Balnazzar: 42136
	},

	-- Priest - Netherlight Temple
	[702] = {
		-- Regalia of the High Priest
		[44251] = "Power Word: Armor|45+ priest|38.65 23.81|Meridelle Lightspark",
	},

	-- Rogue - The Hall of Shadows
	[626] = {
		-- Saga of the Shadowblade
		-- ...
		[44183] = "Champion: Lord Jorach Ravenholdt|10+ rogue 44177|41.39 78.1|Lord Jorach Ravenholdt|artifact",
		[43841] = "Convincin' Old Yancey|10+ rogue 44177|41.19 74.36|Fleet Admiral Tethys|artifact",
		[43852] = "Fancy Lads and Buccaneers|10+ rogue 43841|41.19 74.36|Fleet Admiral Tethys|artifact",
		[44181] = "Champion: Fleet Admiral Tethys|10+ rogue 43852|41.19 74.36|Fleet Admiral Tethys|artifact",
		[42684] = "Throwing SI:7 Off the Trail|10+ rogue 44181|40.89 75.36|Valeera Sanguinar|artifact",
		[43468] = "Blood for the Wolfe|10+ rogue 44181|40.89 75.36|Valeera Sanguinar|artifact",
		[42730] = "Noggenfogger's Reasonable Request|10+ rogue 44181|40.89 75.36|Valeera Sanguinar|artifact",
		[44178] = "A Particularly Potent Potion|10+ rogue 42730|30.47 70.4|Marin Noggenfogger|artifact",

		-- Battlegear of the Uncrowned
		[44252] = "A Sheath For Every Blade|45+ rogue|26.92 36.82|Kelsey Steelspark",
	},

	-- Shaman - The Heart of Azeroth
	[726] = {
		-- Raiment of the Farseer
		[44253] = "A Vision of Triumph|45+ shaman|30.33 60.68|Flamesmith Lanying",
	},

	-- Warlock - Dreadscar Rift
	[717] = {
		-- Vestments of the Black Harvest
		[44254] = "Gazing Into Oblivion|45+ warlock|58.75 32.67|Gigi Gigavoid",
	},

	-- Warrior - Skyhold
	[695] = {
		-- Battlelord's Plate
		[44255] = "Axe and You Shall Receive|45+ warrior|56.22 27.06|Quartermaster Durnolf",
	},


	--[[ Azsuna ]]--

	[630] = {
		-- Behind Legion Lines
		[38834] = "Into the Fray|10+ 41220 -demonhunter|45.1 42.91|Archmage Khadgar",
		[44137] = "Into the Fray|10+ 41220 demonhunter|45.1 42.91|Archmage Khadgar", -- Demon Hunter
		[37653] = "Demon Souls|10+ 38834,44137|43.28 43.16|Allari the Souleater",
		[37660] = "The Scythe of Souls|10+ 37653|43.28 43.16|Allari the Souleater",
		[37658] = "Reignite the Wards|10+ 38834,44137|43.15 43.61|Jace Darkweaver",
		[36920] = "From Within|10+ 37660 37658 -demonhunter|43.55 43.46|Kayn Sunfury",
		[40815] = "From Within|10+ 37660 37658 demonhunter 40375|43.55 43.46|Altruis the Sufferer", -- Altruis Demon Hunter
		[44140] = "From Within|10+ 37660 37658 demonhunter 40374|43.55 43.46|Kayn Sunfury", -- Kayn Demon Hunter
		[37656] = "Fel Machinations|10+ 36920,40815,44140|41.23 50.49|Kor'vas Bloodthorn",
		[37450] = "Saving Stellagosa|10+ 36920,40815,44140|41.23 50.49|Kor'vas Bloodthorn",
		[37449] = "Dark Revelations|10+ 37656 37450|37.8 57.97|Kor'vas Bloodthorn",

		-- Defending Azurewing Repose
		[38443] = "Journey to the Repose|10+ 37449|43.55 43.41|Archmage Khadgar",
		[37853] = "The Death of the Eldest|10+ 38443|47.93 27.19|Archmage Khadgar",
		[37991] = "Agapanthus|10+ 37853|47.99 27.13|Emmigosa",
		[42271] = "Their Dying Breaths|10+ 37991|48.9 26.4|Agapanthus",
		[37690] = "Those Who Remember|10+ 42271|47.84 26.68|Senegos",
		[37855] = "The Last of the Last|10+ 42271|47.84 26.68|Senegos",
		[37856] = "The Withered|10+ 37855|48.62 16.51|Agapanthus",
		[37859] = "The Consumed|10+ 37855|49.39 15.54|Mana-Drained Whelpling",
		[37858] = "Stellagosa|10+ 37856 37859 -37957|49.18 16.6|Projection of Senegos",
		[37957] = "Runas the Shamed|10+ 37855 ~37858|46.62 15.82|Stellagosa",
		[37857] = "Runas Knows the Way|10+ 37856 37859 37957|49.22 16.09|Runas the Shamed",
		[37959] = "The Hunger Returns|10+ 37857|53.79 16.81|Runas the Shamed",
		[37960] = "Leyline Abuse|10+ 37857|53.36 16.26|Projection of Senegos",
		[37860] = "You Scratch My Back...|10+ 37959 37960|53.79 16.81|Runas the Shamed",
		[37861] = "The Nightborne Prince|10+ 37959 37960|53.36 16.26|Projection of Senegos",
		[37862] = "Still Alive|10+ 37861|57.58 13.61|Stellagosa",
		[38015] = "On the Brink|10+ 37862|49.94 26.55|Stellagosa",
		[38014] = "Feasting on the Dragon|10+ 37862|49.65 26.81|Archmage Khadgar",
		[42567] = "Cursed to Wither|10+ 38015 38014|49.94 26.55|Stellagosa",
		[42756] = "Hunger's End|10+ 42567|48.24 22.78|Runas the Shamed",

		-- Azsuna versus Azshara
		[37256] = "They Came From the Sea|10+ 37690|48.38 34.55|Nightwatcher Idri",
		[37733] = "Prince Farondis|10+ 37256|48.38 34.55|Nightwatcher Idri",
		[37727] = "The Magister of Mixology|10+ 37733|47.1 41.4|Magister Garuhod",
		[37728] = "Presentation is Everything|10+ 37733|47.1 41.4|Magister Garuhod",
		[37492] = "A Rather Long Walk|10+ 37733|47.05 41.48|Lady Irisse",
		[37257] = "Our Very Bones|10+ 37733|47 41.36|Prince Farondis",
		[37497] = "Trailing the Tidestone|10+ 37257|47 41.36|Prince Farondis",
		[37486] = "Nar'thalas Still Suffers|10+ 37497|51.78 44.29|Prince Farondis",
		[37467] = "The Walk of Shame|10+ 37486|51.78 44.29|Prince Farondis",
		[37468] = "Into the Academy|10+ 37467|54.18 42.02|Prince Farondis",
		[37736] = "Dressing With Class|10+ 37468|54 39.5|Thyrillion|down link:631",
		[37678] = "Hit the Books|10+ 37468|54 39.5|Andellis|down link:631",
		[37518] = "The Haunted Halls|10+ 37736 37678|54 39.5|Thyrillion|down link:631",
		[42370] = "Wanding 101|10+ 37518|54 39.5|Instructor Nidriel|down link:631",
		[42371] = "Study Hall: Combat Research|10+ 42370|54 39.5|Sythorne|down link:631",
		[37729] = "Pop Quiz: Advanced Rune Drawing|10+ 42371|54 39.5|Instructor Nidriel|down link:631",
		[37730] = "The Headmistress' Keys|10+ 37729|54 39.5|Instructor Nidriel|down link:631",
		[37469] = "The Tidestone: Shattered|10+ 37730|54 39.5|Thyrillion|down link:631",
		[37530] = "Save Yourself|10+ 37469|57.86 43.35|Prince Farondis",
		[37470] = "The Head of the Snake|10+ 37530|57.86 43.35|Prince Farondis",
		[38286] = "Eye of Azshara: Wrath of Azshara|10+ 37470|61.71 41.09|Prince Farondis|dungeon",
		[42213] = "Eye of Azshara: The Tidestone of Golganneth|10+ 38286|55.3 54|Tidestone of Golganneth|dungeon down link:713|Available after defeating Wrath of Azshara in Eye of Azshara",

		-- Ruins of Nar'thalas
		[42692] = "Children of Nar'thalas|10+|53.28 45.31|Kallistia Starlance",
		[42693] = "You Never Know Until You Scry|10+|53.39 45.43|Olothil Starlance",
		[42694] = "Back from the Dead|10+ 42692 42693|53.39 45.43|Olothil Starlance",
		
		-- Against the Giants
		[38407] = "Bottled Up|10+|50.6 34.9|{461806} [Okuna's Message]||Drops from Salteye murlocs",
		[37496] = "Infiltrating Shipwreck Arena|10+ 38407|47.05 41.48|Lady Irisse",
		[37507] = "Boss Whalebelly's in Charge|10+ 37496|50.01 48.56|Okuna Longtusk",
		[37542] = "No Time for Tryouts|10+ 37507|50.01 48.56|Okuna Longtusk",
		[37528] = "Let Sleeping Giants Lie|10+ 37507|50.01 48.56|Okuna Longtusk",
		[37510] = "Sternfathom's Champion|10+ 37542 37528|50.01 48.56|Okuna Longtusk",
		[37536] = "Morale Booster|10+ 37510|47.93 48.68|Sternfathom",
		[37538] = "Round 1, Fight!|10+ 37536|47.93 48.68|Sternfathom",
		[37565] = "The Right Weapon for the Job|10+ 37538|47.87 52.08|Okuna Longtusk's Pack|down link:632",
		[37566] = "The Prince is Going Down|10+ 37565|53.45 62.9|Okuna Longtusk",

		-- Mak'rana and the Fate of the Queen's Reprisal
		[42220] = "Shipwrecked Sailors|10+ alliance|60.72 59.39|[Auto Accept]", -- Alliance
		[42268] = "Shipwrecked Sailors|10+ horde|60.72 59.39|[Auto Accept]", -- Horde
		[38857] = "A Favor for Mr. Shackle|10+|50.34 61.02|Seska Seafang",
		[37657] = "Making the World Safe for Profit|10+|56.6 59.6|Mr. Shackle",
		[37654] = "Maritime Law|10+|56.6 59.6|Mr. Shackle",
		[37659] = "The Captain's Foot Locker|10+ 37654|64.26 56.14|Looper Allen",
		[40794] = "Fate of the Queen's Reprisal|10+ 37659 alliance|65.68 56.92|Captain's Foot Locker", -- Alliance
		[42244] = "Fate of the Queen's Reprisal|10+ 37659 horde|65.68 56.92|Captain's Foot Locker", -- Horde

		-- Challiane Vineyards
		[38203] = {"Challiane Vineyards|10+|43.88 12.51|Cellarman Voodani", "Challiane Vineyards|10+|40.8 9.2|Cellarman Voodani",},

		-- Daglop
		[42238] = "Missing Demon|10+ -38460|50.41 30.79|Tehd Shoemaker",
		[38460] = "Let's Make A Deal|10+ ~42238|61.24 50.74|Daglop",
		[38232] = "Minion! Kill Them!|10+ 38460|61.24 50.74|Daglop",
		[38237] = "This IS In My Contract.|10+ 38232|62.46 51.42|Daglop",

		-- Felblaze Ingress
		[42372] = "Felblaze Ingress|10+ -42375|50.46 30.73|Marius Felbane",
		[42375] = "Eye See You|10+ ~42372|63.85 29.94|Tehd Shoemaker",
		[42369] = "They're Doing it Wrong|10+ 42375|63.85 29.94|Tehd Shoemaker",
		[42368] = "Quantity Over Quality|10+ 42375|63.88 28.88|Marius Felbane",
		[42367] = "Arkethrax|10+ 42375|63.88 28.88|Marius Felbane",

		-- Alchemy
		[39390] = "A Mysterious Text|10+ alchemy 39325|44.96 52.11|Alchemy Book|alchemy",

		-- Engineering
		[40856] = "It'll Cost You|10+ engineering 40855|65.21 24.91|Fargo Flintlocke|engineering",
		[40859] = "The Latest Fashion: Headguns!|10+ engineering 40855|65.21 24.91|Fargo Flintlocke|engineering",
		[40858] = "The Missing Pieces|10+ engineering 40856|65.21 24.91|Fargo Flintlocke|engineering",

		-- Herbalism - Aethril
		[40013] = "Aethril Sample|10+ herbalism|1 Aethril|{1395063} [Aethril Sample]|herbalism discovery|Gathered from Aethril",
		[40015] = "Ragged Strips of Silk|10+ herbalism 40014|1 Aethril|{463527} [Ragged Strips of Silk]|herbalism discovery|Gathered from Aethril",
		[40017] = "A Slip of the Hand|10+ herbalism 40016|1 Aethril|[Auto Accept]|herbalism discovery|Has a chance to be obtained after gathering Aethril",

		-- Herbalism - Felwort
		[40040] = "Felwort Sample|10+ herbalism 45727,43341|6 Felwort|{1387614} [Felwort Sample]|herbalism discovery|Gathered from Felwort", -- Available after unlocking World Quests

		-- Mining - Leystone
		[38777] = "Leystone Deposit Sample|10+ mining|1 LeystoneDeposit|{1394960} [Leystone Deposit Sample]|mining discovery|Mined from Leystone Deposits",
		[38784] = "Leystone Seam Sample|10+ mining|2 LeystoneSeam|{1394960} [Leystone Seam Sample]|mining discovery|Mined from Leystone Seams",
		[38785] = "Living Leystone Sample|10+ mining|3 LivingLeystone|{1394960} [Living Leystone Sample]|mining discovery|Mined from Leystone creatures",
		[38789] = "Rethu's Journal|10+ mining 38787|1 LeystoneDeposit|{237388} [Torn Journal Page]|mining discovery|Mined from Leystone Deposits",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 LeystoneDeposit|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Deposits",
		[38790] = "Rethu's Pick|10+ mining 38787|2 LeystoneSeam|{1060565} [Battered Mining Pick]|mining discovery|Mined from Leystone Seams",
		[38793] = "Rethu's Experience|10+ mining 38790|2 LeystoneSeam|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Seams",
		[38791] = "Rethu's Horn|10+ mining 38787|3 LivingLeystone|{237403} [Chunk of Horn]|mining discovery|Mined from Leystone creatures",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|3 LivingLeystone|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone creatures",
		
		-- Mining - Felslate
		[38795] = "Felslate Deposit Sample|10+ mining|4 FelslateDeposit|{1394961} [Felslate Deposit Sample]|mining discovery|Mined from Felslate Deposits",
		[38796] = "Felslate Seam Sample|10+ mining|5 FelslateSeam|{1394961} [Felslate Seam Sample]|mining discovery|Mined from Felslate Seams",
		[38797] = "Living Felslate Sample|10+ mining|6 LivingFelslate|{1394961} [Living Felslate Sample]|mining discovery|Mined from Felslate creatures",
		[38800] = "Rin'thissa's Eye|10+ mining 38799|4 FelslateDeposit|{237298} [Ore-Bound Eye]|mining discovery|Mined from Felslate Deposits",
		[38803] = "Rin'thissa|10+ mining 38800|4 FelslateDeposit|Rin'thissa|mining discovery|Rin'thissa has a chance to appear after mining Felslate Deposits",
		[38801] = "Lyrelle's Right Arm|10+ mining 38799|5 FelslateSeam|{571556} [Severed Arm]|mining discovery|Mined from Felslate Seams",
		[38804] = "Lyrelle|10+ mining 38801|5 FelslateSeam|Lyrelle|mining discovery|Lyrelle has a chance to appear after mining Felslate Seams",
		[38802] = "Ondri's Still-Beating Heart|10+ mining 38799|6 LivingFelslate|{134339} [Ore-Choked Heart]|mining discovery|Mined from Felslate creatures",
		[38805] = "Ondri|10+ mining 38802|6 LivingFelslate|Ondri|mining discovery|Ondri has a chance to appear after mining Felslate creatures",

		-- Mining - Infernal Brimstone
		[38806] = "Infernal Brimstone Sample|45+ mining 45727,43341|7 InfernalBrimstone|{1394959} [Infernal Brimstone Sample]|mining discovery|Mined from Brimstone Destroyer Core",
	},

	-- Nar'thalas Academy
	[631] = {
		-- Azsuna versus Azshara
		[37736] = "Dressing With Class|10+ 37468|53.38 47.63|Thyrillion",
		[37678] = "Hit the Books|10+ 37468|52.99 47.82|Andellis",
		[37518] = "The Haunted Halls|10+ 37736 37678|53.38 47.63|Thyrillion",
		[42370] = "Wanding 101|10+ 37518|28.89 42.42|Instructor Nidriel",
		[42371] = "Study Hall: Combat Research|10+ 42370|30.3 45.31|Sythorne",
		[37729] = "Pop Quiz: Advanced Rune Drawing|10+ 42371|28.89 42.42|Instructor Nidriel",
		[37730] = "The Headmistress' Keys|10+ 37729|28.89 42.42|Instructor Nidriel",
		[37469] = "The Tidestone: Shattered|10+ 37730|53.38 47.63|Thyrillion",
	},

	-- Oceanus Cove
	[632] = {
		-- Against the Giants
		[37565] = "The Right Weapon for the Job|10+ 37538|43.93 24.65|Okuna Longtusk's Pack",
	},

	--Eye of Azshara
	[713] = {},

	-- Dungeon: Eye of Azshara
	[713] = {
		-- Azsuna versus Azshara
		[38286] = "Eye of Azshara: Wrath of Azshara|10+ 37470|49.4 88.8|Prince Farondis|dungeon elsewhere link:630",
		[42213] = "Eye of Azshara: The Tidestone of Golganneth|10+ 38286|55 54|Tidestone of Golganneth|dungeon|Available after defeating Wrath of Azshara in Eye of Azshara",
	},


	--[[ Val'sharah ]]--

	-- Val'sharah
	[641] = {
		-- Nature's Call
		[40122] = "Cenarius, Keeper of the Grove|10+|54.69 72.84|Malfurion Stormrage",
		[38384] = "Nature's Call|10+ 40122|51.92 64.09|Malfurion Stormrage",
		[39354] = "Wisp in the Willows|10+ 38384|54.3 68.3|Syndrelle",

		-- Archdruid of Lore
		[38381] = "Archdruid of Lore|10+ 38384 -druid|54.38 73.57|Aranelle",
		[44106] = "Archdruid of Lore|10+ 38384 druid|54.38 73.57|Aranelle", -- Druid
		[38235] = "Solid as a Rock|10+ 38381,44106|48.86 70.2|Elothir",
		[38225] = "Death to the Witchmother|10+ 38381,44106|48.86 70.2|Elothir",

		-- Archdruid of the Claw
		[38142] = "Archdruid of the Claw|10+ 38384|54.38 73.57|Aranelle",
		[38455] = "Frenzied Furbolgs|10+ 38142|49.08 82.35|Rylissa Bearsong",
		[38922] = "Littlefur|10+ 38142|48.4 84.65|Elder Sookh",
		[38246] = "Totemic Call|10+ 38922|46.26 84.55|Littlefur",
		[38146] = "The Chieftain's Beads|10+ 38922|48.78 88.45|{133306} [Chieftain's Beads]||Drops from Chieftain Graw",
		[38143] = "Awakening the Archdruid|10+ 38455 38246|49.08 82.35|Rylissa Bearsong",
		[38144] = "The Demons Below|10+ 38143|50.03 85.67|Koda Steelclaw|down link:643",
		[38145] = "Out of the Dream|10+ 38143|50.03 85.67|Koda Steelclaw|down link:643",
		[38147] = "Entangled Dreams|10+ 38144 38145|50.03 85.67|Koda Steelclaw|down link:643",

		-- Archdruid of the Vale
		[38382] = "Archdruid of the Vale|10+ 38384|54.38 73.57|Aranelle",
		[39383] = "Dishonored|10+ 38382|61.04 73.24|Thaon Moonclaw",
		[39384] = "The Corruptor|10+ 39383|62.78 71.71|Thaon Moonclaw",
		[40573] = "The Nightmare Lord|10+ 39384|65 67|Eville Nightwhisper",

		-- Into the Nightmare
		[38323] = "Return to the Grove|10+ 40573 38147 38235 38225 -38148 -38322|62.33 76.22|Evelle Nightwhisper", -- 1
		[38148] = "Return to the Grove|10+ 40573 38147 38235 38225 -38323 -38322|48.8 81.6|Koda Steelclaw", -- 2
		[38322] = "Return to the Grove|10+ 40573 38147 38235 38225 -38323 -38148|48.8 70.2|Elothir", -- 3
		[38377] = "The Emerald Queen|10+ 38323,38148,38322|51.92 64.09|Malfurion Stormrage",
		[38641] = "The Temple of Elune|10+ 38377|52.4 63.4|Ysera",
		[38655] = "Root Cause|10+ 38641|51.47 56.85|Isoraen Nightstar",
		[38662] = "Tears for Fears|10+ 38641|51.44 57|Lyanis Moonfall",
		[38663] = "The Die is Cast|10+ 38662|51.44 57|Lyanis Moonfall",
		[38595] = "Malfurion's Fury|10+ 38663|52.4 63.4|Ysera",
		[38582] = "To Old Friends|10+ 38595|60.56 61.47|Ysera",
		[38753] = "The Demon's Trail|10+ 38582|65 61|Ysera",

		-- All Nightmare Long
		[41056] = "Love Lost|10+ 38753 alliance|67.45 56.11|Tyrande Whisperwind", -- Alliance
		[41054] = "Love Lost|10+ 38753 horde|67.45 56.11|Tyrande Whisperwind", -- Horde
		[38671] = "Lost in Retreat|10+ 41056,41054|69.44 49.37|Mender Onelle",
		[41707] = "Wormtalon Wreckage|10+ 41056,41054|69.44 49.37|Aldos Duskwing",
		[41708] = "Dark Side of the Moon|10+ 41056 alliance|69.54 49.52|Tyrande Whisperwind", -- Alliance
		[41890] = "Dark Side of the Moon|10+ 41054 horde|69.54 49.52|Tyrande Whisperwind", -- Horde
		[43576] = "Regroup at the Refuge|10+ 41708,41890|66.92 50.13|Tyrande Whisperwind",
		[41724] = "Heart of the Nightmare|10+ 43576 alliance|69.54 49.52|Tyrande Whisperwind", -- Alliance
		[38675] = "Heart of the Nightmare|10+ 43576 horde|69.54 49.52|Tyrande Whisperwind", -- Horde
		[38684] = "Reading the Leaves|10+ 41724,38675|66.2 44.6|Elothir",
		[41893] = "Given to Corruption|10+ 41724 alliance|66.2 44.6|Elothir", -- Alliance
		[41749] = "Given to Corruption|10+ 38675 horde|66.2 44.6|Elothir", -- Horde
		[43702] = "Softening the Target|10+ 38684 41893,41749|66.2 44.77|Tyrande Whisperwind",
		[38687] = "Close Enough to Touch|10+ 43702 alliance|63.2 42.22|Tyrande Whisperwind", -- Alliance
		[41763] = "Close Enough to Touch|10+ 43702 horde|63.2 42.22|Tyrande Whisperwind", -- Horde
		[38743] = "The Fate of Val'sharah|10+ 38687,41763|57.82 38.58|Tyrande Whisperwind",
		[40567] = "Darkheart Thicket: Enter the Nightmare|10+ 38743|53.68 55.9|Tyrande Whisperwind",
		[40890] = "The Tears of Elune|10+ 38743|53.46 55.95|Tears of Elune",

		-- Bradensbrook
		[38643] = "A Village in Peril|10+ -39149|54.8 52.8|Darcy Heathrow", -- 1
		[39149] = "A Village in Peril|10+ -38643|51.2 51.2|Theo the Huntsman", -- 2
		[38644] = "The Farmsteads|10+ 38643,39149|42.2 59|Emmeline",
		[38645] = "Children of the Night|10+ 38643,39149|42.4 59|Commander Jarod Shadowsong",
		[38646] = "A Sight For Sore Eyes|10+ 38643,39149|38.8 61.4|Granny Marl",
		[38647] = "For the Corn!|10+ 38643,39149|38.8 61.4|Granny Marl",
		[39117] = "Shriek No More|10+ 38643,39149|37 58.4|Cecily Radcliffe",
		[38711] = "The Warden's Signet|10+ 38643,39149|39.12 64.5|{1025252} [Warden's Signet]||Drops from Lelyn Swiftshadow",
		[39015] = "Grumpy|10+|38.64 65.64|Grumpy||Available after walking through the fire to the top floor of Heathrow Manor",

		-- Black Rook Hold
		-- Todo: check which quests can be picked up at the same time, and check 38721 coordinates
		[38691] = "Jarod's Mission|10+ 38644 38645 38646 38647 39117|42.4 59|Commander Jarod Shadowsong",
		[38718] = "Kur'talos Ravencrest|10+ 38691|40.8 53|Commander Jarod Shadowsong",
		[38714] = "Maiev's Trail|10+ 38718|40.8 53|Commander Jarod Shadowsong",
		[38715] = "The Rook's Guard|10+ 38718|40.8 53|Commander Jarod Shadowsong",
		[38717] = "Black Rook Prison|10+ 38714 38715|43.82 50.29 40.8 53 40.8 53|Commander Jarod Shadowsong",
		[38724] = "Brotherly Love|10+ 38717 -demonhunter|40.58 44.28|Commander Jarod Shadowsong",
		[44457] = "Brotherly Love|10+ 38717 demonhunter|40.58 44.28|Commander Jarod Shadowsong", -- Demon Hunter
		[38721] = "Lieutenant of the Tower|10+ 38724,44457|39.48 42.1|Maiev Shadowsong",
		[38719] = "Illidari Freedom|10+ 38717 -demonhunter|40.6 44.2|Arduen Soulblade",
		[44278] = "Illidari Freedom|10+ 38717 demonhunter|40.6 44.2|Arduen Soulblade", -- Demon Hunter

		-- Lunarwing Shallows
		[40220] = "Thorny Dancing|10+|53.8 79.8|Saylanna Riverbreeze",
		[40221] = "Spread Your Lunarwings and Fly|10+|53.8 79.8|Saylanna Riverbreeze",
		[38862] = "Thieving Thistleleaf|10+|52.4 83.5|{132834} [Lunarwing Egg]||Drops from Thistleleaf sprites",

		-- Lostlight Grotto
		[42748] = "Emerald Sisters|10+|59.4 84.1|Guviena Bladesong",
		[42747] = "Where the Wildkin Are|10+|59.4 84.1|Guviena Bladesong",
		[42751] = "Moon Reaver|10+ 42747|59.4 84.1|Guviena Bladesong",
		[42750] = "Dreamcatcher|10+ +42748,+42747|59.5 82|Leirana",
		[42786] = "Grotesque Remains|10+|60.2 81.75|{646670} [Grotesque Remains]||Drops from Undulating Boneslimes",

		-- Grizzleweald
		[42883] = "All Grell Broke Loose|10+|66.7 77.3|Old Grizzleback",
		[42884] = "Grassroots Effort|10+|66.7 77.3|Old Grizzleback",
		[42865] = "Grell to Pay|10+|66.7 77.3|Old Grizzleback",
		[42857] = "Moist Around the Hedges|10+|66.8 75.7|Moist Grizzlecomb",

		-- Mark of the Demon
		[38656] = "Mark of the Demon|10+|56.77 54.33|{133791} [Demonic Emblem]||Drops from Gravax the Desecrator",

		-- Sylvan Falls
		[41094] = "Hatchlings of the Talon|10+|76.08 31.39|Aviana",

		-- Hunter - Watchers in the Wild
		[42386] = "Rising Troubles|10+ hunter 42385|41.7 60|Hudson Crawford|artifact",
		[42387] = "Assassin Entrapment|10+ hunter 42385|41.7 60|Hudson Crawford|artifact",
		[42388] = "Urgent Summons|10+ hunter 42386 42387 -42389|41.67 59.95|Snowfeather|artifact",

		-- Engineering
		[40861] = "In My Sights|10+ engineering 40860|59.83 62.26|Fargo Flintlocke|engineering",
		[40862] = "All Charged Up|10+ engineering 40860|59.83 62.26|Fargo Flintlocke|engineering",

		-- Enchanting
		[39884] = "No Longer Worthy|10+ enchanting 39881|54.4 57.71|Nalamya|enchanting",
		[39889] = "Led Astray|10+ enchanting 39881|54.4 57.71|Nalamya|enchanting",
		[39882] = "Darkheart Thicket: The Glamour Has Faded|10+ enchanting 39884 39889|54.4 57.71|Nalamya|enchanting dungeon",

		-- Herbalism - Dreamleaf
		[40018] = "Dreamleaf Sample|10+ herbalism|2 Dreamleaf|{1387613} [Dreamleaf Sample]|herbalism discovery|Gathered from Dreamleaf",
		[40020] = "Twisted to Death|10+ herbalism 40019|2 Dreamleaf|{1387617} [Blight-Twisted Herb]|herbalism discovery|Gathered from Dreamleaf",
		[40021] = "One Dead Plant is One Too Many|10+ herbalism 40020|54.81 71.71|Wildcrafter Osme|herbalism",
		[40022] = "Choked by Nightmare|10+ herbalism 40021|2 Dreamleaf|{1387617} [Blight-Choked Herb]|herbalism discovery|Gathered from Dreamleaf",
		[40023] = "The Last Straw|10+ herbalism 40022|54.81 71.71|Wildcrafter Osme|herbalism",

		-- Herbalism - Felwort
		[40040] = "Felwort Sample|10+ herbalism 45727,43341|6 Felwort|{1387614} [Felwort Sample]|herbalism discovery|Gathered from Felwort", -- Available after unlocking World Quests

		-- Mining - Leystone
		[38777] = "Leystone Deposit Sample|10+ mining|1 LeystoneDeposit|{1394960} [Leystone Deposit Sample]|mining discovery|Mined from Leystone Deposits",
		[38784] = "Leystone Seam Sample|10+ mining|2 LeystoneSeam|{1394960} [Leystone Seam Sample]|mining discovery|Mined from Leystone Seams",
		[38785] = "Living Leystone Sample|10+ mining|3 LivingLeystone|{1394960} [Living Leystone Sample]|mining discovery|Mined from Leystone creatures",
		[38789] = "Rethu's Journal|10+ mining 38787|1 LeystoneDeposit|{237388} [Torn Journal Page]|mining discovery|Mined from Leystone Deposits",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 LeystoneDeposit|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Deposits",
		[38790] = "Rethu's Pick|10+ mining 38787|2 LeystoneSeam|{1060565} [Battered Mining Pick]|mining discovery|Mined from Leystone Seams",
		[38793] = "Rethu's Experience|10+ mining 38790|2 LeystoneSeam|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Seams",
		[38791] = "Rethu's Horn|10+ mining 38787|3 LivingLeystone|{237403} [Chunk of Horn]|mining discovery|Mined from Leystone creatures",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|3 LivingLeystone|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone creatures",
		
		-- Mining - Felslate
		[38795] = "Felslate Deposit Sample|10+ mining|4 FelslateDeposit|{1394961} [Felslate Deposit Sample]|mining discovery|Mined from Felslate Deposits",
		[38796] = "Felslate Seam Sample|10+ mining|5 FelslateSeam|{1394961} [Felslate Seam Sample]|mining discovery|Mined from Felslate Seams",
		[38797] = "Living Felslate Sample|10+ mining|6 LivingFelslate|{1394961} [Living Felslate Sample]|mining discovery|Mined from Felslate creatures",
		[38800] = "Rin'thissa's Eye|10+ mining 38799|4 FelslateDeposit|{237298} [Ore-Bound Eye]|mining discovery|Mined from Felslate Deposits",
		[38803] = "Rin'thissa|10+ mining 38800|4 FelslateDeposit|Rin'thissa|mining discovery|Rin'thissa has a chance to appear after mining Felslate Deposits",
		[38801] = "Lyrelle's Right Arm|10+ mining 38799|5 FelslateSeam|{571556} [Severed Arm]|mining discovery|Mined from Felslate Seams",
		[38804] = "Lyrelle|10+ mining 38801|5 FelslateSeam|Lyrelle|mining discovery|Lyrelle has a chance to appear after mining Felslate Seams",
		[38802] = "Ondri's Still-Beating Heart|10+ mining 38799|6 LivingFelslate|{134339} [Ore-Choked Heart]|mining discovery|Mined from Felslate creatures",
		[38805] = "Ondri|10+ mining 38802|6 LivingFelslate|Ondri|mining discovery|Ondri has a chance to appear after mining Felslate creatures",

		-- Mining - Infernal Brimstone
		[38806] = "Infernal Brimstone Sample|45+ mining 45727,43341|7 InfernalBrimstone|{1394959} [Infernal Brimstone Sample]|mining discovery|Mined from Brimstone Destroyer Core",
	},

	-- Lower Sleeper's Barrow
	[643] = {
		-- Archdruid of the Claw
		[38144] = "The Demons Below|10+ 38143|60.54 17.36|Koda Steelclaw",
		[38145] = "Out of the Dream|10+ 38143|60.54 17.36|Koda Steelclaw",
		[38147] = "Entangled Dreams|10+ 38144 38145|62.81 48.81|Koda Steelclaw",
	},

	-- Darkpens
	[642] = {
		-- Black Rook Hold
		[38724] = "Brotherly Love|10+ 38717 -demonhunter|43.17 81.04|Commander Jarod Shadowsong",
		[44457] = "Brotherly Love|10+ 38717 demonhunter|43.17 81.04|Commander Jarod Shadowsong", -- Demon Hunter
		[38721] = "Lieutenant of the Tower|10+ 38724,44457|23.1 40.77|Maiev Shadowsong",
		[38719] = "Illidari Freedom|10+ 38717 -demonhunter|43.21 82.02|Arduen Soulblade",
		[44278] = "Illidari Freedom|10+ 38717 demonhunter|43.21 82.02|Arduen Soulblade", -- Demon Hunter
	},


	--[[ Highmountain ]]--

	-- Highmountain
	[650] = {
		-- The Rivermane Tribe
		[38907] = {"Keepers of the Hammer|10+ -38911|35.96 65.74|Warbrave Oro", "Keepers of the Hammer|10+ -38911|59.01 65.47|Warbrave Oro",},
		[38911] = "The Rivermane Tribe|10+ 38907|46.73 61.1|Mayla Highmountain|link:652",
		[39491] = "Ormgul the Pestilent|10+ 38911|43.64 59.92|Jale Rivermane",
		[39272] = "Poisoned Crops|10+ 38911|43.69 59.9|Farmer Maya",
		[39490] = "Infestation|10+ 38911|43.69 59.9|Farmer Maya",
		[39323] = "Moozy's Sojourn|10+ 39491 39272 39490|40.25 64.06|Rordan Waterwise",
		[39572] = "Moozy's Adventure|10+ 39323|37.47 64.3|Moozy Waterwise",
		[42590] = "Moozy's Reunion|10+ 39572|46.91 61.66|Sella Waterwise|link:750",
		[39496] = "The Flow of the River|10+ 39491 39272 39490|43.64 59.92|Jale Rivermane",
		[39316] = "Trapped Tauren|10+ 39496|41.13 61.57|Angler Creel",
		[39614] = "Fish Out of Water|10+ 39496|41.13 61.57|Angler Creel",
		[39277] = "Spray and Prey|10+ 39496|41.18 61.49|Jale Rivermane",
		[39661] = "Lifespring Cavern|10+ 39316 39614 39277|41.18 61.49|Jale Rivermane",
		[39488] = "Balance of Elements|10+ 39661|38.4 61.22|Jale Rivermane",
		[39489] = "Invading Spelunkers|10+ 39661|38.4 61.22|Jale Rivermane",
		[39487] = "Crystal Fury|10+ 39488 39489|38.4 61.22|Jale Rivermane",
		[39498] = "High Water|10+ 39487|38.4 61.22|Jale Rivermane",

		-- Riverbend
		[42104] = "The Underking Comes|10+ 39498|40.36 71.7|Jale Rivermane",
		[39025] = "Grasp of the Underking|10+ 42104|38.62 68.43|Spiritwalker Ebonhorn",
		[39026] = "The Drogbar|10+ 42104|38.62 68.43|Spiritwalker Ebonhorn",
		[39043] = "Bitestone Enclave|10+ 39025 39026|41.29 72.6|Warbrave Oro",
		[39027] = "Dargrul and the Hammer|10+ 39043|43.68 73.84 41.34 72.45|Warbrave Oro|down link:651",
		[38909] = "Get to High Ground|10+ 39027|38.62 68.43|Spiritwalker Ebonhorn",

		-- The Skyhorn Tribe
		[38913] = "The Skyhorn Tribe|10+ 38909|46.73 61.1|Mayla Highmountain|link:652",
		[39318] = "Nursing the Wounds|10+ 38913|52.47 44.71|Lasan Skyhorn",
		[38910] = "Rocs vs Eagles|10+ 39318|52.47 44.71|Lasan Skyhorn",
		[39321] = "The Three|10+ 38910|52.32 36.42|Lasan Skyhorn",
		[39429] = "Assaulting the Haglands|10+ 38910|52.32 36.42|Lasan Skyhorn",
		[39322] = "The Witchqueen|10+ 39321 39429|49.22 36.59|Lasan Skyhorn",
		[39387] = "The Skies of Highmountain|10+ 39322|45.69 39.15|Lasan Skyhorn",

		-- The Bloodtotem Tribe
		[38912] = "The Bloodtotem Tribe|10+ 38909|46.73 61.1|Mayla Highmountain|link:652",
		[39372] = "Witch of the Wood|10+ 38912|39.42 36.96|Oakin Ironbull",
		[39373] = "Hags of a Feather|10+ 38912|39.42 36.96|Oakin Ironbull",
		[39873] = "I Have a Bad Feeling About This|10+ 38912|38.94 37.36|Navarogg",
		[39374] = "An Audience with Torok|10+ 39372 39373 39873|39.42 36.96|Oakin Ironbull",
		[39455] = "Cave of the Blood Trial|10+ 39374|39.18 34.53|Oakin Ironbull",
		[39860] = "Rite of Blood|10+ 39455|38.52 35.4 37.61 33.46|Torok Bloodtotem|down link:653",
		[39381] = "Rock Troll in a Hard Place|10+ 39860|37.01 39.44 37.61 33.46|Navarogg|down link:653",
		[39391] = "Pet Rocks|10+ 39381|45.21 32.52|Navarogg",
		[39425] = "Stonedark Crystal|10+ 39381|45.21 32.52|Navarogg",
		[39588] = "They Will Pay With Blood|10+ 39381|45.21 32.52|Navarogg",
		[39426] = "Blood Debt|10+ 39391 39425 39588|45.21 32.52|Navarogg",
		[40229] = "Step into the Dark|10+ 39426|49.53 24.15|Navarogg",
		[39456] = "Unexpected Allies|10+ 40229|44.01 23.18 42.59 25.39|Navarogg|down link:659",

		-- Stonedark Grotto
		[39440] = "You Lift, Brul?|10+ 40229|44.85 23.86 42.59 25.39|Damrul the Stronk|down link:659",
		[39438] = "Guhruhlruhlruh|10+ 39440|44.85 23.86 42.59 25.39|Damrul the Stronk|down link:659",
		[39437] = "Deep in the Cavern|10+ 39440|44.85 23.86 42.59 25.39|Damrul the Stronk|down link:659",
		[39439] = "Stonedark Relics|10+ 39440|44.85 23.86 42.59 25.39|Damrul the Stronk|down link:659",

		-- Huln's War
		[40515] = "A Walk With the Spirits|10+ 38909 -40167|46.73 61.1|Mayla Highmountain|link:652",
		[40167] = "The Story of Huln|10+ 40515|47.65 61.65|Spiritwalker Ebonhorn|link:652",
		[40520] = "To See the Past|10+ 40167|47.65 61.65|Spiritwalker Ebonhorn|link:652",
		[39983] = "Huln's War - The Arrival|10+ 40520|47.65 61.65|Spiritwalker Ebonhorn|link:652",
		[40112] = "Huln's War - Malorne's Favored|10+ 39983|47.65 61.65|Spiritwalker Ebonhorn|link:652",
		[39988] = "Huln's War - Stormrage|10+ 40112|47.65 61.65|Spiritwalker Ebonhorn|link:652",
		[39990] = "Huln's War - Reinforcements|10+ 39988|47.65 61.65|Spiritwalker Ebonhorn|link:652",
		[39992] = "Huln's War - The Nathrezim|10+ 39990|47.65 61.65|Spiritwalker Ebonhorn|link:652",

		-- Crystal Fissure
		[39134] = "Wrathshard|10+ 38909|49.02 55.27|Warbrave Nava",
		[39133] = "No Time to talk|10+ 38909|49.02 55.27|Warbrave Nava",

		-- Secrets of Highmountain
		[38916] = "Secrets of Highmountain|10+ 39992|47.65 61.65|Spiritwalker Ebonhorn|link:652",
		[39575] = "The Path of Huln|10+ 38916|44.88 65.71|Spiritwalker Ebonhorn",
		[40219] = "In Defiance of Deathwing|10+ 39575|47.36 70.25 44.82 72.21|Spiritwalker Ebonhorn|down link:657",
		[39578] = "Titanic Showdown|10+ 40219|47.36 70.25 44.82 72.21|Spiritwalker Ebonhorn|down link:657",
		[39577] = "An Ancient Secret|10+ 39578|48.02 75.16 44.82 72.21|Spiritwalker Ebonhorn|down link:657",
		[39579] = "The Backdoor|10+ 39577|49.37 75.19 44.82 72.21|Spiritwalker Ebonhorn|down link:657",
		[39580] = "The High Chieftain|10+ 39579|47.47 84.73|Mayla Highmountain",

		-- Battle of Snowblind Mesa
		[38915] = "Battle of Snowblind Mesa|10+ 39387 39456 39992 39580|46.73 61.1|Mayla Highmountain|link:652",
		[39777] = "Buy Us Time|10+ 38915|53.35 64|Jale Rivermane",
		[39862] = "The Siegebrul|10+ 38915|53.38 64.12|Navarogg",
		[39776] = "Battle Worms|10+ 38915|53.27 64.05|Mayla Highmountain",
		[42088] = "Evacuate Snowmane|10+ 39777 39862 39776|53.27 64.05|Mayla Highmountain",
		[42512] = "Highmountain Stands|10+ 42088|52.28 65.91|Mayla Highmountain",
		[40594] = "Justice Rains from Above|10+ 42512|53.25 64.42|Lasan Skyhorn",
		[39780] = "The Underking|10+ 40594|53.15 68.78|Lasan Skyhorn",
		[39781] = "Neltharion's Lair: Death to the Underking|10+ 39780|53.19 70.04|Mayla Highmountain",
		[42454] = "The Hammer of Khaz'goroth|10+ 39781|47.6 68|Hammer of Khaz'goroth|dungeon down link:731|Defeat Dargrul in Neltharion's Lair",

		-- Thunder Totem
		[42596] = "Mountainstrider Round-Up|10+ 38909|47.97 60.45|Liza Galestride|link:750",
		[42630] = "Bolas Bastion|10+ 39387|46.52 59.53|Bolas Skyfeather|link:750",
		[40217] = "An Offering of Ammo|10+ 39387,39456 ~39417 -40170|46.44 60.61|Shale Greyfeather|link:750",
		[42622] = "Ceremonial Drums|10+ 39992|46.73 61.78|Torv Dubstomp|link:652",

		-- Sylvan Falls
		[41094] = "Hatchlings of the Talon|10+|32.18 66.86|Aviana",

		-- Screeching Crag
		[39419] = "Hex-a-Gone|10+|47.17 47.99|Maltha Silenthoof",

		-- Candle Rock
		[39765] = "Wax On, Wax Off|10+|54.7 45|Oenia Skyhorn",
		[39768] = "Candle to the Grave|10+|54.7 45|Oenia Skyhorn",
		[39769] = "The Gates of Wax|10+ 39765 39768|54.7 45|Oenia Skyhorn",
		[40339] = "Candle of Command|10+ 39769|55.328 41.78 55.16 44.32|Bluewax Gatekeeper|down",
		[40345] = "Burn the Candle at Both Ends|10+ 40339|55.328 41.78 55.16 44.32|Bluewax Gatekeeper|down",
		[39772] = "Can't Hold a Candle To You|10+ 40345|55.328 41.78 55.16 44.32|Bluewax Gatekeeper|down",

		-- Nesingwary's Retreat
		[39859] = "Note-Eating Goats|10+|39.92 52.23|Addie Fizzlebog",
		[40170] = "Amateur Hour|10+ ~40217 ~39417|40.03 52.24|Hemet Nesingwary",
		[39123] = "Lion Stalkin'|10+ 40170|40.03 52.24|Hemet Nesingwary",
		[39867] = "I'm Not Lion!|10+ 39123|40.02 52.36|Ellias",
		[39124] = "Moose Shootin'|10+ 40170|40.03 52.24|Hemet Nesingwary",
		[39178] = "Moose on the Loose|10+ 39124|40 52.3|Laeni Silvershot",
		[39392] = "Bear Huntin'|10+ 40170|40.03 52.24|Hemet Nesingwary",
		[40216] = "A Hunter at Heart|10+ 39859 40170|40.03 52.24|Hemet Nesingwary",
		[40228] = "Scout It Out|10+ 40216|40.03 52.24|Hemet Nesingwary",
		-- check if 39867 or 39178 are required for either of these (39178 probably not needed for 40244)
		[39386] = "Procuring a Prototype|10+ 40228 -39670|40.03 52.24|Hemet Nesingwary",
		[40244] = "That Guy in the Costume|10+ 40228 -40045 -40047 -40049|40.03 52.24|Hemet Nesingwary",

		-- Icepine Point
		[39670] = "Critter Scatter Shot|10+|57.63 56.61|Razik Gazbolt",
		[39656] = "Wolf Pack Attack|10+ 39670|57.63 56.61|Razik Gazbolt",
		[39417] = "Rating Razik|10+ 39656 ~40217 -40170|57.63 56.61|Razik Gazbolt", -- double check ~40217
		[40000] = "A True Hunter|10+|57.59 56.41|Lorna Stoutfoot",

		-- Shipwreck Cove
		[40045] = "Nature vs. Nurture|10+ ~40244|42.73 10.93|King Mrgl-Mrgl",
		[40047] = "I'll Huff, I'll Puff...|10+ ~40244|42.73 10.93|King Mrgl-Mrgl",
		[40049] = "Slime Time|10+ ~40244|42.73 10.93|King Mrgl-Mrgl",
		[40102] = "Murlocs: The Next Generation|10+ 40045 40047 40049|42.73 10.93|King Mrgl-Mrgl",
		[40230] = "Oh, the Clawdacity!|10+ 40045 40047 40049|42.73 10.93|King Mrgl-Mrgl",

		-- Felbane Camp
		[44055] = "They Have A Pitlord|45+|29.74 40.15|Marius Felbane",

		-- Hunter - Watchers in the Wild
		[43335] = "Survival Skills|10+ hunter 42390|36.73 35.4|Rexxar|artifact",
		[42392] = "Survive the Night|10+ hunter 43335|36.73 35.4|Rexxar|artifact",
		[42410] = "Champion: Rexxar|10+ hunter 42392|36.73 35.4|Rexxar|artifact",

		-- Enchanting
		[39879] = "Strong Like the Earth|10+ enchanting 39878|46.73 60.42|Guron Twaintail|enchanting link:750",
		[39880] = "Waste Not|10+ enchanting 39878|46.73 60.42|Guron Twaintail|enchanting link:750",
		[39883] = "Cloaked in Tradition|10+ enchanting 39879 39880|46.73 60.42|Guron Twaintail|enchanting link:750",

		-- Herbalism - Foxflower
		[40024] = "Foxflower Sample|10+ herbalism|3 Foxflower|{1387616} [Foxflower Sample]|herbalism discovery|Gathered from Foxflower",
		[40025] = "Teeny Bite Marks|10+ herbalism 40024|3 Foxflower|{960686} [Nibbled Foxflower Stem]|herbalism discovery|Gathered from Foxflower",
		[40028] = "The Pied Picker|10+ herbalism 40026|3 Foxflower|{656439} [Foxflower Scent Gland]|herbalism discovery|Gathered from Foxflower",

		-- Herbalism - Felwort
		[40040] = "Felwort Sample|10+ herbalism 45727,43341|6 Felwort|{1387614} [Felwort Sample]|herbalism discovery|Gathered from Felwort", -- Available after unlocking World Quests

		-- Mining - Leystone
		[38777] = "Leystone Deposit Sample|10+ mining|1 LeystoneDeposit|{1394960} [Leystone Deposit Sample]|mining discovery|Mined from Leystone Deposits",
		[38784] = "Leystone Seam Sample|10+ mining|2 LeystoneSeam|{1394960} [Leystone Seam Sample]|mining discovery|Mined from Leystone Seams",
		[38785] = "Living Leystone Sample|10+ mining|3 LivingLeystone|{1394960} [Living Leystone Sample]|mining discovery|Mined from Leystone creatures",
		[38888] = "The Highmountain Tauren|10+ mining 38777 38784 38785|55.09 84.05|Mama Diggs|mining elsewhere link:627", -- Available after completing all rank 1 Leystone quests
		[38786] = "Where Respect is Due|10+ mining 38888|55.09 84.05|Ronos Ironhorn|mining",
		[38787] = "The Legend of Rethu Ironhorn|10+ mining 38786|55.09 84.05|Ronos Ironhorn|mining",
		[38789] = "Rethu's Journal|10+ mining 38787|1 LeystoneDeposit|{237388} [Torn Journal Page]|mining discovery|Mined from Leystone Deposits",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 LeystoneDeposit|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Deposits",
		[38790] = "Rethu's Pick|10+ mining 38787|2 LeystoneSeam|{1060565} [Battered Mining Pick]|mining discovery|Mined from Leystone Seams",
		[38793] = "Rethu's Experience|10+ mining 38790|2 LeystoneSeam|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Seams",
		[38791] = "Rethu's Horn|10+ mining 38787|3 LivingLeystone|{237403} [Chunk of Horn]|mining discovery|Mined from Leystone creatures",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|3 LivingLeystone|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone creatures",
		
		-- Mining - Felslate
		[38795] = "Felslate Deposit Sample|10+ mining|4 FelslateDeposit|{1394961} [Felslate Deposit Sample]|mining discovery|Mined from Felslate Deposits",
		[38796] = "Felslate Seam Sample|10+ mining|5 FelslateSeam|{1394961} [Felslate Seam Sample]|mining discovery|Mined from Felslate Seams",
		[38797] = "Living Felslate Sample|10+ mining|6 LivingFelslate|{1394961} [Living Felslate Sample]|mining discovery|Mined from Felslate creatures",
		[38800] = "Rin'thissa's Eye|10+ mining 38799|4 FelslateDeposit|{237298} [Ore-Bound Eye]|mining discovery|Mined from Felslate Deposits",
		[38803] = "Rin'thissa|10+ mining 38800|4 FelslateDeposit|Rin'thissa|mining discovery|Rin'thissa has a chance to appear after mining Felslate Deposits",
		[38801] = "Lyrelle's Right Arm|10+ mining 38799|5 FelslateSeam|{571556} [Severed Arm]|mining discovery|Mined from Felslate Seams",
		[38804] = "Lyrelle|10+ mining 38801|5 FelslateSeam|Lyrelle|mining discovery|Lyrelle has a chance to appear after mining Felslate Seams",
		[38802] = "Ondri's Still-Beating Heart|10+ mining 38799|6 LivingFelslate|{134339} [Ore-Choked Heart]|mining discovery|Mined from Felslate creatures",
		[38805] = "Ondri|10+ mining 38802|6 LivingFelslate|Ondri|mining discovery|Ondri has a chance to appear after mining Felslate creatures",

		-- Mining - Infernal Brimstone
		[38806] = "Infernal Brimstone Sample|45+ mining 45727,43341|7 InfernalBrimstone|{1394959} [Infernal Brimstone Sample]|mining discovery|Mined from Brimstone Destroyer Core",
	},

	-- Thunder Totem
	[750] = {
		-- The Rivermane Tribe
		[42590] = "Moozy's Reunion|10+ 39572|45.89 54.92|Sella Waterwise",
		[38911] = "The Rivermane Tribe|10+ 38907|44.5 50.71|Mayla Highmountain|down link:652",
		[39491] = "Ormgul the Pestilent|10+ 38911|21.05 41.74|Jale Rivermane",
		[39272] = "Poisoned Crops|10+ 38911|21.42 41.68|Farmer Maya",
		[39490] = "Infestation|10+ 38911|21.42 41.68|Farmer Maya",
		[39496] = "The Flow of the River|10+ 39491 39272 39490|21.05 41.74|Jale Rivermane",

		-- The Skyhorn Tribe
		[38913] = "The Skyhorn Tribe|10+ 38909|44.5 50.71|Mayla Highmountain|down link:652",

		-- The Bloodtotem Tribe
		[38912] = "The Bloodtotem Tribe|10+ 38909|44.5 50.71|Mayla Highmountain|down link:652",

		-- Huln's War
		[40515] = "A Walk With the Spirits|10+ 38909 -40167|44.5 50.71|Mayla Highmountain|down link:652",
		[40167] = "The Story of Huln|10+ 40515|51.48 54.87|Spiritwalker Ebonhorn|down link:652",
		[40520] = "To See the Past|10+ 40167|51.48 54.87|Spiritwalker Ebonhorn|down link:652",
		[39983] = "Huln's War - The Arrival|10+ 40520|51.48 54.87|Spiritwalker Ebonhorn|down link:652",
		[40112] = "Huln's War - Malorne's Favored|10+ 39983|51.48 54.87|Spiritwalker Ebonhorn|down link:652",
		[39988] = "Huln's War - Stormrage|10+ 40112|51.48 54.87|Spiritwalker Ebonhorn|down link:652",
		[39990] = "Huln's War - Reinforcements|10+ 39988|51.48 54.87|Spiritwalker Ebonhorn|down link:652",
		[39992] = "Huln's War - The Nathrezim|10+ 39990|51.48 54.87|Spiritwalker Ebonhorn|down link:652",

		-- Secrets of Highmountain
		[38916] = "Secrets of Highmountain|10+ 39992|51.48 54.87|Spiritwalker Ebonhorn|down link:652",
		[39575] = "The Path of Huln|10+ 38916|30.45 85.65|Spiritwalker Ebonhorn",

		-- Battle of Snowblind Mesa
		[38915] = "Battle of Snowblind Mesa|10+ 39387 39456 39992 39580|44.5 50.71|Mayla Highmountain|down link:652",

		-- Thunder Totem
		[42596] = "Mountainstrider Round-Up|10+ 38909|53.94 45.8|Liza Galestride",
		[42630] = "Bolas Bastion|10+ 39387|42.95 38.79|Bolas Skyfeather",
		[40217] = "An Offering of Ammo|10+ 39387,39456 ~39417 -40170|42.32 46.97|Shale Greyfeather",
		[42622] = "Ceremonial Drums|10+ 39992|44.52 55.85|Torv Dubstomp|down link:652",

		-- Crystal Fissure
		[39134] = "Wrathshard|10+ 38909|61.94 6.41|Warbrave Nava",
		[39133] = "No Time to talk|10+ 38909|61.94 6.41|Warbrave Nava",

		-- Enchanting
		[39879] = "Strong Like the Earth|10+ enchanting 39878|44.49 45.54|Guron Twaintail|enchanting",
		[39880] = "Waste Not|10+ enchanting 39878|44.49 45.54|Guron Twaintail|enchanting",
		[39883] = "Cloaked in Tradition|10+ enchanting 39879 39880|44.49 45.54|Guron Twaintail|enchanting",
	},

	-- Hall of Chieftains, Thunder Totem
	[652] = {
		-- The Rivermane Tribe
		[42590] = "Moozy's Reunion|10+ 39572|57.96 75.66|Sella Waterwise|up link:750",
		[38911] = "The Rivermane Tribe|10+ 38907|54.81 63.2|Mayla Highmountain",

		-- The Skyhorn Tribe
		[38913] = "The Skyhorn Tribe|10+ 38909|54.81 63.2|Mayla Highmountain",

		-- The Bloodtotem Tribe
		[38912] = "The Bloodtotem Tribe|10+ 38909|54.81 63.2|Mayla Highmountain",

		-- Huln's War
		[40515] = "A Walk With the Spirits|10+ 38909 -40167|54.81 63.2|Mayla Highmountain",
		[40167] = "The Story of Huln|10+ 40515|74.81 75.12|Spiritwalker Ebonhorn",
		[40520] = "To See the Past|10+ 40167|74.81 75.12|Spiritwalker Ebonhorn",
		[39983] = "Huln's War - The Arrival|10+ 40520|74.81 75.12|Spiritwalker Ebonhorn",
		[40112] = "Huln's War - Malorne's Favored|10+ 39983|74.81 75.12|Spiritwalker Ebonhorn",
		[39988] = "Huln's War - Stormrage|10+ 40112|74.81 75.12|Spiritwalker Ebonhorn",
		[39990] = "Huln's War - Reinforcements|10+ 39988|74.81 75.12|Spiritwalker Ebonhorn",
		[39992] = "Huln's War - The Nathrezim|10+ 39990|74.81 75.12|Spiritwalker Ebonhorn",

		-- Secrets of Highmountain
		[38916] = "Secrets of Highmountain|10+ 39992|74.81 75.12|Spiritwalker Ebonhorn",

		-- Battle of Snowblind Mesa
		[38915] = "Battle of Snowblind Mesa|10+ 39387 39456 39992 39580|54.81 63.2|Mayla Highmountain",

		-- Thunder Totem
		[42596] = "Mountainstrider Round-Up|10+ 38909|78 45|Liza Galestride|up link:750",
		[42630] = "Bolas Bastion|10+ 39387|50.4 29.98|Bolas Skyfeather|up link:750",
		[40217] = "An Offering of Ammo|10+ 39387,39456 ~39417 -39859 -40170|48.46 52.46|Shale Greyfeather|up link:750",
		[42622] = "Ceremonial Drums|10+ 39992|54.86 77.92|Torv Dubstomp",

		-- Enchanting
		[39879] = "Strong Like the Earth|10+ enchanting 39878|54.9 48.34|Guron Twaintail|enchanting up link:750",
		[39880] = "Waste Not|10+ enchanting 39878|54.9 48.34|Guron Twaintail|enchanting up link:750",
		[39883] = "Cloaked in Tradition|10+ enchanting 39879 39880|54.9 48.34|Guron Twaintail|enchanting up link:750",
	},

	-- Bitestone Enclave
	[651] = {
		-- Riverbend
		[39043] = "Bitestone Enclave|10+ 39025 39026|11.66 25.94|Warbrave Oro",
		[39027] = "Dargrul and the Hammer|10+ 39043|47.32 44.44|Warbrave Oro",
	},

	-- Cave of the Blood Trial
	[653] = {
		-- The Bloodtotem Tribe
		[39860] = "Rite of Blood|10+ 39455|59.72 32.69|Torok Bloodtotem",
		[39381] = "Rock Troll in a Hard Place|10+ 39860|40.53 84.14|Navarogg",
	},

	-- Stonedark Grotto
	[659] = {
		-- The Bloodtotem Tribe
		[39456] = "Unexpected Allies|10+ 40229|40.37 53.05|Navarogg",

		-- Stonedark Grotto
		[39440] = "You Lift, Brul?|10+ 40229|52.38 62.7|Damrul the Stronk",
		[39438] = "Guhruhlruhlruh|10+ 39440|52.38 62.7|Damrul the Stronk",
		[39437] = "Deep in the Cavern|10+ 39440|52.38 62.7|Damrul the Stronk",
		[39439] = "Stonedark Relics|10+ 39440|52.38 62.7|Damrul the Stronk",
	},

	-- Path of Huln
	[657] = {
		-- Secrets of Highmountain
		[40219] = "In Defiance of Deathwing|10+ 39575|43.22 28.21|Spiritwalker Ebonhorn",
		[39578] = "Titanic Showdown|10+ 40219|43.22 28.21|Spiritwalker Ebonhorn",
		[39577] = "An Ancient Secret|10+ 39578|49.12 72.25|Spiritwalker Ebonhorn",
		[39579] = "The Backdoor|10+ 39577|61.3 72.5|Spiritwalker Ebonhorn",
	},

	-- Dungeon: Neltharion's Lair
	[731] = {
		-- The Hammer of Khaz'goroth
		[42454] = "The Hammer of Khaz'goroth|10+ 39781|16.9 63|Hammer of Khaz'goroth|dungeon",
	},


	--[[ Stormheim ]]--

	-- Stormheim
	[634] = {
		-- Stormforged Grapple Launcher
		[39775] = {
			-- Technically they can all be picked up by either faction, but we'll hide the ones that are heavily guarded by opposite-faction NPCs
			"Stormforged Grapple Launcher|10+ alliance|33.82 45.74|Stormforged Grapple Launcher", -- Weeping Bluffs
			"Stormforged Grapple Launcher|10+ horde|37 31.8|Stormforged Grapple Launcher", -- Forsaken Foothold
			"Stormforged Grapple Launcher|10+ alliance|37.35 63.77|Stormforged Grapple Launcher", -- Lorna's Watch
			"Stormforged Grapple Launcher|10+ horde|44.86 59.25|Stormforged Grapple Launcher", -- Cullen's Post
			"Stormforged Grapple Launcher|10+ horde|58.05 68.57|Stormforged Grapple Launcher", -- Skold-Ashil
			"Stormforged Grapple Launcher|10+ alliance|58.05 68.57|Stormforged Grapple Launcher", -- Crowley's Overlook
			"Stormforged Grapple Launcher|10+|75.02 55.54|Stormforged Grapple Launcher", -- Dreyrgrot
			"Stormforged Grapple Launcher|10+|69.43 46.14|Stormforged Grapple Launcher", -- Haustvald
			"Stormforged Grapple Launcher|10+|51.35 57.29|Stormforged Grapple Launcher", -- Talonrest
			"Stormforged Grapple Launcher|10+|89.88 11.29|Stormforged Grapple Launcher", -- Shield's Rest
		},

		-- Greymane's Gambit
		[44700] = "Stormheim|10+ -39735 -38035 alliance|30.27 40.56|Archmage Landon", -- Alliance
		[44701] = "Stormheim|10+ -39864 -38307 horde|30.27 40.56|Archmage Landon", -- Horde
		[38035] = "A Royal Summons|10+ 39735,44700 alliance|30.08 40.71|Sky Admiral Rogers|elsewhere link:627|Visit {!}Sky Admiral Rogers in the Violet Citadel to continue the Stormheim story", -- Alliance
		[38307] = "The Warchief Beckons|10+ 39864,44701 horde|30.08 40.71|Nathanos Blightcaller|elsewhere link:627|Visit {!}Nathanos Blightcaller in the Violet Citadel to continue the Stormheim story", -- Horde
		[38206] = "Making the Rounds|10+ 38035 alliance|30.08 40.71|Sky Admiral Rogers|elsewhere link:627|Visit {!}Sky Admiral Rogers in the Violet Citadel to continue the Stormheim story", -- Alliance
		[39698] = "Making the Rounds|10+ 38307 horde|30.08 40.71|Lady Sylvanas Windrunner|elsewhere link:1|Visit {!}Lady Sylvanas Windrunner in Bladefist Bay to continue the Stormheim story", -- Horde
		[39800] = "Greymane's Gambit|10+ 38206 alliance|30.08 40.71|Genn Greymane|elsewhere link:84|Visit {!}Genn Greymane aboard the Skyfire in Stormwind Harbor to continue the Stormheim story", -- Alliance
		[39801] = "The Splintered Fleet|10+ 39698 horde|30.08 40.71|Lady Sylvanas Windrunner|elsewhere link:1|Visit {!}Lady Sylvanas Windrunner in Bladefist Bay to continue the Stormheim story", -- Horde

		-- The Aftermath - Alliance
		[38036] = "Supplies From the Skies|10+ 39800 alliance|33.76 50.76|Mishka",
		[38052] = "Boarded!|10+ 39800 alliance|33.72 51.02|Sky Admiral Rogers",
		[38053] = "Assault and Battery|10+ 39800 alliance|33.6 50.82|Tinkmaster Overspark",
		[38558] = "See Ya Later, Oscillator|10+ 39800 alliance|33.6 50.82|Tinkmaster Overspark",
		[38058] = "Lightning Rod|10+ 38036 38052 38053 38558 alliance|33.6 50.82|Tinkmaster Overspark",
		[38060] = "Signal Boost|10+ 38058 alliance|33.6 50.82|Tinkmaster Overspark", -- Auto-Accept after Lightning Rod
		[38057] = "The Lost Legion|10+ 38036 38052 38053 38558 alliance|33.76 50.76|Mishka",
		[38059] = "Pins and Needles|10+ 38057 alliance|31.18 57.96|Knight-Captain Rhodes",

		-- The Aftermath - Horde
		[38358] = "Pump it Up|10+ 39801 horde|36.11 27.37|Apothecary Withers",
		[38357] = "Side Effects May Include Mild Undeath|10+ 39801 horde|36.11 27.37|Apothecary Withers",
		[38332] = "The Ranger Lord|10+ 39801 horde|36.08 27.56|Dread-Rider Cullen",
		[38360] = "The Windrunner's Fate|10+ 38332 horde|37.9 21.55|Nathanos Blightcaller",
		[38361] = "Wrath of the Blightcaller|10+ 38332 horde|37.9 21.55|Nathanos Blightcaller",
		[38362] = "A Grim Trophy|10+ 38360 38361 horde|44.11 18.19|Nathanos Blightcaller",
		[38308] = "Eyes in the Overlook|10+ 38362 horde|36.74 31.12|Cullen's Scouting Report",
		[38317] = "Masters of Disguise|10+ 38308 horde|33.33 31.41|Spymaster Knockwhistle",

		-- The Trial of Might
		[38210] = "The Ancient Trials|10+ 38060 alliance|33.75 45.84|Muninn", -- Alliance
		[38459] = "The Ancient Trials|10+ 38362 horde|36.8 31.02|Huginn", -- Horde
		[38331] = {"Havi's Test|10+ 38210 alliance|43.17 49.15|Havi", "Havi's Test|10+ 38459 horde|41.83 43.06|Havi",}, -- Havi's location changes depending on faction
		[39590] = {"Ahead of the Game|10+ 38331 alliance|43.17 49.15|Havi", "Ahead of the Game|10+ 38331 horde|41.83 43.06|Havi",},
		[39595] = "Blood and Gold|10+ 38331|44.32 44.53|{132594} [Challenger's Tribute]||Drops from Bloodtotem, Felskorn and Mightstone challengers in the area",
		[39591] = "A Trial of Valor|10+ 39590|46.73 44.44|Yotnar's Head",
		[39592] = "A Trial of Will|10+ 39590|46.73 44.44|Yotnar's Head",
		[39593] = "The Shattered Watcher|10+ 39590|46.73 44.44|Yotnar's Head",
		[39594] = "A Trial of Might|10+ 39591 39592 39593|46.73 44.44|Yotnar",
		[39597] = "The Blessing of the Watchers|10+ 39594|46.32 44.83|Yotnar",

		-- The Trial of Will
		[38337] = "Built to Scale|10+ alliance|44.45 64.34|{134308} [Storm Drake Scale]||Drops from Stormwing Drakes in Hrydshal", -- Alliance
		[38616] = "Built to Scale|10+ horde|44.45 64.34|{134308} [Storm Drake Scale]||Drops from Stormwing Drakes in Hrydshal", -- Horde
		[38473] = "Will of the Thorignir|10+ 39597 alliance|43.17 49.15|Havi", -- Alliance
		[38611] = "Will of the Thorignir|10+ 39597 horde|41.83 43.06|Havi", -- Horde
		[38312] = "A Grapple a Day|10+ 38473 alliance|37.38 63.85|Commander Lorna Crowley", -- Alliance
		[38612] = "A Grapple a Day|10+ 38611 horde|44.83 59.34|Dread-Rider Cullen", -- Horde
		[38318] = "No Wings Required|10+ 39775 38312 alliance|42.02 64.48|Commander Lorna Crowley", -- Alliance
		[38613] = "No Wings Required|10+ 39775 38612 horde|46.56 67.78|Dread-Rider Cullen", -- Horde
		[38405] = "To Weather the Storm|10+ 39775 38312 alliance|42.02 64.48|Commander Lorna Crowley", -- Alliance
		[38614] = "To Weather the Storm|10+ 39775 38612 horde|46.56 67.78|Dread-Rider Cullen", -- Horde
		[38410] = "Impalement Insurance|10+ 38318 38405 alliance|43.8 68.21|Commander Lorna Crowley", -- Alliance
		[38615] = "Impalement Insurance|10+ 38613 38614 horde|43.7 67.87|Dread-Rider Cullen", -- Horde
		[38342] = "Another Way|10+ 38410 alliance|46.24 70.38|Commander Lorna Crowley", -- Alliance
		[38617] = "Another Way|10+ 38615 horde|47 71.73|Dread-Rider Cullen", -- Horde
		[38412] = "Above the Winter Moonlight|10+ 38342 alliance|45.8 72.91|Commander Lorna Crowley", -- Alliance
		[38618] = "Above the Winter Moonlight|10+ 38617 horde|45.8 72.91|Dread-Rider Cullen", -- Horde
		[38414] = "Heart of a Dragon|10+ 38412,38618|44.81 77.4|Vethir",
		[38413] = "Wings of Liberty|10+ 38412,38618|44.81 77.4|Vethir",
		[40568] = "Fury of the Storm|10+ 38412,38618|44.81 77.4|Vethir",
		[39652] = "Where Dragons Rule|10+ 38414 38413 40568|42.78 82.71|Vethir",
		[38624] = "Cry Thunder!|10+ 39652|40.87 81.01|Thrymjaris",

		-- The Trial of Valor
		[39803] = "The Trials Continue|10+ 38624|48.03 54.55|Huginn",
		[39804] = "Speaking of Bones|10+ 39803|60.14 50.74|Havi",
		[39796] = "To Haustvald|10+ 39804|60.14 50.74|Havi",
		[38778] = "Turn the Keys|10+ 39796|68.54 54.39|Vydhar",
		[39788] = "The Runewood's Revenge|10+ 39796|68.54 54.39|Vydhar",
		[38810] = "The Dreaming Fungus|10+ 38778 39788|68.54 54.39|Vydhar",
		[38808] = "Bjornharta|10+ 38778 39788|68.54 54.39|Vydhar",
		[38811] = "Judgment Day|10+ 38810 38808|68.54 54.39|Vydhar",
		[39791] = "Lay Them to Rest|10+ 38810 38808|68.54 54.39|Vydhar",
		[38817] = "Regal Remains|10+ 38811|68.16 48.72|Shieldmaiden Iounn",
		[38816] = "Breaking the Bonespeakers|10+ 38811|68.16 48.72|Shieldmaiden Iounn",
		[38823] = "The Runes that Bind|10+ 38811|69.82 45.75|Rune-Carved Tablet",
		[38815] = "Waking the Shieldmaiden|10+ 38817 38816 38823|69.9 45.49|Shieldmaiden Iounn",
		[38818] = "The Final Judgment|10+ 38815|71.45 42.5|Ashildir",

		-- To Helheim and Back
		[39837] = "An Unworthy Task|10+ 38818|73.57 39.48|Ashildir|elsewhere link:649",
		[38339] = "A Little Kelp From My Foes|10+ 39837|73.57 39.48|Colborn the Unworthy|elsewhere link:649",
		[38324] = "Accessories of the Cursed|10+ 39837|73.57 39.48|Colborn the Unworthy|elsewhere link:649",
		[38347] = "Stealth by Seaweed|10+ 38339 38324|73.57 39.48|Colborn the Unworthy|elsewhere link:649",
		[39848] = "A Desperate Bargain|10+ 38347|73.57 39.48|Ashildir|elsewhere link:649",
		[39857] = "The Eternal Nemesis|10+ 39848|73.57 39.48|Helya's Altar|elsewhere link:649",
		[39849] = "To Light the Way|10+ 39857|73.57 39.48|Ashildir|elsewhere link:649",
		[39850] = "Sundered|10+ 39849|73.57 39.48|Ashildir|elsewhere link:649",
		[39851] = "Allies in Death|10+ 39849|73.57 39.48|Ashildir|elsewhere link:649",
		[39853] = "Victory is Eternal|10+ 39850 39851|73.57 39.48|Ashildir|elsewhere link:649",
		[39855] = "Paid in Lifeblood|10+ 39853|73.57 39.48|Ashildir|elsewhere link:649",

		-- Secrets of the Shieldmaidens
		[39059] = "To Catch a Banshee|10+ 39855 alliance|59.97 51.36|Ensign Ward", -- Alliance
		[38872] = "The Dark Lady's Bidding|10+ 39855 horde|59.97 51.36|Dread-Rider Cullen", -- Horde
		[39060] = "Combustible Contagion|10+ 39059 alliance|71.53 59.82|Genn Greymane", -- Alliance
		[39061] = "Whispers from the Dark|10+ 39059 alliance|71.53 59.82|Genn Greymane", -- Alliance
		[38873] = "Clear the Deck!|10+ 38872 horde|55.06 72.53|Nathanos Blightcaller", -- Horde
		[39153] = "Dreadwake's Dilemma|10+ 38872 horde|55.06 72.53|Nathanos Blightcaller", -- Horde
		[39385] = "A Gift for Greymane|10+ 38872 horde|57.66 71.88|Gilnean Heavy Explosive", -- Horde
		[39472] = "Cut Out the Heart|10+ 39059 alliance|72.41 61.02|Forsaken Battle Plans", -- Alliance
		[39062] = "To Skold-Ashil|10+ 39060 39061 39472 alliance|71.53 59.82|Genn Greymane", -- Alliance
		[39154] = "To Skold-Ashil|10+ 38873 39153 39385 horde|55.06 72.53|Nathanos Blightcaller", -- Horde
		[39405] = {"Stories of Battle|10+ 39062,39154|63.45 64.74|Ashilvara, Verse 1", "Stories of Battle|10+ 39062,39154|58.56 64.2|Ashilvara, Verse 1",},
		[39063] = "Shielded Secrets|10+ 39062 alliance|63.56 61.73|Commander Lorna Crowley", -- Alliance
		[38878] = "Shielded Secrets|10+ 39154 horde|56.76 66.3|Lady Sylvanas Windrunner", -- Horde
		[39092] = "Becoming the Ascendant|10+ 39063 alliance|60.59 65.08|Commander Lorna Crowley", -- Alliance
		[39155] = "Becoming the Ascendant|10+ 38878 horde|60.91 65.3|Lady Sylvanas Windrunner", -- Horde
		[39122] = "Ending the New Beginning|10+ 39092 alliance|62.31 68.09|Genn Greymane", -- Alliance
		[38882] = "A New Life for Undeath|10+ 39155 horde|62.55 68.07|Lady Sylvanas Windrunner", -- Horde

		-- The Champion of Stormheim
		[40078] = "A Heavy Burden|10+ 39855|60.14 50.74|Havi",
		[40001] = "Knocking on Valor's Door|10+ 40078|60.14 50.74|Havi",
		[40002] = "A Familiar Fate|10+ 40001|65.9 59.48|Vethir",
		[40003] = "Stem the Tide|10+ 40002|65.9 59.48|Vethir",
		[40004] = "Break the Spine|10+ 40002|65.9 59.48|Vethir",
		[40005] = "Stormheim's Salvation|10+ 40003 40004|70.2 69.48|Vethir",
		[40072] = "Halls of Valor: Securing the Aegis|10+ 40005|70.26 69.25|Havi|dungeon",
		[43349] = "The Aegis of Aggramar|10+ 40072|71.4 70.4|The Aegis of Aggramar|dungeon link:705|Available after defeating Odyn in Halls of Valor",

		-- Lock, Stock and Two Smoking Goblins
		[39789] = "Eating Into Our Business|10+|51.46 56.95|Ootasa Galehoof",
		[39793] = "Only the Finest|10+ 39789|51.46 57.06|Rax Sixtrigger",
		[39787] = "Rigging the Wager|10+ 39789|51.27 57.2|Snaggle Sixtrigger",
		[39792] = "A Stack of Racks|10+ 39793 39787|51.37 57.28|Rax Sixtrigger",
		[39786] = "A Stone Cold Gamble|10+ 39793 39787|51.32 56.99|Snaggle Sixtrigger",
		[42483] = "Put It All on Red|10+ 39792 39786|51.38 57.32|Snaggle Sixtrigger",
		[43331] = "Time to Collect|45+ 42483|51.38 57.19|Gazrix Gearlock|elsewhere link:627|Visit {!}Gazrix Gearlock in Dalaran to get revenge on the Sixtrigger brothers",

		-- Plight of the Blackfeather
		[42444] = "Plight of the Blackfeather|10+|50.31 34.04|Frightened Ravenbear",
		[42446] = "Singed Feathers|10+ 42444|49.79 32.63|Cukkaw",
		[42445] = "Nithogg's Tribute|10+ 42444|49.98 32.65|Intact Greatstag Antler",
		[42447] = "Dances With Ravenbears|10+ 42446 42445|49.79 32.63|Cukkaw",

		-- Dreyrgrot
		[42640] = "The Value of Knowledge|10+|75.53 50.8|Crate of Ancient Relics",
		[42635] = "The Mystery of Dreyrgrot|10+|74.91 55.58|Sir Finley Mrrgglton",
		[42639] = "A Stone of Blood|10+|74.91 55.58|Sir Finley Mrrgglton",
		[42641] = "What the Bonespeakers Buried|10+ 42635 42639|74.91 55.58|Sir Finley Mrrgglton",
		[42645] = "Spilling Bad Blood|10+ 42635 42639|74.91 55.58|Sir Finley Mrrgglton",

		-- Morheim
		[40120] = "A Murky Fate|10+|78.24 58.66|Morheim Ancestor",

		-- Tideskorn Harbor
		[39984] = "Remnants of the Past|10+|63 48.6|Watcher's Journal",
		[40046] = "Scavenging the Shallows|10+ 39984|58.93 42.81|Havi",
		[43595] = "To Honor the Fallen|10+ 39984|58.93 42.81|Havi",
		[40044] = "Shadows in the Mists|10+ 39984|58.93 42.81|Havi",
		[43596] = "Maw of Souls: Piercing the Mists|45+ 40046 43595 40044|58.93 42.81|Havi|dungeon",

		-- Deemed Worthy
		[44720] = "A Call to Action|45+ -44771|60.07 50.7|Muninn|elsewhere link:627|Visit Muninn in Krasus' Landing to start the Trial of Valor story",
		[44771] = "A Threat Rises|45+ 44720|60.14 50.74|Havi",
		[44721] = "Helya's Conquest|45+ 44771|60.14 50.74|Havi",
		[44729] = "Trial of Valor: Odyn's Favor|45+ 44721|60.14 50.74|Havi|raid",
		[44868] = "Trial of Valor: Odyn's Judgment|45+ 44729|69.5 72.82|Odyn|raid link:807|Available after defeating Odyn in Trial of Valor",
		[45088] = "Trial of Valor: The Lost Army|45+ 44721|69.5 72.82|Odyn|raid link:807|Available after defeating Odyn in Trial of Valor",

		-- Hunter - Beastmaster Hilaire
		[42391] = "Bite of the Beast|10+ hunter 42389|34.73 41.59|Beastmaster Hilaire|artifact",
		[42411] = "Champion: Beastmaster Hilaire|10+ hunter 42391|34.73 41.59|Beastmaster Hilaire|artifact",
		[42393] = "Homecoming|10+ hunter 42411|34.73 41.59|Beastmaster Hilaire|artifact",

		-- Rogue - Mystery at Citrine Bay
		[44155] = "Searching For Clues|10+ rogue 44116|77.27 55.02|Fleet Admiral Tethys|artifact",
		[44117] = "Time Flies When Yer Havin' Rum!|10+ rogue 44116|77.27 55.02|Fleet Admiral Tethys|artifact",
		[44177] = "Dark Secrets and Shady Deals|10+ rogue 44155 44117|77.25 55.07|Fleet Admiral Tethys|artifact",

		-- Herbalism - Fjarnskaggl
		[40029] = "Fjarnskaggl Sample|10+ herbalism|4 Fjarnskaggl|{1387615} [Fjarnskaggl Sample]|herbalism discovery|Gathered from Fjarnskaggl",
		[40030] = "Ram's-Horn Trowel|10+ herbalism 40029|4 Fjarnskaggl|{134436} [Ram's-Horn Trowel]|herbalism discovery|Gathered from Fjarnskaggl",
		[40032] = "The Missing Page|10+ herbalism 40031|4 Fjarnskaggl|{134938} [Runed Journal Page]|herbalism discovery|Gathered from Fjarnskaggl",

		-- Herbalism - Felwort
		[40040] = "Felwort Sample|10+ herbalism 45727,43341|6 Felwort|{1387614} [Felwort Sample]|herbalism discovery|Gathered from Felwort", -- Available after unlocking World Quests

		-- Mining - Leystone
		[38777] = "Leystone Deposit Sample|10+ mining|1 LeystoneDeposit|{1394960} [Leystone Deposit Sample]|mining discovery|Mined from Leystone Deposits",
		[38784] = "Leystone Seam Sample|10+ mining|2 LeystoneSeam|{1394960} [Leystone Seam Sample]|mining discovery|Mined from Leystone Seams",
		[38785] = "Living Leystone Sample|10+ mining|3 LivingLeystone|{1394960} [Living Leystone Sample]|mining discovery|Mined from Leystone creatures",
		[38789] = "Rethu's Journal|10+ mining 38787|1 LeystoneDeposit|{237388} [Torn Journal Page]|mining discovery|Mined from Leystone Deposits",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 LeystoneDeposit|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Deposits",
		[38790] = "Rethu's Pick|10+ mining 38787|2 LeystoneSeam|{1060565} [Battered Mining Pick]|mining discovery|Mined from Leystone Seams",
		[38793] = "Rethu's Experience|10+ mining 38790|2 LeystoneSeam|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Seams",
		[38791] = "Rethu's Horn|10+ mining 38787|3 LivingLeystone|{237403} [Chunk of Horn]|mining discovery|Mined from Leystone creatures",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|3 LivingLeystone|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone creatures",

		-- Mining - Felslate
		[38795] = "Felslate Deposit Sample|10+ mining|4 FelslateDeposit|{1394961} [Felslate Deposit Sample]|mining discovery|Mined from Felslate Deposits",
		[38796] = "Felslate Seam Sample|10+ mining|5 FelslateSeam|{1394961} [Felslate Seam Sample]|mining discovery|Mined from Felslate Seams",
		[38797] = "Living Felslate Sample|10+ mining|6 LivingFelslate|{1394961} [Living Felslate Sample]|mining discovery|Mined from Felslate creatures",
		[38800] = "Rin'thissa's Eye|10+ mining 38799|4 FelslateDeposit|{237298} [Ore-Bound Eye]|mining discovery|Mined from Felslate Deposits",
		[38803] = "Rin'thissa|10+ mining 38800|4 FelslateDeposit|Rin'thissa|mining discovery|Rin'thissa has a chance to appear after mining Felslate Deposits",
		[38801] = "Lyrelle's Right Arm|10+ mining 38799|5 FelslateSeam|{571556} [Severed Arm]|mining discovery|Mined from Felslate Seams",
		[38804] = "Lyrelle|10+ mining 38801|5 FelslateSeam|Lyrelle|mining discovery|Lyrelle has a chance to appear after mining Felslate Seams",
		[38802] = "Ondri's Still-Beating Heart|10+ mining 38799|6 LivingFelslate|{134339} [Ore-Choked Heart]|mining discovery|Mined from Felslate creatures",
		[38805] = "Ondri|10+ mining 38802|6 LivingFelslate|Ondri|mining discovery|Ondri has a chance to appear after mining Felslate creatures",

		-- Mining - Infernal Brimstone
		[38806] = "Infernal Brimstone Sample|45+ mining 45727,43341|7 InfernalBrimstone|{1394959} [Infernal Brimstone Sample]|mining discovery|Mined from Brimstone Destroyer Core",
	},

	-- Stormscale Cavern
	[636] = {
		-- The Aftermath (Alliance)
		[38059] = "Pins and Needles|10+ 38057 alliance|77.16 48.34|Knight-Captain Rhodes",
	},

	-- Helheim
	[649] = {
		-- To Helheim and Back
		[39837] = "An Unworthy Task|10+ 38818|65.59 47.15|Ashildir",
		[38339] = "A Little Kelp From My Foes|10+ 39837|64.62 43.38|Colborn the Unworthy",
		[38324] = "Accessories of the Cursed|10+ 39837|64.62 43.38|Colborn the Unworthy",
		[38347] = "Stealth by Seaweed|10+ 38339 38324|64.62 43.38|Colborn the Unworthy",
		[39848] = "A Desperate Bargain|10+ 38347|46.81 48.97|Ashildir",
		[39857] = "The Eternal Nemesis|10+ 39848|34.11 27.88|Helya's Altar",
		[39849] = "To Light the Way|10+ 39857|46.81 48.97|Ashildir",
		[39850] = "Sundered|10+ 39849|46.81 48.97|Ashildir",
		[39851] = "Allies in Death|10+ 39849|46.81 48.97|Ashildir",
		[39853] = "Victory is Eternal|10+ 39850 39851|46.81 48.97|Ashildir",
		[39855] = "Paid in Lifeblood|10+ 39853|46.81 48.97|Ashildir",
	},

	-- Dungeon: Maw of Souls
	[706] = {
		-- Tideskorn Harbor
		[39984] = "Remnants of the Past|45+|46 90|Watcher's Journal|elsewhere link:634",
		[40046] = "Scavenging the Shallows|45+ 39984|46 90|Havi|elsewhere link:634",
		[43595] = "To Honor the Fallen|45+ 39984|46 90|Havi|elsewhere link:634",
		[40044] = "Shadows in the Mists|45+ 39984|46 90|Havi|elsewhere link:634",
		[43596] = "Maw of Souls: Piercing the Mists|45+ 40046 43595 40044|46 90|Havi|dungeon elsewhere link:634",
	},

	-- Dungeon: Halls of Valor
	[704] = {
		-- The Champion of Stormheim
		[40072] = "Halls of Valor: Securing the Aegis|10+ 40005|47.7 8.9|Havi|dungeon elsewhere link:634",
		[43349] = "The Aegis of Aggramar|10+ 40072|47.7 79.4|The Aegis of Aggramar|dungeon link:705|Available after defeating Odyn",
	},
	[705] = {
		-- The Champion of Stormheim
		[40072] = "Halls of Valor: Securing the Aegis|10+ 40005|51.1 10|Havi|dungeon elsewhere link:634",
		[43349] = "The Aegis of Aggramar|10+ 40072|50.2 88.5|The Aegis of Aggramar|dungeon|Available after defeating Odyn",
	},

	-- Raid: Trial of Valor
	[807] = {
		-- Deemed Worthy
		[44720] = "A Call to Action|45+ -44771|51.2 6.5|Muninn|elsewhere link:627|Visit Muninn in Krasus' Landing to start the Trial of Valor story",
		[44771] = "A Threat Rises|45+ 44720|51.2 6.5|Havi|elsewhere link:634",
		[44721] = "Helya's Conquest|45+ 44771|51.2 6.5|Havi|elsewhere link:634",
		[44729] = "Trial of Valor: Odyn's Favor|45+ 44721|51.2 6.5|Havi|raid elsewhere link:634",
		[44868] = "Trial of Valor: Odyn's Judgment|45+ 44729|51.36 88.56|Odyn|raid|Available after defeating Odyn",
		[45088] = "Trial of Valor: The Lost Army|45+ 44721|51.36 88.56|Odyn|raid|Available after defeating Odyn",
	},


	--[[ Suramar ]]--

	-- Suramar
	[680] = {
		-- Magic Message
		[39985] = "Khadgar's Discovery|45+ -39986 -44555|35.9 47.7|Archmage Khadgar|elsewhere link:627|Visit {!}Archmage Khadgar in the Violet Citadel to start the Suramar campaign", -- There are two versions of this quest that get marked as completed at the same time
		[39986] = "Magic Message|45+ 39985,44555|35.9 47.7|Archmage Khadgar|elsewhere link:627|Visit {!}Archmage Khadgar in the Violet Citadel to continue the Suramar campaign",
		[39987] = "Trail of Echoes|45+ 39986|35.9 47.7|Archmage Khadgar|elsewhere link:627|Visit {!}Archmage Khadgar in the Violet Citadel to continue the Suramar campaign",

		-- An Ancient Gift
		[40008] = "The Only Way Out is Through|45+ 39987|34.65 53.4|Frist Archanist Thalyssra",

		-- Herbalism - Starlight Rose
		[40034] = "Starlight Rosedust|10+ herbalism|5 StarlightRose|{1387618} [Starlight Rosedust]|herbalism discovery|Gathered from Starlight Rose",
		[40036] = "Jeweled Spade Handle|10+ herbalism 40035|5 StarlightRose|{305163} [Jeweled Spade Handle]|herbalism discovery|Gathered from Starlight Rose",
		[40038] = "Insane Ramblings|10+ herbalism 40037|5 StarlightRose|{134943} [Scribbled Ramblings]|herbalism discovery|Gathered from Starlight Rose",

		-- Herbalism - Felwort
		[40040] = "Felwort Sample|10+ herbalism 45727,43341|6 Felwort|{1387614} [Felwort Sample]|herbalism discovery|Gathered from Felwort", -- Available after unlocking World Quests

		-- Mining - Leystone
		[38777] = "Leystone Deposit Sample|10+ mining|1 LeystoneDeposit|{1394960} [Leystone Deposit Sample]|mining discovery|Mined from Leystone Deposits",
		[38784] = "Leystone Seam Sample|10+ mining|2 LeystoneSeam|{1394960} [Leystone Seam Sample]|mining discovery|Mined from Leystone Seams",
		[38785] = "Living Leystone Sample|10+ mining|3 LivingLeystone|{1394960} [Living Leystone Sample]|mining discovery|Mined from Leystone creatures",
		[38789] = "Rethu's Journal|10+ mining 38787|1 LeystoneDeposit|{237388} [Torn Journal Page]|mining discovery|Mined from Leystone Deposits",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 LeystoneDeposit|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Deposits",
		[38790] = "Rethu's Pick|10+ mining 38787|2 LeystoneSeam|{1060565} [Battered Mining Pick]|mining discovery|Mined from Leystone Seams",
		[38793] = "Rethu's Experience|10+ mining 38790|2 LeystoneSeam|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Seams",
		[38791] = "Rethu's Horn|10+ mining 38787|3 LivingLeystone|{237403} [Chunk of Horn]|mining discovery|Mined from Leystone creatures",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|3 LivingLeystone|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone creatures",

		-- Mining - Felslate
		[38795] = "Felslate Deposit Sample|10+ mining|4 FelslateDeposit|{1394961} [Felslate Deposit Sample]|mining discovery|Mined from Felslate Deposits",
		[38796] = "Felslate Seam Sample|10+ mining|5 FelslateSeam|{1394961} [Felslate Seam Sample]|mining discovery|Mined from Felslate Seams",
		[38797] = "Living Felslate Sample|10+ mining|6 LivingFelslate|{1394961} [Living Felslate Sample]|mining discovery|Mined from Felslate creatures",
		[38901] = "The Felsmiths|10+ mining 38795 38796 38797|29.93 53.32|Mama Diggs|mining elsewhere link:627", -- Available after completing all rank 1 Felslate quests
		[38798] = "A Shred of Your Humanity|10+ mining 38901|29.93 53.32|Felsmith Nal'ryssa|mining",
		[38799] = "Darkheart Thicket: Nal'ryssa's Sisters|10+ mining 38798|29.93 53.32|Felsmith Nal'ryssa|mining dungeon",
		[38800] = "Rin'thissa's Eye|10+ mining 38799|4 FelslateDeposit|{237298} [Ore-Bound Eye]|mining discovery|Mined from Felslate Deposits",
		[38803] = "Rin'thissa|10+ mining 38800|4 FelslateDeposit|Rin'thissa|mining discovery|Rin'thissa has a chance to appear after mining Felslate Deposits",
		[38801] = "Lyrelle's Right Arm|10+ mining 38799|5 FelslateSeam|{571556} [Severed Arm]|mining discovery|Mined from Felslate Seams",
		[38804] = "Lyrelle|10+ mining 38801|5 FelslateSeam|Lyrelle|mining discovery|Lyrelle has a chance to appear after mining Felslate Seams",
		[38802] = "Ondri's Still-Beating Heart|10+ mining 38799|6 LivingFelslate|{134339} [Ore-Choked Heart]|mining discovery|Mined from Felslate creatures",
		[38805] = "Ondri|10+ mining 38802|6 LivingFelslate|Ondri|mining discovery|Ondri has a chance to appear after mining Felslate creatures",

		-- Mining - Infernal Brimstone
		[38806] = "Infernal Brimstone Sample|45+ mining 45727,43341|7 InfernalBrimstone|{1394959} [Infernal Brimstone Sample]|mining discovery|Mined from Brimstone Destroyer Core",
		
	},


	--[[ Broken Shore ]]--

	[646] = {
		-- Armies of Legionfall
		[45727] = "Uniting the Isles|45+ -43341|7.22 32.9|Archmage Khadgar|link:627|Visit {!}Archmage Khadgar in the Violet Citadel to start the Broken Shore campaign",
		[46730] = "Armies of Legionfall|45+ 45727|18.5 33.1|Archmage Khadgar|link:627|Visit {!}Archmage Khadgar in Krasus' Landing to start the Broken Shore campaign",
		
		-- Assault on Broken Shore
		[46734] = "Assault on Broken Shore|45+ 46730|18.5 33.1|Archmage Khadgar|link:627|Visit {!}Archmage Khadgar in Krasus' Landing to continue the Broken Shore campaign",
		
		-- Begin Construction
		[46286] = "Legionfall Supplies|45+ 46734|44.54 63.15|Commander Chambers",
		[46245] = "Begin Construction|45+ 46286|44.54 63.15|Commander Chambers",

		-- Aalgen Point
		[46832] = "Aalgen Point|45+ 46734|44.54 63.15|Commander Chambers",

		-- Vengeance Point
		[46845] = "Vengeance Point|45+ 46832|70.76 47.61|Heidirk the Scalekeeper",

		-- Defending Broken Isles
		[46247] = "Defending Broken Isles|45+ 46286|44.54 63.52|Maiev Shadowsong",

		-- The Council's Challenge
		[46765] = "The Broken Shore: Investigating the Legion|45+ 46734|44.73 63.27|Archmage Khadgar|artifact",
		[47000] = "The Council's Call|45+ 46765 -44781|44.73 63.27|Archmage Khadgar|artifact", -- 44781 is the Auto Accept version offered in Dalaran if you do not pick this up

		-- Excavations
		[46499] = "Spiders, Huh?|45+ 46845|39.54 71.68|Excavator Karla",
		[46501] = "Grave Robbin'|45+ 46499|39.54 71.68|Excavator Karla",
		[46509] = "Tomb Raidering|45+ 46501|39.54 71.68|Excavator Karla",
		[46510] = "Ship Graveyard|45+ 46509|39.54 71.68|Excavator Karla",
		[46511] = "We're Treasure Hunters|45+ 46510|39.54 71.68|Excavator Karla",
		[46666] = "The Motherlode|45+ 46511|39.54 71.68|Excavator Karla||Available the following day after completing We're Treasure Hunters",

		-- Cathedral of Eternal Night
		[46253] = "Pillars of Creation|45+|44.73 63.27|Archmage Khadgar|dungeon",
		[46244] = "Cathedral of Eternal Night: Altar of the Aegis|45+ 46286|44.73 63.27|Archmage Khadgar|dungeon",

		-- Tomb of Sargeras
		[46805] = "The Deceiver's Downfall|45+|44.56 63.39|Prophet Velen|raid",

		-- The King's Path (Alliance)
		[46268] = "A Found Memento|45+ alliance|53.34 80.45|Battered Trinket",
		[46272] = "Summons to the Keep|45+ alliance 46268|41.6 59.6|Captain Shwayder||Available the following day after completing A Found Memento",

		-- Mining - Leystone
		[38777] = "Leystone Deposit Sample|10+ mining|1 LeystoneDeposit|{1394960} [Leystone Deposit Sample]|mining discovery|Mined from Leystone Deposits",
		[38784] = "Leystone Seam Sample|10+ mining|2 LeystoneSeam|{1394960} [Leystone Seam Sample]|mining discovery|Mined from Leystone Seams",
		[38785] = "Living Leystone Sample|10+ mining|3 LivingLeystone|{1394960} [Living Leystone Sample]|mining discovery|Mined from Leystone creatures",
		[38789] = "Rethu's Journal|10+ mining 38787|1 LeystoneDeposit|{237388} [Torn Journal Page]|mining discovery|Mined from Leystone Deposits",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 LeystoneDeposit|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Deposits",
		[38790] = "Rethu's Pick|10+ mining 38787|2 LeystoneSeam|{1060565} [Battered Mining Pick]|mining discovery|Mined from Leystone Seams",
		[38793] = "Rethu's Experience|10+ mining 38790|2 LeystoneSeam|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone Seams",
		[38791] = "Rethu's Horn|10+ mining 38787|3 LivingLeystone|{237403} [Chunk of Horn]|mining discovery|Mined from Leystone creatures",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|3 LivingLeystone|[Auto Accept]|mining discovery|Has a chance to appear after mining Leystone creatures",

		-- Mining - Felslate
		[38795] = "Felslate Deposit Sample|10+ mining|4 FelslateDeposit|{1394961} [Felslate Deposit Sample]|mining discovery|Mined from Felslate Deposits",
		[38796] = "Felslate Seam Sample|10+ mining|5 FelslateSeam|{1394961} [Felslate Seam Sample]|mining discovery|Mined from Felslate Seams",
		[38797] = "Living Felslate Sample|10+ mining|6 LivingFelslate|{1394961} [Living Felslate Sample]|mining discovery|Mined from Felslate creatures",
		[38800] = "Rin'thissa's Eye|10+ mining 38799|4 FelslateDeposit|{237298} [Ore-Bound Eye]|mining discovery|Mined from Felslate Deposits",
		[38803] = "Rin'thissa|10+ mining 38800|4 FelslateDeposit|Rin'thissa|mining discovery|Rin'thissa has a chance to appear after mining Felslate Deposits",
		[38801] = "Lyrelle's Right Arm|10+ mining 38799|5 FelslateSeam|{571556} [Severed Arm]|mining discovery|Mined from Felslate Seams",
		[38804] = "Lyrelle|10+ mining 38801|5 FelslateSeam|Lyrelle|mining discovery|Lyrelle has a chance to appear after mining Felslate Seams",
		[38802] = "Ondri's Still-Beating Heart|10+ mining 38799|6 LivingFelslate|{134339} [Ore-Choked Heart]|mining discovery|Mined from Felslate creatures",
		[38805] = "Ondri|10+ mining 38802|6 LivingFelslate|Ondri|mining discovery|Ondri has a chance to appear after mining Felslate creatures",
	},


	--[[ Krokuun ]]--

	[830] = {
		-- Mining - Empyrium
		[48034] = "Empyrium Deposit Chunk|45+ mining|8 EmpyriumDeposit|{962048} [Empyrium Deposit Chunk]|mining discovery|Mined from Empyrium Deposits",
		[48035] = "Angling For a Better Strike|45+ mining 48034|8 EmpyriumDeposit|{237286} [Empyrium Dust]|mining discovery|Mined from Empyrium Deposits",
		[48036] = "Precision Perfected|45+ mining 48035|8 EmpyriumDeposit|{1097742} [Unusable Empyrium Core]|mining discovery|Mined from Empyrium Deposits",
		[48037] = "Empyrium Seam Chunk|45+ mining|9 EmpyriumSeam|{962048} [Empyrium Seam Chunk]|mining discovery|Mined from Empyrium Seams",
		[48038] = "Don't Just Pick At It|45+ mining 48037|9 EmpyriumSeam|{667492} [Embedded Empyrium Ore]|mining discovery|Mined from Empyrium Seams",
		[48039] = "Balancing the Break|45+ mining 48038|9 EmpyriumSeam|{961620} [Empyrium Bits]|mining discovery|Mined from Empyrium Seams",
	},


	--[[ Antoran Wastes ]]--

	[885] = {
		-- Mining - Empyrium
		[48034] = "Empyrium Deposit Chunk|45+ mining|8 EmpyriumDeposit|{962048} [Empyrium Deposit Chunk]|mining discovery|Mined from Empyrium Deposits",
		[48035] = "Angling For a Better Strike|45+ mining 48034|8 EmpyriumDeposit|{237286} [Empyrium Dust]|mining discovery|Mined from Empyrium Deposits",
		[48036] = "Precision Perfected|45+ mining 48035|8 EmpyriumDeposit|{1097742} [Unusable Empyrium Core]|mining discovery|Mined from Empyrium Deposits",
		[48037] = "Empyrium Seam Chunk|45+ mining|9 EmpyriumSeam|{962048} [Empyrium Seam Chunk]|mining discovery|Mined from Empyrium Seams",
		[48038] = "Don't Just Pick At It|45+ mining 48037|9 EmpyriumSeam|{667492} [Embedded Empyrium Ore]|mining discovery|Mined from Empyrium Seams",
		[48039] = "Balancing the Break|45+ mining 48038|9 EmpyriumSeam|{961620} [Empyrium Bits]|mining discovery|Mined from Empyrium Seams",
	},


	--[[ Eredath ]]--

	[882] = {
		-- Mining - Empyrium
		[48034] = "Empyrium Deposit Chunk|45+ mining|8 EmpyriumDeposit|{962048} [Empyrium Deposit Chunk]|mining discovery|Mined from Empyrium Deposits",
		[48035] = "Angling For a Better Strike|45+ mining 48034|8 EmpyriumDeposit|{237286} [Empyrium Dust]|mining discovery|Mined from Empyrium Deposits",
		[48036] = "Precision Perfected|45+ mining 48035|8 EmpyriumDeposit|{1097742} [Unusable Empyrium Core]|mining discovery|Mined from Empyrium Deposits",
		[48037] = "Empyrium Seam Chunk|45+ mining|9 EmpyriumSeam|{962048} [Empyrium Seam Chunk]|mining discovery|Mined from Empyrium Seams",
		[48038] = "Don't Just Pick At It|45+ mining 48037|9 EmpyriumSeam|{667492} [Embedded Empyrium Ore]|mining discovery|Mined from Empyrium Seams",
		[48039] = "Balancing the Break|45+ mining 48038|9 EmpyriumSeam|{961620} [Empyrium Bits]|mining discovery|Mined from Empyrium Seams",
	},


	-- [[ Frostfire Ridge ]]--

	-- Frostfire Ridge
	[525] = {
		-- Foothold in a Savage Land
		[33815] = "A Song of Frost and Fire|10+ horde|40.79 67.08|Farseer Drek'Thar",
		[34402] = "Of Wolves and Warriors|10+ horde 33815|41.81 69.65|Durotan",
		[34364] = "For the Horde!|10+ horde 34402|48.74 65.32|Thrall|link:590",
		[34375] = "Back to Work|10+ horde 34364|48.74 64.9|Gazlowe|link:590",
		[34592] = "A Gronnling Problem|10+ horde 34364|48.74 64.9|Gazlowe|link:590",
		[34765] = "The Den of Skog|10+ horde 34375 34592|48.74 64.9|Gazlowe|link:590",
		[34378] = "Establish Your Garrison|10+ horde 34765|48.74 64.9|Gazlowe|link:590",
	},

	-- Frostwall
	[590] = {
		-- Foothold in a Savage Land
		[34364] = "For the Horde!|10+ horde 34402|51.19 43.23|Thrall",
		[34375] = "Back to Work|10+ horde 34364|51.22 39.57|Gazlowe",
		[34592] = "A Gronnling Problem|10+ horde 34364|51.22 39.57|Gazlowe",
		[34765] = "The Den of Skog|10+ horde 34375 34592|51.22 39.57|Gazlowe",
		[34378] = "Establish Your Garrison|10+ horde 34765|51.22 39.57|Gazlowe",
		[34824] = "What We Got|10+ horde 34378|52.3 53.1|Gazlowe",
		[34822] = "What We Need|10+ horde 34378|52.3 53.1|Gazlowe",
		[34823] = "The Ogron Live?|10+ horde 34378|51.1 51.2|Rokhan",
		[34461] = "Build Your Barracks|10+ horde 34824 34822 34823|52.3 53.1|Gazlowe",
		[34861] = "We Need An Army|10+ horde 34461|52.3 53.1|Gazlowe",
		[34462] = "Winds of Change|10+ horde 34461|53.7 54.8|Warmaster Zog",
		[34775] = "Mission Probable|10+ horde 34462|53.7 54.8|Warmaster Zog",
		[36567] = "Bigger is Better|10+ horde 34775 garrison:1|52.3 53.1|Gazlowe",
		[36614] = "My Very Own Fortress|40+ horde garrison:2|42 55.4|Gazlowe",
		[36706] = {"Ashran Appearance|10+ horde 34775 garrison:1|52.3 53.1|Gazlowe", "Ashran Appearance|10+ horde 34775 garrison:2|42 55.4|Gazlowe", "Ashran Appearance|10+ horde 34775 garrison:3|37.5 50.5|Gazlowe",},

		-- Siege of Bladespire Citadel
		[34379] = {"Den of Wolves|10+ horde 34775 garrison:1|49.6 49.3|Farseer Drek'Thar", "Den of Wolves|10+ horde 34775 garrison:2|49.5 49.4|Farseer Drek'Thar", "Den of Wolves|10+ horde 34775 garrison:3|49.5 49.4|Farseer Drek'Thar",},

		-- On the Shadow's Trail
		[34209] = "Vouchsafe Our Arrival|10+ horde garrison|49.4 36.4|Cordana Felsong",

		-- Spires of Arak - Pinchwhistle Gearworks
		[36862] = {"Pinchwhistle Gearworks|30+ horde garrison:1|50.5 50.5|Murla Longeye", "Pinchwhistle Gearworks|30+ horde garrison:2|46.8 45.8|Murla Longeye", "Pinchwhistle Gearworks|30+ horde garrison:3|46.8 45.8|Murla Longeye",},
	},


	--[[ Shadowmoon Valley ]]--

	-- Shadowmoon Valley
	[539] = {
		-- Establishing a Foothold
		[34582] = "Finding a Foothold|10+ alliance|26.97 8.11|Prophet Velen",
		[34583] = "For the Alliance!|10+ alliance 34582|28.79 16.24|Vindicator Maraad|link:582",
		[34584] = "Looking for Lumber|10+ alliance 34583|29.05 16.21|Baros Alexston|link:582",
		[34616] = "Ravenous Ravens|10+ alliance 34583|29.05 16.21|Baros Alexston|link:582",
		[34585] = "Quakefist|10+ alliance 34584 34616|28.92 16.4|Yrel|link:582",
		[34586] = "Establish Your Garrison|10+ alliance 34585|29.05 16.21|Baros Alexston|link:582",

		-- On the Shadow's Trail
		[33062] = "Catching His Eye|10+ alliance garrison|29.21 25.73|Archmage Khadgar",
		[33113] = "Shadowmoonwell|10+ alliance garrison|29.48 24.53|Delas Moonfang",
	},

	-- Lunarfall
	[582] = {
		-- Establishing a Foothold
		[34583] = "For the Alliance!|10+ alliance 34582|30.18 34.29|Vindicator Maraad",
		[34584] = "Looking for Lumber|10+ alliance 34583|32.69 34.05|Baros Alexston",
		[34616] = "Ravenous Ravens|10+ alliance 34583|32.69 34.05|Baros Alexston",
		[34585] = "Quakefist|10+ alliance 34584 34616|31.38 35.85|Yrel",
		[34586] = "Establish Your Garrison|10+ alliance 34585|32.69 34.05|Baros Alexston",
		[35176] = "Keeping it Together|10+ alliance 34586|41.2 49.2|Baros Alexston",
		[35166] = "Ship Salvage|10+ alliance 34586|41.2 49.2|Baros Alexston",
		[35174] = "Pale Moonlight|10+ alliance 34586|44 53.3|Vindicator Maraad",
		[34587] = "Build Your Barracks|10+ alliance 35176 35166 35174|41.2 49.2|Baros Alexston",
		[34646] = "Qiana Moonshadow|10+ alliance 34587|44 53.3|Vindicator Maraad",
		[34692] = "Delegating on Draenor|10+ alliance 34646|40.3 53.6|Lieutenant Thorn",
		[36592] = "Bigger is Better|10+ alliance 34692 garrison:1|41.2 49.2|Baros Alexston",
		[36624] = {"Ashran Appearance|10+ alliance 34692 garrison:1|40.3 53.6|Lieutenant Thorn",},

		-- Shadows Awaken
		[33075] = {"A Hero's Welcome|10+ alliance 34692 garrison:1|46.7 51|Yrel",},

		-- The Exarch Council
		[34778] = {"Migrant Workers|10+ alliance 34692 garrison:1|44 53.3|Vindicator Maraad",},

		-- On the Shadow's Trail
		[33359] = {"Meet Us at Starfall Outpost|10+ alliance -33062 garrison:1|43.7 44.2|Cordana Felsong",},

		-- Gorgrond - We Need An Outpost
		[35556] = {"The Secrets of Gorgrond|15+ alliance garrison:1 -33533 -36632|31.4 32.9|Bodrick Grey",},

		-- Spires of Arak - Pinchwhistle Gearworks
		[36861] = {"Pinchwhistle Gearworks|30+ alliance -35619 -35077 garrison:1|45.7 46|Watchman Tilnia",},
	},


	--[[ Ashran ]]--

	-- Ashran
	[588] = {
		-- Alliance - Ashran Appearance
		[36626] = "Host Howell|10+ alliance 36624|37.54 91.18|Private Tristan|link:622",
		[36629] = "Inspiring Ashran|10+ alliance 36626|38.31 96.88|Lieutenant Howell|link:622",
		[36630] = "A Surly Dwarf|10+ alliance 36629|38.31 96.88|Lieutenant Howell|link:622",
		[36633] = "Delvar Ironfist|10+ alliance 36630|41.05 86.92|Delvar Ironfist|link:622",

		-- Horde - Ashran Appearance
		[36707] = "Warspear Welcome|10+ horde 36706|41.02 10.57|Stomphoof|link:624",
		[36708] = "Inspiring Ashran|10+ horde 36707|40.66 13.35|Lieutenant Kragil|link:624",
		[36709] = "Burning Beauty|10+ horde 36708|40.66 13.35|Lieutenant Kragil|link:624",
		[35243] = "The Dark Lady's Gift|10+ horde 36709|45.27 7.6|Vivianne|link:624",
	},

	-- Stormshield
	[622] = {
		-- Ashran Appearance
		[36626] = "Host Howell|10+ alliance 36624|32.02 49.96|Private Tristan",
		[36629] = "Inspiring Ashran|10+ alliance 36626|35.53 75.85|Lieutenant Howell",
		[36630] = "A Surly Dwarf|10+ alliance 36629|35.53 75.85|Lieutenant Howell",
		[36633] = "Delvar Ironfist|10+ alliance 36630|47.99 30.61|Delvar Ironfist",
	},

	-- Warspear
	[624] = {
		-- Ashran Appearance
		[36707] = "Warspear Welcome|10+ horde 36706|45.57 34.61|Stomphoof",
		[36708] = "Inspiring Ashran|10+ horde 36707|44.16 45.46|Lieutenant Kragil",
		[36709] = "Burning Beauty|10+ horde 36708|44.16 45.46|Lieutenant Kragil",
		[35243] = "The Dark Lady's Gift|10+ horde 36709|62.13 23|Vivianne",
	},


	--[[ The Jade Forest ]]--

	[371] = {
		-- Phase out Tian Monastery quests: -41728,41733

		-- Monk - The Defense of Tian Monastery
		[41729] = "Slowing the Spread|10+ monk +41728|38.92 25.04|Instructor Myang|artifact",
		[41731] = "Storm, Earth, and Fire|10+ monk 41728|39 24.95|Taran Zhu|artifact",
		[41730] = "Desperate Strike|10+ monk 41728|39 24.95|Taran Zhu|artifact",
		[41732] = "The Hand of Keletress|10+ monk 41729 41731 41730|42.06 25.48|The Monkey King|artifact",
		[41733] = "Rebuilding the Order|10+ monk 41732|45.49 25.06|High Elder Cloudfall|artifact",
	},


	--[[ Teldrassil ]]--

	-- Darnassus
	[89] = {
		-- Battle for Azeroth - A Nation Divided
		[46727] = "Tides of War|10+ alliance -58983 -56775|45.1 50.13|Hero's Herald", -- 58983 is Exile's Reach version - 56775 don't show for Exile's Reach players
	},


	--[[ Azuremyst Isle ]]--

	-- Ammen Vale
	[468] = {
		[9279] = "You Survived!|1+ -9280 draenei alliance|61.16 29.5|Megelon", -- Draenei only
		[9280] = "Replenishing the Healing Crystals|1+ 9279 draenei alliance|52.74 35.9|Proenitus", -- Draenei
		[9369] = "Replenishing the Healing Crystals|1+ -draenei alliance|52.74 35.9|Proenitus", -- Other races
		[9409] = "Urgent Delivery!|1+ 9280,9369 alliance|52.74 35.9|Proenitus",
		[9283] = "Rescue the Survivors!|1+ 9409 draenei alliance|52.07 42.63|Zalduun", -- Draenei only
		[9371] = "Botanist Taerix|1+ 9409 -10302 alliance|52.74 35.9|Proenitus", -- Breadcrumb for Volatile Mutations
		[10302] = "Volatile Mutations|1+ 9280,9369 alliance|49.87 37.33|Botanist Taerix",
		[9293] = "What Must Be Done...|1+ 10302 alliance|49.87 37.33|Botanist Taerix",
		[9294] = "Healing the Lake|1+ 9293 alliance|49.87 37.33|Botanist Taerix",
		[10304] = "Vindicator Aldar|1+ 9294 -37444 -9303 alliance|49.87 37.33|Botanist Taerix", -- Breadcrumb for Inoculation
		[9799] = "Botanical Legwork|1+ 10302 alliance|49.72 37.52|Apprentice Vishael",
		[37445] = "Spare Parts|1+ 10302 -9305 alliance|50.49 47.87|Technician Zhanaa", -- Pre-6.0 version is 9305
		[37444] = "Inoculation|1+ 10302 -9303 alliance|50.64 48.73|Vindicator Aldar", -- Pre-6.0 version is 9303
		[9309] = "The Missing Scout|1+ 37444,9303 alliance|50.64 48.73|Vindicator Aldar", -- check if also req 9294?
		[10303] = "The Blood Elves|1+ 9309 alliance|33.9 69.38|Tolaan",
		[9311] = "Blood Elf Spy|1+ 10303 alliance|33.9 69.38|Tolaan",
		[9798] = "Blood Elf Plans|1+ 10303 alliance|27.79 80.42|{132319} [Blood Elf Plans]||Drops from Surveyor Candress",
		[9312] = "The Emitter|1+ 37445,9305 9311 alliance|50.64 48.73|Vindicator Aldar",
		[9313] = "Travel to Azure Watch|1+ 9312 alliance|50.49 47.87|Technician Zhanaa",
		[9314] = "Word from Azure Watch|1+ alliance|17.1 54.15|Aeun",
	},

	-- Azuremyst Isle
	[97] = {
		-- Ammen Vale
		[9279] = "You Survived!|1+ -9280 draenei alliance|84.18 43.03|Megelon|link:468", -- Draenei only
		[9280] = "Replenishing the Healing Crystals|1+ 9279 draenei alliance|80.42 45.88|Proenitus|link:468", -- Draenei
		[9369] = "Replenishing the Healing Crystals|1+ -draenei alliance|80.42 45.88|Proenitus|link:468", -- Other races
		[9409] = "Urgent Delivery!|1+ 9280,9369 alliance|80.42 45.88|Proenitus|link:468",
		[9283] = "Rescue the Survivors!|1+ 9409 draenei alliance|80.12 48.9|Zalduun|link:468", -- Draenei only
		[9371] = "Botanist Taerix|1+ 9409 -10302 alliance|80.42 45.88|Proenitus|link:468", -- Breadcrumb for Volatile Mutations
		[10302] = "Volatile Mutations|1+ 9280,9369 alliance|79.14 46.53|Botanist Taerix|link:468",
		[9293] = "What Must Be Done...|1+ 10302 alliance|79.14 46.53|Botanist Taerix|link:468",
		[9294] = "Healing the Lake|1+ 9293 alliance|79.14 46.53|Botanist Taerix|link:468",
		[10304] = "Vindicator Aldar|1+ 9294 -37444 -9303 alliance|79.14 46.53|Botanist Taerix|link:468", -- Breadcrumb for Inoculation
		[9799] = "Botanical Legwork|1+ 10302 alliance|79.07 46.01|Apprentice Vishael|link:468",
		[37445] = "Spare Parts|1+ 10302 -9305 alliance|79.42 51.24|Technician Zhanaa|link:468", -- Pre-6.0 version is 9305
		[37444] = "Inoculation|1+ 10302 -9303 alliance|79.48 51.63|Vindicator Aldar|link:468", -- Pre-6.0 version is 9303
		[9309] = "The Missing Scout|1+ 37444,9303 alliance|50.64 48.73|Vindicator Aldar|link:468", -- check if also req 9294?
		[10303] = "The Blood Elves|1+ 9309 alliance|72.01 60.84|Tolaan|link:468",
		[9311] = "Blood Elf Spy|1+ 10303 alliance|72.01 60.84|Tolaan|link:468",
		[9798] = "Blood Elf Plans|1+ 10303 alliance|69.27 65.77|{132319} [Blood Elf Plans]|link:468|Drops from Surveyor Candress",
		[9312] = "The Emitter|1+ 37445,9305 9311 alliance|79.48 51.63|Vindicator Aldar|link:468",
		[9313] = "Travel to Azure Watch|1+ 9312 alliance|79.42 51.24|Technician Zhanaa|link:468",
		[9314] = "Word from Azure Watch|1+ alliance|64.5 54.04|Aeun",

		-- Azure Watch
		[9452] = "Red Snapper - Very Tasty!|1+ alliance|61.06 54.24|Diktynna",
		[9453] = "Find Acteon!|1+ 9452 alliance|61.06 54.24|Diktynna",
		[9454] = "The Great Moongraze Hunt|1+ alliance|49.78 51.93|Acteon",
		[10324] = "The Great Moongraze Hunt|1+ 9454 alliance|49.78 51.93|Acteon",
		[9455] = "Strange Findings|1+ alliance|43 38.6|{134072} [Faintly Glowing Crystal]||Drops from Infected Nightstalker Runt",
		[9456] = "Nightstalker Clean Up, Isle 2...|1+ 9455 alliance|47.12 50.61|Exarch Menelaous",
		[9603] = "Beds, Bandages, and Beyond|1+ draenei alliance|48.34 49.15|Caregiver Chellan", -- Draenei only
		[9604] = "On the Wings of a Hippogryph|1+ 9603 draenei alliance|49.71 49.11|Zaldaan", -- Draenei only
		[9605] = "Hippogryph Master Stephanos|1+ 9604 draenei alliance|28.71 43.06|Nurguni|down link:103", -- Draenei only
		[9606] = "Return to Caregiver Chellan|1+ 9605 draenei alliance|28.06 39.48|Stephanos|down link:103", -- Draenei only
		[9463] = "Medicinal Purpose|1+ draenei alliance|48.39 51.76|Anchorite Fateema", -- Draenei only
		[9473] = "An Alternative Alternative|1+ 9463 draenei alliance|48.38 51.49|Daedal", -- Draenei only
		[9505] = "The Prophecy of Velen|1+ 9473 -9506 draenei alliance|48.38 51.49|Daedal", -- Draenei only breadcrumb for Odesyus' Landing
		[9623] = "Coming of Age|1+ alliance|47.12 50.61|Exarch Menelaous",
		[9625] = "Elekks Are Serious Business|1+ 9623 -28559 alliance|35.07 43.42|Torallius the Pack Handler", -- Breadcrumb for Bloodmyst; mutually exclusive with Hero's Call 28559

		-- Odesyus' Landing
		[9506] = "A Small Start|1+ alliance|47.04 70.2|Admiral Odesyus",
		[9530] = "I've Got a Plant|1+ 9506 alliance|47.04 70.2|Admiral Odesyus",
		[9531] = "Tree's Company|1+ 9530 alliance|47.04 70.2|Admiral Odesyus",
		[9537] = "Show Gnomercy|1+ 9531 alliance|47.04 70.2|Admiral Odesyus",
		[9602] = "Deliver Them From Evil...|1+ 9537 alliance|47.04 70.2|Admiral Odesyus",
		[9512] = "Cookie's Jumbo Gumbo|1+ alliance|46.68 70.54|\"Cookie\" McWeaksauce",
		[9513] = "Reclaiming the Ruins|1+ 9506,9512 alliance|47.12 70.28|Priestess Kyleen Il'dinare",
		[9523] = "Precious and Fragile Things Need Special Handling|1+ 9506,9512 alliance|47.24 69.99|Archaeologist Adamant Ironheart",
		[9514] = "Rune Covered Tablet|1+ 9506,9512 alliance|34.7 77.3|{134462} [Rune Covered Tablet]||Drops from Wrathscale naga",
		[9515] = "Warlord Sriss'tiz|1+ 9514 alliance|47.12 70.28|Priestess Kyleen Il'dinare", -- double check prereqs

		-- The Prophecy of Akida
		[9538] = "Lerning the Language|1+ alliance|49.38 50.97|Cryptographer Aurren",
		[9539] = "Totem of Coo|1+ 9538 alliance|49.44 50.98|Totem of Akida",
		[9540] = "Totem of Tikti|1+ 9539 alliance|55.23 41.65|Totem of Coo",
		[9541] = "Totem of Yor|1+ 9540 alliance|64.47 39.77|Totem of Tikti",
		[9542] = "Totem of Vark|1+ 9541 alliance|63.12 67.88|Totem of Yor",
		[9544] = "The Prophecy of Akida|1+ 9542 alliance|28.11 62.39|Totem of Vark",
		[9559] = "Stillpine Hold|1+ 9544 alliance|49.37 51.09|Arugoo of the Stillpine",

		-- Stillpine Hold
		[9562] = "Murlocs... Why Here? Why Now?|1+ 9538 alliance|44.64 23.48|Gurf", -- Might require 9544?
		[9564] = "Gurf's Dignity|1+ +9562 alliance|34.6 15|{134350} [Gurf's Dignity]||Drops from Murgurgula who patrols the shore", -- Requires 9562 in log
		[9560] = "Beasts of the Apocalypse!|1+ 9538 alliance|44.77 23.89|Moordo", -- Might require 9544?
		[9565] = "Search Stillpine Hold|1+ 9560,9562 alliance|46.68 20.63|High Chief Stillpine", -- check if 9560 or 9560,9562 or 9560 9562
		[9566] = "Blood Crystals|1+ 9565 alliance|45.5 18.9|Blood Crystal|down link:99",
		[9573] = "Chieftain Oomooroo|1+ 9560,9562 alliance|46.9 21.17|Stillpine the Younger", -- check if 9560 or 9560,9562 or 9560 9562
		[9570] = "The Kurken is Lurkin'|1+ 9560,9562 alliance|46.9 21.17|Kurz the Revelator", -- check if 9560 or 9560,9562 or 9560 9562
		[9571] = "The Kurken's Hide|1+ 9570 alliance|46.9 21.17|Kurz the Revelator",
		[9622] = "Warn Your People|1+ 9570 9573 9566|46.68 20.63|High Chief Stillpine",

		-- Silvermyst Isle
		[10428] = "The Missing Fisherman|1+ -9527 alliance|48.96 51.06|Dulvi",
		[9527] = "All That Remains|1+ 10428 alliance|16.59 94.45|Cowlen",
		[9528] = "A Cry For Help|1+ alliance|13.63 73.22|Magwin",

		-- Random
		[9612] = {
			"A Hearty Thanks!|1+ draenei alliance|37.4 19.4|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat", -- West of Stillpine Hold
			"A Hearty Thanks!|1+ draenei alliance|46.6 31.6|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat", -- South of Stillpine Hold
			"A Hearty Thanks!|1+ draenei alliance|55 29|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat", -- South of Emberglade
			"A Hearty Thanks!|1+ draenei alliance|39.4 37.2|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat", -- North of Valaar's Berth
			"A Hearty Thanks!|1+ draenei alliance|42 57.4|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat||Available after healing a Draenei Youngling using {135923} [Gift of the Naaru] in combat", -- South of Valaar's Berth
			"A Hearty Thanks!|1+ draenei alliance|40 71.6|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat||Available after healing a Draenei Youngling using {135923} [Gift of the Naaru] in combat", -- West of Odesyus' Landing
			"A Hearty Thanks!|1+ draenei alliance|56.8 59.6|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat", -- East of the Pod Wreckage
			"A Hearty Thanks!|1+ draenei alliance|53.4 42.4|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat", -- Northeast of Azure Watch
			"A Hearty Thanks!|1+ draenei alliance|55 47|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat", -- East of Azure Watch
			"A Hearty Thanks!|1+ draenei alliance|58.6 42.2|Draenei Youngling||Available after using [spell]Gift of the Naaru] on a Draenei Youngling who is in combat", -- Beach
		},
		[9616] = {
			-- Thanks to Wowhead user axelia for these coordinates <https://www.wowhead.com/quest=9616/bandits#comments:id=1981342>
			-- Blizzard bug: as of 9.0 the drop is broken outside Chromie Time and will not drop at all for level 50+ characters, not even in Party Sync
			"Bandits!|1+ broken:50 alliance|28.6 79.2|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|26.4 67.2|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|33.4 71|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|32.4 62.8|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|35.2 64.4|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|36 60.4|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|43 63.2|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|53.2 61.2|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|46.4 39.2|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|53.6 41.2|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|50.2 29|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|54.2 21.6|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|52 17.4|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|59 18.2|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|37 20.8|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|34 19.2|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|33.4 26.6|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|36.4 32.4|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
			"Bandits!|1+ broken:50 alliance|27.4 52|{133473} [Blood Elf Communication]|chromietime|Drops from Blood Elf Bandit who is stealthed near one of these spawn points",
		},
	},

	-- Stillpine Hold
	[99] = {
		-- Stillpine Hold
		[9566] = "Blood Crystals|1+ 9565 alliance|65.18 30.89|Blood Crystal",
	},

	-- The Exodar
	[103] = {
		-- Azure Watch
		[9605] = "Hippogryph Master Stephanos|1+ 9604 draenei alliance|57.01 50.09|Nurguni", -- Draenei only
		[9606] = "Return to Caregiver Chellan|1+ 9605 draenei alliance|54.49 36.3|Stephanos", -- Draenei only
		[9625] = "Elekks Are Serious Business|1+ 9623 -28559 alliance|81.51 51.46|Torallius the Pack Handler", -- Breadcrumb for Bloodmyst; mutually exclusive with Hero's Call 28559
	},


	--[[ Durotar ]]--

	[1] = {
		-- Stormheim - Greymane's Gambit
		[39698] = "Making the Rounds|10+ 38307 horde|61.37 8.86|Lady Sylvanas Windrunner",
		[39801] = "The Splintered Fleet|10+ 39698 horde|61.49 8.77|Lady Sylvanas Windrunner",

		-- Death Knight - The Four Horsemen
		[42484] = "The Firstborn Rises|10+ deathknight 42449|47.32 17.67|Thassarian|artifact",
	},


	--[[ Tanaris ]]--

	-- Tanaris
	[71] = {
		-- OOX-17/TN
		[351] = "Find OOX-17/TN!|15+|1 OOXDistressBeacon|{132836} [uncommon]OOX-17/TN Distress Beacon]|discovery|Zone Drop",
	},

	-- The Noxious Lair
	[72] = {
		-- OOX-17/TN
		[351] = "Find OOX-17/TN!|15+|1 OOXDistressBeacon|{132836} [uncommon]OOX-17/TN Distress Beacon]|discovery|Zone Drop",
	},

	-- The Gaping Chasm
	[73] = {
		-- OOX-17/TN
		[351] = "Find OOX-17/TN!|15+|1 OOXDistressBeacon|{132836} [uncommon]OOX-17/TN Distress Beacon]|discovery|Zone Drop",
	},

	-- Dungeon: Zul'Farrak
	[219] = {
		-- OOX-17/TN
		[351] = "Find OOX-17/TN!|15+|1 OOXDistressBeacon|{132836} [uncommon]OOX-17/TN Distress Beacon]|discovery|Zone Drop",
	},


	--[[ Feralas ]]--

	[69] = {
		-- OOX-17/FE
		[25475] = "Find OOX-22/FE!|15+|1 OOXDistressBeacon|{132836} [uncommon]OOX-17/FE Distress Beacon]|discovery|Zone Drop",
	},


	--[[ Silithus ]]--

	-- Silithus
	[81] = {
		-- Classic: art:86
		-- BfA: art:962

		-- The Heart of Azeroth
		[51211] = "The Heart of Azeroth|art:962 40+ 43028,52946|42.22 44.27|Magni Bronzebeard",
		[52428] = "Infusing the Heart|40+ 51211|43.2 44.49|Magni Bronzebeard|elsewhere link:1021",
	},

	-- Chamber of Heart
	[1021] = {
		-- The Heart of Azeroth
		[51211] = "The Heart of Azeroth|40+ 43028,52946|50.1 30.62|Magni Bronzebeard|elsewhere link:81",
		[52428] = "Infusing the Heart|40+ 51211|50.15 53.66|Magni Bronzebeard",
	},


	--[[ Elwynn Forest ]]--

	-- Stormwind City
	[84] = {
		-- Alliance Balloon
		[29412] = "Blown Away|10+ alliance|58.89 52.74|Vin",

		-- Stormheim - Greymane's Gambit
		[38206] = "Making the Rounds|10+ 38035 alliance|18.92 42.78|Sky Admiral Rogers",
		[39800] = "Greymane's Gambit|10+ 38206 alliance|18.66 51.1|Genn Greymane",

		-- Battle for Azeroth - A Nation Divided
		[46727] = {"Tides of War|10+ alliance -58983 -56775|62.82 71.75|Hero's Herald", "Tides of War|10+ alliance -58983 -56775|62.17 30.14|Hero's Herald",}, -- 58983 is Exile's Reach version - 56775 don't show for Exile's Reach players
		[46728] = "The Nation of Kul Tiras|10+ alliance 46727 -59641 -56775|80.26 33.13|Anduin Wrynn", -- 59641 is Exile's Reach version
	},


	--[[ Duskwood ]]--

	[47] = {
		-- Death Knight - Apocalypse
		[40931] = "Following the Curse|10+ deathknight 40930|77.42 36.32|Revil Kost|artifact",
	},


	--[[ Deadwind Pass ]]--
	
	[42] = {
		-- Death Knight - Apocalypse
		[40932] = "Disturbing the Past|10+ deathknight 40931|52.42 34.41|Revil Kost|artifact",
		[40933] = "A Grisly Task|10+ deathknight 40932|52.42 34.41|Revil Kost|artifact",
		[40934] = "The Dark Riders|10+ deathknight 40933 -40986|49.46 74.73|Revil Kost|artifact", -- 40986 is used if 2nd/3rd artifact
		[40935] = "The Call of Vengeance|10+ deathknight 40934,40986 -40987|46.91 69.48|Revil Kost|artifact", -- 40987 is used if 2nd/3rd artifact
	},


	--[[ Arathi Highlands ]]--

	[14] = {
		-- Art: 15 (Cataclysm), 1137 (BfA)

		-- Death Knight - The Four Horsemen
		[42534] = "Our Oldest Enemies|10+ art:15 deathknight 42533|19.45 67.31|Prince Galen Trollbane|artifact",
		[42535] = "Death... and Decay|10+ art:15 deathknight 42533|19.45 67.31|Prince Galen Trollbane|artifact",
		[42536] = "Regicide|10+ art:15 deathknight 42534 42535|19.52 67.09|Thassarian|artifact",
		[42537] = "The King Rises|10+ art:15 deathknight 42536|23.39 61.4|Thassarian|artifact",
	},


	--[[ The Hinterlands ]]--

	[26] = {
		-- OOX-17/HL
		[485] = "Find OOX-22/HL!|10+|1 OOXDistressBeacon|{132836} [uncommon]OOX-17/HL Distress Beacon]|discovery|Zone Drop",
	},
}