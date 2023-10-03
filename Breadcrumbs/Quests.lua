local _, Data = ...


-- Hidden Bonus Objective Quests
-- Pins for quests in this table are removed from Blizzard's Bonus Objective Data Provider if the "Hide Storylines" setting is enabled
-- This is used to remove broken bonus objectives or to replace them with our own quest pins
Data.HiddenBonusObjectiveQuests = {
	-- Shadowlands
	[57301] = true, -- Maldraxxus - Callous Concoctions
	[66042] = true, -- Zereth Mortis - Patterns Within Patterns
	[65749] = true, -- Zereth Mortis - The Necessity Of Equipment
	[64641] = true, -- Zereth Mortis - Mysterious Greenery

	-- Dragonflight
	[70750] = true, -- Aiding the Accord
	[72068] = true, -- Aiding the Accord: A Feast For All
	[72373] = true, -- Aiding the Accord: The Hunt is On
	[72374] = true, -- Aiding the Accord: Dragonbane Keep
	[72375] = true, -- Aiding the Accord: The Isles Call
	[75259] = true, -- Aiding the Accord: Zskera Vaults
	[75859] = true, -- Aiding the Accord: Sniffenseeking
	[75860] = true, -- Aiding the Accord: Researchers Under Fire
	[75861] = true, -- Aiding the Accord: Suffusion Camp
}


-- --------------------------------------------------


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
		_n				Must not have completed quest ID n (not turned in)

		class			Must be class (deathknight, demonhunter, druid, evoker, hunter, mage, monk, paladin, priest, rogue, shaman, warlock, warrior)
		profession		Must have learned profession (alchemy, blacksmithing, enchanting, engineering, herbalism, inscription, jewelcrafting, leatherworking, mining, skinning, tailoring, archaeology, cooking, fishing)
		race			Must be race (bloodelf, draenei, darkiron, dracthyr, dwarf, gnome, goblin, highmountain, human, kultiran, lightforged, maghar, mechagnome, nightborne, nightelf, orc, pandaren, undead, tauren, troll, voidelf, vulpera, worgen, zandalari)
		alliance		Must be Alliance
		horde			Must be Horde
		covenant		Must currently belong to covenant (kyrian, necrolord, nightfae, venthyr)
		cloth			Primary armor type is cloth (future-proof equivalent to "priest,mage,warlock")
		leather			Primary armor type is leather (future-proof equivalent to "demonhunter,druid,monk,rogue")
		mail			Primary armor type is mail (future-proof equivalent to "evoker,hunter,shaman")
		plate			Primary armor type is plate (future-proof equivalent to "deathknight,paladin,warrior")
		-x				Inverse of above

		reset:n			Quest ID n must not have been completed during today's daily quest reset

		active:n		World Quest/Task Quest with ID n must be active

		flying			Must have learned flying
		dragonriding	Must have learned dragonriding

		garrison		Must have unlocked WoD Garrison (any tier)
		garrison:n		Must have a WoD Garrison at tier n

		research:x		Must have researched GarrTalent ID x (see https://wago.tools/db2/GarrTalent)

		renown:n		Must have attained renown level n with their currently chosen Shadowlands covenant

		mount:x			Must have collected mount with ID x (see https://wowpedia.fandom.com/wiki/MountID)

		toy:x			Must have learned toy with item ID x

		item:x			Must have at least one item with ID x in bags (includes bank)
		item:x:n		Must have at least n items with ID x in bags (includes bank)

		currency:n:x	Must have at least x or more of currency with ID n

		art:x			Map (where this pin is located) must currently have UiMapArtID x (see https://wago.tools/db2/UiMapXMapArt)
		art:y:x			Map with ID y must currently have UiMapArtID x

		reputation:x:n	Must have reached standing n or higher with reputation faction x
						Major (renown) type reputations require renown level n or higher (1 is Renown 1)
						Friendship type reputation require standing n or higher (for example, for Nat Pagle; 1 is Stranger, 2 is Pal, ... 6 is Best Friend)
						Traditional reputation require standing ID n or higher (1 is Hated, ... 4 is Neutral, 5 is Friendly, ... 8 is Exalted)

		skill:x:n		Must have n or more skill in TradeSkillLine ID x (see https://wowpedia.fandom.com/wiki/TradeSkillLineID)
						For example, skill:2832:25 would require Dragon Isles Herbalism at skill level 25 or higher
		skill:profX:n	Shorthand for TradeSkillLine ID, where prof is the name of the profession and X is the expansion number (Classic is 1, Burning Crusade is 2, ... Dragonflight is 10)
						For example, skill:herbalism10:25 is equivalent to skill:2832:25
						Archaeology does not have expansion categories, so in this case skill:archaeology:525 is equivalent to skill:794:525

		profperk:x:y	Must have earned specialization perk y in profession with TradeSkillLine ID x
		profperk:profX:y  See skill shorthand above

		spell:x			Must know spell with ID x

		achievement:x	Must have earned achievement with ID x on this character
		accachievement:x  Must have earned achievement with ID x on any character

		broken			Quest is broken and cannot be completed, it will be hidden unless the user has decided to display broken quests
		broken:n		Quest is broken if you are level n or higher and cannot be completed, it will be hidden when above this level unless the user has decided to display broken quests

	Almost all conditions can be inverted by adding - in front of them
	Some examples:
		dwarf			Must be a dwarf
		-dwarf			Must not be a dwarf
		10+ gnome mage	Must be a level 10 or higher gnome mage
		mage,warlock	Must be either a mage or a warlock
		10+ gnome,dwarf mage,warlock   Must be a level 10 or higher gnome or dwarf who is also a mage or warlock
		10+ 123			Must be level 10 or higher and have completed quest with ID 123
		10+ 123,456		Must be level 10 or higher and have completed either quest 123 or 456
		10+ 123 -456	Must be level 10 or higher and have completed quest 123 but not 456
		20+ skill:engineering1:200 -spell:20219 -spell:20222    Must be level 20 or higher, have 200 or more skill in Classic Engineering, have not learned the Gnomish Engineering spell and have not learned the Goblin Engineering spell



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
		account			Account quest
		red				Quest is started by killing a mob, changes the pin icon to a red bang
		warboard		Quest is obtained from a Warboard, changes the pin icon to a warboard
		elsewhere		Quest is obtained in a different location, changes the pin icon to an arrow - a link flag should always be provided with this flag

		dungeon			Dungeon quest
		raid			Raid quest
		profession		Profession quest (alchemy, blacksmithing, enchanting, engineering, herbalism, inscription, jewelcrafting, leatherworking, mining, skinning, tailoring, archaeology, cooking, fishing)
		petbattle		Pet Battle quest
		
		link:n			Pin becomes clickable to open map with ID n, should be used if the quest takes place on a different map
						Replaces the Source text with the name of the linked map
		
		up				Quest is on a different map above the current map, also changes the XX YY pin to an exit marker if provided
		down			Quest is on a different map below the current map, also changes the XX YY pin to an entrance marker if provided

		discovery		Quest can be discovered from a non-fixed location in the zone, for example by mining a node
						Places the pin in the Discovery Quest list (top left corner of the map) sorted by other flags and priority number
	
		chromietime		Quest can only be picked up during a Timewalking Campaign (Chromie Time); adds a dynamic help tip depending on level and Chromie Time status
		chromiesync		Quest can only be picked up during a Timewalking Campaign (Chromie Time) or in Party Sync; adds a dynamic help tip depending on level and Chromie Time status
		partysync-warning			Adds a warning tooltip for players at level 60 or above: "You will likely need to Party Sync with a low level character to be able to pick up this quest" 
		partysync-warning-turnin	Adds a warning tooltip for players at level 60 or above: "You will likely need to Party Sync with a low level character to be able to complete this quest" 
		partysync-warning-chain		Adds a warning tooltip for players at level 60 or above: "You will likely need to Party Sync with a low level character to be able to complete parts of this quest chain" 

	Help: Tooltip help text formatting
		{x}				Atlas texture named x
		{/x}			Texture with name/path x inside the Breadcrumbs/Textures folder
		{n}				Texture/icon with texture ID n
		{!}				Equivalent to {QuestNormal}
		[				White text color opening tag
		[color]			Colored text opening tag where color a named color: 
							spell, friendly, neutral, unfriendly, hostile, dead, daily, poor, uncommon, rare, epic, legendary, artifact, heirloom, green, yellow, red, gray
		[hex]			Colored text opening tag where hex is a hex color, for example [ffffff] would be white
		]				Close color tag
		§				|
		[hasitem:x]		Dynamic color opening tag - beige if the character has at least one item with ID x in their inventory, otherwise gray
		[hasitem:x:n]	Dynamic color opening tag - beige if the character has n or more items with ID x in their inventory, otherwise gray
		<itemcount:x>	Number of items with ID x
		<currencycount:x>  Amount of currency with ID x


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
		59770 - Maw Intro Completed (including skip)
		62704 - Threads of Fate chosen
		60293 - Pride or Unit, Phalynx chosen (Pelodis)
		60294 - Pride or Unit, Larion chosen (Nemea)
		-60259 -60260 -60261 -60262 -60263 - No Steward chosen
		62704,57904,59609,62899,62921 - World Quests Unlocked

	Dragonflight
		67030 - Adventure Mode unlocked on account
		75658 - Zaralek Cavern World Quests unlocked on account


]]--

Data.Quests = {

	--[[ Dragon Isles ]]--

	[1978] = {
		-- Dragonscale Expedition - In the Halls of Titans
		[69097] = "A Vault Unsealed|70+ reputation:2507:24|1 DocNannersCampaign|Doc Nanners|discovery campaign", -- Requires Renown 24 with Dragonscale Expedition
	
		-- Iskaara Tuskarr - The Chieftain's Duty
		[68863] = "A Lost Tribe|70+ reputation:2511:11|3 RowieCampaign|Rowie|discovery campaign", -- Requires Renown 11 with Iskaara Tuskarr
	},


	--[[ Zaralek Cavern ]]--

	[2133] = {
		-- Campaign
		[75641] = "Power Unified|70+ 75658|56.84 54.79|Examiner Tae'shara Bloodwatcher|campaign",
	},


	--[[ Thaldraszus ]]--

	-- Valdrakken
	[2112] = {
		-- Aiding the Accord
		[70750] = "Aiding the Accord|60+ 67030 -72374 -72068 -72373 -72375 -72369 -75859 -75860 -75861|50.17 56.22|Therazal|campaign weekly", -- You get one of 5 random weeklies, we consolidate them into one pin
		[72354] = "The Great Vault|70+|50.17 56.22|Therazal",

		-- The Spark of Ingenuity
		[70180] = "Jump-Start? Jump-Starting!|60+ 67030,68+ 67030,66221 ~70846|84.22 54.41|Greyzik Cobblefinger|campaign", -- Requires either Adventure Mode unlocked or 67030, invalidates 70846
		[70845] = "In Tyr's Footsteps|60+ 70180|84.33 53.55|Maiden of Inspiration|campaign",
		[70181] = "First Challenge of Tyr: Finesse|60+ 70845|84.33 53.55|Ornamented Statue|campaign elsewhere link:2024",
		[70182] = "The Sweet Taste of Victory|60+ 70181|84.33 53.55|Maiden of Inspiration|campaign elsewhere link:2024",
		[70633] = "Fueling the Engine|60+ 70182|84.33 53.55|Maiden of Inspiration|campaign",
		[72783] = "Crafting Orders|60+ 70633|85.02 54.45|Greyzik Cobblefinger|campaign",
		[70339] = "In Tyr's Footsteps: The Ohn'ahran Plains|60+ 70633|84.33 53.55|Maiden of Inspiration|campaign",
		[70376] = "Second Challenge of Tyr: Might|60+ 70339|84.33 53.55|Ornamented Statue|campaign elsewhere link:2023",
		[70341] = "Well Earned Victory|60+ 70376|84.33 53.55|Maiden of Inspiration|campaign elsewhere link:2023",
		[70650] = "In Tyr's Footsteps: The Waking Shores|60+ 70341|84.33 53.55|Maiden of Inspiration|campaign",
		[70509] = "Third Challenge of Tyr: Persistence|60+ 70650|84.33 53.55|Broken Ornamented Statue|campaign elsewhere link:2022",
		[70621] = "Third Challenge of Tyr: Persistence Embodied|60+ 70509|84.33 53.55|Maiden of Inspiration|campaign elsewhere link:2022",
		[70510] = "Victorious|60+ 70621|84.33 53.55|Maiden of Inspiration|campaign elsewhere link:2022",
		[70881] = "Fourth Challenge of Tyr: Resourcefulness|60+ 70510|84.33 53.55|Maiden of Inspiration|campaign dungeon",
		[70899] = "Fifth Challenge of Tyr: Ingenuity|60+ 70881|84.33 53.55|Maiden of Inspiration|campaign",
		[70900] = "Innovating the Engine|60+ 70899|84.33 53.55|Maiden of Inspiration|campaign",
		-- Skip completes 72340
		[72339] = "Engine of Innovation|60+ 72340|84.33 53.55|Maiden of Inspiration",

		-- The Revival Catalyst
		--[72360] = "Reviving the Machine|70+|54.38 40.92|Watcher Koranos", -- Does it still exist in 10.1?

		-- Artisan's Consortium
		[70221] = "Show Your Mettle|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,herbalism,mining,skinning reputation:2544:2|39.44 70.17|Thomas Bright|weekly", -- Requires Preferred (rank 2) or higher with Artisan's Consortium
		[67295] = "That's My Specialty|60+ 62+,67030 66340 skill:2823:25,skill:2822:25,skill:2825:25,skill:2827:25,skill:2832:25,skill:2828:25,skill:2829:25,skill:2830:25,skill:2833:25,skill:2834:25,skill:2831:25|39.37 70.16|Miguel Bright", -- Requires 25 skill in any Dragon Isles primary profession
		[69919] = "A Craft in Need|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,cooking,fishing|35.37 58.77|Azley",
		[69946] = "The Master of Their Craft|60+ 62+,67030 67564 65686 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,herbalism,mining,skinning|39.44 70.17|Thomas Bright",
		[70033] = "Artisan's Supply: Pioneer's Leather Boots|60+ leatherworking|29 61|Samar|leatherworking",

		-- The Ruby Feast
		--[70930] = "All Tea, No Shadeleaf|70+|61.63 11.54|Rumiastrasza",
		[67047] = "Warm Away These Shivers|70+ 70930|61.63 11.54|Lilial Dawnburst|elsewhere link:2024",

		-- The Emerald Enclave
		[67094] = "A Dryad's Work Is Never Done|60+ 68+,67030|72.78 66.17|Thalendra",
		[67606] = "A Dryadic Remedy|60+ 68+,67030 67094|72.78 66.17|Thalendra",

		-- Gardens of Unity
		[72189] = "Garden Variety|60+ 68+,67030 -66134|77.37 67.03|Tender Xina", -- Breadcrumb for 66134

		-- Tyrhold Reservoir
		[72190] = "Reservoir Reservations|60+, 68+,67030 -65913|25.49 40.95|Talikka", -- Breadcrumb for 65913
		
		-- Dragonscale Expedition - In the Halls of Titans
		[69097] = "A Vault Unsealed|70+ reputation:2507:24|1 DocNannersCampaign|Doc Nanners|discovery campaign", -- Requires Renown 24 with Dragonscale Expedition
	
		-- Iskaara Tuskarr - The Chieftain's Duty
		[68863] = "A Lost Tribe|70+ reputation:2511:11|3 RowieCampaign|Rowie|discovery campaign", -- Requires Renown 11 with Iskaara Tuskarr
	},

	-- Thaldraszus
	[2025] = {
		-- Valdrakken, City of Dragons

		-- Time Management

		-- Big Time Adventurer

		-- Aiding the Accord
		[70750] = "Aiding the Accord|60+ 67030 -72374 -72068 -72373 -72375 -72369 -75859 -75860 -75861|39.96 60.78|Therazal|campaign weekly link:2112", -- You get one of 5 random weeklies, we consolidate them into one pin
		[72354] = "The Great Vault|70+|39.96 60.78|Therazal|link:2112",

		-- The Spark of Ingenuity
		[70180] = "Jump-Start? Jump-Starting!|60+ 67030,68+ 67030,66221 ~70846|44.88 60.51|Greyzik Cobblefinger|campaign link:2112", -- Requires either Adventure Mode unlocked or 67030, invalidates 70846
		[70845] = "In Tyr's Footsteps|60+ 70180|44.9 60.39|Maiden of Inspiration|campaign link:2112",
		[70181] = "First Challenge of Tyr: Finesse|60+ 70845|44.9 60.39|Ornamented Statue|campaign elsewhere link:2024",
		[70182] = "The Sweet Taste of Victory|60+ 70181|44.9 60.39|Maiden of Inspiration|campaign elsewhere link:2024",
		[70633] = "Fueling the Engine|60+ 70182|44.9 60.39|Maiden of Inspiration|campaign link:2112",
		[72783] = "Crafting Orders|60+ 70633|45 60.52|Greyzik Cobblefinger|campaign link:2112",
		[70339] = "In Tyr's Footsteps: The Ohn'ahran Plains|60+ 70633|44.9 60.39|Maiden of Inspiration|campaign",
		[70376] = "Second Challenge of Tyr: Might|60+ 70339|44.9 60.39|Ornamented Statue|campaign elsewhere link:2023",
		[70341] = "Well Earned Victory|60+ 70376|44.9 60.39|Maiden of Inspiration|campaign elsewhere link:2023",
		[70650] = "In Tyr's Footsteps: The Waking Shores|60+ 70341|44.9 60.39|Maiden of Inspiration|campaign",
		[70509] = "Third Challenge of Tyr: Persistence|60+ 70650|44.9 60.39|Broken Ornamented Statue|campaign elsewhere link:2022",
		[70621] = "Third Challenge of Tyr: Persistence Embodied|60+ 70509|44.9 60.39|Maiden of Inspiration|campaign elsewhere link:2022",
		[70510] = "Victorious|60+ 70621|44.9 60.39|Maiden of Inspiration|campaign elsewhere link:2022",
		[70881] = "Fourth Challenge of Tyr: Resourcefulness|60+ 70510|44.9 60.39|Maiden of Inspiration|campaign dungeon link:2112",
		[70899] = "Fifth Challenge of Tyr: Ingenuity|60+ 70881|44.9 60.39|Maiden of Inspiration|campaign link:2112",
		[70900] = "Innovating the Engine|60+ 70899|44.9 60.39|Maiden of Inspiration|campaign link:2112",
		-- Skip completes 72340
		[72339] = "Engine of Innovation|60+ 72340|44.9 60.39|Maiden of Inspiration|link:2112",

		-- The Revival Catalyst
		--[72360] = "Reviving the Machine|70+|40.57 58.57|Watcher Koranos|link:2112",

		-- Gelikyr Overlook

		-- Drawing Conclusions

		-- The Screechflight Scramble

		-- The Ruby Feast
		--[70930] = "All Tea, No Shadeleaf|70+|COORDS|Rumiastrasza|link:2112",
		--[67047] = "Warm Away These Shivers|70+ 70930|COORDS|Lilial Dawnburst|elsewhere link:2024",

		-- The Emerald Enclave
		[67094] = "A Dryad's Work Is Never Done|60+ 68+,67030|43.23 62.21|Thalendra|link:2112",
		[67606] = "A Dryadic Remedy|60+ 68+,67030 67094|43.23 62.21|Thalendra|link:2112",

		-- Gardens of Unity
		[72189] = "Garden Variety|60+ 68+,67030 -66134|43.89 62.34|Tender Xina|link:2112", -- Breadcrumb for 66134
		[66134] = "Azeroth Pest Control|60+ 68+,67030 ~72189|37.86 75.47|Gryrmpech", -- Invalidates breadcrumb 72189
		[66135] = "The Gardener's Apprentice|60+ 68+,67030 66134|37.86 75.47|Gryrmpech",
		[66278] = "One Drakonid's Junk|60+ 68+,67030 66134 +66135|38.91 74.25|Bronze Stopwatch",
		[66279] = "New Kid on the Clock|60+ 68+,67030 66278|37.86 75.47|Gryrmpech",
		[66138] = "Like Sands Through the Hourglass|60+ 68+,67030 66279|35.23 72.64|Orizmu",
		[66136] = "Elemental Extract|60+ 68+,67030 66135|37.86 75.47|Gryrmpech",
		[66137] = "Lashing Out|60+ 68+,67030 66135|37.86 75.47|Gryrmpech",
		[66139] = "Flame at Last|60+ 68+,67030 66136 66137|37.86 75.47|Gryrmpech",
		[66412] = "Carry On, Basilton|60+ 68+,67030 66138 66139|37.86 75.47|Gryrmpech", -- is 66138 required?

		-- Tyrhold Reservoir
		[72190] = "Reservoir Reservations|60+ 68+,67030 -65913|36.4 58.57|Talikka|link:2112", -- Breadcrumb for 65913
		[65913] = "Wotcher, Watcher?|60+ 68+,67030 ~72190|49.54 58.86|Zuttiki", -- Invalidates breadcrumb 72190
		[65918] = "Preventative Maintenance|60+ 68+,67030 65913|49.54 58.86|Zuttiki",
		[70139] = "Where There's a Ward, There's a Way|60+ 68+,67030 65913|49.61 58.76|Mara",
		[65921] = "Refti Retribution|60+ 68+,67030 65918 70139|49.54 58.86|Zuttiki",
		[65916] = "We Don't Negotiate with Primalists|60+ 68+,67030 65918 70139|49.61 58.76|Mara",
		[65920] = "For the Ward!|60+ 68+,67030 65921 65916|49.61 58.76|Mara",

		-- Bleeding Hearts
		[72399] = "The Hermit's Garden|60+ 68+,67030 -69932|52.58 69.92|Agues", -- Breadcrumb for 69932
		[69932] = "Every Life Counts|60+ 68+,67030 ~72399|50.17 67.66|Szareth", -- Invalidates breadcrumb 72399
		[69933] = "Curiosity's Price|60+ 68+,67030|50.17 67.66|Szareth",
		[69934] = "Bleeding Hearts|60+ 68+,67030 69932 69933|50.17 67.66|Szareth",

		-- Serene Dreams Spa

		-- Misty Vale
		-- ...
		[70878] = "Ring of Fire|60+ 68+,67030 70874|42.28 78.91|Maldra Flametongue",
		[70875] = "Worst of the Worst|60+ 68+,67030 70874|42.45 78.85|Investigator Erima",
		[70876] = "Fracture the Foci|60+ 68+,67030 70874|42.45 78.85|Investigator Erima",
		[70879] = "Fracture the Foci|60+ 68+,67030 70878 70875 70876|42.45 78.85|Investigator Erima",

		-- Hearthstone Duel
		[66929] = "Gotta Collect Them All|60+ 68+,67030|59.74 43.58|Yumadormu",
		[67167] = "It's Time To Duel!|60+ 68+,67030 66929|60.67 43.29|Yumadormu",
		[67178] = "White Eyes, Blue Dragon|60+ 68+,67030 67167|58.12 40.34|Professor Dromokdormi",

		-- Dragon Racing
		[72485] = "The Azure Span Tour|60+ dragonriding 72483|29.34 68.39|Celormu",
		[72487] = "The Thaldraszus Tour|60+ dragonriding 72485|44.47 90.73|Celormu",
		[72482] = "The Waking Shores Advanced Tour|60+ dragonriding accachievement:15915 accachievement:15918 accachievement:15921 accachievement:15924|46.04 63.03|Celormu", -- Requires all normal races completed on account
		[72972] = "The Waking Shores Reverse Tour|60+ dragonriding accachievement:15915 accachievement:15918 accachievement:15921 accachievement:15924|46.04 63.03|Celormu", -- Requires all normal races completed on account
		[72488] = "The Thaldraszus Advanced Tour|60+ dragonriding 72486|44.47 90.73|Celormu",
		[72985] = "The Thaldraszus Reverse Tour|60+ dragonriding 72984|44.47 90.73|Celormu",

		-- Artisan's Consortium
		[70221] = "Show Your Mettle|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,herbalism,mining,skinning reputation:2544:2|38.41 62.79|Miguel Bright|weekly link:2112", -- Requires Preferred (rank 2) or higher with Artisan's Consortium
		[67295] = "That's My Specialty|60+ 62+,67030 66340 skill:2823:25,skill:2822:25,skill:2825:25,skill:2827:25,skill:2832:25,skill:2828:25,skill:2829:25,skill:2830:25,skill:2833:25,skill:2834:25,skill:2831:25|38.4 62.79|Miguel Bright|link:2112", -- Requires 25 skill in any Dragon Isles primary profession
		[69919] = "A Craft in Need|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,cooking,fishing|37.82 61.14|Azley|link:2112",
		
		-- Dragonscale Expedition - In the Halls of Titans
		[69097] = "A Vault Unsealed|70+ reputation:2507:24|1 DocNannersCampaign|Doc Nanners|discovery campaign", -- Requires Renown 24 with Dragonscale Expedition
		[66636] = "The Other Side|70+ 67722|54.27 55.41|Toddy Whiskers|campaign",
		[66173] = "Hall of Samples|70+ 66636|55.13 56.34|Toddy Whiskers|campaign",
		[66174] = "Hall of the Aspects|70+ 66636|55.13 56.34|Toddy Whiskers|campaign",
		[71152] = "Back to the Main Hall|70+ 66173 66174|54.83 55.93|Toddy Whiskers|campaign|\"Use any of the two teleporers to either Hall of Samples or Hall of Aspects to get back to Toddy Whiskers\"",
		[66546] = "Retrieve the Discs|70+ 71152|55.13 56.34|Toddy Whiskers|campaign",
		[66547] = "It Belongs in a Museum... Eventually|70+ 66546|54.45 55.55|Toddy Whiskers|campaign",
	
		-- Iskaara Tuskarr - The Chieftain's Duty
		[68863] = "A Lost Tribe|70+ reputation:2511:11|3 RowieCampaign|Rowie|discovery campaign", -- Requires Renown 11 with Iskaara Tuskarr
	},

	-- Primalist Tomorrow
	[2085] = {
		-- Dragonscale Expedition - In the Halls of Titans
		[69097] = "A Vault Unsealed|70+ reputation:2507:24|1 DocNannersCampaign|Doc Nanners|discovery campaign", -- Requires Renown 24 with Dragonscale Expedition
	
		-- Iskaara Tuskarr - The Chieftain's Duty
		[68863] = "A Lost Tribe|70+ reputation:2511:11|3 RowieCampaign|Rowie|discovery campaign", -- Requires Renown 11 with Iskaara Tuskarr
	},


	--[[ The Azure Span ]]--
	
	[2024] = {
		-- Into the Archives
		[65686] = "To the Azure Span|60+ 65+,67030|37.66 23.71|Masud the Wise|campaign",
		[66228] = "Camp Antonidas|60+ 65+,67030 65686|41.44 35.61|Glania of the Blessed Ones|campaign",
		[66227] = "Some Good Fishing|60+ 65+,67030 65686|41.46 35.63|Khuri|fishing",
		[67174] = "Arcane Detection|60+ 65+,67030 65686|41.22 35.88|Miva Star-Eye",
		[67175] = "How To Stop An Exploding Toy Boat|60+ 65+,67030 67174|41.22 35.88|Miva Star-Eye",
		[67177] = "WANTED: Gorger|60+ 65+,67030 65686|41.42 36.42|Shala",
		[67035] = "Preservation of Knowledge|60+ 65+,67030 66228|46.67 39.74|Althanus|campaign",
		[67033] = "Assemble the Defenses|60+ 65+,67030 66228|46.69 39.77|Noriko the All-Remembering|campaign",
		[67036] = "Wrath of the Kirin Tor|60+ 65+,67030 67035 67033|46.69 39.77|Noriko the All-Remembering|campaign",
		[65688] = "Meeting Kalecgos|60+ 65+,67030 67036|46.64 40.19|Archmage Khadgar|campaign",
		[72784] = "Supporting the Cobalt Assembly|68+ 67036 -70550|46.67 39.74|Althanus", -- Breadcrumb for 70550
		[66488] = "WANTED: Frigellus|60+ 65+,67030 67036|46.16 39.62|WANTED: Frigellus",
		[66489] = "Setting the Defense|60+ 65+,67030 66488|45.99 38.41|Arch Enchanter Celeste",
		[66671] = "Path to Nowhere|60+ 65+,67030 67036|45.69 39.78|Caddy Scattershot",
		[66523] = "Tending the Forge|60+ 65+,67030 67036|46.12 40.98|Custodian Vernagos",
		[66493] = "Send It!|60+ 65+,67030 66523|45.99 38.79|Supply Portal",
		[65689] = "The Many Images of Kalecgos|60+ 65+,67030 65688|40.92 55|Kalecgos|campaign",
		[65702] = "Driven Mad|60+ 65+,67030 65689|40.74 59.04|Kalecgos|campaign",
		[65709] = "Arcane Pruning|60+ 65+,67030 65689|40.69 59.1|Kalecgos|campaign",
		[65852] = "Straight to the Top|60+ 65+,67030 65702 65709|40.74 59.04|Kalecgos|campaign",
		[65751] = "Platform Adjustments|60+ 65+,67030 65852|39.97 61.46|Kalecgos|campaign|\"Use one of the four Arcane currents if you need to get back up to Kalecgos atop the Archives\"",
		[65752] = "Arcane Annoyances|60+ 65+,67030 65852|39.97 61.46|Kalecgos|campaign|\"Use one of the four Arcane currents if you need to get back up to Kalecgos atop the Archives\"",
		[65854] = "Reclaiming the Oathstone|60+ 65+,67030 65751 65752|39.97 61.46|Kalecgos|campaign|\"Use one of the four Arcane currents if you need to get back up to Kalecgos atop the Archives\"",
		[65855] = "Aiding Azure Span|60+ 65+,67030 65854|39.48 63.07|Sindragosa|campaign",

		-- Tuskarr Troubles
		[66699] = "Ask the Locals|60+ 65+,67030 65855|46.69 39.77|Noriko the All-Remembering|campaign",
		[69904] = "Suspiciously Quiet|60+ 65+,67030 65855 -66500|46.69 39.77|Noriko the All-Remembering", -- Breadcrumb for 66500
		[66500] = "Ways of Seeing|60+ 65+,67030 65855 ~69904|47.67 40.23|Apprentice Scrumpy", -- Invalidates breadcrumb 69904
		[66503] = "For The Love of Others|60+ 65+,67030 66500|46.69 39.77|Noriko the All-Remembering",
		[65864] = "Catch the Caravan|60+ 65+,67030 66699|45.72 38.84|Babunituk|campaign",
		[65867] = "Howling in the Big Tree Hills|60+ 65+,67030 65864|35.28 36.94|Brena|campaign",
		[65866] = "Snap the Traps|60+ 65+,67030 65864|35.28 36.94|Brena|campaign",
		[65868] = "Those Aren't for Chewing|60+ 65+,67030 65864|35.37 36.94|Elder Poa|campaign",
		[65870] = "Supplies!|60+ 65+,67030 65867 65866 65868|34.34 31.01|Elder Poa|campaign",
		[65872] = "Ill Gnolls with Ill Intent|60+ 65+,67030 65867 65866 65868|34.37 31.03|Brena|campaign",
		[65873] = "Leader of the Shadepaw Pack|60+ 65+,67030 65867 65866 65868|34.37 31.03|Brena|campaign",
		[65871] = "Gnoll Way Out|60+ 65+,67030 65867 65866 65868|34.41 31.1|Hanu|campaign",
		[66239] = "Spreading Decay|60+ 65+,67030 65870 65872 65873 65871|34.37 31.03|Brena|campaign",
		[65869] = "Another Ambush|60+ 65+,67030 66239|28.69 34.82|Brena|campaign",
		[66026] = "Urgent Action Required|60+ 65+,67030 65869|28.69 34.82|Brena|campaign",

		-- Decayed Roots
		[65838] = "Breaching the Brackenhide|60+ 65+,67030 66026|20.54 35.69|Kalecgos|campaign",
		[65846] = "Ley Litter|60+ 65+,67030 65838|16.75 37.31|Kalecgos|campaign",
		[65844] = "Cut Out the Rot|60+ 65+,67030 65838|16.76 37.25|Norukk|campaign",
		[65845] = "Echoes of the Fallen|60+ 65+,67030 65838|16.75 37.22|Brena|campaign",
		[65848] = "Tome-ward Bound|60+ 65+,67030 65846 65844 65845|16.75 37.31|Kalecgos|campaign",
		[65847] = "Realignment|60+ 65+,67030 65848|15.3 39.43|Kalecgos|campaign",
		[65849] = "To Iskaara|60+ 65+,67030 65847|16.08 41.45|Brena|campaign",
		[66210] = "Gather the Family|60+ 65+,67030 65849|13.24 49.56|Brena|campaign",
		[66211] = "Brackenhide Hollow: To the Source|60+ 65+,67030 65849|13.24 49.56|Brena|dungeon",

		-- Vakthros

		-- Iskaara
		[66212] = "Fishing: Aileron Seamoth|60+ 65+,67030 65849 fishing|14.07 49.45|Lukoturukk|fishing",
		[66217] = "WANTED: Krojek the Shoreprowler|60+ 65+,67030 65849|13.19 48.76|Bukarakikk",
		[66218] = "Scampering Scamps|60+ 65+,67030 65849|12.9 48.7|Hanu",
		[66223] = "Can We Keep It?|60+ 65+,67030 66218|10.59 46.87|Neelo",
		[66558] = "Rowie|60+ 65+,67030 65849|13.76 47.61|Auntie Kaunnie",
		[70129] = "Toejam the Terrible|60+ 65+,67030 66558|16.11 50.42|Rowie",

		-- Grimtusk Hideaway
		[71013] = "No Vengeance on an Empty Stomach|60+ 65+,67030 66730|58.79 34.91|Old Grimtusk|fishing",
		[71014] = "A Far Furbolg Friend|60+ 65+,67030 71013|58.79 34.91|Old Grimtusk",
		[70996] = "A Little Kelp for My Friends|60+ 65+,67030 71014|1.18 39.25|Barst",
		[71000] = "Barst Recruited|60+ 65+,67030 70996|1.18 39.25|Barst",
		[71015] = "All Brawn, No Brains|60+ 65+,67030 71013|58.79 34.91|Old Grimtusk",
		[71009] = "Elementary, My Dear Drakonid|60+ 65+,67030 71015|21.05 35.09|Varsek",
		[71012] = "Varsek Recruited|60+ 65+,67030 71009|21.51 35.47|Varsek",
		[71016] = "Grimtusk's Sister|60+ 65+,67030 71013|58.79 34.91|Old Grimtusk",
		[71017] = "Naluki's Letter|60+ 65+,67030 71016|12.47 49.23|Naluki",
		[71135] = "Loose Ends|60+ 65+,67030 71000 71012 71017|58.79 34.91|Old Grimtusk",

		-- Gorloc Shore
		[66213] = "The Weave of a Tale|60+ 65+,67030 65849|12.4 49.4|Elder Nappa",
		[71234] = "Nook News|60+ 65+,67030 66213|14.07 49.45|Lukoturukk", -- check if 66213 is the only req
		[66781] = "A Matter of Taste|60+ 65+,67030 71234|7.62 44.33|Mordigan Ironjaw",
		[66147] = "Crystals in the Water|60+ 65+,67030 66781|7.64 44.23|Aelnara",
		[66154] = "Salivatory Samples|60+ 65+,67030 66781|7.67 44.27|Examiner Rowe",
		[66164] = "Fishy Fingers|60+ 65+,67030 66781|7.65 44.33|LOU-C Fitzcog",
		[66175] = "Field Experiment|60+ 65+,67030 66147 66154 66164|7.65 44.33|LOU-C Fitzcog",
		[66177] = "No Dwarf Left Behind|60+ 65+,67030 66175|7.65 44.33|LOU-C Fitzcog",
		[66232] = "Afront 'Till A Salt|60+ 65+,67030 66175|7.46 44.28|Wayun",
		[66187] = "Mad Mordigan & The Crystal King|60+ 65+,67030 66177|10.77 41.18|Aelnara",
		[66559] = "Back To Camp|60+ 65+,67030 66187|10.77 41.18|Aelnara",

		-- Snowhide Camp
		[66708] = "Riders in the Snow|60+ 65+,67030 -66709|65.9 25.48|Tuskarr Elder", -- Breadcrumb for 66709
		[66709] = "Field Medic 101|60+ 65+,67030 ~66708|59.26 39.73|Old Grimtusk", -- Invalidates breadcrumb 66708
		[66715] = "The Extraction|60+ 65+,67030 66709|59.26 39.73|Old Grimtusk",
		[66703] = "Snowball Effect|60+ 65+,67030 66715|58.39 42.03|Frostbite",
		[67050] = "Frostbite: Causes and Symptoms|60+ 65+,67030 66703|58.39 42.03|Frostbite",
		[66730] = "True Survivors|60+ 65+,67030 67050|58.47 40.53|Old Grimtusk",

		-- Slyvern Plunge
		[71235] = "Field Mages|60+ 65+,67030 66709 -68639|65.81 25.32|Drok Scrollstabber", -- Breadcrumb for 68639
		[68639] = "Prowling Polar Predators|60+ 65+,67030 ~71235|63.58 28.9|Callisto Windsor", -- Invalidates breadcrumb 71235
		[68641] = "Mossing the Mark|60+ 65+,67030|63.61 28.82|Steria Duskgrove",
		[68643] = "Vitamins and Minerals|60+ 65+,67030 68639 68641|63.58 28.9|Callisto Windsor",
		[68642] = "Needles to Say|60+ 65+,67030 68639 68641|63.61 28.82|Steria Duskgrove",
		[68644] = "Sugar, Spice, and Everything Nice|60+ 65+,67030 68643 68642|63.61 28.82|Steria Duskgrove",
		[69862] = "Save a Slyvern|60+ 65+,67030 68644|63.58 28.83|Steria Duskgrove",
		[70338] = "They Took the Kits|60+ 65+,67030 69862|65.7 30.84|Steria Duskgrove",

		-- Brackenhide Water Hole
		[66261] = "A Minor Setback|60+ 65+,67030 -66262|21.01 38.91|Illusory Mage", -- Breadcrumb for 66262
		[66262] = "Waste Water Cleanup|60+ 65+,67030 ~66261|22.73 41.68|Detry Hornswald", -- Invalidates breadcrumb 66261
		[66263] = "A Precision Approach|60+ 65+,67030 66262|22.73 41.68|Detry Hornswald",
		[66264] = "Disarmed and Docile|60+ 65+,67030 66262|22.73 41.68|Detry Hornswald",
		[66265] = "Who's Next?|60+ 65+,67030 66263 66264|22.73 41.68|Detry Hornswald",
		[66266] = "Filthy Mongrels|60+ 65+,67030 66263 66264|22.73 41.68|Detry Hornswald",
		[66267] = "M.E.T.A.|60+ 65+,67030 66263 66264|23.46 41.85|Illusory Mage",
		[66268] = "Third Try's the Charm|60+ 65+,67030 66265 66266 66267|22.73 41.68|Detry Hornswald",
		[66269] = "Just To Be Sure|60+ 65+,67030 66265 66266 66267|22.73 41.68|Detry Hornswald",
		[66270] = "Whack-a-Gnoll|60+ 65+,67030 66268 66269|22.73 41.68|Detry Hornswald",

		-- Creektooth Den
		[65279] = "By Royal Decree|60+ 65+,67030|16.2 20.88|Gnoll Mon-Ark",
		[65306] = "Rot Rancher|60+ 65+,67030|16.2 20.88|Gnoll Mon-Ark",
		[65302] = "Keys to the Kingdom|60+ 65+,67030 65279 65306|16.2 20.88|Gnoll Mon-Ark",
		[65594] = "Making a Mountain Out of a Gnoll Hill|60+ 65+,67030 65302|16.2 20.88|Gnoll Mon-Ark", -- coords?
		[65595] = "One Bad Apple|60+ 65+,67030 65594|12.87 22.01|Gnoll Mon-Ark",

		-- Shiverweb Vale
		[65750] = "Eight-Legged Menace|60+ 65+,67030|51.73 61.98|Lilial Dawnburst",
		[65769] = "Icy Webs|60+ 65+,67030|51.73 61.98|Lilial Dawnburst",
		[65758] = "Grungir the Explorer|60+ 65+,67030 65750 65769|51.73 61.98|Lilial Dawnburst",
		[65832] = "Dwarven Antifreeze|60+ 65+,67030 65758|49.01 64.21|Grungir Ironspout",
		[65833] = "Primalist Tampering|60+ 65+,67030 65758|49.01 64.21|Grungir Ironspout",
		[65834] = "Kill the Queen|60+ 65+,67030 65832 65833|49.01 64.21|Grungir Ironspout",

		-- Kauriq Gleamlet
		[65914] = "Mammoths Matter|60+ 65+,67030|44.78 50.62|Ruriq",
		[65925] = "Culling the Cullers|60+ 65+,67030|44.78 50.62|Ruriq",
		[65926] = "Tackling the Falls|60+ 65+,67030 65914 65925|45.41 54.16|Ruriq",
		[66724] = "The Gleamfisher|60+ 65+,67030 65926|45.51 54.18|Kauj",
		[65929] = "Tackling the Falls|60+ 65+,67030 66724|45.45 54.17|Ruriq",
		[65928] = "Wayward Winds|60+ 65+,67030 66724|45.51 54.18|Kauj",
		[65930] = "A Wrestle of Wind and Water|60+ 65+,67030 65929 65928|45.51 54.18|Kauj",
		[66155] = "Ruriq's River Rapids Ride|60+ 65+,67030 65930|45 54.03|Ruriq",

		-- Lost Ruins
		[66964] = "Artifacts in the Wrong Hands|60+ 65+,67030 -67111|65.94 25.27|Polky Cogzapper", -- Breadcrumb for 67111
		[67111] = "The Ailing Apprentice|60+ 65+,67030 ~66964|67.22 44.41|Kattigat", -- Invalidates breadcrumb 66964
		[67724] = "The Fending Flames|60+ 65+,67030 ~66964|67.34 44.34|To'tik",
		[70856] = "Kill it with Fire|60+ 65+,67030 ~66964|67.34 44.34|To'tik",
		[70858] = "Back into the Action|60+ 65+,67030 67111 67724 70856|67.22 44.41|Kattigat",
		[70859] = "What the Guardian Beholds|60+ 65+,67030 70858|67.3 44.34|Alia Sunsoar",
		[70931] = "Whispered Fragments|60+ 65+,67030 70859|67.3 44.34|Alia Sunsoar",
		[70937] = "What Valthrux Once Was|60+ 65+,67030 70859|67.34 44.34|To'tik",
		[70946] = "No One May Wield It|60+ 65+,67030 70931 70937|67.34 44.34|To'tik",
		[70970] = "Good Intentions|60+ 65+,67030 70946|67.32 44.39|Kattigat",

		-- Ruins of Karnthar
		[66391] = "To the Ruins!|60+ 65+,67030|63.44 57.99|Rannan Korren",
		[66353] = "R.A.D. Anomalies|60+ 65+,67030 66391|65.02 58.61|Rannan Korren",
		[66352] = "What the Enemy Knows|60+ 65+,67030 66391|65 58.62|Lathos Sunband",
		[66422] = "The Expedition Continues!|60+ 65+,67030 66353 66352|65 58.62|Lathos Sunband",
		[66423] = "Worries and Validations|60+ 65+,67030 66422|65.64 60.79|Lathos Sunband",
		[66425] = "Arcane Overload|60+ 65+,67030 66423|65.63 60.76|Rannan Korren",
		[66426] = "Running Out of Time|60+ 65+,67030 66425|65.64 60.79|Lathos Sunband",
		[66427] = "A Looming Menace|60+ 65+,67030 66426|68.46 60.5|Lathos Sunband",
		[66428] = "Friendship For Granted|60+ 65+,67030 66427|68.48 60.43|Rannan Korren",
		[66429] = "I Will Remember|60+ 65+,67030 66428|68.48 60.43|Rannan Korren",

		-- Rustpine Den
		[66141] = "Broken Traditions, Broken Bodies|60+ 65+,67030 ~66557|63.21 58.63|Garz", -- Invalidates breadcrumb 66557
		[66148] = "Former Furbolg Family|60+ 65+,67030 66141|63.5 52.97|Garz",
		[66149] = "Elemental Influence|60+ 65+,67030 66141|63.5 52.97|Garz",
		[66150] = "Rescuing Radza|60+ 65+,67030 66141|63.5 52.97|Garz",
		[66151] = "His Stone Heart|60+ 65+,67030 66148 66149 66150|60.91 50.51|Radza Thunderclaw",
		[66152] = "Nowhere to Go|60+ 65+,67030 66151|60.98 50.56|Garz",
		[70627] = "What of the Winterpelt Clan?|60+ 65+,67030 66152 -66557|63.17 58.69|Radza Thunderclaw", -- Mutually exclusive with 66557

		-- Winterpelt Hollow
		[66622] = "Wayward Tools|60+ 65+,67030|65.57 16.18|Tyrnokos Sunstrike",
		[66553] = "Hollow Up|60+ 65+,67030|65.39 15.95|Sonova Snowden",
		[66554] = "Aggressive Self-Defence|60+ 65+,67030|65.39 15.95|Sonova Snowden",
		[66555] = "Bear With Me|60+ 65+,67030 66553 66554|65.39 15.95|Sonova Snowden",
		[66556] = "Ice Cave Ya Got There|60+ 65+,67030 66555|65.39 15.95|Sonova Snowden",
		[66557] = "Academic Acquaintances|60+ 65+,67030 66556 -66141 -70627|65.39 15.95|Sonova Snowden", -- Breadcrumb for 66141; mutually exclusive with 70627

		-- Three-Falls Lookout
		[71233] = "Falling Water|60+ 65+,67030 -66837|28.46 35.11|Unkimi", -- Breadcrumb for 66837
		[66837] = "Nothing for Breakfast|60+ 65+,67030 ~71233|18.73 24.48|Willa Stronghinge", -- Invalidates breadcrumb 71233
		[66838] = "It's Cold Up Here|60+ 65+,67030|18.73 24.48|Willa Stronghinge",
		[66839] = "It's Brew Time!|60+ 65+,67030|18.99 23.29|Modurun Sixtoes",
		[66844] = "The Great Shokhari|60+ 65+,67030|19.05 23.97|Zon'Wogi",
		[66843] = "Out of Lukh|60+ 65+,67030|19.26 26.9|Branor Broadbraw",
		[66840] = "Water Safety|60+ 65+,67030 66837 66838|18.54 23.67|Manny Read", -- 66839 might be needed (probably not)
		[66841] = "A Shard of the Past|60+ 65+,67030 66837 66838|19.16 24.73|Gannar Fullpack", -- 66839 might be needed (probably not)
		[66845] = "Legendary Foil|60+ 65+,67030 66840 66841|18.74 24.43|Guo-Hee Calmwater",
		[66846] = "The Heart of the Deck|60+ 65+,67030 66845|18.77 24.43|Mysterious Apparition",

		-- A Helping Claw
		[71094] = "Help Is Our Way!|68+|46.41 25.67|Heleth the Wise",
		[71095] = "A Claw in Need|68+ 71094|45.9 25.98|Heleth the Wise",
		[71096] = "Is A Claw Indeed|68+ 71095|45.94 25.96|[unfriendly]Venderthvan]",
		[71097] = "A Helping Claw|68+ 71096|45.94 25.96|[unfriendly]Venderthvan]",

		-- Hemet Nesingwary
		[66972] = "Old Stonetusk|60+ 65+,67030|45 40.5|Hemet Nesingwary||\"Available while Hemet is at Camp Antonidas heading towards Iskaara or Camp Nowhere\"",
		[66958] = "Protect And Herd|60+ 65+,67030|14.16 46.82|Hemet Nesingwary||\"Available while Hemet is at Iskaara, and also while travelling through Camp Antonidas after arriving from Theron's Watch\"",
		[66957] = "A Shadow In The Ice|60+ 65+,67030|46.66 38.65|Hemet Nesingwary||\"Available while Hemet is at Camp Antonidas heading towards Rhonin's Shield\"",
		[66968] = "Pruning The Pack|60+ 65+,67030|65.45 25.89|Hemet Nesingwary||\"Available while Hemet is at Rhonin's Shield heading towards Theron's Watch\"",
		[66971] = "The Face of Death|60+ 65+,67030|63.5 15.65|Hemet Nesingwary||\"Available while Hemet is at Theron's Watch heading towards Camp Antonidas\"",
		[66939] = "Hunting the Huntmaster|60+ 65+,67030|63.83 59.08|Hemet Nesingwary||\"Available while Hemet is at Camp Nowhere\"",

		-- Happy Little Accidents
		[70166] = "The Joy of Painting|60+ 65+,67030 65849|22.14 36.76|Rauvros",
		[70168] = "Sad Little Accidents|60+ 65+,67030 70166|7.87 53.45|Ranpiata|dungeon",
		[70170] = "Beat the Demons Out of It|60+ 65+,67030 70168|7.87 53.45|Ranpiata|dungeon",
		[70171] = "Happy Little Accidents|60+ 65+,67030 70170|7.87 53.45|Ranpiata",

		-- Cobalt Assembly
		[70550] = "Welcome to the Assembly|68+ ~72784|49.05 23.15|Venthi", -- Invalidates breadcrumb 72784

		-- Dragon Racing
		[72487] = "The Thaldraszus Tour|60+ dragonriding 72485|63.17 13.65|Celormu",
		[72488] = "The Thaldraszus Advanced Tour|60+ dragonriding 72486|63.17 13.65|Celormu",
		[72985] = "The Thaldraszus Reverse Tour|60+ dragonriding 72984|63.17 13.65|Celormu",

		-- The Ruby Feast
		[67047] = "Warm Away These Shivers|70+ 70930|51.73 61.98|Lilial Dawnburst",

		-- Artisan's Consortium
		[67295] = "That's My Specialty|60+ 62+,67030 66340 skill:2823:25,skill:2822:25,skill:2825:25,skill:2827:25,skill:2832:25,skill:2828:25,skill:2829:25,skill:2830:25,skill:2833:25,skill:2834:25,skill:2831:25|37.82 24|Miguel Bright", -- Requires 25 skill in any Dragon Isles primary profession
		[69915] = "Targeted Ads|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,cooking,fishing|37.94 24.1|Azley",
		[69981] = "Customer Satisfaction|60+ 69915 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,cooking,fishing|37.94 24.1|Azley",
		[69919] = "A Craft in Need|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,cooking,fishing|37.94 24.1|Azley",
		
		-- Dragonscale Expedition - In the Halls of Titans
		[69097] = "A Vault Unsealed|70+ reputation:2507:24|1 DocNannersCampaign|Doc Nanners|discovery campaign", -- Requires Renown 24 with Dragonscale Expedition

		-- Iskaara Tuskarr - Renown
		[70871] = "Iskaaran Fishing Net|60+ accachievement:16924|12.82 49.18|Tavio", -- Requires Renown 5 with Iskaara Tuskarr on account
		[70940] = "Tuskarr Champion's Tales|60+ reputation:2511:5|12.41 49.34|Elder Poa", -- Requires Renown 5 with Iskaara Tuskarr
		[70963] = "Wrist Support|60+ reputation:2511:14|13.17 48.52|Arvik", -- Requires Renown 14 with Iskaara Tuskarr
		[70978] = "Dragon Isles Champion's Tales|60+ reputation:2511:15|12.41 49.34|Elder Poa", -- Requires Renown 15 with Iskaara Tuskarr
	
		-- Iskaara Tuskarr - The Chieftain's Duty
		[68863] = "A Lost Tribe|70+ reputation:2511:11|3 RowieCampaign|Rowie|discovery campaign", -- Requires Renown 11 with Iskaara Tuskarr
		[68640] = "Sudden Isolation|70+ reputation:2511:11 68863|13.14 49.26|Murik|campaign", -- Requires Renown 11 with Iskaara Tuskarr

		-- The Spark of Ingenuity
		[70181] = "First Challenge of Tyr: Finesse|60+ 70845|67.18 30.72|Ornamented Statue|campaign",
		[70182] = "The Sweet Taste of Victory|60+ 70181|67.13 30.92|Maiden of Inspiration|campaign",
	},


	--[[ Ohn'ahran Plains ]]--
	
	[2023] = {
		-- Into the Plains
		[65779] = "Into the Plains|60+ 62+,67030 65795,67030|79.44 15.2|Ambassador Taurasza|campaign", -- Adventure mode bypasses prereqs
		[65780] = "Proving Oneself|60+ 62+,67030 65779|77.72 23.93|Scout Tomul|campaign",
		[65783] = "Welcome at Our Fire|60+ 62+,67030 65780|78.62 25.38|Scout Tomul|campaign",
		[70174] = "The Shikaar|60+ 62+,67030 65783|85.31 25.41|Scout Tomul|campaign",
		[65801] = "Making Introductions|60+ 62+,67030 70174|85.73 25.32|Sansok Khan|campaign",
		[65802] = "Supplies for the Journey|60+ 62+,67030 70174|85.73 25.32|Sansok Khan|campaign",
		[70319] = "Nergazurai|60+ 62+,67030|84.53 25.33|Muqur Rain-Touched",
		[65803] = "Toward the City|60+ 62+,67030 65801 65802|84.69 22.81|Scout Tomul|campaign",
		[65804] = "For Food and Rivalry|60+ 62+,67030 65803|75.67 31.67|Scout Tomul|campaign",
		[70185] = "Mysterious Beast|60+ 62+,67030 65803|76.74 31.89|Mysterious Paw Print|campaign",
		[65940] = "By Broken Road|60+ 62+,67030 65803 70185|75.67 31.67|Scout Tomul|campaign",
		[65805] = "Connection to Ohn'ahra|60+ 62+,67030 65940|69.97 37.98|Ohn Seshteng|campaign",
		[66848] = "Omens on the Wind|60+ 62+,67030 65805|69.97 37.98|Ohn Seshteng|campaign",
		[65806] = "Maruukai|60+ 62+,67030 66848|70.01 38.03|Sansok Khan|campaign",

		-- Maruukai
		[72429] = {"Orientation: Maruukai|60+ 67030 -65806,66783|63.4 41.39|Sansok Khan", "Orientation: Maruukai|60+ 67030 65806 -66022|61.44 39.52|Sansok Khan", "Orientation: Maruukai|60+ 67030 66022 -66783|60.08 37.45|Sansok Khan",},
		-- 66783 - find correct quest when Sansok Khan moves back
		[70739] = "Bloodlines, Sweets, and Teerai|60+ 62+,67030|63.61 40.46|Hunter Narman",
		[70730] = "Shikaar Giver|60+ 62+,67030|62.81 35.45|Windsage Dawa",
		[70721] = "After My Ohn Heart|60+ 62+,67030 70739 70730|62.81 35.45|Windsage Dawa",
		[66016] = "Clan Teerai|60+ 62+,67030 65806|61.44 39.52|Sansok Khan|campaign",
		[66019] = "Honoring Our Ancestors|60+ 62+,67030 66016|59.15 37.6|Qariin Dotur|campaign",
		[66017] = "Clan Ohn'ir|60+ 62+,67030 65806|61.44 39.52|Sansok Khan|campaign",
		[66020] = "Omens and Incense|60+ 62+,67030 66017|62.99 33.66|Ohn Seshteng|campaign",
		[66018] = "Clan Nokhud|60+ 62+,67030 65806|61.44 39.52|Sansok Khan|campaign",
		[66021] = "Unwelcome Outsider|60+ 62+,67030 66018|60.32 40.74|Guard Bahir|campaign",
		[66969] = "Clans of the Plains|60+ 62+,67030 66019 66020 66021|62.44 41.58|Aru|campaign",
		[66948] = "The Emissary's Arrival|60+ 62+,67030 66969|61.03 40.43|Gemisath|campaign",
		[66022] = "The Khanam Matra|60+ 62+,67030 66948|61.03 40.43|Gemisath|campaign",
		[66023] = "Trucebreakers|60+ 62+,67030 66022|60.36 38.05|Khansguard Akato|campaign",
		[66024] = "Covering Their Tails|60+ 62+,67030 66022|59.5 38.75|Scout Tomul|campaign",
		[66025] = "The Nokhud Threat|60+ 62+,67030 66023 66024|60.32 38.08|Khanam Matra Sarest|campaign",

		-- Ohn'ahra's Blessing
		[66201] = "Hooves of War|60+ 62+,67030 66025|60.01 37.49|Khanam Matra Sarest|campaign",
		[66222] = "The Calm Before the Storm|60+ 62+,67030 66201|41.89 61.79|Khansguard Jebotai|campaign",
		[70229] = "Boku the Mystic|60+ 62+,67030 66222|41.89 61.79|Khansguard Jebotai|campaign",
		[66254] = "Pessimistic Mystic|60+ 62+,67030 70229|36.81 57.26|Initiate Boku|campaign",
		[66224] = "Mystic Mystery|60+ 62+,67030 66254|36.81 57.26|Initiate Boku|campaign",
		[66225] = "Toting Totems|60+ 62+,67030 66224|49.36 63.14|Tigari Khan|campaign",
		[70195] = "Taken By Storm|60+ 62+,67030 66224|49.36 63.14|Tigari Khan|campaign",
		[66226] = "Emotional Support Companions|60+ 62+,67030|47.02 71.18|Initiate Kittileg",
		[66236] = "Catching Wind|60+ 62+,67030 66225 70195|49.36 63.14|Tigari Khan|campaign",
		[66242] = "Weather Control|60+ 62+,67030 66236|58.12 68.97|Initiate Boku|campaign",
		[66256] = "Eagle-itarian|60+ 62+,67030 66236|58.12 68.97|Initiate Boku|campaign",
		[66257] = "Fowl Sorcery|60+ 62+,67030 66236|58.12 68.97|Initiate Boku|campaign",
		[66258] = "Oh No, Ohn'ahra!|60+ 62+,67030 66242 66256 66257|60.65 63.54|Initiate Boku|campaign",
		[66259] = "A Storm of Ill Tidings|60+ 62+,67030 66258|61.41 62.78|Initiate Boku|campaign",

		-- Bonds Renewed
		[66327] = "Chasing the Wind|60+ 62+,67030 66259|60.01 37.49|Khanam Matra Sarest|campaign",
		[70244] = "Nokhud Can Come of This|60+ 62+,67030 66327|73.04 40.59|Khanam Matra Sarest|campaign",
		[66329] = "Blowing of the Horn|60+ 62+,67030 70244|76.7 40.95|Khanam Matra Sarest|campaign",
		[66328] = "Green Dragon Down|60+ 62+,67030 66329|76.7 40.95|Khanam Matra Sarest|campaign",
		[66344] = "With the Wind at Our Backs|60+ 62+,67030 66328|72.45 50.77|Merithra|campaign",
		[70220] = "Shady Sanctuary|60+ 62+,67030 66344|28.26 57.69|Merithra|campaign",
		[70062] = "Some Call Me Bug Catcher|60+ 62+,67030|29.68 58.63|Gracus||\"Gracus wanders around the Shady Sanctuary\"",
		[70069] = "Others Call Me Duck Herder|60+ 62+,67030 70062|29.68 58.63|Gracus||\"Gracus wanders around the Shady Sanctuary\"",
		[70070] = "But... I Am the Hero of Ducks|60+ 62+,67030 70069|29.68 58.63|Gracus||\"Gracus wanders around the Shady Sanctuary\"",
		[66331] = "The Primalist Front|60+ 62+,67030 70220|28.26 57.69|Merithra|campaign",
		[66333] = "Justice for Solethus|60+ 62+,67030 66331|25.63 40.52|Merithra|campaign",
		[66335] = "Deconstruct Additional Pylons|60+ 62+,67030 66333|26.32 39.05|Khanam Matra Sarest|campaign",
		[66784] = "Starve the Storm|60+ 62+,67030 66333|26.32 39.05|Khanam Matra Sarest|campaign",
		[66337] = "Stormbreaker|60+ 62+,67030 66335 66784|26.32 39.05|Khanam Matra Sarest|campaign",
		[66336] = "The Isle of Emerald|60+ 62+,67030 66337|25.65 48.4|Merithra|campaign",
		[66783] = "Renewal of Vows|60+ 62+,67030 66336|22.14 50.98|Merithra|campaign",
		[66339] = "The Nokhud Offensive: The Wind Belongs to the Sky|60+ 62+,67030 66783|22.14 50.98|Khanam Matra Sarest|dungeon",
		[70985] = "The Lonely Scout|60+ 62+,67030 66783|34.22 53.98|Scout Santuun",

		-- Taivan's Purpose
		[67772] = "The Trouble with Taivan|60+ 62+,67030 66327|61.21 40|Healer Selbekh",
		[67921] = "The Hunting Hound|60+ 62+,67030 67772|71.42 49.59|Hunter Jadar",
		[70989] = "Part of a Pack|60+ 62+,67030 67921|71.42 49.59|Hunter Jadar",
		[68083] = "Try Again, Taivan!|60+ 62+,67030 70989|71.42 49.59|Hunter Jadar",
		[68084] = "The Gentle Giant|60+ 62+,67030 68083|61.21 40|Healer Selbekh",
		[68085] = "Shaping a Shepherd|60+ 62+,67030 68084|49.05 41.07|Shepherd Tevatei",
		[71022] = "Reign of the Ram|60+ 62+,67030 68085|49.05 41.07|Shepherd Tevatei",
		[68087] = "Danger in Daruukhan|60+ 62+,67030 71022|49.05 41.07|Shepherd Tevatei",
		[69094] = "Saving Centaur|60+ 62+,67030 68087|52.83 29.85|Healer Selbekh",
		[69095] = "Homeward Hound|60+ 62+,67030 69094|52.83 29.85|Healer Selbekh",
		[69096] = "Taivan's Purpose|60+ 62+,67030 69095|61.21 40|Healer Selbekh",

		-- Initiate's Day Out
		[65906] = "A Disgruntled Initiate|60+ 62+,67030 -65901|63.12 34.05|Windsage Ordven", -- Breadcrumb for 65901
		[65901] = "Sneaking Out|60+ 62+,67030 ~65906|56.25 75.95|Initiate Radiya", -- Invalidates breadcrumb 65906
		[65907] = "Favorite Fruit|60+ 62+,67030 65901|54.78 66.41|Initiate Radiya",
		[65770] = "A Promise Is A Promise|60+ 62+,67030 65907|54.78 66.41|Initiate Radiya",
		[65761] = "More Adventure Than Expected|60+ 62+,67030 65770|52.05 63.24|Godoloto",
		[65711] = "Stealing Its Thunder|60+ 62+,67030 65761|47.5 54.13|Initiate Radiya",
		[66676] = "Sneaking In|60+ 62+,67030 65711|48.27 56.5|Initiate Radiya",

		-- To Tame A Thunderspine
		[71196] = "To Tame A Thunderspine|70+ 66676 reputation:2503:9|56.2 77.11|Initiate Radiya", -- Requires Renown 9 with Maruuk Centaur
		[71197] = "To Tame A Thunderspine|70+ 71196 reset:71196|56.2 77.11|Initiate Radiya", -- check coords
		[71198] = "To Tame A Thunderspine|70+ 71197 reset:71197|57.09 77.64|Initiate Radiya",
		[71199] = "To Tame A Thunderspine|70+ 71198 reset:71198|56.73 76.3|Initiate Radiya",
		[71195] = "To Tame A Thunderspine|70+ 71199 reset:71199|57.66 72.31|Initiate Radiya",
		[71209] = "Beast of the Plains|70+ 71195|57.66 72.31|Initiate Radiya",

		-- Lilac Ramble
		[65899] = "Find Theramus|60+ 62+,67030|25.06 56.88|Celina Crunchyleaves",
		[65900] = "Suspiciously Spiced Steak|60+ 62+,67030 65899|24.46 63.04|Felina Starrunner",
		[65903] = "Can't Beat Fluffy|60+ 62+,67030 65899|24.44 63.01|Celina Crunchyleaves",
		[65902] = "Food or Floof|60+ 62+,67030 65900 65903|24.46 63.04|Felina Starrunner",
		[65905] = "More Than Weeds|60+ 62+,67030 65902|24.46 63.04|Felina Starrunner",
		[65937] = "Proof of Negligence|60+ 62+,67030 65902|24.44 63.01|Celina Crunchyleaves",
		[65904] = "Enough Is Enough|60+ 62+,67030 65905 65937|24.44 63.01|Celina Crunchyleaves",
		[66011] = "In Memory of Ysera|60+ 62+,67030 65904|24.54 63.97|Felina Starrunner",

		-- Pinewood Post
		[65837] = "Trouble In The Pines|60+ 62+,67030 -66681|61.99 41.81|Beastmaster Tirren", -- Breadcrumb for 66681
		[66681] = "Tempests Abound|60+ 62+,67030 ~65837|81.03 58.94|Sentinel Olekk", -- Invalidates breadcrumb 65837
		[66680] = "Counting Sheep|60+ 62+,67030 ~65837|81.02 58.97|Scout Watu",
		[66689] = "More Than A Rock|60+ 62+,67030 ~65837|82.33 64.38|{4554450} [Stormtouched Shards]||Drops from any [hostile]Stormtouched beast] in Sagecrest Pines",
		[66683] = "Last Resort Analysis|60+ 62+,67030 66681 66680 66689|81.02 58.97|Scout Watu",
		[65836] = "Show of Storm|60+ 62+,67030 66683|81.02 58.97|Scout Watu",
		[66684] = "Storm Chasing|60+ 62+,67030 65836|83.98 60.73|Scout Watu",

		-- Elder Nazuun
		[71027] = "WANTED: Mara'nar the Thunderous|60+ 62+,67030|39.56 56.42|WANTED: Mara'nar the Thunderous",
		[66687] = "Land of the Apex|60+ 62+,67030|41.63 56.74|Elder Nazuun",
		[66834] = "Rellen, the Learned|60+ 62+,67030 66687|41.63 56.74|Elder Nazuun",
		[66688] = "Signs of the Wind|60+ 62+,67030|41.63 56.74|Elder Nazuun",
		[70374] = "Himia, the Blessed|60+ 62+,67030 66688|49.35 49.4|Himia, the Blessed",
		[66690] = "The Nokhud Offensive: The Final Ancestor|60+ 62+,67030 66834 70374|41.63 56.74|Elder Nazuun|dungeon",

		-- The Eternal Kurgans
		[66651] = "Up to No-khud|60+ 62+,67030 -66652|40.93 61.61|Elder Yuvari", -- Breadcrumb for 66652
		[66652] = "Return to Mender|60+ 62+,67030 ~66651|39.03 66.01|Initiate Zorig", -- Invalidates breadcrumb 66651
		[66654] = "Desecrator Annihilator|60+ 62+,67030 66652|39.03 66.01|Initiate Zorig",
		[66655] = "Reagents of De-Necromancy|60+ 62+,67030 66652|39.03 66.01|Initiate Zorig",
		[69936] = "Zambul, Head Vandal|60+ 62+,67030 66654 66655|33.76 65.36|Initiate Zorig",
		[66656] = "Definitely Eternal Slumber|60+ 62+,67030 69936|33.76 65.36|Initiate Zorig",
		[66657] = "And Stay Dead!|60+ 62+,67030 66656|33.76 65.36|Initiate Zorig",
		[66658] = "The Nokhud Offensive: Founders Keepers|60+ 62+,67030 66657|41 61.61|Initiate Zorig|dungeon",

		-- Mudfin Village
		[65950] = "Thieving Gorlocs|60+ 62+,67030|84.39 25.03|Farrier Roscha",
		[65951] = "Sole Supplier|60+ 62+,67030|84.35 25.01|Apprentice Ehri",
		[65953] = "The Ora-cull|60+ 62+,67030 65950 65951|80.54 30.73|Khasar",
		[65954] = "Release the Hounds|60+ 62+,67030 65950 65951|80.54 30.73|Khasar",
		[65955] = "A Centaur's Best Friend|60+ 62+,67030 65950 65951|80.54 30.73|Khasar",
		[66005] = "Medallion of a Fallen Friend|60+ 62+,67030 65953 65954 65955|82.1 31.5|{1013266} [Medallion of a Fallen Friend]||Drops from [hostile]Chief Grrlgllmesh]",
		[65952] = "A Chief of Legends|60+ 62+,67030 65953 65954 65955|83.43 32.33|Khasar",
		[65949] = "The Sole Mender|60+ 62+,67030 66005|83.43 32.33|Khasar",
		[66006] = "Return to Roscha|60+ 62+,67030 65952|83.43 32.33|Khasar",

		-- Nelthazan Ruins
		[70337] = "Emberwatch|60+ 62+,67030|62.13 36.43|Windsage Kven",
		[65890] = "The Nelthazan Ruins|60+ 62+,67030 -65891|66 25.06|Telemancer Aerilyn", -- Breadcrumb for 65891
		[65891] = "Tools of the Tirade|60+ 62+,67030 ~65890|64 18.29|Skyscribe Adenedal", -- Invalidates breadcrumb 65890
		[65893] = "The Relic Inquiry|60+ 62+,67030 ~65890|64 18.29|Skyscribe Adenedal",
		[65895] = "Competing Company|60+ 62+,67030 65891 65893|64 18.29|Skyscribe Adenedal",
		[66719] = "One Step Backwards|60+ 62+,67030 65891 65893 evoker|64 18.29|Skyscribe Adenedal", -- double check on Evoker
		[65898] = "Proto Problems|60+ 62+,67030 65895 -evoker,66719|62.14 16.31|Skyscribe Adenedal",
		[66700] = "Proto Problems|60+ 62+,67030 65898|66.33 24.34|Skyscribe Adenedal",

		-- The Fields of Ferocity
		[70444] = "The Fields of Ferocity|60+ 62+,67030 -66459|62.33 42.3|Fields of Ferocity", -- Breadcrumb for 66459
		[66459] = "The Field of Ferocity: Terror of the Swamp!|60+ 62+,67030 ~70444|53.16 37.32|Gurgthock", -- Invalidates breadcrumb 70444
		[66460] = "The Field of Ferocity: Lord of Decay!|60+ 62+,67030 66459|53.16 37.32|Gurgthock",
		[66461] = "The Field of Ferocity: Foe from the Volcano!|60+ 62+,67030 66460|53.16 37.32|Gurgthock",
		[66462] = "The Field of Ferocity: Lost in the Dream!|60+ 62+,67030 66461|53.16 37.32|Gurgthock",
		[66463] = "The Field of Ferocity: Elemental Revenge Round!|60+ 62+,67030 66462|53.16 37.32|Gurgthock",
		[66464] = "The Field of Ferocity: Master of the Hunt!|60+ 62+,67030 66463|53.16 37.32|Gurgthock",

		-- Dragon Racing
		[72485] = "The Azure Span Tour|60+ dragonriding 72483|88.09 36.28|Celormu",
		[72486] = "The Azure Span Advanced Tour|60+ dragonriding 72484|88.09 36.28|Celormu",
		[72486] = "The Azure Span Reverse Tour|60+ dragonriding 72982|88.09 36.28|Celormu",

		-- Grand Hunts
		[70501] = "License to Hunt|70+ accachievement:17044|64.01 41.02|Hunt Instructor Basku", -- Requires Renown 5 with Maruuk Centaur unlocked on account
		
		-- Artisan's Consortium
		[67295] = "That's My Specialty|60+ 62+,67030 66340 skill:2823:25,skill:2822:25,skill:2825:25,skill:2827:25,skill:2832:25,skill:2828:25,skill:2829:25,skill:2830:25,skill:2833:25,skill:2834:25,skill:2831:25|71.88 80.99|Miguel Bright", -- Requires 25 skill in any Dragon Isles primary profession
		[69915] = "Targeted Ads|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,cooking,fishing|72.05 81.14|Azley",
		[69981] = "Customer Satisfaction|60+ 69915 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,cooking,fishing|72.05 81.14|Azley",
		[69919] = "A Craft in Need|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,cooking,fishing|72.05 81.14|Azley",
		[70029] = {"Artisan's Supply: Runed Serevite Rods|60+ enchanting|41.35 61|Asarin|enchanting", "Artisan's Supply: Runed Serevite Rods|60+ enchanting|56.83 75.51|Solonga|enchanting",},
		[70033] = {"Artisan's Supply: Pioneer's Leather Boots|60+ leatherworking|39.4 55.4|Ekhi|leatherworking", "Artisan's Supply: Pioneer's Leather Boots|60+ leatherworking|80.8 59.4|Dokhusek|leatherworking",},
		[70034] = "Artisan's Supply: Salamanther Scale|60+ skinning|84.6 23.2|Makhul|skinning",
		[69979] = "A Worthy Hunt|60+ 62+,67030 69946|51.77 33.02|Khadin",

		-- The Azure Span - Into the Archives
		[66340] = "Into the Azure|60+ 62+,67030 66783|22.14 50.98|Merithra|campaign",
		[65686] = "To the Azure Span|60+ 65+,67030|71.66 80.58|Masud the Wise|campaign",

		-- The Spark of Ingenuity
		[70376] = "Second Challenge of Tyr: Might|60+ 70339|66.14 55.2|Ornamented Statue|campaign",
		[70341] = "Well Earned Victory|60+ 70376|66.28 55.33|Maiden of Inspiration|campaign",
		
		-- Dragonscale Expedition - In the Halls of Titans
		[69097] = "A Vault Unsealed|70+ reputation:2507:24|1 DocNannersCampaign|Doc Nanners|discovery campaign", -- Requires Renown 24 with Dragonscale Expedition
	
		-- Iskaara Tuskarr - The Chieftain's Duty
		[68863] = "A Lost Tribe|70+ reputation:2511:11|3 RowieCampaign|Rowie|discovery campaign", -- Requires Renown 11 with Iskaara Tuskarr
	},


	--[[ The Waking Shores ]]--

	[2022] = {
		-- The Dragonscale Expedition
		[70122] = "Explorers in Peril|60+ alliance 67700|82.13 31.88|Toddy Whiskers|campaign", -- Alliance
		[65452] = "Explorers in Peril|60+ horde 65444|80.62 27.61|Naleidea Rivergleam|campaign", -- Horde
		[70124] = "Practice Materials|60+ alliance 67700|82.09 31.88|Thaelin Darkanvil|campaign", -- Alliance
		[65451] = "Practice Materials|60+ horde 65444|80.61 27.65|Boss Magor|campaign", -- Horde
		[70123] = "Primal Pests|60+ alliance 67700|82.16 31.85|Scalecommander Azurathel|campaign", -- Alliance
		[65453] = "Primal Pests|60+ horde 65444|80.65 27.6|Scalecommander Cindrethresh|campaign", -- Horde
		[70148] = "Without Purpose|60+ dracthyr|76.41 34.45|Haephesta", -- Dracthyr only
		[70042] = "Opportunities Abound|60+ rogue|76.3 34.34|Vish the Sneak", -- Rogue only
		[66101] = "From Such Great Heights|60+|75.84 33.49|Aster Cloudgaze",
		[67053] = "Give Peace a Chance|60+ alliance|76.73 34.55|Captain Garrick", -- Alliance
		[66110] = "Give Peace a Chance|60+ horde|76.36 33.08|Warlord Breka Grimaxe", -- Horde
		[70135] = "Encroaching Elementals|60+ alliance 67053 -66111|76.36 33.08|Warlord Breka Grimaxe", -- Alliance
		[66111] = "Encroaching Elementals|60+ horde 66110 -70135|76.73 34.55|Captain Garrick", -- Horde
		[66112] = "Always Be Crafting|60+ 67053,66110|76.35 34.64|Grun Ashbeard",
		[69965] = "Quality Assurance|60+ 67053,66110|76.41 34.45|Haephesta",
		[70125] = "Where is Wrathion?|60+ alliance 70122|76.63 33.63|Toddy Whiskers|campaign", -- Alliance
		[69910] = "Where is Wrathion?|60+ horde 65452|76.61 33.6|Naleidea Rivergleam|campaign", -- Horde
		[72293] = "Adventuring in the Dragon Isles|60+ 67030 69910,70125 -69911 -72266|76.57 33.66|Sendrax",
		-- 72266 - The Waking Shores (Adventure Mode)
		[69911] = "Excuse the Mess|60+ 69910,70125 -67030,72266|76.57 33.66|Sendrax|campaign",
		[69912] = "My First Real Emergency!|60+ 69911|76.57 33.66|Sendrax|campaign",
		[69914] = "The Djaradin Have Awoken|60+ 69912|76.22 34.53|Majordomo Selistra|campaign",

		-- Dragons in Distress
		[65760] = "Reporting for Duty|60+ 69914|76.26 34.4|Sendrax|campaign",
		[65989] = "Invader Djaradin|60+ 65760|71.2 40.77|Commander Lethanak|campaign",
		[65990] = "Deliver Whelps From Evil|60+ 65760|71.2 40.77|Commander Lethanak|campaign",
		[65991] = "Time for a Reckoning|60+ 65989 65990|71.2 40.77|Commander Lethanak|campaign",
		[65993] = "Killjoy|60+ 65991|66.36 35|Wrathion|campaign",
		[65992] = "Blacktalon Intel|60+ 65991|66.36 35|Wrathion|campaign",
		[65995] = "The Obsidian Citadel|60+ 65991|62.92 29.42|{237451} [Qalashi Plans]|campaign|Drops from [hostile]Meatgrinder Sotok]",
		[65996] = "Veteran Reinforcements|60+ 65993 65992 65995|62.75 33.11|Majordomo Selistra|campaign",
		[66998] = "Fighting Fire with... Water|60+|59.1 34.84|Caretaker Ventraz", -- no prereqs?
		[65997] = "Chasing Sendrax|60+ 65996|54.99 30.78|Caretaker Azkra|campaign",
		[70179] = "A Two for One Deal|60+ 65997|54.43 30.84|Apprentice Caretaker Zefren",
		[65998] = "Future of the Flights|60+ 65997|55.17 24.95|Sendrax|campaign",
		[65999] = "Red in Tooth and Claw|60+ 65997|55.17 24.95|Sendrax|campaign",
		[66000] = "Library of Alexstrasza|60+ 65997|55.26 24.69|On the Origin of Draconic Species|campaign",
		[66001] = "A Last Hope|60+ 65998 65999 66000|55.17 24.95|Sendrax|campaign",

		-- In Defense of Life
		[66114] = "For the Benefit of the Queen|60+ 66001|55.09 31.02|Majordomo Selistra|campaign",
		[66115] = "The Mandate of the Red|60+ 66114|62.34 73.02|Alexstrasza the Life-Binder|campaign",
		[70061] = "Training Wings|60+ 66115|62.18 70.56|Amella|campaign",
		[68795] = "Dragonriding|60+ 66114|62.34 73.02|Alexstrasza the Life-Binder|campaign",
		[65118] = "How to Glide with Your Dragon|60+ 68795|57.66 66.89|Lord Andestrasz|campaign",
		[65120] = "How to Dive with Your Dragon|60+ 65118|57.66 66.89|Lord Andestrasz|campaign",
		[65133] = "How to Use Momentum with Your Dragon|60+ 65120|57.66 66.89|Lord Andestrasz|campaign",
		[68796] = "The Skytop Observatory|60+ 65133|57.66 66.89|Lord Andestrasz|campaign",
		[68797] = "A New Set of Horns|60+ 68796|75.18 54.97|Lord Andestrasz|campaign",
		[68798] = "Dragon Glyphs and You|60+ 68797|75.18 54.97|Lord Andestrasz|campaign",
		[68799] = "Return to the Ruby Lifeshrine|60+ 68798|75.18 54.97|Lord Andestrasz|campaign",
		[66931] = "Who Brought the Ruckus?|60+ 70061 68799|62.34 73.02|Alexstrasza the Life-Binder|campaign",
		[66116] = "The Primary Threat|60+ 66931|59.51 72.64|Majordomo Selistra|campaign",
		[66118] = "Basalt Assault|60+ 66116|59.41 75.88|Commander Lethanak|campaign",
		[66119] = "Ruby Life Pools: Primalist Invasion|60+ 66118|59.97 75.95|Kildrumeh|dungeon",
		[66122] = "Proto-Fight|60+ 66118|59.41 75.88|Commander Lethanak|campaign",
		[66121] = "Egg Evac|60+ 66118|59.48 76.14|Majordomo Selistra|campaign",
		[66123] = "Cut Off the Head|60+ 66121|53.69 80.17|Majordomo Selistra|campaign", -- is 66122 req?
		[66124] = "Exeunt, Triumphant|60+ 66123|53.69 80.17|Majordomo Selistra|campaign",

		-- Wrathion's Gambit
		[66079] = "Wrathion Awaits|60+ 66124|46.09 78.29|Alexstrasza the Life-Binder|campaign",
		[72241] = "Lessons From Our Past|60+ 66079|42.47 66.79|Scalecommander Emberthal|campaign",
		[66078] = "Sharp Practice|60+ 72241|42.47 66.84|Wrathion|campaign",
		[66048] = "Best Plans and Intentions|60+ 72241|42.47 66.79|Scalecommander Emberthal|campaign",
		[65956] = "Talon Strike|60+ 66078 66048|42.47 66.84|Wrathion|campaign",
		[65957] = "No Time for Heroes|60+ 66078 66048|42.47 66.84|Wrathion|campaign",
		[65939] = "The Courage of One's Convictions|60+ 65956 65957|33.99 61.29|Wrathion|campaign",
		[66044] = "Taking the Walls|60+ +65939|29.15 58.83|Wrathion|campaign",
		[66049] = "Obsidian Oathstone|60+ 65939 66044|26.43 58.77|Wrathion|campaign",
		[66055] = "A Shattered Past|60+ 66049|27.26 62.8|Forgemaster Bazentus|campaign",
		[66056] = "Forging a New Future|60+ 66055|27.26 62.8|Forgemaster Bazentus|campaign",
		[66354] = "The Spark|60+ 66056|24.68 61.12|Forgemaster Bazentus|campaign",
		[66057] = "Restoring the Faith|60+ 66354|24.68 61.12|Forgemaster Bazentus|campaign",
		[72135] = "Neltharus: Secrets Within|60+ !66057|25.11 56.23|Archivist Edress|dungeon",

		-- A Purpose Restored
		[66779] = "Heir Apparent|60+ 66057|24.25 55.88|Sabellian|campaign",
		[66780] = "Claimant to the Throne|60+ 66057|24.43 55.5|Wrathion|campaign",
		[65793] = "Black Wagon Flight|60+ 66779 66780|24.25 55.88|Sabellian|campaign",
		[66785] = "The Last Eggtender|60+ 65793|57.95 67.3|Sabellian|campaign",
		[66788] = "Egg-cited for the Future|60+ 66785|61.6 68.71|Mother Elion|campaign",
		[65791] = "Life-Binder on Duty|60+ 66788|61.6 68.71|Mother Elion|campaign",
		[65794] = "A Charge of Care|60+ 65791|62.34 73.02|Alexstrasza the Life-Binder|campaign",

		-- Save the Hippos!
		[72122] = "Erstwhile Ecologists|60+ 65989 -66105|71.14 40.48|Mender Eskros",
		[66105] = "A Scalpel of a Solution|60+ ~72122|74.43 42.14|Ecologist Iskha", -- Invalidates 72122
		[66107] = "Wildlife Rescue|60+|74.43 42.14|Ecologist Tharu",
		[66104] = "Forensic Ecology|60+ 66105 66107|74.43 42.14|Ecologist Iskha",
		[66108] = "A Sledgehammer of a Solution|60+ 66104|74.43 42.14|Ecologist Iskha",
		[66106] = "Don't Be So Shellfish|60+ 66104|74.43 42.14|Ecologist Tharu",

		-- Let's Get Quacking
		[66196] = "A Quack For Help|60+ 66104|80.12 42.86|Bubbled Duckling",
		-- 70872 hidden weekly lockout
		[70877] = "A Quack in Time|60+ 66196 -70872|80.09 39.88|Bubbled Duckling",
		[70917] = "A Shoulder to Quack On|60+ 70877 -70872|81.6 45.45|Bubbled Duckling",
		[70918] = "Quack for Your Life|60+ 70917 -70872|79.33 42.76|Bubbled Duckling",
		[70919] = "Quacking Out for a Hero|60+ 70918 -70872|82.85 42.62|Bubbled Duckling",

		-- Ruby Lifecalling
		[66825] = "A Ruby Lifecalling|60+|61.89 73.83|Lifecaller Tzadrak", -- no prereqs?
		[66879] = "Hornstrider Havoc|60+ 66825|61.73 73.76|Dazakros",
		[66892] = "Deluge Dilemma|60+ 66879|53.42 58.37|Dazakros",
		[66893] = "Beaky Reclamation|60+ 66879|53.42 58.37|Dazakros",
		[70351] = "Garden Party|60+ 66825|61.74 73.7|Akora",
		[66827] = "Flowers of our Labor|60+ 70351|60.17 66.43|Akora",
		[66828] = "Huddle at the Hollow|60+ 66827|60.19 66.4|Keshki",
		[66830] = "Hornswoggled!|60+ 66828|65.33 63.68|Keshki",
		[66997] = "Nursery Direction|60+ 66825|61.82 73.58|Vaeros",
		[66734] = "Leave Bee Alone|60+ 66997|55.26 63.47|Vaeros",
		[66735] = "Just a Trim|60+ 66997|55.26 63.47|Vaeros",
		[66737] = "A Better Start|60+ 66734 66735|55.2 63.7|Adazius",
		[70058] = "Friend on the Mend|60+|59.88 70.37|Lillistrasza",

		-- Stay a While
		[70132] = "Stay a While|60+|57.85 66.8|Veritistrasz",
		-- 70206, 70543, 70544, 70217, 70546, 70547, 70219, 70548 -- Dialogs 1-8 complete
		-- 70223 -- Final dialog complete
		[70134] = "Memories|60+ 70132 70223|57.85 66.8|Veritistrasz", -- Must complete entire RP for this to be offered

		-- Dragonscale Basecamp
		[72397] = "Orientation: Dragonscale Basecamp|60+ 67030|47.88 82.42|Naleidea Rivergleam",

		-- Professional Protographer
		[66963] = "Out For Delivery|60+ -66524|48.48 78.85|Hauler Bennet", -- Breadcrumb for 66524
		[66524] = "Amateur Protography|60+ ~66963|48.49 82.68|Cataloger Wulferd", -- Invalidates breadcrumb 66963
		[66525] = "Competitive Protography|60+ 66524|39.02 83.24|Cataloger Wulferd",
		[66526] = "Preserving the Wilds|60+ 66524|39.08 83.27|Dervishian",
		[66527] = "Professional Protography|60+ 66525 66526|39.02 83.24|Cataloger Wulferd",
		[66528] = "King Without a Crown|60+ 66527|39.08 83.27|Dervishian",
		[66529] = "A Thousand Words|60+ 66528|39.08 83.27|Dervishian",

		-- Brave Researchers
		[69897] = "Behavior Analysis \"Homework\"|60+|45.91 81.45|Iyali",
		[69898] = "Scientific Meat-thod|60+|45.91 81.45|Iyali",
		[69899] = "Secret Research|60+ 69897 69898|45.91 81.45|Iyali",
		[69900] = "Identifying the Source|60+ 69899|45.95 81.49|Tyrgon",
		[69901] = "Bring In the Expert|60+ 69899|45.95 81.49|Tyrgon",
		[69902] = "Theory in Practice|60+ 69900 69901|45.95 81.49|Tyrgon",

		-- Crabtender's Quandry
		[66612] = "Crabtender's Quandry|60+|59.74 51.22|Crabtender Kad'irsza",
		[71141] = "Gills with Gall|60+|59.7 51.21|Ru'kroszk",

		-- Beyond the Barrier
		[69896] = "Disastrous Detour|60+ -66435|63.58 61.77|Scout Kuvaeth", -- Breadcrumb for 66435
		[66435] = "Site Salvage|60+ ~69896|66.06 58.13|Elementalist Taiyang", -- Invalidates breadcrumb 66435
		[66436] = "Unearthed Troublemakers|60+ ~69896|66.06 58.13|Elementalist Taiyang",
		[66437] = "A Key Element|60+ ~69896|67.46 57.23|{1020373} [Orb of Primal Stone]||Drops from [hostile]Earth Elementals] in the area",
		[66438] = "Lofty Goals|60+ 66435 66436 66437|66.57 56.11|Examiner Tae'shara Bloodwatcher",
		[66439] = "Rapid Fire Plans|60+ 66435 66436 66437|66.62 56.05|Acadia Chistlestone",
		[66441] = "Distilled Effort|60+ 66435 66436 66437|66.59 56.08|Elementalist Taiyang",
		[70994] = "Drainage Solutions|60+ 66435 66436 66437|70.5 56.84|Zikkori", -- check reqs
		[66442] = "Let's Get Theoretical|60+ 66438 66439 66441|66.59 56.08|Elementalist Taiyang",
		[66447] = "Beyond the Barrier|60+ 66442|66.51 55.97|Elementalist Taiyang",

		-- The Shadow of His Wing
		[65687] = "Punching Up|60+|39.43 48.33|Ingot",
		[65690] = "A Cultist's Misgivings|60+|39.43 48.33|Ingot",
		[65782] = "Under Lock and Key|60+ 65690|37.43 46.62|Ayasanth",
		[65691] = "The Shadow of His Wings|60+ 65687 65782|37.35 46.61|Ayasanth",

		-- The Earthen Ring
		[66003] = "Rings To Bind Them|60+|37.45 71.78|Earthcaller Yevaa",
		[66369] = "The Earthen Ward|60+ 66003|37.45 71.78|Earthcaller Yevaa",
		[66368] = "Island In A Storm|60+ 66369|37.45 71.78|Earthcaller Yevaa|weekly",
		[70414] = "Shaky Grounds|60+|37.1 56.05|Earthmender Govrum",

		-- Dragon Racing
		[72481] = "The Waking Shores Tour|60+ dragonriding achievement:16978 67030|73.25 52.07|Celormu", -- Requires Valdrakken Accord renown 7 obtained on account
		[72483] = "The Ohn'ahran Plains Tour|60+ dragonriding 72481|73.25 52.07|Celormu",
		[72482] = "The Waking Shores Advanced Tour|60+ dragonriding accachievement:15915 accachievement:15918 accachievement:15921 accachievement:15924|73.25 52.07|Celormu", -- Requires all normal races completed on account
		[72972] = "The Waking Shores Reverse Tour|60+ dragonriding accachievement:15915 accachievement:15918 accachievement:15921 accachievement:15924|73.25 52.07|Celormu", -- Requires all normal races completed on account
		[72484] = "The Ohn'ahran Plains Advanced Tour|60+ dragonriding 72482|73.25 52.07|Celormu",
		[72982] = "The Ohn'ahran Plains Reverse Tour|60+ dragonriding 72972|73.25 52.07|Celormu",

		-- Artisan's Consortium
		[67564] = "Artisan's Courier|60+ alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,herbalism,mining,skinning|57.93 68.25|Haephesta",
		[70221] = "Show Your Mettle|60+ 62+,67030 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,herbalism,mining,skinning reputation:2544:2|60.23 72.19|Thomas Bright|weekly", -- Requires Preferred (rank 2) or higher with Artisan's Consortium
		[67080] = "Artisan's Supply: Dragon's Alchemical Solution|60+ alchemy|60.26 72.19|Zherrak|alchemy",
		[70029] = "Artisan's Supply: Runed Serevite Rods|60+ enchanting|75.83 33.27|Veeno|enchanting",
		[70030] = "Artisan's Supply: Quality-Assured Optics|60+ engineering|42.99 66.51|Winnie Fingerspring|engineering",
		[70026] = {"Artisan's Supply: Lava Beetles|60+ herbalism|76.86 34.04|Feilin Kuan|herbalism", "Artisan's Supply: Lava Beetles|60+ herbalism|57.44 65.92|Szarostrasza|herbalism",},
		[70033] = "Artisan's Supply: Pioneer's Leather Boots|60+ leatherworking|76.63 34.85|Deirdre Flemmin|leatherworking",
		[70028] = "Artisan's Supply: Salt Deposits|60+ mining|76.35 34.64|Grun Ashbeard|mining",
		[70034] = "Artisan's Supply: Salamanther Scale|60+ skinning|76.69 34.78|Toninaar|skinning",
		[69946] = "The Master of Their Craft|60+ 62+,67030 67564 65686 alchemy,blacksmithing,enchanting,engineering,inscription,jewelcrafting,leatherworking,tailoring,herbalism,mining,skinning|60.23 72.19|Thomas Bright",

		-- Ohn'ahran Plains - Into the Plains
		[65795] = "Next Steppes|60+ 65794|61.56 68.56|Alexstrasza the Life-Binder|campaign",
		[65779] = "Into the Plains|60+ 62+,67030 65795,67030|48.27 88.67|Ambassador Taurasza|campaign", -- Adventure mode bypasses prereqs

		-- Aiding the Accord
		[70750] = "Aiding the Accord|60+ 67030 -72374 -72068 -72373 -72375 -72369 -75859 -75860 -75861|76.51 34.29|Kerazal|campaign weekly", -- You get one of 5 random weeklies, we consolidate them into one pin
		[72354] = "The Great Vault|70+|76.51 34.29|Kerazal",
		
		-- The Spark of Ingenuity
		[70509] = "Third Challenge of Tyr: Persistence|60+ 70650|64.02 41.47|Broken Ornamented Statue|campaign",
		[70621] = "Third Challenge of Tyr: Persistence Embodied|60+ 70509|64.1 41.39|Maiden of Inspiration|campaign",
		[70510] = "Victorious|60+ 70621|64.1 41.39|Maiden of Inspiration|campaign",

		-- Dragonscale Expedition - In the Halls of Titans
		[69097] = "A Vault Unsealed|70+ reputation:2507:24|1 DocNannersCampaign|Doc Nanners|discovery campaign", -- Requires Renown 24 with Dragonscale Expedition
		[67722] = "Break on Through|70+ reputation:2507:24 69097|47.1 82.58|Cataloger Jakes|campaign", -- Requires Renown 24 with Dragonscale Expedition
		-- hidden tracking quests: 72752, 72822
		[69888] = "Unusual Suspects|70+ 66547 -72822|47.21 82.73|Toddy Whiskers", -- Available the following weekly reset after completing 66547 (72822 is hidden weekly tracking quest)
	
		-- Iskaara Tuskarr - The Chieftain's Duty
		[68863] = "A Lost Tribe|70+ reputation:2511:11|3 RowieCampaign|Rowie|discovery campaign", -- Requires Renown 11 with Iskaara Tuskarr
	},


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
		[65032] = "Battleground Observers|65030 ~65031 -60|38.89 70|Tal-Inara|campaign",
		-- 65033 Observing Victory - this daily quest is displayed by the Bonus Objectives Data Provider so we don't have to
		-- HQT 53409 resets with daily
		[65034] = "Return to Oribos|65032 65033 -60|34.24 55.9|Strategist Zo'rak|campaign",

		-- Threads of Fate: Torghast
		-- 64848 Torghast chosen - Also given optional breadcrumb 64846 (Torghast)
		-- Also autocompletes 64557 (In Darkness, Found), 64210 (The Box of Many Things), 64216 (Tower Knowledge)
		[64849] = "Tower of the Damned|64848 ~64846 -60|38.89 70|Tal-Inara|campaign",

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
		[62916] = "Your Next Best Friend|60+,62704 kyrian 59426 -60259 -60260 -60261 -60262 -60263|52.98 47.56|Sika|weekly", -- Weekly quest - only show if no Steward choice has been made

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
		[59809] = "On De Other Side|60+ nightfae renown:8 59242|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59811] = "Taking Inventory|60+ nightfae renown:8 59809|1 MaskOfBwonsamdiCampaign|Bwonsamdi|discovery campaign|\"Mask of Bwonsamdi can take you to the Other Side\"",
		[59812] = "Following the Trail|60+ nightfae 59811|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59813] = "Minions of Mueh'zala|60+ nightfae 59812|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59815] = "Stolen Loa|60+ nightfae 59812|2 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59817] = "Winter Be Comin'|60+ nightfae 59813 59815|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
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
		[59809] = "On De Other Side|60+ nightfae renown:8 59242|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59811] = "Taking Inventory|60+ nightfae renown:8 59809|1 MaskOfBwonsamdiCampaign|Bwonsamdi|discovery campaign|\"Mask of Bwonsamdi can take you to the Other Side\"",
		[59812] = "Following the Trail|60+ nightfae 59811|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59813] = "Minions of Mueh'zala|60+ nightfae 59812|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59815] = "Stolen Loa|60+ nightfae 59812|2 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59817] = "Winter Be Comin'|60+ nightfae 59813 59815|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
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
		[59809] = "On De Other Side|60+ nightfae renown:8 59242|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59811] = "Taking Inventory|60+ nightfae renown:8 59809|1 MaskOfBwonsamdiCampaign|Bwonsamdi|discovery campaign|\"Mask of Bwonsamdi can take you to the Other Side\"",
		[59812] = "Following the Trail|60+ nightfae 59811|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59813] = "Minions of Mueh'zala|60+ nightfae 59812|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59815] = "Stolen Loa|60+ nightfae 59812|2 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59817] = "Winter Be Comin'|60+ nightfae 59813 59815|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",

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
		[59809] = "On De Other Side|60+ nightfae renown:8 59242|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59811] = "Taking Inventory|60+ nightfae 59809|1 MaskOfBwonsamdiCampaign|Bwonsamdi|discovery campaign|\"Mask of Bwonsamdi can take you to the Other Side\"",
		[59812] = "Following the Trail|60+ nightfae 59811|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59813] = "Minions of Mueh'zala|60+ nightfae 59812|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59815] = "Stolen Loa|60+ nightfae 59812|2 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
		[59817] = "Winter Be Comin'|60+ nightfae 59813 59815|1 MaskOfBwonsamdiCampaign|Mask of Bwonsamdi|discovery campaign",
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

		-- Stonehead
		[58327] = "Snacks for Stonehead|60+,62704|39.31 65.22|Chewed Light Shard||\"Use the nearby Hollow Rock to disguise yourself from Stonehead\"",
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

		-- Druid - The Dreamgrove
		[40643] = "A Summons From Moonglade|10+ druid 44184,44663|60.39 44.99|Archdruid Hamuul Runetotem|artifact",
		[41106] = "Call of the Wilds|10+ druid 40643|60.39 44.99|Archdruid Hamuul Runetotem|artifact elsewhere link:80|Visit {!}Archdruid Hamuul Runetotem in Moonglade to continue the Druid Campaign",
		[40644] = "The Dreamway|10+ druid 41106|60.39 44.99|Archdruid Hamuul Runetotem|artifact elsewhere link:80|Visit {!}Archdruid Hamuul Runetotem in Moonglade to continue the Druid Campaign",
		[40645] = "To The Dreamgrove|10+ druid 40644|60.39 44.99|Malfurion Stormrage|artifact elsewhere link:80|Visit {!}Malfurion Stormrage in Moonglade to continue the Druid Campaign",

		-- Hunter - Path of the Hunter
		[40384] = "Needs of the Hunters|10+ hunter 44184,44663|61.27 44.89|Snowfeather|artifact",
		[41415] = "The Hunter's Call|10+ hunter 40384|60.04 53.46|Emmarel Shadewarden|artifact",
		[40618] = "Weapons of Legend|10+ hunter 41415|60.04 53.46|Emmarel Shadewarden|artifact",

		-- Hunter - Titanstrike
		-- Titanstrike chosen = 40621

		-- Hunter - Talonclaw
		-- Titanstrike chosen = 40619

		-- Hunter - Thas'dorah, Legacy of the Windrunners
		-- Thas'dorah chosen = 40620
		[41540] = "Rendezvous with the Courier|10+ hunter 40618 40620 -40953|60.04 53.46|Emmarel Shadewarden|artifact", -- First artifact
		[40392] = "Call of the Marksman|10+ hunter 41540 -40953|71.45 49.99|Courier Larkspur|artifact", -- First artifact
		[40400] = "Clandestine Operation|10+ hunter 40392 -40953 alliance|71.45 49.99|Vereesa Windrunner|artifact elsewhere link:646", -- First artifact - Alliance
		[40402] = "Clandestine Operation|10+ hunter 40392 -40953 horde -bloodelf|71.45 49.99|Vereesa Windrunner|artifact elsewhere link:646", -- First artifact - Horde
		[40403] = "Clandestine Operation|10+ hunter 40392 -40953 horde bloodelf|71.45 49.99|Vereesa Windrunner|artifact elsewhere link:646", -- First artifact -- Blood Elf
		[40419] = "Rescue Mission|10+ hunter 40400,40402,40403 -40953|71.45 49.99|Vereesa Windrunner|artifact elsewhere link:646",

		-- Hunter - The Unseen Path
		[40953] = "On Eagle's Wings|10+ hunter 40952,41008,41009|60.04 53.46|Emmarel Shadewarden|artifact",
		[40954] = "The Unseen Path|10+ hunter 40953|72.83 41.19|Emmarel Shadewarden|artifact elsewhere link:739|Visit {!}Emmarel Shadewarden in Trueshot Lodge to continue the Hunter Campaign",
		[40955] = "Oath of Service|10+ hunter 40954|72.83 41.19|Emmarel Shadewarden|artifact elsewhere link:739|Visit {!}Emmarel Shadewarden in Trueshot Lodge to continue the Hunter Campaign",
		[40958] = "Tactical Matters|10+ hunter 40955|72.83 41.19|Emmarel Shadewarden|artifact elsewhere link:739|Visit {!}Emmarel Shadewarden in Trueshot Lodge to continue the Hunter Campaign",
		[40959] = "The Campaign Begins|10+ hunter 40958|72.83 41.19|Tactician Tinderfell|artifact elsewhere link:739|Visit {!}Tactician Tinderfell in Trueshot Lodge to continue the Hunter Campaign",
		
		-- Warrior - Becoming Valarjar
		[42814] = "An Important Mission|10+ warrior alliance 44184,44663|0 QuestionMark|Sergeant Dalton|discovery artifact", -- Alliance
		[41052] = "A Desperate Plea|10+ warrior horde 44184,44663|0 QuestionMark|Eitrigg|discovery artifact", -- Horde
		[42815] = "Return to the Broken Shore|10+ warrior alliance 42814|74.59 44.98|Danath Trollbane|artifact", -- Alliance
		--[38904] = "Return to the Broken Shore|10+ warrior alliance 41052|COORDS|High Overlord Saurfang|artifact", -- Horde

		-- Other classes
		[72129] = "Aiding Khadgar|10+ -deathknight -demonhunter -druid -hunter -mage -monk -paladin -priest -rogue -shaman -warlock -warrior 44184,44663|28.49 48.34|Archmage Khadgar|artifact", -- Auto Accept
		[72134] = "An Adventurer's Aid|10+ -deathknight -demonhunter -druid -hunter -mage -monk -paladin -priest -rogue -shaman -warlock -warrior 72129|28.49 48.34|Archmage Khadgar|artifact",

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
		-- The Dreamgrove
		[40646] = "Weapons of Legend|10+ druid 40645|44.51 51.1|Rensar Greathoof|artifact", -- First artifact
		-- 40781 - Scythe of Elune chosen
		-- 40900 - Scythe of Elune complete
		-- 40701 - Fangs of Ashamane chosen
		-- 42430 - Fangs of Ashamane complete
		-- 40702 - Claws of Ursoc chosen
		-- 41918 - Claws of Ursoc complete
		-- 40703 - G'Hanir, the Mother Tree chosen
		-- 41689 - G'Hanir, the Mother Tree complete
		[41255] = "Sowing The Seed|10+ druid 40646 40900,42430,41918,41689|44.51 51.1|Rensar Greathoof|artifact",
		[41332] = "Ascending The Circle|10+ druid 41255|30.92 54.25|Rensar Greathoof|artifact",
		[40652] = "Word on the Winds|10+ druid 41332|45.98 51.04|Malfurion Stormrage|artifact",
		[40653] = "Making Trails|10+ druid 40652|52.59 51.43|Skylord Omnuron|artifact",
		[43980] = "Another Weapon of Old|10+ druid 40653|44.51 51.1|Rensar Greathoof|artifact", -- Second artifact
		[44431] = {
			-- Third artifact
			"More Weapons of Old|10+ druid 43980 40900 42430|44.51 51.1|Rensar Greathoof|artifact", -- Scythe and Fangs complete
			"More Weapons of Old|10+ druid 43980 40900 41918|44.51 51.1|Rensar Greathoof|artifact", -- Scythe and Claws complete
			"More Weapons of Old|10+ druid 43980 40900 41689|44.51 51.1|Rensar Greathoof|artifact", -- Scythe and G'Hanir complete
			"More Weapons of Old|10+ druid 43980 42430 41918|44.51 51.1|Rensar Greathoof|artifact", -- Fangs and Claws complete
			"More Weapons of Old|10+ druid 43980 42430 41689|44.51 51.1|Rensar Greathoof|artifact", -- Fangs and G'Hanir complete
			"More Weapons of Old|10+ druid 43980 41918 41689|44.51 51.1|Rensar Greathoof|artifact", -- Claws and G'Hanir complete
		},
		[44443] = {
			-- Fourth artifact
			"Weapons of the Ancients|10+ druid 44431 -40900 42430 41918 41689|44.51 51.1|Rensar Greathoof|artifact", -- Scythe missing
			"Weapons of the Ancients|10+ druid 44431 40900 -42430 41918 41689|44.51 51.1|Rensar Greathoof|artifact", -- Fangs missing
			"Weapons of the Ancients|10+ druid 44431 40900 42430 -41918 41689|44.51 51.1|Rensar Greathoof|artifact", -- Claws missing
			"Weapons of the Ancients|10+ druid 44431 40900 42430 41918 -41689|44.51 51.1|Rensar Greathoof|artifact", -- G'Hanir missing
		},
		[42583] = "Rise, Champions|10+ druid 40653|44.51 51.1|Rensar Greathoof|artifact",
		-- ... rest can be done on Errol

		-- The Scythe of Elune
		[40783] = "The Scythe of Elune|10+ druid 40646 40781|44.52 51.43|Naralex|artifact",

		-- The Fangs of Ashamane
		[42428] = "The Shrine of Ashamane|10+ druid 40646 40701|44.51 51.1|Rensar Greathoof|artifact",

		-- The Claws of Ursoc
		[41468] = "Mistress of the Claw|10+ druid 40646 40702|44.51 51.1|Rensar Greathoof|artifact",

		-- G'Hanir, the Mother Tree
		[40649] = "Meet with Mylune|10+ druid 40646 40703|45.65 50.26|Keeper Remulos|artifact",

		-- Dreamgrove Raiment
		[44232] = "The Grove Provides|45+ druid 40645|40.03 17.76|Amurra Thistledew",
	},

	-- Hunter - Trueshot Lodge
	[739] = {
		-- The Unseen Path
		-- 42185 - Titansstrike complete
		-- 40385 - Talonclaw complete
		-- 40952 - Thas'dorah complete
		[40954] = "The Unseen Path|10+ hunter 40953|36.66 29.14|Emmarel Shadewarden|artifact",
		[40955] = "Oath of Service|10+ hunter 40954|43.51 24.67|Emmarel Shadewarden|artifact",
		[40958] = "Tactical Matters|10+ hunter 40955|43.51 24.67|Emmarel Shadewarden|artifact",
		[40959] = "The Campaign Begins|10+ hunter 40958|42.78 46.94|Tactician Tinderfell|artifact",
		[44043] = "Continuing the Legend|10+ hunter 40959|43.42 26.36|Emmarel Shadewarden|artifact", -- Second artifact
		[44366] = {
			-- Third artifact
			"One Last Adventure|10+ hunter 44043 42185 40385|43.42 26.36|Emmarel Shadewarden|artifact", -- Titanstrike and Talonclaw complete
			"One Last Adventure|10+ hunter 44043 40952 42185|43.42 26.36|Emmarel Shadewarden|artifact", -- Titanstrike and Thas'dorah complete
			"One Last Adventure|10+ hunter 44043 40385 40952|43.42 26.36|Emmarel Shadewarden|artifact", -- Talonclaw and Thas'dorah complete
		},

		-- Thas'dorah, Legacy of the Windrunners
		[41540] = "Rendezvous with the Courier|10+ hunter 40618 40620 44043|43.42 26.36|Emmarel Shadewarden|artifact", -- Second/third artifact
		[40392] = "Call of the Marksman|10+ hunter 41540 40953|47.6 44.8|Courier Larkspur|artifact", -- Second/third artifact
		[40400] = "Clandestine Operation|10+ hunter 40392 40953 alliance|47.6 44.8|Vereesa Windrunner|artifact elsewhere link:646", -- Second/third artifact - Alliance
		[40402] = "Clandestine Operation|10+ hunter 40392 40953 horde -bloodelf|47.6 44.8|Vereesa Windrunner|artifact elsewhere link:646", -- Second/third artifact - Horde
		[40403] = "Clandestine Operation|10+ hunter 40392 40953 horde bloodelf|47.6 44.8|Vereesa Windrunner|artifact elsewhere link:646", -- Second/third artifact -- Blood Elf
		[40419] = "Rescue Mission|10+ hunter 40400,40402,40403 40953|47.6 44.8|Vereesa Windrunner|artifact elsewhere link:646",

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
		[38407] = "Bottled Up|10+|50.6 34.9|{461806} [Okuna's Message]||Drops from [hostile]Salteye Murlocs]",
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
		[38146] = "The Chieftain's Beads|10+ 38922|48.78 88.45|{133306} [Chieftain's Beads]||Drops from [hostile]Chieftain Graw]",
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
		[38711] = "The Warden's Signet|10+ 38643,39149|39.12 64.5|{1025252} [Warden's Signet]||Drops from [hostile]Lelyn Swiftshadow]",
		[39015] = "Grumpy|10+|38.64 65.64|Grumpy||Available after walking through the fire to the top floor of Heathrow Manor",

		-- Black Rook Hold
		-- TODO:: check which quests can be picked up at the same time, and check 38721 coordinates
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
		[38862] = "Thieving Thistleleaf|10+|52.4 83.5|{132834} [Lunarwing Egg]||Drops from [hostile]Thistleleaf Sprites]",

		-- Lostlight Grotto
		[42748] = "Emerald Sisters|10+|59.4 84.1|Guviena Bladesong",
		[42747] = "Where the Wildkin Are|10+|59.4 84.1|Guviena Bladesong",
		[42751] = "Moon Reaver|10+ 42747|59.4 84.1|Guviena Bladesong",
		[42750] = "Dreamcatcher|10+ +42748,+42747|59.5 82|Leirana",
		[42786] = "Grotesque Remains|10+|60.2 81.75|{646670} [Grotesque Remains]||Drops from [hostile]Undulating Boneslime]",

		-- Grizzleweald
		[42883] = "All Grell Broke Loose|10+|66.7 77.3|Old Grizzleback",
		[42884] = "Grassroots Effort|10+|66.7 77.3|Old Grizzleback",
		[42865] = "Grell to Pay|10+|66.7 77.3|Old Grizzleback",
		[42857] = "Moist Around the Hedges|10+|66.8 75.7|Moist Grizzlecomb",

		-- Mark of the Demon
		[38656] = "Mark of the Demon|10+|56.77 54.33|{133791} [Demonic Emblem]||Drops from [hostile]Gravax the Desecrator]",

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
		[39595] = "Blood and Gold|10+ 38331|44.32 44.53|{132594} [Challenger's Tribute]||Drops from [hostile]Bloodtotem], [hostile]Felskorn] and [hostile]Mightstone] Challengers in the area",
		[39591] = "A Trial of Valor|10+ 39590|46.73 44.44|Yotnar's Head",
		[39592] = "A Trial of Will|10+ 39590|46.73 44.44|Yotnar's Head",
		[39593] = "The Shattered Watcher|10+ 39590|46.73 44.44|Yotnar's Head",
		[39594] = "A Trial of Might|10+ 39591 39592 39593|46.73 44.44|Yotnar",
		[39597] = "The Blessing of the Watchers|10+ 39594|46.32 44.83|Yotnar",

		-- The Trial of Will
		[38337] = "Built to Scale|10+ alliance|44.45 64.34|{134308} [Storm Drake Scale]||Drops from [hostile]Stormwing Drake] in Hrydshal", -- Alliance
		[38616] = "Built to Scale|10+ horde|44.45 64.34|{134308} [Storm Drake Scale]||Drops from [hostile]Stormwing Drake] in Hrydshal", -- Horde
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
		-- Hunter - Thas'dorah, Legacy of the Windrunners
		[40400] = "Clandestine Operation|10+ hunter 40392 alliance|32.28 32.42|Vereesa Windrunner|artifact", -- Alliance
		[40402] = "Clandestine Operation|10+ hunter 40392 horde -bloodelf|32.28 32.42|Vereesa Windrunner|artifact", -- Horde
		[40403] = "Clandestine Operation|10+ hunter 40392 horde bloodelf|32.28 32.42|Vereesa Windrunner|artifact", -- Blood Elf
		[40419] = "Rescue Mission|10+ hunter 40400,40402,40403|32.28 32.42|Vereesa Windrunner|artifact",

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
		[46253] = "Pillars of Creation|45+ 46734|44.73 63.27|Archmage Khadgar|dungeon",
		[46244] = "Cathedral of Eternal Night: Altar of the Aegis|45+ 46286|44.73 63.27|Archmage Khadgar|dungeon",

		-- Tomb of Sargeras
		[46805] = "The Deceiver's Downfall|45+ 46734|44.56 63.39|Prophet Velen|raid",

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


	-- [[ Tanaan Jungle ]]--

	[534] = {
		-- Apexis Gemcutter
		[39176] = "Mastery Of Taladite|40+ 39175,39195|25.9 39.88|Sun-Sage Chakkis|jewelcrafting", -- Does not require Jewelcrafting
		[39177] = "Ruined Construct|40+ 39176|17.46 45.16|Apexis Gemcutter|jewelcrafting", -- Does not require Jewelcrafting
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
		-- Teldrassil
		[6342]  = "An Unexpected Gift|1+ alliance nightelf 6341|36.08 53.49|Sister Aquinne", -- Night Elf only
		[6343]  = "Return to Nyoma|1+ alliance nightelf 6342|36.62 47.85|Leora", -- Night Elf only

		-- The Howling Oak
		[26385] = "Breaking Waves of Change|5+ alliance worgen 28517 -26383 -13518 -28490|48.13 14.45|Genn Greymane", -- Worgen only

		-- Darkshore
		[26383] = "Breaking Waves of Change|5+ alliance -26385 -13518 -28490|43.91 76.16|Sentinel Cordressa Briarbow", -- Breadcrumb for 13518

		-- Battle for Azeroth - A Nation Divided
		[46727] = "Tides of War|10+ alliance -58983 -56775|45.1 50.13|Hero's Herald", -- 58983 is Exile's Reach version - 56775 doesn't show for Exile's Reach players
	},

	-- Shadowglen
	[460] = {
		[28713] = "The Balance of Nature|1+ alliance|45.63 74.54|Ilthalaine",
		[28714] = "Fel Moss Corruption|1+ alliance 28713|45.63 74.54|Ilthalaine",
		[28715] = "Demonic Thieves|1+ alliance 28713|45.95 72.88|Melithar Staghelm",
		[28723] = "Priestess of the Moon|1+ alliance 28714 28715|46.3 73.5|Ilthalaine",
		[28724] = "Iverron's Antidote|1+ alliance 28723|42.51 50.51|Dentaria Silverglade",
		[28725] = "The Woodland Protector|1+ alliance 28724|42.51 50.51|Dentaria Silverglade",
		[28726] = "Webwood Corruption|1+ alliance 28725|39.01 30.18|Tarindrella",
		[28727] = "Vile Touch|1+ alliance 28726|39.01 30.18|Tarindrella",
		[28728] = "Signs of Things to Come|1+ alliance 28727|39.01 30.18|Tarindrella",
		[28729] = "Teldrassil: Crown of Azeroth|1+ alliance 28728|42.51 50.51|Dentaria Silverglade",
		[28730] = "Precious Waters|1+ alliance 28729|42.51 50.51|Dentaria Silverglade",
		[28731] = "Teldrassil: Passing Awareness|1+ alliance 28730|47.21 55.94|Tenaron Stormgrip",
		[2159]  = "Dolanaar Delivery|1+ alliance|54.56 84.72|Porthannius",
	},

	-- Shadowthread Cave, Shadowglen
	[58] = {
		[28726] = "Webwood Corruption|1+ alliance 28725|1 Tarindrella|Tarindrella|discovery",
		[28727] = "Vile Touch|1+ alliance 28726|1 Tarindrella|Tarindrella|discovery",
		[28728] = "Signs of Things to Come|1+ alliance 28727|1 Tarindrella|Tarindrella|discovery",
	},

	-- Teldrassil
	[57] = {
		-- Shadowglen
		[28713] = "The Balance of Nature|1+ alliance|57.96 39.19|Ilthalaine|link:460",
		[28714] = "Fel Moss Corruption|1+ alliance 28713|57.96 39.19|Ilthalaine|link:460",
		[28715] = "Demonic Thieves|1+ alliance 28713|58.04 38.79|Melithar Staghelm|link:460",
		[28723] = "Priestess of the Moon|1+ alliance 28714 28715|58.13 38.94|Ilthalaine|link:460",
		[28724] = "Iverron's Antidote|1+ alliance 28723|57.19 33.26|Dentaria Silverglade|link:460",
		[28725] = "The Woodland Protector|1+ alliance 28724|57.19 33.26|Dentaria Silverglade|link:460",
		[28726] = "Webwood Corruption|1+ alliance 28725|56.33 28.25|Tarindrella|link:460",
		[28727] = "Vile Touch|1+ alliance 28726|56.33 28.25|Tarindrella|link:460",
		[28728] = "Signs of Things to Come|1+ alliance 28727|56.33 28.25|Tarindrella|link:460",
		[28729] = "Teldrassil: Crown of Azeroth|1+ alliance 28728|57.19 33.26|Dentaria Silverglade|link:460",
		[28730] = "Precious Waters|1+ alliance 28729|57.19 33.26|Dentaria Silverglade|link:460",
		[28731] = "Teldrassil: Passing Awareness|1+ alliance 28730|58.35 34.6|Tenaron Stormgrip|link:460",
		[2159]  = "Dolanaar Delivery|1+ alliance|60.17 41.71|Porthannius",

		-- Dolanaar
		[929]   = "Teldrassil: The Refusal of the Aspects|1+ alliance 28731|55.82 53.89|Corithras Moonrage",
		[6344]  = "Reminders of Home|1+ alliance nightelf|56.73 53.51|Nyoma", -- Night Elf only
		[6341]  = "To Darnassus|1+ alliance nightelf 6344|55.47 50.42|Nyoma", -- Night Elf only
		[488]   = "Zenn's Bidding|1+ alliance|59.56 49.09|Zenn Foulhoof",
		[489]   = "Seek Redemption!|1+ alliance 488|55.77 50.45|Syral Bladeleaf",
		[13946] = "Nature's Reprisal|1+ alliance 489|55.77 50.45|Syral Bladeleaf",
		[932]   = "Twisted Hatred|1+ alliance 489|55.55 49.99|Tallonkai Swiftroot",
		[2438]  = "The Emerald Dreamcatcher|1+ alliance|55.55 49.99|Tallonkai Swiftroot",
		[2459]  = "Ferocitas the Dream Eater|1+ alliance 2438|55.55 49.99|Tallonkai Swiftroot",
		[475]   = "A Troubling Breeze|1+ alliance|55.69 52|Athridas Bearmantle",
		[476]   = "Gnarlpine Corruption|1+ alliance 475|64.59 51.14|Gaerolas Talvethren",
		[13945] = "Resident Danger|1+ alliance 476|55.66 51.99|Sentinel Kyra Starsong",
		[483]   = "The Relics of Wakening|1+ alliance 476|55.69 52|Athridas Bearmantle",
		[486]   = "Ursal the Mauler|1+ alliance 483|55.69 52|Athridas Bearmantle",
		[487]   = "The Road to Darnassus|1+ alliance 483|49.35 44.66|Moon Priestess Amara",
		[997]   = "Denalan's Earth|1+ alliance 486|55.77 50.45|Syral Bladeleaf",

		-- Ban'ethil Barrow Den
		[2541]  = "The Sleeping Druid|1+ alliance|45.03 53.48|Oben Rageclaw|down link:60",
		[2561]  = "Druid of the Claw|1+ alliance 2541|45.03 53.48|Oben Rageclaw|down link:60",

		-- Lake Al'Ameth
		[930]   = "The Glowing Fruit|1+ alliance|57.64 63.02|Strange Fruited Plant",
		[927]   = "The Moss-twined Heart|1+ alliance|52.04 63.68|{134339} [Moss-Twined Heart]||Drops from [hostile]Blackmoss the Fetid]",
		[941]   = "Planting the Heart|1+ alliance 927|59.94 59.77|Denalan",
		[918]   = "Timberling Seeds|1+ alliance 997|59.94 59.77|Denalan",
		[919]   = "Timberling Sprouts|1+ alliance 997|59.94 59.77|Denalan",
		[922]   = "Rellian Greenspyre|1+ alliance 918|59.94 59.77|Denalan",
		[7383]  = "Teldrassil: The Burden of the Kaldorei|1+ alliance 929 918|55.82 53.89|Corithras Moonrage",

		-- The Oracle Glade
		[931]   = "The Shimmering Frond|1+ alliance|37.12 25.5|Strange Fronded Plant",
		[2518]  = "Tears of the Moon|1+ alliance|39.17 29.9|Priestess A'moora",
		[937]   = "The Enchanted Glade|1+ alliance|39.5 29.86|Sentinel Arynia Cloudsbreak",
		[938]   = "Mist|1+ alliance|34.49 27.82|Mist",

		-- Wellspring Hovel
		[923]   = "Mossy Tumors|1+ alliance 922|43.96 44.16|Rellian Greenspyre",
		[2499]  = "Oakenscowl|1+ alliance 923|43.94 44.2|Denalan",

		-- Pools of Arlithien
		[933]   = "Teldrassil: The Coming Dawn|1+ alliance 7383|41.02 45.59|Corithras Moonrage",
		[14005] = "The Vengeance of Elune|1+ alliance 933|42.52 58.18|Tarindrella",
		[935]   = "The Waters of Teldrassil|1+ alliance 14005|42.52 58.18|Tarindrella",
		[14039] = "Home of the Kaldorei|1+ alliance 935|41.02 45.59|Corithras Moonrage",

		-- The Howling Oak
		[28517] = "The Howling Oak|5+ alliance worgen|55.23 89.18|Krennan Aranas", -- Worgen only; unsure if this is available to Worgens starting in Exile's Reach
		
		-- Darkshore
		[26385] = "Breaking Waves of Change|5+ alliance worgen 28517 -26383 -13518 -28490|30.45 39.11|Genn Greymane|link:89", -- Worgen only breadcrumb for 13518
	},

	-- Ban'ethil Barrow Den - Upper Den
	[60] = {
		-- Check if this has any prereqs, suspecting 476
		[2541]  = "The Sleeping Druid|1+ alliance|41.27 83.74|Oben Rageclaw",
		[2561]  = "Druid of the Claw|1+ alliance 2541|41.27 83.74|Oben Rageclaw",
	},

	-- Ban'ethil Barrow Den - Lower Den
	[61] = {
		[2541]  = "The Sleeping Druid|1+ alliance|54.9 71.6|Oben Rageclaw|up link:60",
		[2561]  = "Druid of the Claw|1+ alliance 2541|54.9 71.6|Oben Rageclaw|up link:60",
	},


	--[[ Darkshore ]]--

	[62]= {
		-- art:67 - Cataclysm
		-- art:1176 - Battle for Azeroth Warfront
		[13518] = "The Last Wave of Survivors|5+ art:62:67 alliance ~26383 ~26385 ~28490|51.78 18.01|Dentaria Silverglade", -- Invalidates breadcrumbs 26383, 26385 and 28490
	},


	--[[ Azuremyst Isle ]]--

	-- The Exodar
	[103] = {
		-- Azuremyst Isle
		[9605]  = "Hippogryph Master Stephanos|1+ 9604 draenei alliance|57.01 50.09|Nurguni", -- Draenei only
		[9606]  = "Return to Caregiver Chellan|1+ 9605 draenei alliance|54.49 36.3|Stephanos", -- Draenei only

		-- Bloodmyst Isle
		[9625]  = "Elekks Are Serious Business|1+ 9623 -28559 alliance|81.51 51.46|Torallius the Pack Handler", -- Breadcrumb for Bloodmyst; mutually exclusive with Hero's Call 28559
	},

	-- Ammen Vale
	[468] = {
		[9279]  = "You Survived!|1+ -9280 draenei alliance|61.16 29.5|Megelon", -- Draenei only
		[9280]  = "Replenishing the Healing Crystals|1+ 9279 draenei alliance|52.74 35.9|Proenitus", -- Draenei
		[9369]  = "Replenishing the Healing Crystals|1+ -draenei alliance|52.74 35.9|Proenitus", -- Other races
		[9409]  = "Urgent Delivery!|1+ 9280,9369 alliance|52.74 35.9|Proenitus",
		[9283]  = "Rescue the Survivors!|1+ 9409 draenei alliance|52.07 42.63|Zalduun", -- Draenei only
		[9371]  = "Botanist Taerix|1+ 9409 -10302 alliance|52.74 35.9|Proenitus", -- Breadcrumb for Volatile Mutations
		[10302] = "Volatile Mutations|1+ 9280,9369 alliance|49.87 37.33|Botanist Taerix",
		[9293]  = "What Must Be Done...|1+ 10302 alliance|49.87 37.33|Botanist Taerix",
		[9294]  = "Healing the Lake|1+ 9293 alliance|49.87 37.33|Botanist Taerix",
		[10304] = "Vindicator Aldar|1+ 9294 -37444 -9303 alliance|49.87 37.33|Botanist Taerix", -- Breadcrumb for Inoculation
		[9799]  = "Botanical Legwork|1+ 10302 alliance|49.72 37.52|Apprentice Vishael",
		[37445] = "Spare Parts|1+ 10302 -9305 alliance|50.49 47.87|Technician Zhanaa", -- Pre-6.0 version is 9305
		[37444] = "Inoculation|1+ 10302 -9303 alliance|50.64 48.73|Vindicator Aldar", -- Pre-6.0 version is 9303
		[9309]  = "The Missing Scout|1+ 37444,9303 alliance|50.64 48.73|Vindicator Aldar", -- check if also req 9294?
		[10303] = "The Blood Elves|1+ 9309 alliance|33.9 69.38|Tolaan",
		[9311]  = "Blood Elf Spy|1+ 10303 alliance|33.9 69.38|Tolaan",
		[9798]  = "Blood Elf Plans|1+ alliance|27.79 80.42|{132319} [Blood Elf Plans]||Drops from [Surveyor Candress]",
		[9312]  = "The Emitter|1+ 37445,9305 9311 alliance|50.64 48.73|Vindicator Aldar",
		[9313]  = "Travel to Azure Watch|1+ 9312 alliance|50.49 47.87|Technician Zhanaa",
		[9314]  = "Word from Azure Watch|1+ alliance|17.1 54.15|Aeun",
	},

	-- Azuremyst Isle
	[97] = {
		-- Ammen Vale
		[9279]  = "You Survived!|1+ -9280 draenei alliance|84.18 43.03|Megelon|link:468", -- Draenei only
		[9280]  = "Replenishing the Healing Crystals|1+ 9279 draenei alliance|80.42 45.88|Proenitus|link:468", -- Draenei
		[9369]  = "Replenishing the Healing Crystals|1+ -draenei alliance|80.42 45.88|Proenitus|link:468", -- Other races
		[9409]  = "Urgent Delivery!|1+ 9280,9369 alliance|80.42 45.88|Proenitus|link:468",
		[9283]  = "Rescue the Survivors!|1+ 9409 draenei alliance|80.12 48.9|Zalduun|link:468", -- Draenei only
		[9371]  = "Botanist Taerix|1+ 9409 -10302 alliance|80.42 45.88|Proenitus|link:468", -- Breadcrumb for Volatile Mutations
		[10302] = "Volatile Mutations|1+ 9280,9369 alliance|79.14 46.53|Botanist Taerix|link:468",
		[9293]  = "What Must Be Done...|1+ 10302 alliance|79.14 46.53|Botanist Taerix|link:468",
		[9294]  = "Healing the Lake|1+ 9293 alliance|79.14 46.53|Botanist Taerix|link:468",
		[10304] = "Vindicator Aldar|1+ 9294 -37444 -9303 alliance|79.14 46.53|Botanist Taerix|link:468", -- Breadcrumb for Inoculation
		[9799]  = "Botanical Legwork|1+ 10302 alliance|79.07 46.01|Apprentice Vishael|link:468",
		[37445] = "Spare Parts|1+ 10302 -9305 alliance|79.42 51.24|Technician Zhanaa|link:468", -- Pre-6.0 version is 9305
		[37444] = "Inoculation|1+ 10302 -9303 alliance|79.48 51.63|Vindicator Aldar|link:468", -- Pre-6.0 version is 9303
		[9309]  = "The Missing Scout|1+ 37444,9303 alliance|50.64 48.73|Vindicator Aldar|link:468", -- check if also req 9294?
		[10303] = "The Blood Elves|1+ 9309 alliance|72.01 60.84|Tolaan|link:468",
		[9311]  = "Blood Elf Spy|1+ 10303 alliance|72.01 60.84|Tolaan|link:468",
		[9798]  = "Blood Elf Plans|1+ 10303 alliance|69.27 65.77|{132319} [Blood Elf Plans]|link:468|Drops from [Surveyor Candress]",
		[9312]  = "The Emitter|1+ 37445,9305 9311 alliance|79.48 51.63|Vindicator Aldar|link:468",
		[9313]  = "Travel to Azure Watch|1+ 9312 alliance|79.42 51.24|Technician Zhanaa|link:468",
		[9314]  = "Word from Azure Watch|1+ alliance|64.5 54.04|Aeun",

		-- Azure Watch
		[9452]  = "Red Snapper - Very Tasty!|1+ alliance|61.06 54.24|Diktynna",
		[9453]  = "Find Acteon!|1+ 9452 alliance|61.06 54.24|Diktynna",
		[9612]  = "A Hearty Thanks!|1+ draenei alliance -rogue|1 GiftOfTheNaaru|Draenei Youngling|discovery tomtom|Cast {135923} [spell]Gift of the Naaru] on a [green]Draenei Youngling] who is in combat to obtain this quest",
		[9616]  = "Bandits!|1+ broken:50 alliance|2 BloodElfCommunication|{133473} [Blood Elf Communication]|discovery chromietime tomtom|Drops from [hostile]Blood Elf Bandit] who is stealthed in a random location", -- Blizzard bug: as of 9.0 the drop is broken outside Chromie Time and will not drop at all for level 50+ characters, not even in Party Sync
		[9454]  = "The Great Moongraze Hunt|1+ alliance|49.78 51.93|Acteon",
		[10324] = "The Great Moongraze Hunt|1+ 9454 alliance|49.78 51.93|Acteon",
		[9455]  = "Strange Findings|1+ alliance|43 38.6|{134072} [Faintly Glowing Crystal]||Drops from [hostile]Infected Nightstalker Runt]",
		[9456]  = "Nightstalker Clean Up, Isle 2...|1+ 9455 alliance|47.12 50.61|Exarch Menelaous",
		[9603]  = "Beds, Bandages, and Beyond|1+ draenei alliance|48.34 49.15|Caregiver Chellan", -- Draenei only
		[9604]  = "On the Wings of a Hippogryph|1+ 9603 draenei alliance|49.71 49.11|Zaldaan", -- Draenei only
		[9605]  = "Hippogryph Master Stephanos|1+ 9604 draenei alliance|28.71 43.06|Nurguni|down link:103", -- Draenei only
		[9606]  = "Return to Caregiver Chellan|1+ 9605 draenei alliance|28.06 39.48|Stephanos|down link:103", -- Draenei only
		[9463]  = "Medicinal Purpose|1+ draenei alliance|48.39 51.76|Anchorite Fateema", -- Draenei only
		[9473]  = "An Alternative Alternative|1+ 9463 draenei alliance|48.38 51.49|Daedal", -- Draenei only
		[9505]  = "The Prophecy of Velen|1+ 9473 -9506 draenei alliance|48.38 51.49|Daedal", -- Draenei only breadcrumb for 9506
		[9623]  = "Coming of Age|1+ alliance|47.12 50.61|Exarch Menelaous",
		[9625]  = "Elekks Are Serious Business|1+ 9623 -28559 alliance|35.07 43.42|Torallius the Pack Handler", -- Breadcrumb for Bloodmyst; mutually exclusive with 28559
		[9582]  = "Strength of One|10+ alliance warrior|50.02 50.52|Ruada", -- Warrior only
		[10350] = "Behomat|1+ alliance warrior 9582|50.02 50.52|Ruada", -- Warrior only

		-- Odesyus' Landing
		[9506]  = "A Small Start|1+ alliance ~9505|47.04 70.2|Admiral Odesyus", -- Invalidates breadcrumb 9505
		[9530]  = "I've Got a Plant|1+ 9506 alliance|47.04 70.2|Admiral Odesyus",
		[9531]  = "Tree's Company|1+ 9530 alliance|47.04 70.2|Admiral Odesyus",
		[9537]  = "Show Gnomercy|1+ 9531 alliance|47.04 70.2|Admiral Odesyus",
		[9602]  = "Deliver Them From Evil...|1+ 9537 alliance|47.04 70.2|Admiral Odesyus",
		[9512]  = "Cookie's Jumbo Gumbo|1+ alliance|46.68 70.54|\"Cookie\" McWeaksauce",
		[9513]  = "Reclaiming the Ruins|1+ 9506 alliance|47.12 70.28|Priestess Kyleen Il'dinare",
		[9523]  = "Precious and Fragile Things Need Special Handling|1+ 9506 alliance|47.24 69.99|Archaeologist Adamant Ironheart",
		[9514]  = "Rune Covered Tablet|1+ 9506 alliance|34.7 77.3|{134462} [Rune Covered Tablet]||Drops from [hostile]Wrathscale] Naga",
		[9515]  = "Warlord Sriss'tiz|1+ 9514 alliance|47.12 70.28|Priestess Kyleen Il'dinare",

		-- The Prophecy of Akida
		[9538]  = "Lerning the Language|1+ alliance|49.38 50.97|Cryptographer Aurren",
		[9539]  = "Totem of Coo|1+ 9538 alliance|49.44 50.98|Totem of Akida",
		[9540]  = "Totem of Tikti|1+ 9539 alliance|55.23 41.65|Totem of Coo",
		[9541]  = "Totem of Yor|1+ 9540 alliance|64.47 39.77|Totem of Tikti",
		[9542]  = "Totem of Vark|1+ 9541 alliance|63.12 67.88|Totem of Yor",
		[9544]  = "The Prophecy of Akida|1+ 9542 alliance|28.11 62.39|Totem of Vark",
		[9559]  = "Stillpine Hold|1+ 9544 alliance|49.37 51.09|Arugoo of the Stillpine",

		-- Stillpine Hold
		[9562]  = "Murlocs... Why Here? Why Now?|1+ 9538 alliance|44.64 23.48|Gurf", -- Might require 9544?
		[9564]  = "Gurf's Dignity|1+ +9562 alliance|34.6 15|{134350} [Gurf's Dignity]||Drops from [hostile]Murgurgula] who patrols the shore", -- Requires 9562 in log
		[9560]  = "Beasts of the Apocalypse!|1+ 9538 alliance|44.77 23.89|Moordo", -- Might require 9544?
		[9565]  = "Search Stillpine Hold|1+ 9560,9562 alliance|46.68 20.63|High Chief Stillpine", -- check if 9560 or 9560,9562 or 9560 9562
		[9566]  = "Blood Crystals|1+ 9565 alliance|45.5 18.9|Blood Crystal|down link:99",
		[9573]  = "Chieftain Oomooroo|1+ 9560,9562 alliance|46.9 21.17|Stillpine the Younger", -- check if 9560 or 9560,9562 or 9560 9562
		[9570]  = "The Kurken is Lurkin'|1+ 9560,9562 alliance|46.9 21.17|Kurz the Revelator", -- check if 9560 or 9560,9562 or 9560 9562
		[9571]  = "The Kurken's Hide|1+ 9570 alliance|46.9 21.17|Kurz the Revelator",
		[9622]  = "Warn Your People|1+ 9570 9573 9566|46.68 20.63|High Chief Stillpine",

		-- Silvermyst Isle
		[10428] = "The Missing Fisherman|1+ -9527 alliance|48.96 51.06|Dulvi", -- Breadcrumb for 9527
		[9527]  = "All That Remains|1+ ~10428 alliance|16.59 94.45|Cowlen", -- Invalidates breadcrumb 10428
		[9528]  = "A Cry For Help|1+ alliance|13.63 73.22|Magwin",
	},

	-- Stillpine Hold
	[99] = {
		[9566] = "Blood Crystals|1+ 9565 alliance|65.18 30.89|Blood Crystal",
	},


	--[[ Durotar ]]--

	-- Orgrimmar
	[85] = {
		--[66253] = "Stolen Shipments|1+ horde|48.54 75.91|Zaa'je", -- Removed in 10.0.5
		--[66323] = "Idling Pie|1+ horde 66253|48.54 75.91|Zaa'je", -- Removed in 10.0.5
		[29401] = "Blown Away|10+ horde|48.13 46.85|Jaga",

		-- Durotar
		[6385]  = "Doras the Wind Rider Master|1+ horde orc,maghar,troll 6384|53.64 78.77|Innkeeper Gryshka", --Orc/Mag'har/Troll only
		[6386]  = "Return to Razor Hill|1+ horde orc,maghar,troll 6385|49.63 59.2|Doras", --Orc/Mag'har/Troll only

		-- Northern Barrens
		[25264] = "Ak'Zeloth|5+ horde 25263|49.91 59.15|Arnak Fireblade|down link:86",

		-- Azshara
		[25275] = "Report to the Labor Captain|1+ horde goblin -28496 -14129|49.21 72.27|Eitrigg", -- Goblin only breadcrumb for 14129, mutually exclusive with 28496

		-- Ragefire Chasm
		[31034] = "Enemies Below|7+ horde -31036 -31037|49.21 72.27|Eitrigg", -- Mutually exclusive with 31036 and 31037

		-- Cataclysm
		[28805] = "The Eye of the Storm|30+ horde|50.48 38.38|Farseer Krogar",

		-- Mount Hyjal
		[49855] = "Disaster at Mount Hyjal|30+ horde 28805 -27721 -25316|50.48 38.38|Farseer Krogar",

		-- Vashj'ir
		[28816] = "To the Depths|30+ horde 28805 -27718 -25924|50.48 38.38|Farseer Krogar",

		-- Deepholm
		[27203] = "The Maelstrom|30+ horde|50.48 38.38|Farseer Krogar",

		-- Legion
		[43926] = "Legion: The Legion Returns|10+ -44663 horde|49.67 76.46|Warchief's Command Board",

		-- Battle for Azeroth - The Stormwind Extraction
		[51443] = {"Battle for Azeroth: Mission Statement|10+ horde -60361 -59926|66.69 49.23|Warchief's Herald", "Battle for Azeroth: Mission Statement|10+ horde -60361 -59926|49.41 76.6|Warchief's Herald",}, -- 60361 is the Exile's Reach version
		
		-- Dragon Isles - The Dragonscale Expedition
		[65435] = "The Dragon Isles Await|10+ horde -70198|44.08 37.98|Ebyssian|campaign",
		[65437] = "Aspectral Invitation|10+ horde 65435 -70198|44.08 37.98|Ebyssian|campaign",
		[65443] = "Expeditionary Coordination|10+ horde 65437  -70198|44.19 37.79|Naleidea Rivergleam|campaign",
		[72256] = "The Dark Talons|10+ horde 65437  -70198|44.04 38.27|Scalecommander Cindrethresh|campaign",

		-- Blacksmithing
		[2751]  = "Barbaric Battlements|15+ horde blacksmithing skill:blacksmithing1:140|76.76 37.74|Orokk Omosh|blacksmithing", -- Requires 140 skill in Classic Blacksmithing

		-- Engineering
		[29477] = "Gnomish Engineering|20+ horde engineering skill:engineering1:200 -spell:20219 -spell:20222|56.8 56.4|Roxxik|engineering", -- Requires 200 skill in Classic Engineering
		[29475] = "Goblin Engineering|20+ horde engineering skill:engineering1:200 -spell:20219 -spell:20222|56.8 56.4|Roxxik|engineering", -- Requires 200 skill in Classic Engineering

		-- Fishing
		[6608]  = "You Too Good.|15+ horde fishing skill:fishing1:225|66.46 41.93|Lumak|fishing", -- Requires 225 skill in Classic Fishing
	},

	-- Cleft of Shadow, Orgrimmar
	[86] = {
		-- Northern Barrens
		[25264] = "Ak'Zeloth|5+ horde 25263|58.15 54.47|Arnak Fireblade",
	},

	-- Valley of Trials
	[461] = {
		[25152] = "Your Place In The World|1+ horde|45.2 68.39|Kaltunk",
		[25126] = "Cutting Teeth|1+ horde 25152|44.93 66.41|Gornek",
		[25136] = "Galgar's Cactus Apple Surprise|1+ horde 25126|42.97 62.4|Galgar",
		[25172] = "Invaders in Our Home|1+ horde 25126|44.93 66.41|Gornek",
		[25127] = "Sting of the Scorpid|1+ horde 25172|44.93 66.41|Gornek",
		[25128] = "Hana'zua|1+ horde 25127 -25129|41.71 70|Canaga Earthcaller", -- Breadcrumb for 25129
		[25129] = "Sarkoth|1+ horde ~25128|34.61 44.21|Hana'zua", -- Invalidates breadcrumb 25128
		[25130] = "Back to the Den|1+ horde 25129|34.61 44.21|Hana'zua",
		[25131] = "Vile Familiars|1+ horde 25127|45.81 63.43|Zureetha Fargaze",
		[37446] = "Lazy Peons|1+ horde 25172|46.17 63.28|Foreman Thazz'ril",
		[25135] = "Thazz'ril's Pick|1+ horde 25131 37446|46.17 63.28|Foreman Thazz'ril",
		[25132] = "Burning Blade Medallion|1+ horde 25131 37446|45.81 63.43|Zureetha Fargaze",
		[25133] = "Report to Sen'jin Village|1+ horde 25132|45.81 63.43|Zureetha Fargaze", -- Breadcrumb for 25167
	},

	-- Echo Isles
	[463] = {
		-- Death Knights, Demon Hunters, Evokers and Paladins are all out of luck
		[24764] = "The Rise of the Darkspear|1+ horde druid|42.83 53.43|Jin'thala", -- Druid only
		[24776] = "The Rise of the Darkspear|1+ horde hunter|42.83 53.43|Jin'thala", -- Hunter only
		[24750] = "The Rise of the Darkspear|1+ horde mage|42.83 53.43|Jin'thala", -- Mage only
		[31159] = "The Rise of the Darkspear|1+ horde monk|42.83 53.43|Jin'thala", -- Monk only
		[24782] = "The Rise of the Darkspear|1+ horde priest|42.83 53.43|Jin'thala", -- Priest only
		[24770] = "The Rise of the Darkspear|1+ horde rogue|42.83 53.43|Jin'thala", -- Rogue only
		[24758] = "The Rise of the Darkspear|1+ horde shaman|42.83 53.43|Jin'thala", -- Shaman only
		[26272] = "The Rise of the Darkspear|1+ horde warlock|42.83 53.43|Jin'thala", -- Warlock only
		[24607] = "The Rise of the Darkspear|1+ horde warrior|42.83 53.43|Jin'thala", -- Warrior only
		[24765] = "The Basics: Hitting Things|1+ horde druid 24764|58.07 54.04|Zen'tabra", -- Druid only
		[24777] = "The Basics: Hitting Things|1+ horde hunter 24776|56.39 50.08|Ortezza", -- Hunter only
		[24751] = "The Basics: Hitting Things|1+ horde mage 24750|59.69 52.06|Soratha", -- Mage only
		[31158] = "The Basics: Hitting Things|1+ horde monk 31159|52.57 51.85|Zabrax", -- Monk only
		[24783] = "The Basics: Hitting Things|1+ horde priest 24782|58.04 49.26|Tunari", -- Priest only
		[24771] = "The Basics: Hitting Things|1+ horde rogue 24770|52.89 49.02|Legati", -- Rogue only
		[24759] = "The Basics: Hitting Things|1+ horde shaman 24758|50.08 52.75|Nekali", -- Shaman only
		[26273] = "The Basics: Hitting Things|1+ horde warlock 26272|50.04 49.95|Voldreka", -- Warlock only
		[24639] = "The Basics: Hitting Things|1+ horde warrior 24607|52.54 53.68|Nortet", -- Warrior only
		[24767] = "A Rough Start|1+ horde druid 24765|58.07 54.04|Zen'tabra", -- Druid only
		[24779] = "A Rough Start|1+ horde hunter 24777|56.39 50.08|Ortezza", -- Hunter only
		[24753] = "A Rough Start|1+ horde mage 24751|59.69 52.06|Soratha", -- Mage only
		[31160] = "A Rough Start|1+ horde monk 31158|52.57 51.85|Zabrax", -- Monk only
		[24785] = "A Rough Start|1+ horde priest 24783|58.04 49.26|Tunari", -- Priest only
		[24773] = "A Rough Start|1+ horde rogue 24771|52.89 49.02|Legati", -- Rogue only
		[24761] = "A Rough Start|1+ horde shaman 24759|50.08 52.75|Nekali", -- Shaman only
		[26275] = "A Rough Start|1+ horde warlock 26273|50.04 49.95|Voldreka", -- Warlock only
		[24641] = "A Rough Start|1+ horde warrior 24639|52.54 53.68|Nortet", -- Warrior only
		[24768] = "Proving Pit|1+ horde druid 24767|58.07 54.04|Zen'tabra", -- Druid only
		[24780] = "Proving Pit|1+ horde hunter 24779|56.39 50.08|Ortezza", -- Hunter only
		[24754] = "Proving Pit|1+ horde mage 24753|59.69 52.06|Soratha", -- Mage only
		[31161] = "Proving Pit|1+ horde monk 31160|52.57 51.85|Zabrax", -- Monk only
		[24786] = "Proving Pit|1+ horde priest 24785|58.04 49.26|Tunari", -- Priest only
		[24774] = "Proving Pit|1+ horde rogue 24773|52.89 49.02|Legati", -- Rogue only
		[24762] = "Proving Pit|1+ horde shaman 24761|50.08 52.75|Nekali", -- Shaman only
		[26276] = "Proving Pit|1+ horde warlock 26275|50.04 49.95|Voldreka", -- Warlock only
		[24642] = "Proving Pit|1+ horde warrior 24641|52.54 53.68|Nortet", -- Warrior only
		[24769] = "More Than Expected|1+ horde druid 24768|58.07 54.04|Zen'tabra", -- Druid only
		[24781] = "More Than Expected|1+ horde hunter 24780|56.39 50.08|Ortezza", -- Hunter only
		[24755] = "More Than Expected|1+ horde mage 24754|59.69 52.06|Soratha", -- Mage only
		[31163] = "More Than Expected|1+ horde monk 31161|52.57 51.85|Zabrax", -- Monk only
		[24787] = "More Than Expected|1+ horde priest 24786|58.04 49.26|Tunari", -- Priest only
		[24775] = "More Than Expected|1+ horde rogue 24774|52.89 49.02|Legati", -- Rogue only
		[24763] = "More Than Expected|1+ horde shaman 24762|50.08 52.75|Nekali", -- Shaman only
		[26277] = "More Than Expected|1+ horde warlock 26276|50.04 49.95|Voldreka", -- Warlock only
		[24643] = "More Than Expected|1+ horde warrior 24642|52.54 53.68|Nortet", -- Warrior only
		[25037] = "Crab Fishin'|1+ horde 26277,24781,31163,24763,24755,24775,24787,24643,24769|60.54 62.89|Tora'jin",
		[25064] = "Moraya|1+ horde 26277,24781,31163,24763,24755,24775,24787,24643,24769|61.57 65.86|Vol'jin",
		[24622] = "A Troll's Truest Companion|1+ horde 25064|56.83 63.68|Moraya",
		[24623] = "Saving the Young|1+ horde 24622|45.58 85.11|Kijara",
		[24624] = "Mercy for the Lost|1+ horde 24622|45.73 85|Tegashi",
		[24625] = "Consort of the Sea Witch|1+ horde 24622|45.73 85|Tegashi",
		[24626] = "Young and Vicious|1+ horde 24623 24624 24625|45.58 85.11|Kijara",
		[25035] = "Breaking the Line|1+ horde 24626|58.95 66.84|Tortunga",
		[24812] = "No More Mercy|1+ horde 25035|58.92 23.06|Morakki",
		[24813] = "Territorial Fetish|1+ horde 25035|58.92 23.06|Morakki",
		[24814] = "An Ancient Enemy|1+ horde 24812 24813|58.92 23.06|Morakki",
		[25073] = "Sen'jin Village|1+ horde 24814 -25167|61.57 65.86|Vol'jin", -- Breadcrumb for 25167
	},

	-- Durotar
	[1] = {
		-- Valley of Trials
		[25152] = "Your Place In The World|1+ horde|43.3 68.76|Kaltunk|link:461",
		[25126] = "Cutting Teeth|1+ horde 25152|43.23 68.26|Gornek|link:461",
		[25136] = "Galgar's Cactus Apple Surprise|1+ horde 25126|42.73 67.23|Galgar|link:461",
		[25172] = "Invaders in Our Home|1+ horde 25126|43.23 68.26|Gornek|link:461",
		[25127] = "Sting of the Scorpid|1+ horde 25172|43.23 68.26|Gornek|link:461",
		[25128] = "Hana'zua|1+ horde 25127 -25129|42.41 69.17|Canaga Earthcaller|link:461", -- Breadcrumb for 25129
		[25129] = "Sarkoth|1+ horde ~25128|40.59 62.59|Hana'zua|link:461", -- Invalidates breadcrumb 25128
		[25130] = "Back to the Den|1+ horde 25129|40.59 62.59|Hana'zua|link:461",
		[25131] = "Vile Familiars|1+ horde 25127|43.45 67.5|Zureetha Fargaze|link:461",
		[37446] = "Lazy Peons|1+ horde 25172|43.55 67.46|Foreman Thazz'ril|link:461",
		[25135] = "Thazz'ril's Pick|1+ horde 25131 37446|43.55 67.46|Foreman Thazz'ril|link:461",
		[25132] = "Burning Blade Medallion|1+ horde 25131 37446|43.45 67.5|Zureetha Fargaze|link:461",
		[25133] = "Report to Sen'jin Village|1+ horde 25132|43.45 67.5|Zureetha Fargaze|link:461",

		-- Echo Isles
		-- Death Knights, Demon Hunters, Evokers and Paladins are all out of luck
		[24764] = "The Rise of the Darkspear|1+ horde druid|62.46 84.45|Jin'thala|link:463", -- Druid only
		[24776] = "The Rise of the Darkspear|1+ horde hunter|62.46 84.45|Jin'thala|link:463", -- Hunter only
		[24750] = "The Rise of the Darkspear|1+ horde mage|62.46 84.45|Jin'thala|link:463", -- Mage only
		[31159] = "The Rise of the Darkspear|1+ horde monk|62.46 84.45|Jin'thala|link:463", -- Monk only
		[24782] = "The Rise of the Darkspear|1+ horde priest|62.46 84.45|Jin'thala|link:463", -- Priest only
		[24770] = "The Rise of the Darkspear|1+ horde rogue|62.46 84.45|Jin'thala|link:463", -- Rogue only
		[24758] = "The Rise of the Darkspear|1+ horde shaman|62.46 84.45|Jin'thala|link:463", -- Shaman only
		[26272] = "The Rise of the Darkspear|1+ horde warlock|62.46 84.45|Jin'thala|link:463", -- Warlock only
		[24607] = "The Rise of the Darkspear|1+ horde warrior|62.46 84.45|Jin'thala|link:463", -- Warrior only
		[24765] = "The Basics: Hitting Things|1+ horde druid 24764|67.67 84.65|Zen'tabra|link:463", -- Druid only
		[24777] = "The Basics: Hitting Things|1+ horde hunter 24776|67.09 83.3|Ortezza|link:463", -- Hunter only
		[24751] = "The Basics: Hitting Things|1+ horde mage 24750|68.22 83.98|Soratha|link:463", -- Mage only
		[31158] = "The Basics: Hitting Things|1+ horde monk 31159|65.79 83.91|Zabrax|link:463", -- Monk only
		[24783] = "The Basics: Hitting Things|1+ horde priest 24782|67.66 83.02|Tunari|link:463", -- Priest only
		[24771] = "The Basics: Hitting Things|1+ horde rogue 24770|65.9 83.25|Legati|link:463", -- Rogue only
		[24759] = "The Basics: Hitting Things|1+ horde shaman 24758|64.94 84.21|Nekali|link:463", -- Shaman only
		[26273] = "The Basics: Hitting Things|1+ horde warlock 26272|64.93 83.26|Voldreka|link:463", -- Warlock only
		[24639] = "The Basics: Hitting Things|1+ horde warrior 24607|65.78 84.53|Nortet|link:463", -- Warrior only
		[24767] = "A Rough Start|1+ horde druid 24765|67.67 84.65|Zen'tabra|link:463", -- Druid only
		[24779] = "A Rough Start|1+ horde hunter 24777|67.09 83.3|Ortezza|link:463", -- Hunter only
		[24753] = "A Rough Start|1+ horde mage 24751|68.22 83.98|Soratha|link:463", -- Mage only
		[31160] = "A Rough Start|1+ horde monk 31158|65.79 83.91|Zabrax|link:463", -- Monk only
		[24785] = "A Rough Start|1+ horde priest 24783|67.66 83.02|Tunari|link:463", -- Priest only
		[24773] = "A Rough Start|1+ horde rogue 24771|65.9 83.25|Legati|link:463", -- Rogue only
		[24761] = "A Rough Start|1+ horde shaman 24759|64.94 84.21|Nekali|link:463", -- Shaman only
		[26275] = "A Rough Start|1+ horde warlock 26273|64.93 83.26|Voldreka|link:463", -- Warlock only
		[24641] = "A Rough Start|1+ horde warrior 24639|65.78 84.53|Nortet|link:463", -- Warrior only
		[24768] = "Proving Pit|1+ horde druid 24767|67.67 84.65|Zen'tabra|link:463", -- Druid only
		[24780] = "Proving Pit|1+ horde hunter 24779|67.09 83.3|Ortezza|link:463", -- Hunter only
		[24754] = "Proving Pit|1+ horde mage 24753|68.22 83.98|Soratha|link:463", -- Mage only
		[31161] = "Proving Pit|1+ horde monk 31160|65.79 83.91|Zabrax|link:463", -- Monk only
		[24786] = "Proving Pit|1+ horde priest 24785|67.66 83.02|Tunari|link:463", -- Priest only
		[24774] = "Proving Pit|1+ horde rogue 24773|65.9 83.25|Legati|link:463", -- Rogue only
		[24762] = "Proving Pit|1+ horde shaman 24761|64.94 84.21|Nekali|link:463", -- Shaman only
		[26276] = "Proving Pit|1+ horde warlock 26275|64.93 83.26|Voldreka|link:463", -- Warlock only
		[24642] = "Proving Pit|1+ horde warrior 24641|65.78 84.53|Nortet|link:463", -- Warrior only
		[24769] = "More Than Expected|1+ horde druid 24768|67.67 84.65|Zen'tabra|link:463", -- Druid only
		[24781] = "More Than Expected|1+ horde hunter 24780|67.09 83.3|Ortezza|link:463", -- Hunter only
		[24755] = "More Than Expected|1+ horde mage 24754|68.22 83.98|Soratha|link:463", -- Mage only
		[31163] = "More Than Expected|1+ horde monk 31161|65.79 83.91|Zabrax|link:463", -- Monk only
		[24787] = "More Than Expected|1+ horde priest 24786|67.66 83.02|Tunari|link:463", -- Priest only
		[24775] = "More Than Expected|1+ horde rogue 24774|65.9 83.25|Legati|link:463", -- Rogue only
		[24763] = "More Than Expected|1+ horde shaman 24762|64.94 84.21|Nekali|link:463", -- Shaman only
		[26277] = "More Than Expected|1+ horde warlock 26276|64.93 83.26|Voldreka|link:463", -- Warlock only
		[24643] = "More Than Expected|1+ horde warrior 24642|65.78 84.53|Nortet|link:463", -- Warrior only
		[25037] = "Crab Fishin'|1+ horde 26277,24781,31163,24763,24755,24775,24787,24643,24769|68.51 87.68|Tora'jin|link:463",
		[25064] = "Moraya|1+ horde 26277,24781,31163,24763,24755,24775,24787,24643,24769|68.86 88.69|Vol'jin|link:463",
		[24622] = "A Troll's Truest Companion|1+ horde 25064|67.25 87.95|Moraya|link:463",
		[24623] = "Saving the Young|1+ horde 24622|63.4 95.27|Kijara|link:463",
		[24624] = "Mercy for the Lost|1+ horde 24622|63.45 95.23|Tegashi|link:463",
		[24625] = "Consort of the Sea Witch|1+ horde 24622|63.45 95.23|Tegashi|link:463",
		[24626] = "Young and Vicious|1+ horde 24623 24624 24625|63.4 95.27|Kijara|link:463",
		[25035] = "Breaking the Line|1+ horde 24626|67.97 89.03|Tortunga|link:463",
		[24812] = "No More Mercy|1+ horde 25035|67.96 74.07|Morakki|link:463",
		[24813] = "Territorial Fetish|1+ horde 25035|67.96 74.07|Morakki|link:463",
		[24814] = "An Ancient Enemy|1+ horde 24812 24813|67.96 74.07|Morakki|link:463",
		[25073] = "Sen'jin Village|1+ horde 24814 -25167|68.86 88.69|Vol'jin|link:463", -- Breadcrumb for 25167

		-- Sen'jin Village
		[25170] = "Cleaning Up the Coastline|1+ horde|55.74 75.36|Bom'bay",
		[25165] = "Never Trust a Big Barb and a Smile|1+ horde 25170|55.74 75.36|Bom'bay",
		[25167] = "Breaking the Chain|1+ horde ~25133 ~25073|55.95 74.72|Master Gadrin", -- Invalidates breadcrumb 25133
		[25168] = "Purge the Valley|1+ horde 25167|55.95 74.72|Master Gadrin",
		[25169] = "The War of Northwatch Aggression|1+ horde 25167|55.43 75.1|Lar Prowltusk",
		[25171] = "Riding On|1+ horde 25168 25169|55.95 74.72|Master Gadrin",

		-- Razor Hill
		[6365]  = "Meats to Orgrimmar|1+ horde orc,maghar,troll|50.74 42.83|Grimtak", --Orc/Mag'har/Troll only
		[6384]  = "Ride to Orgrimmar|1+ horde orc,maghar,troll 6365|53.09 43.58|Burok", --Orc/Mag'har/Troll only
		[25173] = "From Bad to Worse|1+ horde 25171|51.94 43.51|Gar'Thok",
		[25177] = "Storming the Beaches|1+ horde 25173|51.94 43.51|Gar'Thok",
		[25179] = "Loss Reduction|1+ horde 25173|57.91 45.14|Injured Razor Hill Grunt",
		[25176] = "Exploiting the Situation|1+ horde 25171|53.1 43.14|Gail Nozzywig",
		[25178] = "Shipwreck Searching|1+ horde 25173 25176|53.1 43.14|Gail Nozzywig",
		[25227] = "Thonk|1+ horde 25178 -25187|53.1 43.14|Gail Nozzywig", -- Breadcrumb for 25187
		[25232] = "The Burning Blade|1+ horde|52.25 43.15|Orgnil Soulscar",
		[25196] = "The Dranosh'ar Blockade|1+ horde 25232|52.25 43.15|Orgnil Soulscar",
		[840]   = "Conscript of the Horde|5+ horde|50.85 43.59|Takrin Pathseeker",

		-- Southfury Watershed
		[25187] = "Lost in the Floods|1+ horde ~25227|49.58 40.17|Thonk", -- Invalidates breadcrumb 25227
		[25188] = "Watershed Patrol|1+ horde 25187|49.58 40.17|Thonk",
		[25190] = "Raggaran's Rage|1+ horde +25188|42.7 49.9|Raggaran",
		[25192] = "Raggaran's Fury|1+ horde 25190 +25188|42.7 49.9|Raggaran",
		[25193] = "Lost But Not Forgotten|1+ horde +25188|43.38 30.63|Misha Tor'kren",
		[25194] = "Unbidden Visitors|1+ horde +25188|35.85 41.38|Zen'Taji",
		[25195] = "That's the End of That Raptor|1+ horde 25194 +25188|35.85 41.38|Zen'Taji",

		-- The Dranosh'ar Blockade
		[834]   = "Winds in the Desert|1+ horde|46.38 22.93|Rezlak",
		[835]   = "Securing the Lines|1+ horde|46.38 22.93|Rezlak",
		[25260] = "Fizzled|1+ horde 25196|45 14.77|Gor the Enforcer",
		[25261] = "Margoz|1+ horde 25260|45 14.77|Gor the Enforcer",
		[25236] = "Thunder Down Under|1+ horde|45 14.77|Gor the Enforcer",
		[25205] = "The Wolf and the Kodo|1+ horde|44.9 14.83|Shin Stonepillar",
		[25206] = "Ignoring the Warnings|1+ horde 25205|45 14.77|Gor the Enforcer",
		[25648] = "Beyond Durotar|1+ horde 25236 25206 -28496|45 14.77|Gor the Enforcer", -- Mutually exclusive with 28496

		-- Deadeye Shore
		[25262] = "Skull Rock|1+ horde 25261|56.41 20.04|Margoz",
		[25263] = "Arnak Fireblade|1+ horde 25262|56.41 20.04|Margoz",
		[25256] = "Sent for Help|1+ horde|56.38 20.22|Vek'nag",
		[25257] = "Ghislania|1+ horde 25256|58.83 23.17|Spiketooth",
		[25258] = "Griswold Hanniston|1+ horde 25256|58.83 23.17|Spiketooth",
		[25259] = "Gaur Icehorn|1+ horde 25256|58.83 23.17|Spiketooth",

		-- Legion
		[44281] = "To Be Prepared|10+ -44663 43926 horde|46.01 13.78|Holgar Stormaxe",
		[40518] = "The Battle for Broken Shore|10+ -44663 44281 horde|55.65 11.04|Stone Guard Mukar",

		-- Stormheim - Greymane's Gambit
		[39698] = "Making the Rounds|10+ 38307 horde|61.37 8.86|Lady Sylvanas Windrunner",
		[39801] = "The Splintered Fleet|10+ 39698 horde|61.49 8.77|Lady Sylvanas Windrunner",

		-- Death Knight - The Four Horsemen
		[42484] = "The Firstborn Rises|10+ deathknight 42449|47.32 17.67|Thassarian|artifact",

		-- Dragon Isles - The Dragonscale Expedition
		[65439] = "Whispers on the Winds|10+ horde 65443 72256 -70198|55.92 12.61|Archmage Khadgar|campaign",
		[65444] = "To the Dragon Isles!|60+ horde 65439,70198 ~70198|55.81 12.66|Naleidea Rivergleam|campaign",
	},


	--[[ Azshara ]]--

	[76] = {
		-- Defending Orgrimmar
		[14117] = "The Eyes of Ashenvale|5+ horde|26.82 76.95|Ag'tor Bloodfist",
		[14118] = "Venison for the Troops|5+ horde|26.82 76.95|Ag'tor Bloodfist",
		[14129] = "Runaway Shredder!|5+ horde|27 77.08|Labor Captain Grabbit",
		[14134] = "The Captain's Logs|5+ horde 14129|27 77.08|Labor Captain Grabbit",
		[14135] = "Up a Tree|5+ horde 14134|27 77.08|Labor Captain Grabbit",
		[14146] = "Defend the Gates!|5+ horde 14135|27 77.08|Labor Captain Grabbit",
		[14155] = "Arborcide|5+ horde 14146|27 77.08|Labor Captain Grabbit",
		[14162] = "Report to Horzak|5+ horde 14155 -14161|27 77.08|Labor Captain Grabbit", -- Breadcrumb for 14161

		-- Mountainfoot Strip Mine
		[14161] = "Basilisk Bashin'|5+ horde ~14162|29.15 66.24|Horzak Zignibble", -- Invalidates breadcrumb 14162
		[14165] = "Stone Cold|5+ horde|29.15 66.24|Horzak Zignibble",
		[14190] = "The Perfect Prism|5+ horde 14165|29.15 66.24|Horzak Zignibble",
		[14192] = "Prismbreak|5+ horde 14190|20.26 70.4|Headquarters Radio",
		[14194] = "Refleshification|5+ horde 14192|20.03 69.98|Weapons Cabinet",
		[14197] = "A Quota to Meet|5+ horde|29.26 66.49|Foreman Fisk",
		[14468] = "Another Warm Body|5+ horde 14161 14194 14197|29.53 66.84|Private Worcester",

		-- Redirecting the Ley Lines
		[14127] = "Return of the Highborne?|5+ horde|27.27 73.39|{133464} [Scout's Orders]||Has a chance to drop from [hostile]Talrendis Scout]",
		[14128] = "Return of the Highborne?|5+ horde 14127|26.82 76.95|Ag'tor Bloodfist",
		[14201] = "A Thousand Stories in the Sand|5+ horde 24453|29.68 66.88|Malynea Skyreaver",
		[14215] = "Memories of the Dead|5+ horde 14201|29.68 66.88|Malynea Skyreaver",
		[14216] = "Mystery of the Sarcen Stone|5+ horde 14215|29.68 66.88|Malynea Skyreaver",

		-- Sisters of the Sea
		[14258] = "Mortar the Point|5+ horde|52.22 74.24|Bombardier Captain Smooks",
		[14262] = "To Gut a Fish|5+ horde 14258|50.68 75.29|Torg Twocrush",
		[14267] = "Investigating the Sea Shrine|5+ horde 14258|50.68 75.29|Torg Twocrush",
		[14270] = "The Keystone Shard|5+ horde 14267|59.01 71.85|Naga Power Stone",
		[14271] = "Report to Twocrush|5+ horde 14270|59.01 71.85|Naga Power Stone",
		[14295] = "Sisters of the Sea|5+ horde 14271|50.68 75.29|Torg Twocrush",

		-- Subject Nine from Space!
		[14322] = "Bad Science! Bad!|5+ horde|45.06 75.48|Twistex Happytongs", -- any prereq?
		[14408] = "Nine's Plan|5+ horde|42.23 76.09|Subject Nine", -- any prereq?
		[14422] = "Raptor Raptor Rocket|5+ horde 14408|42.23 76.09|Subject Nine",

		-- The Rarest Substance on Azeroth
		[14202] = "Survey the Lakeshore|5+ horde 24453|29.72 67.07|Custer Clubnik",
		[14209] = "Gunk in the Trunk|5+ horde 14202|29.72 67.07|Custer Clubnik",
		[14423] = "Dozercism|5+ horde 14209|29.72 67.07|Custer Clubnik",
		[14424] = "Need More Science|5+ horde 14423 -14308|29.72 67.07|Custer Clubnik", -- Breadcrumb for 14308
		[14308] = "When Science Attacks|5+ horde ~14424|50.41 74.29|Assistant Greely", -- Invalidates breadcrumb 14424
		[14310] = "Segmentation Fault: Core Dumped|5+ horde 14308|43.81 77.36|Secret Lab Squawkbox",
		[14370] = "Mysterious Azsharite|5+ horde 14310|50.41 74.29|Assistant Greely",
		[14371] = "A Gigantic Snack|5+ horde 14310|50.41 74.29|Assistant Greely",
		[14377] = "Befriending Giants|5+ horde 14370 14371|50.41 74.29|Assistant Greely",
		[14385] = "Azsharite Experiment Number One|5+ horde 14377|50.41 74.29|Assistant Greely",
		[14383] = "The Terrible Tinkers of the Ruined Reaches|5+ horde 14377|50.53 74.74|Hobart Grapplehammer",
		[14388] = "Azsharite Experiment Number Two|5+ horde 14385|50.41 74.29|Assistant Greely",
		[24458] = "A Hello to Arms|5+ horde 14388|50.53 74.74|Hobart Grapplehammer",

		-- Heart of Arkkoroc
		[14469] = "Hand-me-downs|5+ horde 14468|29.46 57.67|Commander Molotov",
		[14470] = "Military Breakthrough|5+ horde 14468|29.38 57.62|Glix Grindlock",
		[14471] = "First Degree Mortar|5+ horde 14468|29.11 57.93|Xiz \"The Eye\" Salvoblast",
		[14472] = "In The Face!|5+ horde 14469 14470 14471|29.38 57.62|Glix Grindlock",
		[24452] = "Profitability Scouting|5+ horde 14472|29.46 57.67|Commander Molotov",
		[24453] = "Private Chat|5+ horde 24452|29.46 57.67|Commander Molotov",
		[14478] = {"Operation Fishgut|5+ horde 24453|52.3 50.31|Wrenchmen Recruitment Poster", "Operation Fishgut|5+ horde 24453|56.05 48.26|Wrenchmen Recruitment Poster", "Operation Fishgut|5+ horde 24453|56.98 50.09|Wrenchmen Recruitment Poster",},
		[24455] = "Rapid Deployment|5+ horde 14478|60.64 50.59|Commander Molotov",
		[14479] = "There Are Many Like It|5+ horde 24455|58.1 52.31|Captain Desoto",
		[24437] = "First Come, First Served|5+ horde|39.14 51.77|Ruckus",
		[24435] = "Mop Up|5+ horde 14479|41.5 53.64|Lieutenant Drex",
		[24436] = "Halo Drops|5+ horde 14479|41.38 53.93|Sergeant Hort",
		[24448] = "Field Promotion|5+ horde 24435 24436|41.5 53.64|Lieutenant Drex",
		[14487] = "Still Beating Heart|5+ horde 24448|34.31 44.9|Captain Tork",
		[14480] = "Extermination|5+ horde 24448|34.31 44.9|Sergeant Zelks",
		[14484] = "Head of the Snake|5+ horde 24448|34.31 44.9|Sergeant Zelks",
		[14485] = "Ticker Required|5+ horde 24448|34.31 44.9|Sergeant Zelks",
		[14486] = "Handling the Goods|5+ horde 24448|34.53 44.67|Tora Halotrix",
		[24449] = "Shore Leave|5+ horde 14487 14480 14484 14485 14486|34.31 44.9|Captain Tork",

		-- The Best Apprentice
		[14407] = "Azshara Blues|5+ horde|59.33 50.75|Teemo",
		[14130] = "Friends Come In All Colors|5+ horde 14407|55.5 52.13|Kalec",
		[14131] = "A Little Pick-me-up|5+ horde 14130|70.36 36.25|Ergll",
		[14132] = "That's Just Rude!|5+ horde 14130|70.36 36.25|Ergll",
		[14323] = "Absorbent|5+ horde 14130|70.36 36.25|Ergll",
		[14324] = "Full of Hot Water|5+ horde 14323|70.36 36.25|Ergll",
		[14345] = "Wash Out|5+ horde 14131 14132 14324|70.36 36.25|Ergll",
		[14340] = "Dressed to Impress|5+ horde 14345|42.71 25.11|Sorata Firespinner",
		[14249] = "Shear Will|5+ horde 14340|47.15 21.07|Will Robotronic",
		[14250] = "Renewable Resource|5+ horde 14340|47.29 21.2|Tharkul Ironskull",
		[14263] = "Waste of Thyme|5+ horde 14340|47.01 21.05|Quarla Whistlebreak",
		[14226] = "Trouble Under Foot|5+ horde 14249 14250 14263|47.23 20.85|Image of Archmage Xylem",
		[14230] = "Manual Labor|5+ horde 14249 14250 14263|47.24 21.28|Teresa Spireleaf",
		[14413] = "The Pinnacle of Learning|5+ horde 14226 14230|47.23 20.85|Image of Archmage Xylem",
		[14296] = "Watch Your Step|5+ horde 14413|55.71 14.77|Image of Archmage Xylem",
		[14300] = "The Trial of Fire|5+ horde 14296|55.95 12.16|Image of Archmage Xylem",
		[24478] = "The Trial of Frost|5+ horde 14296|55.95 12.16|Image of Archmage Xylem",
		[24479] = "The Trial of Shadow|5+ horde 14296|55.95 12.16|Image of Archmage Xylem",
		[14299] = "Xylem's Asylum|5+ horde 14300 24478 24479|55.95 12.16|Image of Archmage Xylem",
		[14389] = "Wasn't It Obvious?|5+ horde 14299|25.59 37.96|Joanna",
		[14390] = "Easy is Boring|5+ horde 14389|27.94 40.04|[dead]Spirit of Azuregos]||Use [spell]Ambitious Reach] inside Xylem's Tower to enter the spirit realm",
		[14391] = "Turning the Tables|5+ horde 14390 -24467|27.94 40.04|[dead]Spirit of Azuregos]||Use [spell]Ambitious Reach] inside Xylem's Tower to enter the spirit realm", -- Breadcrumb for 24467
		[24467] = "Fade to Black|5+ horde 14390 ~14391|66.55 20.36|Kalec", -- Invalidates breadcrumb 14391
		[14297] = "Pro-liberation|5+ horde 14390|66.34 20.26|Jellix Fuselighter",
		[14261] = "Ice Cold|5+ horde 14390|66.54 19.6|Feno Blastnoggin",
		[14392] = "Farewell, Minnow|5+ horde 24467 14297 14261|67.06 20.53|Azuregos",

		-- Northern Rocketway Exchange
		[14428] = "Amberwind's Journal|5+ horde|42.61 23.7|Andorel Sunsworn",
		[14429] = "Arcane De-Construction|5+ horde 14428|49.5 28.82|Upper Scrying Stone",
		[14430] = "Hacking the Construct|5+ horde 14429|52.99 29.03|Lower Scrying Stone",
		[14431] = "The Blackmaw Scar|5+ horde|42.41 23.61|Haggrum Bloodfist",
		[14432] = "A Pale Brew|5+ horde 14431|42.41 23.61|Haggrum Bloodfist",
		[14433] = "Diplomacy by Another Means|5+ horde 14431|42.41 23.61|Haggrum Bloodfist",
		[14435] = "The Blackmaw Doublecross|5+ horde 14432 14433|42.41 23.61|Haggrum Bloodfist",

		-- The Conquest of Azshara
		[24497] = "Airborne Again|5+ horde 24449 14392|52.97 49.77|Gurlorn",
		[14475] = "Grounded!|5+ horde|14.35 65.03|Kroum",
		[14476] = "Rigged to Blow|5+ horde 14475|14.46 75.57|Bombardier Captain Smooks",
		[14477] = "Push the Button!|5+ horde 14476|14.46 75.57|Bombardier Captain Smooks",
		[24430] = "Blacken the Skies|5+ horde 14477|14.47 65.72|Jr. Bombardier Hackel",
		[14462] = "Where's My Head?|5+ horde|14.01 64.84|Chawg",
		[14464] = "Lightning Strike Assassination|5+ horde 14462|12.52 67.46|Slinky Sharpshiv",
		[24433] = "Let Them Feast on Fear|5+ horde|14.01 64.84|Chawg",
		[24434] = "Commando Drop|5+ horde|13.85 64.49|Andorel Sunsworn",
		[24439] = "The Conquest of Azshara|5+ horde 24430 14464 24433 24434|14.01 64.84|Chawg", -- confirm 14464 and 24433
		[24463] = "Probing into Ashenvale|7+ horde 24439 -13866 -28493|14.35 65.03|Kroum", -- Breadcrumb for 13866; mutually exclusive with 28493
	},


	--[[ Mulgore ]]--

	-- Thunder Bluff
	[88] = {
		-- Mulgore
		[6363]  = "Tal the Wind Rider Master|1+ horde tauren 6362|45.74 55.85|Ahanu", -- Tauren only
		[6364]  = "Return to Varg|1+ horde tauren 6363|47.02 49.6|Tal", -- Tauren only
		[24540] = "War Dance|1+ horde tauren 24524 ~24550|60.26 51.68|Baine Bloodhoof", -- Tauren only; invalidates breadcrumb 24550
		[26397] = "Walk With The Earth Mother|1+ horde tauren 24540|60.26 51.68|Baine Bloodhoof", -- Tauren only

		-- Silverpine Forest
		[264]   = "Until Death Do Us Part|5+ horde|28.91 26|Clarice Foster",

		-- Ragefire Chasm
		[31036] = "Enemies Below|7+ horde -31034 -31037|60.26 51.68|Baine Bloodhoof", -- Mutually exclusive with 31034 and 31037

		-- Battle for Azeroth - The Stormwind Extraction
		[51443] = "Battle for Azeroth: Mission Statement|10+ horde -60361 -59926|42.41 58.31|Warchief's Herald", -- 60361 is the Exile's Reach version

		-- Engineering
		[29477] = "Gnomish Engineering|20+ horde engineering skill:engineering1:200 -spell:20219 -spell:20222|36.4 59.6|Engineer Palehoof|engineering", -- Requires 200 skill in Classic Engineering
		[29475] = "Goblin Engineering|20+ horde engineering skill:engineering1:200 -spell:20219 -spell:20222|36.4 59.6|Engineer Palehoof|engineering", -- Requires 200 skill in Classic Engineering
	},

	-- Camp Narache
	[462] = {
		[14449] = "The First Step|1+ horde|27.73 28.28|Chief Hawkwind",
		[14452] = "Rite of Strength|1+ horde 14449|39.45 37.25|Grull Hawkwind",
		[24852] = "Our Tribe, Imprisoned|1+ horde 14452|39.45 37.25|Grull Hawkwind",
		[14458] = "Go to Adana|1+ horde 24852|39.45 37.25|Grull Hawkwind",
		[14456] = "Rite of Courage|1+ horde 14458|30.92 50.6|Adana Thunderhorn",
		[14455] = "Stop the Thorncallers|1+ horde 14458|30.92 50.6|Adana Thunderhorn",
		[14459] = "The Battleboars|1+ horde 14456 14455|30.92 50.6|Adana Thunderhorn",
		[14461] = "Feed of Evil|1+ horde 14456 14455|30.92 50.6|Adana Thunderhorn",
		[14460] = "Rite of Honor|1+ horde 14459 14461|30.92 50.6|Adana Thunderhorn",
		[24861] = "Last Rites, First Rites|1+ horde 14460|27.73 28.28|Chief Hawkwind",
		[23733] = "Rites of the Earthmother|1+ horde 24861|27.73 28.28|Chief Hawkwind",
		[24215] = "Rite of the Winds|1+ horde 23733|15.63 30.27|Dyami Windsoar",
	},

	-- Mulgore
	[7] = {
		-- Camp Narache
		[14449] = "The First Step|1+ horde|45.15 75.45|Chief Hawkwind|link:462",
		[14452] = "Rite of Strength|1+ horde 14449|48.95 78.35|Grull Hawkwind|link:462",
		[24852] = "Our Tribe, Imprisoned|1+ horde 14452|48.95 78.35|Grull Hawkwind|link:462",
		[14458] = "Go to Adana|1+ horde 24852|48.95 78.35|Grull Hawkwind|link:462",
		[14456] = "Rite of Courage|1+ horde 14458|46.19 82.68|Adana Thunderhorn|link:462",
		[14455] = "Stop the Thorncallers|1+ horde 14458|46.19 82.68|Adana Thunderhorn|link:462",
		[14459] = "The Battleboars|1+ horde 14456 14455|46.19 82.68|Adana Thunderhorn|link:462",
		[14461] = "Feed of Evil|1+ horde 14456 14455|46.19 82.68|Adana Thunderhorn|link:462",
		[14460] = "Rite of Honor|1+ horde 14459 14461|46.19 82.68|Adana Thunderhorn|link:462",
		[24861] = "Last Rites, First Rites|1+ horde 14460|45.15 75.45|Chief Hawkwind|link:462",
		[23733] = "Rites of the Earthmother|1+ horde 24861|45.15 75.45|Chief Hawkwind|link:462",
		[24215] = "Rite of the Winds|1+ horde 23733|41.23 76.09|Dyami Windsoar|link:462",

		-- Bloodhoof Village
		[6361]  = "A Bundle of Hides|1+ horde tauren|46.06 58.19|Varg Windwhisper", -- Tauren only
		[6362]  = "Ride to Thunder Bluff|1+ horde tauren 6361|47.44 58.64|Tak", -- Tauren only
		[14438] = "Sharing the Land|1+ horde|47.66 59.59|Ahmo Thunderhorn",
		[14491] = "The Restless Earth|1+ horde 14438|47.66 59.59|Ahmo Thunderhorn",
		[743]   = "Dangers of the Windfury|1+ horde|47.51 61.32|Ruul Eagletalon",
		[761]   = "Swoop Hunting|1+ horde|48.79 58.79|Harken Windtotem",
		[26188] = "Mazzranache|1+ horde|47.16 56.66|Maur Raincaller",
		[11129] = "Kyle's Gone Missing!|1+ horde|48.34 53.09|Ahab Wheathoof",
		[24459] = "Morin Cloudstalker|1+ horde -749|47.66 59.59|Ahmo Thunderhorn", -- Breadcrumb for 749
		[20440] = "Poison Water|1+ horde tauren|48.62 59.8|Mull Thunderhorn", -- Tauren only
		[24440] = "Winterhoof Cleansing|1+ horde tauren 20440|48.62 59.8|Mull Thunderhorn", -- Tauren only
		[24441] = "Thunderhorn Totem|1+ horde tauren 24440|48.62 59.8|Mull Thunderhorn", -- Tauren only
		[24456] = "Thunderhorn Cleansing|1+ horde tauren 24441|48.62 59.8|Mull Thunderhorn", -- Tauren only
		[24457] = "Rite of Vision|1+ horde tauren 24456|48.62 59.8|Mull Thunderhorn", -- Tauren only
		[20441] = "Rite of Vision|1+ horde tauren 24457|47.89 57.11|Zarlman Two-Moons", -- Tauren only

		-- The Ravaged Caravan
		[749]   = "The Ravaged Caravan|1+ horde ~24459|57.05 60.43|Morin Cloudstalker", -- Invalidates breadcrumb 24459
		[751]   = "The Ravaged Caravan|1+ horde 749|53.53 48.28|Sealed Supply Crate",
		[26179] = "The Venture Co.|1+ horde 751|57.05 60.43|Morin Cloudstalker",
		[26180] = "Supervisor Fizsprocket|1+ horde 751|57.05 60.43|Morin Cloudstalker",

		-- Camp Sungraze
		[833]   = "A Sacred Burial|1+ horde|49.52 17.1|Lorekeeper Raintotem",
		[744]   = "Preparation for Ceremony|1+ horde|49.59 17.59|Eyahn Eagletalon",
		[770]   = "The Demon Scarred Cloak|1+ horde|43.28 14.84|{134358} [Demon Scarred Cloak]||Drops from [hostile]Ghost Howl] who roams the area",
		[773]   = "Rite of Wisdom|1+ horde tauren 20441|49.52 17.1|Lorekeeper Raintotem", -- Tauren only
		[24523] = "Wildmane Totem|1+ horde tauren 24456|49.37 17.33|Una Wildmane", -- Tauren only
		[24524] = "Wildmane Cleansing|1+ horde tauren 24523|49.37 17.33|Una Wildmane", -- Tauren only
		[24550] = "Journey into Thunder Bluff|1+ horde tauren 24524 -24540|49.37 17.33|Una Wildmane", -- Tauren only; breadcrumb for 24540
	},


	--[[ Northern Barrens ]]--

	[10] = {
		-- Far Watch
		[871]   = "In Defense of Far Watch|5+ horde|67.67 39.39|Kargal Battlescar",
		[844]   = "Plainstrider Menace|5+ horde|67.4 38.77|Halga Bloodeye",
		[13878] = "Through Fire and Flames|5+ horde|66.49 45.45|Dorak",
		[872]   = "The Far Watch Offensive|5+ horde 871|67.67 39.39|Kargal Battlescar",
		[5041]  = "Supplies for the Crossroads|5+ horde 871|67.4 38.77|Halga Bloodeye",
		[13949] = "Crossroads Caravan Pickup|5+ horde 872 5041|67.4 38.77|Halga Bloodeye",

		-- Grol'dom Farm
		[13961] = "Drag it Out of Them|5+ horde|56.58 40.28|Togrik",
		[13963] = "By Hook Or By Crook|5+ horde 13961|56.58 40.28|Togrik",
		[13968] = "The Tortusk Takedown|5+ horde 13963|56.58 40.28|Togrik",
		[13969] = "Grol'dom's Missing Kodo|5+ horde 13963|56.37 40.33|Kranal Fiss",
		[13970] = "Animal Services|5+ horde 13969|58.01 49.27|Grol'dom Kodo",
		[13971] = "The Kodo's Return|5+ horde 13970|58.01 49.27|Grol'dom Kodo",
		[899]   = "Consumed by Hatred|5+ horde|55.17 41.02|Mankrik",
		[13973] = "The Grol'dom Militia|5+ horde|54.02 41.26|Una Wolfclaw",
		[13975] = "Crossroads Caravan Delivery|5+ horde 13949|54.62 41.47|Rocco Whipshank",

		-- The Crossroads
		[845]   = "The Zhevra|5+ horde|49.99 59.85|Sergra Darkthorn",
		[903]   = "Hunting the Huntress|5+ horde|49.99 59.85|Sergra Darkthorn",

		-- Defeating the Kolkar
		[848]   = "Fungal Spores|5+ horde|48.59 58.34|Apothecary Helbrim",

		-- Mysteries of the Oases
		[870]   = "The Forgotten Pools|5+ horde|49.49 58.66|Tonga Runetotem",

		-- Ratchet
		[14034] = "Club Foote|5+ horde|68.41 69.06|Gazlowe",
		[14045] = "Find Baron Longshore|5+ horde|68.41 69.06|Gazlowe",
		[895]   = "WANTED: Cap'n Garvey|5+|68.26 71.24|WANTED",
		[865]   = "It's Gotta be the Horn|5+|67.86 71.49|Mebok Mizzyrix",
		[14066] = "Investigate the Wreckage|5+ horde|66.86 72.79|Gazrog",
		[891]   = "A Captain's Vengeance|5+ horde|67.72 74|Captain Thalo'thas Brightsun",
		[887]   = "Southsea Freebooters|5+ horde|69.6 72.98|Wharfmaster Dizzywig",
		[14052] = "Take it up with Tony|5+ horde|69.6 72.98|Wharfmaster Dizzywig",

		-- Nozzlepot's Outpost

		-- Inspiration and Hope

		-- The Mor'shan Rampart
		[13612] = "Mor'shan Defense|7+ horde ~28493 ~13866|42.7 14.96|Kadrak", -- Invalidates breadcrumbs 28493 and 13866
		[13618] = "Find Gorat!|7+ horde|42.7 14.96|Kadrak",
		[13615] = "Empty Quivers|7+ horde|42.26 15.2|Truun",
		[13613] = "Rescue the Fallen|7+ horde|42.43 15.77|Dinah Halfmoon",

		-- Wailing Caverns
		[26878] = "Disciples of Naralex|8+ horde|49.49 58.66|Tonga Runetotem|dungeon",
	},


	--[[ Ashenvale ]]--

	[63] = {
		-- The Mor'shan Rampart
		[13866] = "To The Ramparts!|7+ horde ~24463 -28493 -13612|94.4 46.82|Kulg Gorespatter", -- Invalidates breadcrumb 24463; mutually exclusive with 28493; breadcrumb for 13612
		[13612] = "Mor'shan Defense|7+ horde ~28493 ~13866|68.52 89.39|Kadrak", -- Invalidates breadcrumbs 28493 and 13866
		[13618] = "Find Gorat!|7+ horde|68.52 89.39|Kadrak",
		[13615] = "Empty Quivers|7+ horde|68.09 89.62|Truun",
		[13613] = "Rescue the Fallen|7+ horde|68.25 90.19|Dinah Halfmoon",
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


	--[[ Moonglade ]]--

	[80] = {
		-- Mount Hyjal
		[25316] = "As Hyjal Burns|30+ ~49855 ~27721 ~27726|45.48 44.87|Emissary Windsong",

		-- Druid - The Dreamgrove
		[41106] = "Call of the Wilds|10+ druid 40643|56.26 31.83|Archdruid Hamuul Runetotem|artifact",
		[40644] = "The Dreamway|10+ druid 41106|56.26 31.83|Archdruid Hamuul Runetotem|artifact",
		[40645] = "To The Dreamgrove|10+ druid 40644|66.73 60.54|Malfurion Stormrage|artifact",
	},


	--[[ Silithus ]]--

	-- Silithus
	[81] = {
		-- Classic: art:86
		-- BfA: art:962

		-- The Heart of Azeroth
		[51211] = "The Heart of Azeroth|art:81:962 40+ 43028,52946|42.22 44.27|Magni Bronzebeard",
		[52428] = "Infusing the Heart|40+ 51211|43.2 44.49|Magni Bronzebeard|elsewhere link:1021",
	},

	-- Chamber of Heart
	[1021] = {
		-- The Heart of Azeroth
		[51211] = "The Heart of Azeroth|40+ 43028,52946|50.1 30.62|Magni Bronzebeard|elsewhere link:81",
		[52428] = "Infusing the Heart|40+ 51211|50.15 53.66|Magni Bronzebeard",
	},


	--[[ Dun Morohh ]]--

	-- Ironforge
	[87] = {
		-- Dun Morogh
		[6388]  = "Gryth Thurden|1+ dwarf,gnome,darkiron alliance 6391|51.54 26.32|Golnir Bouldertoe", -- Dwarf/Gnome/Dark Iron only
		[6392]  = "Return to Gremlock|1+ dwarf,gnome,darkiron alliance 6388|55.49 47.74|Gryth Thurden", -- Dwarf/Gnome/Dark Iron only
		[26118] = "Seize the Ambassador|1+ alliance 26112|39.77 57.28|Moira Thaurissan",

		-- Loch Modan
		[26131] = "Reinforcements for Loch Modan|5+ alliance -28567|41.43 52.29|Mountaineer Barleybrew", -- Exclusive with 28567 (Hero's Call: Loch Modan)

		-- Engineering
		[29477] = "Gnomish Engineering|20+ alliance engineering skill:engineering1:200 -spell:20219 -spell:20222|68.4 44.2|Springspindle Fizzlegear|engineering", -- Requires 200 skill in Classic Engineering
		[29475] = "Goblin Engineering|20+ alliance engineering skill:engineering1:200 -spell:20219 -spell:20222|68.4 44.2|Springspindle Fizzlegear|engineering", -- Requires 200 skill in Classic Engineering
	},

	-- Coldridge Valley
	[427] = {
		[24469] = "Hold the Line!|1+ alliance|67.14 41.3|Joren Ironstock",
		[24470] = "Give 'em What-For|1+ alliance 24469|67.14 41.3|Joren Ironstock",
		[24471] = "Aid for the Wounded|1+ alliance 24469|65.51 43.01|Sten Stoutarm",
		[24473] = "Lockdown in Anvilmar|1+ alliance 24470 24471|67.14 41.3|Joren Ironstock",
		[24474] = "First Things First: We're Gonna Need Some Beer|1+ alliance 24473|62.88 21.03|Jona Ironstock",
		[24475] = "All the Other Stuff|1+ alliance 24474|62.88 21.03|Jona Ironstock",
		[24477] = "Dwarven Artifacts|1+ alliance 24473|61.7 22.06|Grundel Harkin",
		[24486] = "Make Hay While the Sun Shines|1+ alliance 24477|61.7 22.06|Grundel Harkin",
		[24487] = "Whitebeard Needs Ye|1+ alliance 24475 24486|62.88 21.03|Jona Ironstock",
		[182]   = "The Troll Menace|1+ alliance 24487|42.72 62.21|Grelin Whitebeard",
		[24489] = "Trolling for Information|1+ alliance 24487|43.24 63.11|Apprentice Soren",
		[3361]  = "A Refugee's Quandary|1+ alliance 24487|41.92 63.43|Felix Whindlebolt",
		[218]   = "Ice and Fire|1+ alliance 182 24489 3361|42.72 62.21|Grelin Whitebeard",
		[24490] = "A Trip to Ironforge|1+ alliance 218|42.72 62.21|Grelin Whitebeard",
		[24491] = "Follow that Gyro-Copter!|1+ alliance 24490|87.51 44.47|Hands Springsprocket",
		[24492] = "Pack Your Bags|1+ alliance 24491|69.84 44|Milo Geartwinge",
		[24493] = "Don't Forget About Us|1+ alliance +24492 _24492|62.88 21.03|Jona Ironstock", -- Can only be obtained while on 24492
	},

	-- Gnomeregan, New Tinkertown
	[30] = {
		[27670] = "Pinned Down|1+ alliance gnome -deathknight|34.09 32.21|Nevin Twistwrench", -- Gnome only; not available for Death Knights
		[28167] = "Report to Carvo Blastbolt|1+ alliance gnome 27670|34.09 32.21|Nevin Twistwrench", -- Gnome only
		[27671] = "See to the Survivors|1+ alliance gnome 28167|50.96 31.93|Carvo Blastbolt", -- Gnome only
		[28169] = "Withdraw to the Loading Room!|1+ alliance gnome 27671|50.96 31.93|Carvo Blastbolt", -- Gnome only
		[27635] = "Decontamination|1+ alliance gnome 28169|53.08 82.33|Gaffer Coilspring", -- Gnome only
		[27674] = "To the Surface|1+ alliance gnome 27635|66.44 81.58|Technician Braggle", -- Gnome only
	},

	-- New Tinkertown
	[469] = {
		-- Gnomeregan
		[27670] = "Pinned Down|1+ alliance gnome -deathknight|25.76 31.96|Nevin Twistwrench|down link:30", -- Gnome only; not available for Death Knights
		[28167] = "Report to Carvo Blastbolt|1+ alliance gnome 27670|25.76 31.96|Nevin Twistwrench|down link:30", -- Gnome only
		[27671] = "See to the Survivors|1+ alliance gnome 28167|25.76 31.96|Carvo Blastbolt|down link:30", -- Gnome only
		[28169] = "Withdraw to the Loading Room!|1+ alliance gnome 27671|25.76 31.96|Carvo Blastbolt|down link:30", -- Gnome only
		[27635] = "Decontamination|1+ alliance gnome 28169|25.76 31.96|Gaffer Coilspring|down link:30", -- Gnome only
		[27674] = "To the Surface|1+ alliance gnome 27635|27.83 36.12|Technician Braggle|down link:30", -- Gnome only

		-- New Tinkertown
		[41217] = "The Future of Gnomeregan|1+ alliance gnome 27635 hunter|39.51 38.39|Nevin Twistwrench", -- Gnome Hunter only
		[26197] = "The Future of Gnomeregan|1+ alliance gnome 27635 mage|39.51 38.39|Nevin Twistwrench", -- Gnome Mage only
		[31135] = "The Future of Gnomeregan|1+ alliance gnome 27635 monk|39.51 38.39|Nevin Twistwrench", -- Gnome Monk only
		[26199] = "The Future of Gnomeregan|1+ alliance gnome 27635 priest|39.51 38.39|Nevin Twistwrench", -- Gnome Priest only
		[26206] = "The Future of Gnomeregan|1+ alliance gnome 27635 rogue|39.51 38.39|Nevin Twistwrench", -- Gnome Rogue only
		[26202] = "The Future of Gnomeregan|1+ alliance gnome 27635 warlock|39.51 38.39|Nevin Twistwrench", -- Gnome Warlock only
		[26203] = "The Future of Gnomeregan|1+ alliance gnome 27635 warrior|39.51 38.39|Nevin Twistwrench", -- Gnome Warrior only
		[41218] = "Meet the High Tinker|1+ alliance gnome 41217 hunter|41.93 31.64|Muffinus Chromebrew", -- Gnome Hunter only
		[26421] = "Meet the High Tinker|1+ alliance gnome 26197 mage|41.09 29.13|Bipsi Frostflinger", -- Gnome Mage only
		[31137] = "Meet the High Tinker|1+ alliance gnome 31135 monk|40.1 35.61|Xi, Friend to the Small", -- Gnome Monk only
		[26422] = "Meet the High Tinker|1+ alliance gnome 26199 priest|39.4 28.38|\"Doc\" Cogspin", -- Gnome Priest only
		[26423] = "Meet the High Tinker|1+ alliance gnome 26206 rogue|38.03 33.56|Kelsey Steelspark", -- Gnome Rogue only
		[26424] = "Meet the High Tinker|1+ alliance gnome 26202 warlock|37.68 37.97|Alamar Grimm", -- Gnome Warlock only
		[26425] = "Meet the High Tinker|1+ alliance gnome 26203 warrior|40.65 35.36|Drill Sergeant Steamcrank", -- Gnome Warrior only
		[26208] = "The Fight Continues|1+ alliance gnome 41218,26421,31137,26422,26423,26424,26425|38.79 32.73|High Tinker Mekkatorque", -- Gnome only
		[26566] = "A Triumph of Gnomish Ingenuity|1+ alliance gnome 26208|38.79 32.73|High Tinker Mekkatorque", -- Gnome only
		[26222] = "Scrounging for Parts|1+ alliance gnome 26566|40.58 28.02|Engineer Grindspark", -- Gnome only
		[26205] = "A Job for the Multi-Bot|1+ alliance gnome 26222|40.58 28.02|Engineer Grindspark", -- Gnome only
		[26264] = "What's Left Behind|1+ alliance gnome 26222|39.23 26.56|Tock Sprysprocket", -- Gnome only
		[26265] = "Dealing with the Fallout|1+ alliance gnome 26222|38.2 40.21|Corporal Fizzwhistle", -- Gnome only
		[26316] = "What's Keeping Kharmarn?|1+ alliance gnome 26205 26264 26265|38.38 33.48|Captain Tread Sparknozzle", -- Gnome only
		[26285] = "Get Me Explosives Back!|1+ alliance gnome 26316|37.29 65.2|Kharmarn Palegrip", -- Gnome only
		[26284] = "Missing in Action|1+ alliance gnome 26316|37.29 65.2|Kharmarn Palegrip", -- Gnome only
		[26318] = "Finishin' the Job|1+ alliance gnome 26285 26284|37.29 65.2|Kharmarn Palegrip", -- Gnome only
		[26329] = "One More Thing|1+ alliance gnome 26318|37.29 65.2|Kharmarn Palegrip", -- Gnome only
		[26331] = "Crushcog's Minions|1+ alliance gnome 26329|38.79 32.73|High Tinker Mekkatorque", -- Gnome only
		[26333] = "No Tanks!|1+ alliance gnome 26329|38.2 33.66|Hinkles Fastblast", -- Gnome only
		[26339] = {"Staging in Brewnall|1+ alliance gnome 26331 26333|38.03 33.56|Kelsey Steelspark", "Staging in Brewnall|1+ alliance gnome 26331 26333|41.93 31.64|Muffinus Chromebrew",}, -- Gnome only
		[26342] = "Paint it Black|1+ alliance gnome 26339|48.76 52.88|Jarvi Shadowstep", -- Gnome only
		[26364] = "Down with Crushcog!|1+ alliance gnome 26342|48.76 52.88|Jarvi Shadowstep", -- Gnome only
		[26373] = "On to Kharanos|1+ alliance gnome 26364|48.76 52.88|Jarvi Shadowstep", -- Gnome only

		-- Kharanos
		[26380] = "Bound for Kharanos|1+ alliance|81.78 55.37|Ciara Deepstone",
	},

	-- Dun Morogh
	[27] = {
		-- Coldridge Valley
		[24469] = "Hold the Line!|1+ alliance|36.87 70.05|Joren Ironstock|link:427",
		[24470] = "Give 'em What-For|1+ alliance 24469|36.87 70.05|Joren Ironstock|link:427",
		[24471] = "Aid for the Wounded|1+ alliance 24469|36.55 70.38|Sten Stoutarm|link:427",
		[24473] = "Lockdown in Anvilmar|1+ alliance 24470 24471|36.87 70.05|Joren Ironstock|link:427",
		[24474] = "First Things First: We're Gonna Need Some Beer|1+ alliance 24473|36.03 66.05|Jona Ironstock|link:427",
		[24475] = "All the Other Stuff|1+ alliance 24474|36.03 66.05|Jona Ironstock|link:427",
		[24477] = "Dwarven Artifacts|1+ alliance 24473|35.8 66.25|Grundel Harkin|link:427",
		[24486] = "Make Hay While the Sun Shines|1+ alliance 24477|35.8 66.25|Grundel Harkin|link:427",
		[24487] = "Whitebeard Needs Ye|1+ alliance 24475 24486|36.03 66.05|Jona Ironstock|link:427",
		[182]   = "The Troll Menace|1+ alliance 24487|32.06 74.17|Grelin Whitebeard|link:427",
		[24489] = "Trolling for Information|1+ alliance 24487|32.16 74.35|Apprentice Soren|link:427",
		[3361]  = "A Refugee's Quandary|1+ alliance 24487|31.9 74.41|Felix Whindlebolt|link:427",
		[218]   = "Ice and Fire|1+ alliance 182 24489 3361|32.06 74.17|Grelin Whitebeard|link:427",
		[24490] = "A Trip to Ironforge|1+ alliance 218|32.06 74.17|Grelin Whitebeard|link:427",
		[24491] = "Follow that Gyro-Copter!|1+ alliance 24490|40.88 70.67|Hands Springsprocket|link:427",
		[24492] = "Pack Your Bags|1+ alliance 24491|37.4 70.58|Milo Geartwinge|link:427",
		[24493] = "Don't Forget About Us|1+ alliance +24492 _24492|36.03 66.05|Jona Ironstock|link:427", -- Can only be obtained while on 24492

		-- Gnomeregan
		[27670] = "Pinned Down|1+ alliance gnome -deathknight|25.76 31.96|Nevin Twistwrench|down link:30", -- Gnome only; not available for Death Knights
		[28167] = "Report to Carvo Blastbolt|1+ alliance gnome 27670|25.76 31.96|Nevin Twistwrench|down link:30", -- Gnome only
		[27671] = "See to the Survivors|1+ alliance gnome 28167|27.73 31.92|Carvo Blastbolt|down link:30", -- Gnome only
		[28169] = "Withdraw to the Loading Room!|1+ alliance gnome 27671|27.73 31.92|Carvo Blastbolt|down link:30", -- Gnome only
		[27635] = "Decontamination|1+ alliance gnome 28169|27.97 37.79|Gaffer Coilspring|down link:30", -- Gnome only
		[27674] = "To the Surface|1+ alliance gnome 27635|29.53 37.7|Technician Braggle|down link:30", -- Gnome only

		-- New Tinkertown
		[41217] = "The Future of Gnomeregan|1+ alliance gnome 27635 hunter|33.93 38.57|Nevin Twistwrench|link:469", -- Gnome Hunter only
		[26197] = "The Future of Gnomeregan|1+ alliance gnome 27635 mage|33.93 38.57|Nevin Twistwrench|link:469", -- Gnome Mage only
		[31135] = "The Future of Gnomeregan|1+ alliance gnome 27635 monk|33.93 38.57|Nevin Twistwrench|link:469", -- Gnome Monk only
		[26199] = "The Future of Gnomeregan|1+ alliance gnome 27635 priest|33.93 38.57|Nevin Twistwrench|link:469", -- Gnome Priest only
		[26206] = "The Future of Gnomeregan|1+ alliance gnome 27635 rogue|33.93 38.57|Nevin Twistwrench|link:469", -- Gnome Rogue only
		[26202] = "The Future of Gnomeregan|1+ alliance gnome 27635 warlock|33.93 38.57|Nevin Twistwrench|link:469", -- Gnome Warlock only
		[26203] = "The Future of Gnomeregan|1+ alliance gnome 27635 warrior|33.93 38.57|Nevin Twistwrench|link:469", -- Gnome Warrior only
		[41218] = "Meet the High Tinker|1+ alliance gnome 41217 hunter|34.85 36.01|Muffinus Chromebrew|link:469", -- Gnome Hunter only
		[26421] = "Meet the High Tinker|1+ alliance gnome 26197 mage|34.53 35.06|Bipsi Frostflinger|link:469", -- Gnome Mage only
		[31137] = "Meet the High Tinker|1+ alliance gnome 31135 monk|34.16 37.51|Xi, Friend to the Small|link:469", -- Gnome Monk only
		[26422] = "Meet the High Tinker|1+ alliance gnome 26199 priest|33.89 34.78|\"Doc\" Cogspin|link:469", -- Gnome Priest only
		[26423] = "Meet the High Tinker|1+ alliance gnome 26206 rogue|33.38 36.74|Kelsey Steelspark|link:469", -- Gnome Rogue only
		[26424] = "Meet the High Tinker|1+ alliance gnome 26202 warlock|33.24 38.4|Alamar Grimm|link:469", -- Gnome Warlock only
		[26425] = "Meet the High Tinker|1+ alliance gnome 26203 warrior|34.37 37.42|Drill Sergeant Steamcrank|link:469", -- Gnome Warrior only
		[26208] = "The Fight Continues|1+ alliance gnome 41218,26421,31137,26422,26423,26424,26425|33.67 36.42|High Tinker Mekkatorque|link:469", -- Gnome only
		[26566] = "A Triumph of Gnomish Ingenuity|1+ alliance gnome 26208|33.67 36.42|High Tinker Mekkatorque|link:469", -- Gnome only
		[26222] = "Scrounging for Parts|1+ alliance gnome 26566|34.34 34.65|Engineer Grindspark|link:469", -- Gnome only
		[26205] = "A Job for the Multi-Bot|1+ alliance gnome 26222|34.34 34.65|Engineer Grindspark|link:469", -- Gnome only
		[26264] = "What's Left Behind|1+ alliance gnome 26222|33.83 34.09|Tock Sprysprocket|link:469", -- Gnome only
		[26265] = "Dealing with the Fallout|1+ alliance gnome 26222|33.44 39.25|Corporal Fizzwhistle|link:469", -- Gnome only
		[26316] = "What's Keeping Kharmarn?|1+ alliance gnome 26205 26264 26265|33.51 36.71|Captain Tread Sparknozzle|link:469", -- Gnome only
		[26285] = "Get Me Explosives Back!|1+ alliance gnome 26316|33.1 48.69|Kharmarn Palegrip|link:469", -- Gnome only
		[26284] = "Missing in Action|1+ alliance gnome 26316|33.1 48.69|Kharmarn Palegrip|link:469", -- Gnome only
		[26318] = "Finishin' the Job|1+ alliance gnome 26285 26284|33.1 48.69|Kharmarn Palegrip|link:469", -- Gnome only
		[26329] = "One More Thing|1+ alliance gnome 26318|33.1 48.69|Kharmarn Palegrip|link:469", -- Gnome only
		[26331] = "Crushcog's Minions|1+ alliance gnome 26329|33.67 36.42|High Tinker Mekkatorque|link:469", -- Gnome only
		[26333] = "No Tanks!|1+ alliance gnome 26329|33.44 36.78|Hinkles Fastblast|link:469", -- Gnome only
		[26339] = "Staging in Brewnall|1+ alliance gnome 26331 26333|33.38 36.74|Kelsey Steelspark|link:469", -- Gnome only
		[26342] = "Paint it Black|1+ alliance gnome 26339|37.43 44.04|Jarvi Shadowstep|link:469", -- Gnome only
		[26364] = "Down with Crushcog!|1+ alliance gnome 26342|37.43 44.04|Jarvi Shadowstep|link:469", -- Gnome only
		[26373] = "On to Kharanos|1+ alliance gnome 26364|37.43 44.04|Jarvi Shadowstep|link:469", -- Gnome only

		-- Kharanos
		[26380] = "Bound for Kharanos|1+ alliance|49.9 44.98|Ciara Deepstone",
		[6387]  = "Honor Students|1+ dwarf,gnome,darkiron alliance|54.78 50.63|Gremlock Pilsnor", -- Dwarf/Gnome/Dark Iron only
		[6391]  = "Ride to Ironforge|1+ dwarf,gnome,darkiron alliance 6387|53.8 52.76|Brolan Galebeard", -- Dwarf/Gnome/Dark Iron only
		[384]   = "Beer Basted Boar Ribs|1+ alliance|53.93 50.69|Ragnar Thunderbrew|cooking",
		[315]   = "The Perfect Stout|1+ alliance|54.2 51.17|Rejold Barleybrew",
		[25724] = "Frostmane Aggression|1+ alliance ~26373|53.71 52.19|Captain Tharran",
		[25668] = "Pilfered Supplies|1+ alliance 25724|53.71 52.1|Quartermaster Glynna",
		[25667] = "Culling the Wendigos|1+ alliance 25724|53.71 52.19|Captain Tharran",
		[313]   = "Forced to Watch from Afar|1+ alliance 25724|53.71 52.19|Captain Tharran",
		[25792] = "Pushing Forward|1+ alliance 25667 313|53.71 52.19|Captain Tharran",
		[412]   = "Operation Recombobulation|1+ alliance 25667 313|53.27 51.9|Razzle Sprysprocket",
		[25838] = "Help from Steelgrill's Depot|1+ alliance 25792 412|53.71 52.19|Captain Tharran",
		[25839] = "The Ultrasafe Personnel Launcher|1+ alliance 25838|56.82 47.1|Delber Cranktoggle",

		-- Frostmane Retreat
		[28868] = "The View from Down Here|1+ alliance 25839|62.55 53.81|Snevik the Blade",
		[25840] = "Eliminate the Resistance|1+ alliance 25839|62.5 53.71|Slamp Wobblecog",
		[25841] = "Strike From Above|1+ alliance 25839|62.5 53.71|Slamp Wobblecog",
		[25882] = "A Hand at the Ranch|1+ alliance 25840 25841 -25932|62.5 53.71|Slamp Wobblecog", -- Breadcrumb for 25932

		-- Amberstill Ranch
		[25932] = "It's Raid Night Every Night|1+ alliance ~25882|70.41 48.92|Sergeant Flinthammer", -- Invalidates breadcrumb 25882
		[25905] = "Rams on the Lam|1+ alliance 25932|70.66 48.87|Veron Amberstill",
		[314]   = "Protecting the Herd|1+ alliance 25932|70.28 48.16|Rudra Amberstill",
		[25933] = "Help for the Quarry|1+ alliance 25905 314|70.41 48.92|Sergeant Flinthammer",

		-- Gol'Bolar Quarry
		[432]   = "Those Blasted Troggs!|1+ alliance|75.31 54.67|Foreman Stonebrow",
		[433]   = "The Public Servant|1+ alliance|75.9 54.31|Senator Mehr Stonehallow|weekly", -- Weekly quest
		[25937] = "Priceless Treasures|1+ alliance|76.19 53.04|Prospector Drugan",
		[25986] = "Trouble at the Lake|1+ alliance 433 -25978|75.9 54.31|Senator Mehr Stonehallow", -- Breadcrumb for 25978 -- check if 432 and/or 25937 are prereqs

		-- Bahrum's Post
		[25978] = "Entombed in Ice|1+ alliance ~25986|82.85 48.41|Sergeant Bahrum", -- Invalidates breadcrumb 25986
		[25979] = "Dealing with the Surge|1+ alliance|82.64 48.3|Khurgorn Singefeather",
		[25997] = "Dark Iron Scheming|1+ alliance 25978 25979|82.85 48.41|Sergeant Bahrum",
		[25998] = "Get to the Airfield|1+ alliance 25997|82.85 48.41|Sergeant Bahrum",

		-- Ironforge Airfield
		[26078] = "Extinguish the Fires|1+ alliance 25998|78.25 20.51|Commander Stonebreaker||\"You can use Mathel's Flying Machine in Gol'Bolar Quarry if you need to get back to the Airfield.\"",
		[26085] = "Rallying the Defenders|1+ alliance 26078|78.25 20.51|Commander Stonebreaker||\"You can use Mathel's Flying Machine in Gol'Bolar Quarry if you need to get back to the Airfield.\"",
		[26094] = "Striking Back|1+ alliance 26085|78.25 20.51|Commander Stonebreaker||\"You can use Mathel's Flying Machine in Gol'Bolar Quarry if you need to get back to the Airfield.\"",
		[26102] = "Grimaxe's Demise|1+ alliance 26094|78.25 20.51|Commander Stonebreaker||\"You can use Mathel's Flying Machine in Gol'Bolar Quarry if you need to get back to the Airfield.\"",
		[26112] = "Demanding Answers|1+ alliance 26102|78.25 20.51|Commander Stonebreaker||\"You can use Mathel's Flying Machine in Gol'Bolar Quarry if you need to get back to the Airfield.\"",

		-- South Gate Outpost
		[26854] = "The Lost Pilot|5+ alliance|92.23 48.55|Pilot Hammerfoot",
		[26855] = "A Pilot's Revenge|5+ alliance 26854|87.64 50.14|A Dwarven Corpse",
		[13635] = "South Gate Status Report|5+ alliance 26855|92.23 48.55|Pilot Hammerfoot",
	},


	--[[ Loch Modan ]]--

	[48] = {
		-- South Gate Outpost
		[26854] = "The Lost Pilot|5+ alliance|14 56.49|Pilot Hammerfoot",
		[26855] = "A Pilot's Revenge|5+ alliance 26854|5.84 59.31|A Dwarven Corpse|link:27",
		[13635] = "South Gate Status Report|5+ alliance 26855|14 56.49|Pilot Hammerfoot",

		-- Valley of Kings
		[26146] = "In Defense of the King's Lands|5+ alliance|23.38 75.04|Captain Rugelfuss",
		[26145] = "The Trogg Threat|5+ alliance ~13635|23.33 74.92|Mountaineer Cobbleflint", -- Maybe requires 13635?
		[26147] = "Bigger and Uglier|5+ alliance 26146|23.3 75.05|Mountaineer Wallbang",
		[26148] = "A Decisive Strike|5+ alliance 26146|23.38 75.04|Captain Rugelfuss",
		[26176] = "Onward to Thelsamar|5+ alliance 26148 -26842|23.38 75.04|Captain Rugelfuss", -- Breadcrumb for 26842

		-- Thelsamar
		[26842] = "Out of Gnoll-where|5+ alliance ~26176|35.06 46.59|Mountaineer Kadrell", -- Invalidates 26176
		[13636] = "Stormpike's Orders|5+ alliance -26843|35.06 46.59|Mountaineer Kadrell", -- Breadcrumb for 26843
		[25118] = "Looking for Lurkers|5+ alliance|35.43 42.82|Dakk Blunderblast",
		[26860] = "Thelsamar Blood Sausages|5+ alliance|34.83 49.28|Vidra Hearthstove|cooking",
		[13648] = "WANTED: The Dark Iron Spy|5+ alliance|37.3 46.52|Wanted!",

		-- Algaz Station
		[26843] = "A Tiny, Clever Commander|5+ alliance ~13636|25.45 17.96|Mountaineer Stormpike", -- Invalidates breadcrumb 13636
		[26844] = "Kobold and Kobolder|5+ alliance 26843|25.45 17.96|Mountaineer Stormpike",
		[26845] = "Who's In Charge Here?|5+ alliance 26844|25.45 17.96|Mountaineer Stormpike",
		[26863] = "Filthy Paws|5+ alliance 26844|25.45 17.96|Mountaineer Stormpike",
		[26846] = "A Nasty Exploit|5+ alliance 26844|25.4 17.79|Scout Dorli",
		[26864] = "The Bearer of Gnoll-edge|5+ alliance 26845|25.45 17.96|Mountaineer Stormpike",
		[26137] = "Checking on the Boys|10+ alliance ~28565 -25395|25.45 17.96|Mountaineer Stormpike", -- Breadcrumb for 25395

		-- The Axis of Awful
		[26927] = "Suddenly, Murlocs!|5+ alliance 26864|35.06 46.59|Mountaineer Kadrell",
		[26928] = "Smells Like A Plan|5+ alliance 26927|34.79 49.12|Cannary Caskshot",
		[26929] = "A Load of Croc|5+ alliance 26927|34.79 49.12|Cannary Caskshot",
		[26932] = "Buzz Off|5+ alliance 26927|35.06 46.59|Mountaineer Kadrell",
		[26868] = "Axis of Awful|5+ alliance 26928|34.79 49.12|Cannary Caskshot",

		-- Ironband's Excavation
		[13639] = "Resupplying the Excavation|5+ alliance 26868|37.24 47.38|Jern Hornhelm",
		[309]   = "Protecting the Shipment|5+ alliance 13639|56.36 65.98|Huldar",
		[13650] = "Keep Your Hands Off The Goods!|5+ alliance 309|65.34 65.98|Prospector Ironband",
		[26961] = "Gathering Idols|5+ alliance|64.89 66.66|Magmar Fellhew",
		[13647] = "Joining the Hunt|5+ alliance 13650 26961|64.89 66.66|Magmar Fellhew",

		-- Farstrider Lodge
		[27025] = "Thistle While You Work|5+ alliance|82.79 63.46|Safety Warden Pipsy",
		[27026] = "Defcon: Bobcat|5+ alliance 27025|82.79 63.46|Safety Warden Pipsy",
		[27016] = "The Joy of Boar Hunting|5+ alliance|83.48 65.38|Daryl the Youngling",
		[27036] = "Vyrin's Revenge|5+ alliance 27016|81.91 64.61|Vyrin Swiftwind",
		[27037] = "Vyrin's Revenge|5+ alliance 27036|83.48 65.38|Daryl the Youngling",
		[27028] = "Hornet Hunting|5+ alliance|81.75 61.66|Marek Ironheart",
		[27030] = "Foxtails By The Handful|5+ alliance|81.75 61.66|Marek Ironheart",
		[27031] = "Wing Nut|5+ alliance|81.64 64.76|Bingles Blastenheimer",
		[27032] = "Bird is the Word|5+ alliance 27031|81.64 64.76|Bingles Blastenheimer",
		[27033] = "Skystrider's Heart|5+ alliance 27032|78.58 76.22|Rusted Skystrider|down|\"Inside Ironwing Cavern\"",
		[27034] = "He's That Age|5+ alliance 27033|81.64 64.76|Bingles Blastenheimer",

		-- Twilight Threats
		[27035] = "Standing Up|5+ alliance 27034|58.51 29.1|Ando Blastenheimer",
		[27074] = "Fight the Hammer|5+ alliance 27035|58.51 29.1|Ando Blastenheimer",
		[27075] = "Servants of Cho'gall|5+ alliance 27074|64.12 26.61|Ashlan Stonesmirk",
		[27077] = "Clutching at Chaos|5+ alliance 27074|64.12 26.61|Ashlan Stonesmirk",
		[27078] = "Gor'kresh|5+ alliance 27075 27077|64.12 26.61|Ashlan Stonesmirk",
		[27115] = "Ando's Call|5+ alliance 27078|64.12 26.61|Ashlan Stonesmirk",
		[27116] = "The Winds of Loch Modan|5+ alliance 27115|58.51 29.1|Ando Blastenheimer",

		-- Explorer's League Documents
		[13656] = "Explorers' League Document (1 of 6)|5+ alliance|36.75 61.11|Stolen Explorers' League Document",
		[13655] = "Explorers' League Document (2 of 6)|5+ alliance|41.37 38.98|Stolen Explorers' League Document",
		[13657] = "Explorers' League Document (3 of 6)|5+ alliance|61.71 73.17|Stolen Explorers' League Document",
		[13658] = "Explorers' League Document (4 of 6)|5+ alliance|68.11 66.14|Stolen Explorers' League Document",
		[13660] = "Explorers' League Document (5 of 6)|5+ alliance|53.7 38.11|Stolen Explorers' League Document",
		[13659] = "Explorers' League Document (6 of 6)|5+ alliance|73.17 35.86|Stolen Explorers' League Document",
		[13661] = "Heartfelt Appreciation|5+ alliance 13656 13655 13657 13658 13660 13659|37.27 47.76|Torren Squarejaw",
	},


	--[[ Wetlands ]]--

	[56] = {
		-- Dun Algaz
		[25395] = "The Stolen Keg|10+ alliance ~26137 ~28565|49.95 79.16|Mountaineer Rharen", -- Invalidates breadcrumbs 26137 and 28565
		[25211] = "Cleaning Hovel|10+ alliance|49.91 79.24|Mountaineer Grugelm",
		[25770] = "Keg Run|10+ alliance 25395 -25721|49.95 79.16|Mountaineer Rharen", -- Breadcrumb for 25721

		-- Slabchisel's Survey
		[25721] = "Fight the Flood|10+ alliance ~25770|57.51 71.76|Forba Slabchisel", -- Invalidates 25770
		[25722] = "Sedimentary, My Dear|10+ alliance|57.47 71.43|Surveyor Thurdan",
		[25723] = "Thresh Out of Luck|10+ alliance|57.84 71.49|Dunlor Marblebeard",
	},


	--[[ Elwynn Forest ]]--

	-- Stormwind City
	[84] = {
		[332]   = "Wine Shop Advert|1+ alliance|63.77 73.59|Renato Gallina",
		[333]   = "Harlan Needs a Resupply|1+ alliance|62.32 67.94|Harlan Bagley",
		[334]   = "Package for Thurman|1+ alliance|58.09 67.49|Rema Schneider",
		--[66390] = "Missing Merchandise|1+ alliance|51.53 70.41|Onnesa", -- Removed in 10.0.5
		--[66420] = "Happy Hour|1+ alliance 66390|51.53 70.41|Onnesa", -- Removed in 10.0.5
		[29412] = "Blown Away|10+ alliance|58.89 52.74|Vin",

		-- Elwynn Forest
		[26395] = "Dungar Longdrink|1+ alliance human,kultiran 26394|77.17 60.99|Osric Strang", -- Human/Kul Tiran only
		[26396] = "Return to Argus|1+ alliance human,kultiran 26395|70.94 72.47|Dungar Longdrink", -- Human/Kul Tiran only

		-- Westfall
		[26370] = "Return to Sentinel Hill|5+ alliance 26322|85.86 32.79|Grand Admiral Jes-Tereth",

		-- Redridge Mountains
		[26365] = "Hero's Call: Redridge Mountains!|7+ alliance -28563 -26503|85.86 32.79|Grand Admiral Jes-Tereth", -- Breadcrumb for 26503; mutually exclusive with 28563

		-- Loch Modan
		[353]   = "Stormpike's Delivery|1+ alliance ~1097|59.72 33.8|Grimand Elmore", -- Invalidates breadcrumb 1097

		-- Hillsbrad Foothills
		[543]   = "The Perenolde Tiara|7+ alliance|81.55 34.07|Count Remington Ridgewell",

		-- Mists of Pandaria
		[29547] = "The King's Command|10+ alliance|85.86 32.79|Grand Admiral Jes-Tereth",
		[29548] = "The Mission|10+ alliance 29547|78.8 39.9|Rell Nightwind",

		-- Legion
		[40519] = {
			"Legion: The Legion Returns|10+ alliance -demonhunter -44663 -44184|62.87 71.47|Hero's Call Board",
			"Legion: The Legion Returns|10+ alliance -demonhunter -44663 -44184|62.23 29.86|Hero's Call Board",
		},
		[42782] = "To Be Prepared|10+ alliance -demonhunter -44663 -44184 40519|37.08 43.1|Recruiter Lee",

		-- Stormheim - Greymane's Gambit
		[38206] = "Making the Rounds|10+ 38035 alliance|18.92 42.78|Sky Admiral Rogers",
		[39800] = "Greymane's Gambit|10+ 38206 alliance|18.66 51.1|Genn Greymane",

		-- Battle for Azeroth - A Nation Divided
		[46727] = { -- 58983 is the Exile's Reach version - 56775 won't show for Exile's Reach players
			"Tides of War|10+ alliance -58983 -56775|62.82 71.75|Hero's Herald",
			"Tides of War|10+ alliance -58983 -56775|62.17 30.14|Hero's Herald",
		},
		[46728] = "The Nation of Kul Tiras|10+ alliance 46727 -59641 -56775|80.26 33.13|Anduin Wrynn", -- 59641 is Exile's Reach version

		-- Dragon Isles - The Dragonscale Expedition
		[65436] = "The Dragon Isles Await|10+ alliance -70197|79.8 27.02|Wrathion|campaign",
		[66577] = "Aspectral Invitation|10+ alliance 65436 -70197|79.8 27.02|Wrathion|campaign",
		[66589] = "Expeditionary Coordination|10+ alliance 66577 -70197|79.72 27.32|Toddy Whiskers|campaign",
		[72240] = "The Obsidian Warders|10+ alliance 66577 -70197|79.75 27.97|Scalecommander Azurathel|campaign",
		[66596] = "Whispers on the Winds|10+ alliance 66589 72240 -70197|23.01 56.15|Archmage Khadgar|campaign",
		[67700] = "To the Dragon Isles!|10+ alliance 66596,70197 ~70197|22.72 55.66|Toddy Whiskers|campaign",

		-- Engineering
		[29477] = "Gnomish Engineering|20+ alliance engineering skill:engineering1:200 -spell:20219 -spell:20222|62.85 31.96|Lilliam Sparkspindle|engineering", -- Requires 200 skill in Classic Engineering
		[29475] = "Goblin Engineering|20+ alliance engineering skill:engineering1:200 -spell:20219 -spell:20222|62.85 31.96|Lilliam Sparkspindle|engineering", -- Requires 200 skill in Classic Engineering
	},

	-- Northshire
	[425] = {
		-- The early Northshire quests all have 9 versions of the same quest
		-- Completing one version will also autocomplete the other 8 for the character, so there is no need to check which exact quest we can pick up
		-- All currently available Alliance races except Mechagnomes seem to be able to do these quests as of 9.2.7
		[29078] = "Beating Them Back!|1+ alliance -mechagnome -28757 -28767 -28766 -28764 -31139 -28765 -28762 -28763|33.56 53.05|Marshal McBride", -- 9 quests
		[29079] = "Lions for Lambs|1+ alliance 28757,29078,28767,28766,28764,31139,28765,28762,28763 -28759 -28772 -28769 -28771 -28773 -31140 -28770 -28774|33.56 53.05|Marshal McBride", -- 9 quests
		[29080] = "Join the Battle!|1+ alliance 28759,28769,31140,28770,28771,28772,28773,28774,29079 -28780 -28784 -31143 -28785 -28786 -28787 -28788 -28789|33.56 53.05|Marshal McBride", -- 9 quests
		[29081] = "They Sent Assassins|1+ alliance 29080,28780,28784,31143,28785,28786,28787,28788,28789 -31144 -28791 -28795 -28792 -28794 -28793 -28797 -28796|35.73 39.8|Sergeant Willem", -- 9 quests
		[28809] = "Fear No Evil|1+ alliance 29080,28780,28784,31143,28785,28786,28787,28788,28789 -28811 -28810 -63447 -29082 -28808 -28812 -28813 -28806|34.99 38.29|Brother Paxton", -- 9 quests
		[28817] = "The Rear is Clear|1+ alliance 29081,31144,28791,28795,28792,28794,28793,28797,28796 28809,28811,28810,63447,29082,28808,28812,28813,28806 -28823 -28821 -31145 -29083 -28820 -28819 -28822 -28818|35.73 39.8|Sergeant Willem", -- 9 quests
		[26389] = "Blackrock Invasion|1+ alliance 28817,28823,28821,31145,29083,28820,28819,28822,28818|33.56 53.05|Marshal McBride",
		[26391] = "Extinguishing Hope|1+ alliance 28817,28823,28821,31145,29083,28820,28819,28822,28818|33.39 54.66|Milly Osworth",
		[26390] = "Ending the Invasion!|1+ alliance 26389|33.56 53.05|Marshal McBride",
		[54]    = "Report to Goldshire|1+ alliance 26390|33.56 53.05|Marshal McBride",

		-- Goldshire
		[37112] = "Rest and Relaxation|1+ alliance|23.42 77.83|Falkhaan Isenstrider",
	},

	-- Elwynn Forest
	[37] = {
		-- Northshire
		[29078] = "Beating Them Back!|1+ alliance -mechagnome -28757 -28767 -28766 -28764 -31139 -28765 -28762 -28763|48.2 42.08|Marshal McBride|link:425", -- 9 quests
		[29079] = "Lions for Lambs|1+ alliance 28757,29078,28767,28766,28764,31139,28765,28762,28763 -28759 -28772 -28769 -28771 -28773 -31140 -28770 -28774|48.2 42.08|Marshal McBride|link:425", -- 9 quests
		[29080] = "Join the Battle!|1+ alliance 28759,28769,31140,28770,28771,28772,28773,28774,29079 -28780 -28784 -31143 -28785 -28786 -28787 -28788 -28789|48.2 42.08|Marshal McBride|link:425", -- 9 quests
		[29081] = "They Sent Assassins|1+ alliance 29080,28780,28784,31143,28785,28786,28787,28788,28789 -31144 -28791 -28795 -28792 -28794 -28793 -28797 -28796|48.81 38.38|Sergeant Willem|link:425", -- 9 quests
		[28809] = "Fear No Evil|1+ alliance 29080,28780,28784,31143,28785,28786,28787,28788,28789 -28811 -28810 -63447 -29082 -28808 -28812 -28813 -28806|48.6 37.96|Brother Paxton|link:425", -- 9 quests
		[28817] = "The Rear is Clear|1+ alliance 29081,31144,28791,28795,28792,28794,28793,28797,28796 28809,28811,28810,63447,29082,28808,28812,28813,28806 -28823 -28821 -31145 -29083 -28820 -28819 -28822 -28818|48.81 38.38|Sergeant Willem|link:425", -- 9 quests
		[26389] = "Blackrock Invasion|1+ alliance 28817,28823,28821,31145,29083,28820,28819,28822,28818|48.2 42.08|Marshal McBride|link:425",
		[26391] = "Extinguishing Hope|1+ alliance 28817,28823,28821,31145,29083,28820,28819,28822,28818|48.15 42.52|Milly Osworth|link:425",
		[26390] = "Ending the Invasion!|1+ alliance 26389|48.2 42.08|Marshal McBride|link:425",
		[54]    = "Report to Goldshire|1+ alliance 26390|48.2 42.08|Marshal McBride|link:425",

		-- Goldshire
		[37112] = "Rest and Relaxation|1+ alliance|45.37 48.99|Falkhaan Isenstrider",
		[1097]  = "Elmore's Task|1+ alliance -353|41.71 65.54|Smith Argus", -- Breadcrumb for 353
		[26393] = "A Swift Message|1+ alliance human,kultiran|41.71 65.54|Smith Argus", -- Human/Kul Tiran only
		[26394] = {"Continue to Stormwind|1+ alliance human,kultiran 26393|41.72 64.63|Bartlett the Brave", "Continue to Stormwind|1+ alliance human,kultiran 26393|81.83 66.55|Goss the Swift",}, -- Human/Kul Tiran only
		[40]    = "A Fishy Peril|1+ alliance|42.14 67.25|Remy \"Two Times\"",
		[35]    = "Further Concerns|1+ alliance 40|42.11 65.93|Marshal Dughan",
		[47]    = "Gold Dust Exchange|1+ alliance|42.14 67.25|Remy \"Two Times\"",
		[62]    = "The Fargodeep Mine|1+ alliance ~54|42.11 65.93|Marshal Dughan",
		[76]    = "The Jasperlode Mine|1+ alliance 62|42.11 65.93|Marshal Dughan",
		[60]    = "Kobold Candles|1+ alliance|43.32 65.71|William Pestle",
		[26150] = "A Visit With Maybell|1+ alliance 60 -106|43.32 65.71|William Pestle", -- Breadcrumb for 106
		[239]   = "Westbrook Garrison Needs Help!|1+ alliance 59 -11|42.11 65.93|Marshal Dughan", -- Breadcrumb for 11

		-- Stonefield Farm and Maclure Vineyards
		[88]    = "Princess Must Die!|1+ alliance|34.66 84.48|Ma Stonefield",
		[85]    = "Lost Necklace|1+ alliance|34.49 84.25|\"Auntie\" Bernice Stonefield",
		[86]    = "Pie for Billy|1+ alliance 85|43.13 85.72|Billy Maclure",
		[84]    = "Back to Billy|1+ alliance 86|34.49 84.25|\"Auntie\" Bernice Stonefield",
		[87]    = "Goldtooth|1+ alliance 84|43.13 85.72|Billy Maclure",
		[106]   = "Young Lovers|1+ alliance ~26150|43.15 89.62|Maybell Maclure", -- Invalidates breadcrumb 26150
		[111]   = "Speak with Gramma|1+ alliance 106|29.84 86|Tommy Joe Stonefield",
		[107]   = "Note to William|1+ alliance 111|34.94 83.86|Gramma Stonefield",
		[112]   = "Collecting Kelp|1+ alliance 107|43.32 65.71|William Pestle",
		[114]   = "The Escape|1+ alliance 112|43.32 65.71|William Pestle",

		-- Eastvale Logging Camp
		[37]    = "Find the Lost Guards|1+ alliance 35|73.97 72.19|Guard Thomas",
		[45]    = "Discover Rolf's Fate|1+ alliance 37|72.66 60.33|A half-eaten body",
		[71]    = "Report to Thomas|1+ alliance 45|79.8 55.51|Rolf's corpse",
		[59]    = "Cloth and Leather Armor|1+ alliance 71|73.97 72.19|Guard Thomas",
		[52]    = "Protect the Frontier|1+ alliance|73.97 72.19|Guard Thomas",
		[46]    = "Bounty on Murlocs|1+ alliance|74.03 72.31|Bounty Board",
		[26152] = "WANTED: James Clark|1+ alliance|74.03 72.31|Bounty Board",
		[123]   = "The Collector|1+ alliance|78.62 67.18|{134939} [Gold Pickup Schedule]||Drops from [neutral]James Clark]",
		[147]   = "Manhunt|1+ alliance 123|81.86 66.04|Marshal Patterson",
		[83]    = "Fine Linen Goods|1+ alliance|79.46 68.71|Sara Timberlain",
		[5545]  = "A Bundle of Trouble|1+ alliance|81.38 66.11|Supervisor Raelen",

		-- Westbrook Garrison
		[176]   = {"WANTED: \"Hogger\"|1+ alliance|24.57 78.23|Wanted Poster", "WANTED: \"Hogger\"|1+ alliance|24.55 74.67|Wanted Poster",},
		[11]    = "Riverpaw Gnoll Bounty|1+ alliance ~239|24.23 74.45|Deputy Rainer", -- Invalidates breadcrumb 239

		-- Westfall
		[184]   = "Furlbrow's Deed|5+ alliance|24.78 95.26|Westfall Deed",
		[26378] = { -- Breadcrumb for 26209; 28562 is the Hero's Call Board version
			"Hero's Call: Westfall|5+ alliance -28562 -26209|24.23 74.45|Deputy Rainer",
			"Hero's Call: Westfall|5+ alliance -28562 -26209|42.11 65.93|Marshal Dughan",
			"Hero's Call: Westfall|5+ alliance -28562 -26209|73.97 72.19|Guard Thomas",
			"Hero's Call: Westfall|5+ alliance -28562 -26209|81.86 66.04|Marshal Patterson",
			"Hero's Call: Westfall|5+ alliance -28562 -26209|84.61 69.38|Marshal Haggard",
		},
	},


	--[[ Westfall ]]--

	[52] = {
		-- The Jansen Stead
		[26209] = "Murder Was The Case That They Gave Me|5+ alliance ~26378 ~28562|60.05 19.28|Lieutenant Horatio Laine", -- Invalidates breadcrumbs 26378 and 28562
		[26213] = "Hot On the Trail: The Riverpaw Clan|5+ alliance 26209|60.05 19.28|Lieutenant Horatio Laine",
		[26214] = "Hot On the Trail: Murlocs|5+ alliance 26209|60.05 19.28|Lieutenant Horatio Laine",
		[26215] = "Meet Two-Shoed Lou|5+ alliance 26213 26214|60.05 19.28|Lieutenant Horatio Laine",

		-- Furlbrow's Pumpkin Farm
		[26228] = "Livin' the Life|5+ alliance 26215|49.66 19.39|Two-Shoed Lou",
		[26229] = "\"I TAKE Candle!\"|5+ alliance 26215|49.59 19.61|Jimb \"Candles\" McHannigan",
		[26230] = "Feast or Famine|5+ alliance 26215|49.54 19.14|Mama Celeste",
		[26232] = "Lou's Parting Thoughts|5+ alliance 26228|49.66 19.39|Two-Shoed Lou",
		[26236] = "Shakedown at the Saldean's|5+ alliance 26232|49.66 19.39|Two-Shoed Lou",

		-- Saldean's Farm
		[26237] = "Times are Tough|5+ alliance 26236|56.04 31.23|Farmer Saldean",
		[26252] = "Heart of the Watcher|5+ alliance 26236|54.12 32.43|{133862} [Harvest Watcher Heart]||Has a chance to drop from [hostile]Harvest Watcher]",
		[26257] = "It's Alive!|5+ alliance 26252|56.04 31.23|Farmer Saldean",
		[26241] = "Westfall Stew|5+ alliance 26236|56.42 30.52|Salma Saldean",
		[26270] = "You Have Our Thanks|5+ alliance 26237 26241|56.04 31.23|Farmer Saldean",
		[26266] = "Hope for the People|5+ alliance 26270|56.42 30.52|Salma Saldean",

		-- Sentinel Hill
		[26371] = { -- Breadcrumb for 26348
			"The Legend of Captain Grayson|5+ alliance -26322 -26348|56.39 47.35|Scout Galiaan", 
			"The Legend of Captain Grayson|5+ alliance 26322 -26348|56.3 49.52|Scout Galiaan", -- Galiaan moves after completing 26322
		},
		[26271] = "Feeding the Hungry and the Hopeless|5+ alliance 26266|56.97 47.11|Hope Saldean",
		[26287] = "The Westfall Brigade|5+ alliance 26266|56.45 47.57|Captain Danuvin",
		[26288] = "Jango Spothide|5+ alliance 26287|56.45 47.57|Captain Danuvin",
		[26365] = { -- Breadcrumb for 26503; mutually exclusive with 28563
			"Hero's Call: Redridge Mountains!|7+ alliance -26322 -28563 -26503|56.45 47.57|Captain Danuvin",
			"Hero's Call: Redridge Mountains!|7+ alliance 26322 -28563 -26503|56.42 49.53|Captain Danuvin", -- Danuvin moves after completing 26322
		},
		[26286] = "In Defense of Westfall|5+ alliance 26266|56.32 47.52|Marshal Gryan Stoutmantle",
		[26289] = "Find Agent Kearnen|5+ alliance 26271 26286|56.32 47.52|Marshal Gryan Stoutmantle",
		[26290] = "Secrets of the Tower|5+ alliance 26289|68.33 70.38|Agent Kearnen",
		[26291] = "Big Trouble in Moonbrook|5+ alliance 26290|68.33 70.38|Agent Kearnen",
		[26292] = "To Moonbrook!|5+ alliance 26291|56.32 47.52|Marshal Gryan Stoutmantle",
		[26322] = "Rise of the Brotherhood|5+ alliance 26320|56.32 47.52|Marshal Gryan Stoutmantle",
		[26761] = "Threat to the Kingdom|5+ alliance 26370|56.37 49.63|Marshal Gryan Stoutmantle",

		-- Moonbrook
		[26295] = "Propaganda|5+ alliance 26292|42.1 64.12|Captain Alpert",
		[26296] = "Evidence Collection|5+ alliance 26292|42.86 69.17|{237277} [Red Bandana]||Drops from [hostile]Moonbrook Thug]",
		[26297] = "The Dawning of a New Day|5+ alliance 26295|42.1 64.12|Captain Alpert",
		[26319] = "Secrets Revealed|5+ alliance 26297|42.1 64.12|Captain Alpert",
		[26320] = "A Vision of the Past|5+ alliance 26319|42.97 65.03|Thoralius the Wise",

		-- Captain Sanders' Hidden Treasure
		[26353] = "Captain Sanders' Hidden Treasure|5+|50.46 9.91|{134269} [Captain Sanders' Treasure Map]||Has a chance to drop from any Murloc along the coast",
		[26354] = "Captain Sanders' Hidden Treasure|5+ 26353|25.9 47.76|Captain's Footlocker",
		[26355] = "Captain Sanders' Hidden Treasure|5+ 26354|40.52 47.78|Broken Barrel",
		[26356] = "Captain Sanders' Hidden Treasure|5+ 26355|40.63 17.03|Old Jug",

		-- Westfall Lighthouse
		[26348] = "The Coast Isn't Clear|5+ alliance ~26371|30.5 85.62|Captain Grayson", -- Invalidates breadcrumb 26371
		[26347] = "Keeper of the Flame|5+ alliance|30.5 85.62|Captain Grayson",
		[26349] = "The Coastal Menace|5+ alliance|30.5 85.62|Captain Grayson",
	},


	--[[ Redridge Mountains ]]--

	[49] = {
		-- Three Corners
		[26503] = "Still Assessing the Threat|7+ alliance ~26365 ~28563|15.32 64.59|Watch Captain Parker", -- Invalidates breadcrumbs 26365 and 28563
		[26505] = "Parker's Report|7+ alliance 26503|15.32 64.59|Watch Captain Parker",
		[26506] = "Franks and Beans|7+ alliance|15.62 65.32|Darcy Parker",
		[26504] = "WANTED: Redridge Gnolls|7+ alliance|16.04 64.61|Wanted!",

		-- Lakeshire
		[26508] = "Nida's Necklace|7+ alliance|28.34 48.87|Shawn",
		[26509] = "An Unwelcome Guest|7+ alliance|22.04 42.7|Martie Jainrose",
		[26728] = "Hero's Call: Duskwood!|10+ alliance -28564 -26618|28.68 40.95|Bailiff Conacher", -- Breadcrumb for 26618; mutually exclusive with 28564
		[26510] = "We Must Prepare!|7+ alliance|28.91 41.11|Magistrate Solomon",
		[26511] = "Lake Everstill Clean Up|7+ alliance|28.68 40.95|Bailiff Conacher",
		[26512] = "Tuning the Gnomecorder|7+ alliance 26510|28.91 41.11|Magistrate Solomon",
		[26513] = "Like a Fart in the Wind|7+ alliance 26510|31.86 44.89|Marshal Marris", -- 26511 might be prereq?
		[26519] = "He Who Controls the Ettins|7+ alliance 26510|28.23 23.58|{134944} [uncommon]Dirt-Stained Scroll]||Has a chance to drop from [hostile]Redridge] Gnolls in the Redridge Canyons",
		[26520] = "Saving Foreman Oslow|7+ alliance 26519|17.86 18.6|Ettin Control Orb|down|\"Inside Rethban Caverns\"",
		[26514] = "Canyon Romp|7+ alliance 26512|28.91 41.11|Magistrate Solomon",
		[26544] = "They've Wised Up...|7+ alliance 26514|28.91 41.11|Magistrate Solomon",
		[26545] = "Yowler Must Die!|7+ alliance 26544|28.91 41.11|Magistrate Solomon",
		[26567] = "John J. Keeshan|7+ alliance 26520 26545|28.66 40.73|Colonel Troteman",
		[26568] = "This Ain't My War|7+ alliance 26567|26.29 40.13|John J. Keeshan",
		[26570] = "Render's Army|7+ alliance 26568|29.73 44.52|Marshal Marris",
		[26569] = "Surveying Equipment|7+ alliance 26568|29.65 44.54|Foreman Oslow",
		[26571] = "Weapons of War|7+ alliance 26568|28.66 40.73|Colonel Troteman",
		[26573] = "His Heart Must Be In It|7+ alliance 26571|28.66 40.73|Colonel Troteman",
		[26586] = "In Search of Bravo Company|7+ alliance 26568|28.66 40.73|Colonel Troteman",
		[26587] = "Breaking Out is Hard to Do|7+ alliance 26586|47.53 41.95|Messner",
		[26560] = "Jorgensen|7+ alliance 26587|41.72 20.87|Messner",
		[26561] = "Krakauer|7+ alliance 26560|33.69 11.68|Jorgensen",
		[26562] = "And Last But Not Least... Danforth|7+ alliance 26561|30.7 9.3|Krakauer",
		[26563] = "Return of the Bravo Company|7+ alliance 26562|30.7 9.3|Danforth",
		[26607] = "They Drew First Blood|7+ alliance 26573 26563|28.66 40.73|Colonel Troteman",
		[26616] = "It's Never Over|7+ alliance 26607|26.33 40.1|John J. Keeshan",

		-- Camp Everstill
		[26636] = "Bravo Company Field Kit: Camouflage|7+ alliance 26616|52.4 55.4|Krakauer",
		[26637] = "Bravo Company Field Kit: Chloroform|7+ alliance 26616|52.43 55.55|Messner",
		[26638] = "Hunting the Hunters|7+ alliance 26616|52.53 55.55|Danforth",
		[26639] = "Point of Contact: Brubaker|7+ alliance 26616|52.55 55.41|John J. Keeshan",
		[26640] = "Unspeakable Atrocities|7+ alliance 26639|53.05 67.83|[dead]Brubaker]",
		[26646] = "Prisoners of War|7+ alliance 26636 26637 26638 26640|52.55 55.41|John J. Keeshan",
		[26651] = "To Win a War, You Gotta Become War|7+ alliance 26646|52.55 55.41|John J. Keeshan",

		--- Shalewind Canyon
		[26668] = "Detonation|7+ alliance 26651|77.69 65.5|John J. Keeshan",
		[26692] = "Shadowhide Extinction|7+ alliance 26668|77.63 65.34|Danforth",
		[26693] = "The Dark Tower|7+ alliance 26668|77.69 65.5|John J. Keeshan",
		[26694] = "The Grand Magus Doane|7+ alliance 26693|77.69 65.5|John J. Keeshan",
		[26708] = "AHHHHHHHHHHHH! AHHHHHHHHH!!!|7+ alliance 26694|77.2 65.93|Colonel Troteman",

		-- Keeshan's Post
		[26713] = "Showdown at Stonewatch|7+ alliance 26708|60.66 36.66|Colonel Troteman",
		[26714] = "Darkblaze, Brood of the Worldbreaker|7+ alliance 26713|60.66 36.66|Colonel Troteman",
		[26726] = "Triumphant Return|7+ alliance 26714|60.66 36.66|Colonel Troteman",
	},


	--[[ Duskwood ]]--

	[47] = {
		-- Death Knight - Apocalypse
		[40931] = "Following the Curse|10+ deathknight 40930|77.42 36.32|Revil Kost|artifact",

		-- Druid - The Scythe of Elune
		[40784] = "Its Rightful Place|10+ druid 40783|48.9 34.32|Valorn Stillbough|artifact",
		[40785] = "A Foe of the Dark|10+ druid 40784|48.83 34.22|Belysra Starbreeze|artifact",
		[40834] = "Following the Curse|10+ druid 40785|77.42 36.32|Revil Kost|artifact",
	},


	--[[ Deadwind Pass ]]--
	
	[42] = {
		-- Death Knight - Apocalypse
		[40932] = "Disturbing the Past|10+ deathknight 40931|52.42 34.41|Revil Kost|artifact",
		[40933] = "A Grisly Task|10+ deathknight 40932|52.42 34.41|Revil Kost|artifact",
		[40934] = "The Dark Riders|10+ deathknight 40933 -40986|49.46 74.73|Revil Kost|artifact", -- 40986 is used if 2nd/3rd artifact
		[40935] = "The Call of Vengeance|10+ deathknight 40934,40986 -40987|46.91 69.48|Revil Kost|artifact", -- 40987 is used if 2nd/3rd artifact

		-- Druid - The Scythe of Elune
		[40835] = "Disturbing the Past|10+ druid 40834|52.42 34.41|Revil Kost|artifact",
		[40837] = "The Deadwind Hunt|10+ druid 40835|52.42 34.41|Revil Kost|artifact",
		[40838] = "The Dark Riders|10+ druid 40837|46.92 69.47|Revil Kost|artifact",
		[40900] = "The Burden Borne|10+ druid 40838|46.92 69.47|Revil Kost|artifact",
	},


	--[[ Eversong Woods ]]--

	-- Silvermoon City
	[110] = {
		-- Eversong Woods
		[9134]  = "Skymistress Gloaming|1+ horde bloodelf 9133|53.94 71.03|Sathren Azuredawn", -- Blood Elf only
		[9135]  = "Return to Sathiel|1+ horde bloodelf 9134|63.12 96.4|Skymistress Gloaming", -- Blood Elf only
	},

	-- Sunstrider Isle
	[467] = {
		[8325]  = "Reclaiming Sunstrider Isle|1+ horde bloodelf|61.03 45.13|Magistrix Erona", -- Blood Elf only
		[8326]  = "Unfortunate Measures|1+ horde bloodelf 8325|61.03 45.13|Magistrix Erona", -- Blood Elf only
		[37440] = "A Fistful of Slivers|1+ horde bloodelf 8326|61.82 39.35|Arcanist Ithanas", -- Blood Elf only
		[37442] = "The Shrine of Dath'Remar|1+ horde bloodelf 8326|63.97 42.83|Well Watcher Solanian", -- Blood Elf only
		[37443] = "Solanian's Belongings|1+ horde bloodelf 8326|63.97 42.83|Well Watcher Solanian", -- Blood Elf only
		[37439] = "Thirst Unending|1+ horde bloodelf 8326|58.46 38.79|Arcanist Helion|link:467", -- Blood Elf only
		[8327]  = "Report to Lanthan Perilon|1+ horde bloodelf 8326 -8334|61.03 45.13|Magistrix Erona", -- Blood Elf only breadcrumb for 8334
		[8334]  = "Aggression|1+ horde bloodelf 8326 ~8327|52.88 49.78|Lanthan Perilon", -- Blood Elf only; invalidates breadcrumb 8327
		[8338]  = "Tainted Arcane Sliver|1+ horde bloodelf|38.85 63.94|{132884} [Tainted Arcane Sliver]||Drops from [Tainted Arcane Wraith]", -- Blood Elf only
		[8335]  = "Felendren the Banished|1+ horde bloodelf 8334|52.88 49.78|Lanthan Perilon", -- Blood Elf only
		[8347]  = "Aiding the Outrunners|1+ horde bloodelf 8335 -9704|52.88 49.78|Lanthan Perilon", -- Blood Elf only breadcrumb for 9704
		[9704]  = "Slain by the Wretched|1+ horde ~8347|68.42 79.61|Outrunner Alarion", -- Invalidates breadcrumb 8347
		[9705]  = "Package Recovery|1+ horde 9704|73.36 90.21|[dead]Slain Outrunner]",
		[8350]  = "Completing the Delivery|1+ horde 9705|68.42 79.61|Outrunner Alarion",
	},

	-- Eversong Woods
	[94] = {
		-- Sunstrider Isle
		[8325]  = "Reclaiming Sunstrider Isle|1+ horde bloodelf|38.02 21.01|Magistrix Erona|link:467", -- Blood Elf only
		[8326]  = "Unfortunate Measures|1+ horde bloodelf 8325|38.02 21.01|Magistrix Erona|link:467", -- Blood Elf only
		[37440] = "A Fistful of Slivers|1+ horde bloodelf 8326|38.27 19.13|Arcanist Ithanas|link:467", -- Blood Elf only
		[37442] = "The Shrine of Dath'Remar|1+ horde bloodelf 8326|38.97 20.26|Well Watcher Solanian|link:467", -- Blood Elf only
		[37443] = "Solanian's Belongings|1+ horde bloodelf 8326|38.97 20.26|Well Watcher Solanian|link:467", -- Blood Elf only
		[37439] = "Thirst Unending|1+ horde bloodelf 8326|37.18 18.95|Arcanist Helion|link:467", -- Blood Elf only
		[8327]  = "Report to Lanthan Perilon|1+ horde bloodelf 8326 -8334|38.02 21.01|Magistrix Erona|link:467", -- Blood Elf only breadcrumb for 8334
		[8334]  = "Aggression|1+ horde bloodelf 8326 ~8327|35.37 22.52|Lanthan Perilon|link:467", -- Blood Elf only; invalidates breadcrumb 8327
		[8335]  = "Felendren the Banished|1+ horde bloodelf 8334|35.37 22.52|Lanthan Perilon|link:467", -- Blood Elf only
		[8338]  = "Tainted Arcane Sliver|1+ horde bloodelf|30.71 27.12|{132884} [Tainted Arcane Sliver]|link:467|Drops from [Tainted Arcane Wraith]", -- Blood Elf only
		[8347]  = "Aiding the Outrunners|1+ horde bloodelf 8335 -9704|35.37 22.52|Lanthan Perilon|link:467", -- Blood Elf only breadcrumb for 9704
		[9704]  = "Slain by the Wretched|1+ horde ~8347|40.42 32.21|Outrunner Alarion", -- Invalidates breadcrumb 8347
		[9705]  = "Package Recovery|1+ horde 9704|42.02 35.65|[dead]Slain Outrunner]",
		[8350]  = "Completing the Delivery|1+ horde 9705|40.42 32.21|Outrunner Alarion",

		-- Falconwing Square
		[8468]  = "WANTED: Thaelis the Hungerer|1+ horde|48.17 46.31|Wanted: Thaelis the Hungerer",
		[8463]  = "Unstable Mana Crystals|1+ horde|48.17 46|Aeldon Sunbrand",
		[9352]  = "Darnassian Intrusions|1+ horde 8463|48.17 46|Aeldon Sunbrand",
		[8472]  = "Major Malfunction|1+ horde|47.25 46.31|Magister Jaronis",
		[8895]  = "Delivery to the North Sanctum|1+ horde 8472|47.25 46.31|Magister Jaronis",
		[9119]  = "Malfunction at the West Sanctum|1+ horde 8895|44.63 53.14|Ley-Keeper Caidanis",
		[8486]  = "Arcane Instability|1+ horde 9119|36.7 57.44|Ley-Keeper Velania",
		[8482]  = "Incriminating Documents|1+ horde|36.78 61|{133464} [Incriminating Documents]||Drops from [hostile]Darnassian Scout]",
		[8483]  = "The Dwarven Spy|1+ horde 8482|48.17 46|Aeldon Sunbrand",
		[9256]  = "Fairbreeze Village|1+ horde 8483 -8892|48.17 46|Aeldon Sunbrand", -- Breadcrumb for 8892

		-- Swift Discipline
		[9035]  = "Roadside Ambush|1+ horde -9062|45.19 56.43|Apprentice Ralen", -- Breadcrumb for 9062
		[9062]  = "Soaked Pages|1+ horde ~9035|44.87 61.03|Apprentice Meledor", -- Invalidates breadcrumb 9035
		[9064]  = "Taking the Fall|1+ horde 9062|44.87 61.03|Apprentice Meledor",
		[9066]  = "Swift Discipline|1+ horde 9064|55.7 54.51|Instructor Antheol",

		-- Fairbreeze Village
		[8491]  = "Pelt Collection|1+ horde|44.72 69.63|Velan Brightoak",
		[9130]  = "Goods from Silvermoon City|1+ horde bloodelf|43.7 71.56|Sathiel", -- Blood Elf only
		[9133]  = "Fly to Silvermoon City|1+ horde bloodelf 9130|43.95 69.98|Skymaster Brightdawn", -- Blood Elf only
		[9135]  = "Return to Sathiel|1+ horde bloodelf 9134|54.37 50.73|Skymistress Gloaming", -- Blood Elf only
		[9358]  = "Ranger Sareyn|1+ horde -9252|43.67 71.31|Marniel Amberlight", -- Breadcrumb for 9252
		[9258]  = "The Scorched Grove|1+ horde -8473|43.58 71.2|Ardeyn Riverwind", -- Breadcrumb for 8473
		[8892]  = "Situation at Sunsail Anchorage|1+ horde ~9256|43.35 70.83|Ranger Degolien", -- Invalidates breadcrumb 9256
		[9359]  = "Farstrider Retreat|1+ horde 8892 -8476|43.35 70.83|Ranger Degolien", -- Breadcrumb for 8476
		[9144]  = "Missing in the Ghostlands|1+ horde -28560 -9147|44.03 70.76|Magistrix Landra Dawnstrider", -- Breadcrumb for 9147; mutually exclusive with 28560
		[9395]  = "Saltheril's Haven|1+ horde -9067|44.03 70.76|Magistrix Landra Dawnstrider", -- Breadcrumb for 9067
		[9067]  = "The Party Never Ends|1+ horde ~9395|38.15 73.55|Lord Saltheril", -- Invalidates breadcrumb 9395
		[9254]  = "The Wayward Apprentice|1+ horde -8487|44.03 70.76|Magistrix Landra Dawnstrider", -- Breadcrumb for 8487

		-- Tranquil Shore
		[8884]  = "Fish Heads, Fish Heads...|1+ horde|30.22 58.34|Hathvelion Sungaze",
		[8885]  = "The Ring of Mmmrrrggglll|1+ horde 8884|30.22 58.34|Hathvelion Sungaze",
		[8886]  = "Grimscale Pirates!|1+ horde|36.36 66.62|Captain Kelisendra",
		[8887]  = "Captain Kelisendra's Lost Rutters|1+ horde|26.89 59.82|{134939} [Captain Kelisendra's Lost Rutters]||Has a chance to drop from [hostile]Grimscale Murlocs]",
		[8480]  = "Lost Armaments|1+ horde|36.36 66.78|Velendris Whitemorn",
		[9076]  = "Wretched Ringleader|1+ horde 8480|36.36 66.78|Velendris Whitemorn",

		-- The Scorched Grove
		[8473]  = "A Somber Task|1+ horde ~9258|34.06 80.02|Larianna Riverwind", -- Invalidates breadcrumb 9258
		[8474]  = "Old Whitebark's Pendant|1+ horde|34.81 84.34|{133280} [Old Whitebark's Pendant]||Drops from [hostile]Old Whitebark]",
		[10166] = "Whitebark's Memory|1+ horde 8474|34.06 80.02|Larianna Riverwind",

		-- The Dead Scar
		[8475]  = "The Dead Scar|1+ horde|50.34 50.77|Ranger Jaela",
		[9252]  = "Defending Fairbreeze Village|1+ horde ~9358|46.93 71.78|Ranger Sareyn", -- Invalidates breadcrumb 9358
		[9253]  = "Runewarden Deryan|1+ horde 9252 -8490|46.93 71.78|Ranger Sareyn", -- Breadcrumb for 8490
		[8490]  = "Powering our Defenses|1+ horde ~9253|44.2 85.47|Runewarden Deryan", -- Invalidates breadcrumb 9253
		[8487]  = "Corrupted Soil|1+ horde ~9254|54.28 70.98|Apprentice Mirveda", -- Invalidates breadcrumb 9254
		[8488]  = "Unexpected Results|1+ horde 8487|54.28 70.98|Apprentice Mirveda",
		[9255]  = "Research Notes|1+ horde 8488|54.28 70.98|Apprentice Mirveda",

		-- Duskwither Spire
		[9394]  = "Where's Wyllithen?|1+ horde -8894|67.81 56.53|Apprentice Loralthalis", -- Breadcrumb for 9394
		[8894]  = "Cleaning up the Grounds|1+ horde ~9394|68.71 46.95|Groundskeeper Wyllithen", -- Invalidates breadcrumb 9394
		[8889]  = "Deactivating the Spire|1+ horde ~8888|67.81 56.53|Apprentice Loralthalis", -- Invalidates breadcrumb 8889
		[8890]  = "Word from the Spire|1+ horde 8889|67.81 56.53|Apprentice Loralthalis",
		[8891]  = "Abandoned Investigations|1+ horde|69.24 52.11|Magister Duskwither's Journal|up",

		-- Farstrider Retreat
		[8476]  = "Amani Encroachment|1+ horde ~9359|60.32 62.77|Lieutenant Dawnrunner", -- Invalidates breadcrumb 9359
		[8477]  = "The Spearcrafter's Hammer|1+ horde|59.52 62.6|Arathel Sunforge",
		[8888]  = "The Magister's Apprentice|1+ horde -8889|60.31 61.38|Magister Duskwither", -- Breadcrumb for 8889
		[8479]  = "Zul'Marosh|1+ horde|70.53 72.34|Ven'jashi",
		[9360]  = "Amani Invasion|1+ horde|62.4 79.6|{134946} [Amani Invasion Plans]||Drops from [hostile]Chieftain Zul'Marosh]",
		[9363]  = "Warning Fairbreeze Village|1+ horde 9360|60.32 62.77|Lieutenant Dawnrunner",

		-- Ghostlands
		[9147]  = "The Fallen Courier|1+ horde ~9144|49.02 89.05|Apothecary Thedra", -- Invalidates breadcrumb 9144
		[9148]  = "Delivery to Tranquillien|1+ horde 9147 ~9138|48.98 88.99|Courier Dawnstrider", -- Cannot be picked up at the same time as 9138
	},


	--[[ Tirisfal Glades ]]--

	-- Undercity
	[90] = {
		-- Tirisfal Glades
		[6322] = "Michael Garrett|1+ horde undead 6323|61.5 41.79|Gordon Wendham", -- Undead only
		[6324] = "Return to Morris|1+ horde undead 6322|63.26 48.54|Michael Garrett", -- Undead only
	},

	-- Deathknell
	[465] = {
		[24959] = "Fresh out of the Grave|1+ horde undead|40.79 78.49|Agatha", -- Undead only
		[28608] = "The Shadow Grave|1+ horde undead 24959|43.43 79.92|Undertaker Mordo", -- Undead only
		[26799] = "Those That Couldn't Be Saved|1+ horde undead 28608|43.43 79.92|Undertaker Mordo", -- Undead only
		[28652] = "Caretaker Caice|1+ horde undead 26799 -24960|43.43 79.92|Undertaker Mordo", -- Undead only breadcrumb for 24960
		[24960] = "The Wakening|1+ horde undead 28608 ~28652|45.93 80.47|Caretaker Caice", -- Undead only; invalidates breadcrumb 28652
		[25089] = "Beyond the Graves|1+ horde undead 24960|45.93 80.47|Caretaker Caice", -- Undead only
		[26800] = "Recruitment|1+ horde undead 25089|49.94 56.54|Deathguard Saltain", -- Undead only
		[26801] = "Scourge on our Perimeter|1+ horde|46.63 58.8|Shadow Priest Sarvis",
		[28651] = "Novice Elreth|1+ horde 26801|46.63 58.8|Shadow Priest Sarvis",
		[24961] = "The Truth of the Grave|1+ horde 28651|46.74 58.2|Novice Elreth",
		[28672] = "The Executor In the Field|1+ horde 24961|46.74 58.2|Novice Elreth",
		[26802] = "The Damned|1+ horde 28672|55.48 37.79|Executor Arren",
		[24973] = "Night Web's Hollow|1+ horde 26802|55.48 37.79|Executor Arren",
		[24970] = "No Better Than the Zombies|1+ horde 24973|55.48 37.79|Executor Arren",
		[24971] = "Assault on the Rotbrain Encampment|1+ horde 24970|67.03 42.38|Darnell",
		[24972] = "Vital Intelligence|1+ horde 24971|46.63 58.8|Shadow Priest Sarvis",
	},

	-- Tirisfal Glades
	[18] = { -- Shadowlands version is 2070
		-- art:19 - Cataclysm
		-- art:1136 - Battle for Azeroth

		-- Deathknell
		[24959] = "Fresh out of the Grave|1+ horde undead|29.43 70.95|Agatha|link:465", -- Undead only
		[28608] = "The Shadow Grave|1+ horde undead 24959|30.07 71.29|Undertaker Mordo|link:465", -- Undead only
		[26799] = "Those That Couldn't Be Saved|1+ horde undead 28608|30.07 71.29|Undertaker Mordo|link:465", -- Undead only
		[28652] = "Caretaker Caice|1+ horde undead 26799 -24960|30.07 71.29|Undertaker Mordo|link:465", -- Undead only breadcrumb for 24960
		[24960] = "The Wakening|1+ horde undead 28608 ~28652|30.67 71.43|Caretaker Caice|link:465", -- Undead only; invalidates breadcrumb 28652
		[25089] = "Beyond the Graves|1+ horde undead 24960|30.67 71.43|Caretaker Caice|link:465", -- Undead only
		[26800] = "Recruitment|1+ horde undead 25089|31.63 65.65|Deathguard Saltain|link:465", -- Undead only
		[26801] = "Scourge on our Perimeter|1+ horde|30.84 66.2|Shadow Priest Sarvis|link:465",
		[28651] = "Novice Elreth|1+ horde 26801|30.84 66.2|Shadow Priest Sarvis|link:465",
		[24961] = "The Truth of the Grave|1+ horde 28651|30.87 66.05|Novice Elreth|link:465",
		[28672] = "The Executor In the Field|1+ horde 24961|30.87 66.05|Novice Elreth|link:465",
		[26802] = "The Damned|1+ horde 28672|32.97 61.13|Executor Arren|link:465",
		[24973] = "Night Web's Hollow|1+ horde 26802|32.97 61.13|Executor Arren|link:465",
		[24970] = "No Better Than the Zombies|1+ horde 24973|32.97 61.13|Executor Arren|link:465",
		[24971] = "Assault on the Rotbrain Encampment|1+ horde 24970|35.76 62.23|Darnell|link:465",
		[24972] = "Vital Intelligence|1+ horde 24971|30.84 66.2|Shadow Priest Sarvis|link:465",

		-- Calston Estate
		[24979] = "A Scarlet Letter|1+ art:18:19 horde|34.21 48.05|{237451} [A Scarlet Letter]||Has a chance to drop from [hostile]Scarlet Warrior]",
		[24974] = "Ever So Lonely|1+ art:18:19 horde|44.75 53.64|Sedrick Calston",
		[24978] = "Reaping the Reapers|1+ art:18:19 horde|44.75 53.67|Deathguard Simmer",
		[24980] = "The Scarlet Palisade|1+ art:18:19 horde 24978|44.75 53.67|Deathguard Simmer",
		[24975] = "Fields of Grief|1+ art:18:19 horde|44.62 53.78|Apothecary Johaan",
		[24976] = "Variety is the Spice of Death|1+ art:18:19 horde 24975|44.62 53.78|Apothecary Johaan",
		[24977] = "Johaan's Experiment|1+ art:18:19 horde 24976|44.62 53.78|Apothecary Johaan",
		[25038] = "Gordo's Task|1+ art:18:19 horde 24976|44.37 53.18|Gordo",

		-- Cold Hearth Manor
		[25090] = "A Putrid Task|1+ art:18:19 horde|52.54 54.82|Deathguard Dillinger",
		[24982] = "The New Forsaken|1+ art:18:19 horde -24983|52.54 54.82|Deathguard Dillinger", -- Breadcrumb for 24983

		-- Brill
		[6321]  = "Supplying Brill|1+ art:18:19 horde undead|60.13 52.39|Deathguard Morris", -- Undead only
		[6323]  = "Ride to the Undercity|1+ art:18:19 horde undead 6321|58.84 51.94|Anette Williams", -- Undead only
		[24983] = "Forsaken Duties|1+ art:18:19 horde ~24982|61 50.54|Magistrate Sevren", -- Invalidates breadcrumb 24982
		[24990] = "Darkhound Pounding|1+ art:18:19 horde 24976|60.05 52.86|Junior Apothecary Holland",
		[24992] = "Escaped From Gilneas|1+ art:18:19 horde +24990 -25039|1 WorgenInfiltrator|[hostile]Worgen Infiltrator]|discovery|Bring a [hostile]Darkhound] to low health to force a [hostile]Worgen Infiltrator] out of hiding", -- Mutually exclusive with 25039; triggering the Worgen Infiltrator completes HQT 25040
		[25039] = "Have You Seen Anything Weird Out There?|1+ art:18:19 horde 25040 -24992|61.88 51.96|Ratslin Maime", -- Requires HQT 25040; mutually exclusive with 24992
		[24993] = "Annihilate the Worgen|1+ art:18:19 horde 24992,25039|60.54 51.86|Executor Zygand",
		[24996] = "Holland's Experiment|1+ art:18:19 horde 24990|60.05 52.86|Junior Apothecary Holland",
		[24991] = "Garren's Haunt|1+ art:18:19 horde 24996 -24994|60.05 52.86|Junior Apothecary Holland", -- Breadcrumb for 24994
		[25006] = "The Grasp Weakens|1+ art:18:19 horde 25005|61 50.54|Magistrate Sevren",
		[25007] = "East... Always to the East|1+ art:18:19 horde 25006|61 50.54|Magistrate Sevren",
		[24981] = "A Thorn in our Side|1+ art:18:19 horde|60.54 51.86|Executor Zygand",
		[26964] = "Warchief's Command: Silverpine Forest!|5+ art:18:19 horde -28568 -26965|60.54 51.86|Executor Zygand", -- Breadcrumb for 26965 (?); mutually exclusive with 28568

		-- Death's Watch Waystation
		[24988] = "The Chill of Death|1+ art:18:19 horde 24983|65.25 60.42|Gretchen Dedmar",
		[24989] = "Return to the Magistrate|1+ art:18:19 horde 24988|65.49 60.25|Deathguard Linnea",

		-- Garren's Haunt
		[24997] = "Graverobbers|1+ art:18:19 horde|61.6 34.39|Apprentice Crispin",
		[24998] = "Maggot Eye|1+ art:18:19 horde 24997|61.6 34.39|Apprentice Crispin",
		[24994] = "Doom Weed|1+ art:18:19 horde ~24991|61.65 34.56|Apothecary Jerrod", -- Invalidates breadcrumb 24991
		[24995] = "Off the Scales|1+ art:18:19 horde 24994|61.65 34.56|Apothecary Jerrod",
		[24999] = "Planting the Seed of Fear|1+ art:18:19 horde 24994|61.6 34.39|Apprentice Crispin",
		[25031] = "Head for the Mills|1+ art:18:19 horde 24995 24999 -25003|61.65 34.56|Apothecary Jerrod", -- Breadcrumb for 25003

		-- Agamand Mills
		[25003] = "The Family Crypt|1+ art:18:19 horde ~25031|54.59 29.89|Coleman Farthing", -- Invalidates breadcrumb 25031
		[25030] = "The Haunted Mills|1+ art:18:19 horde|52.83 26.35|{133730} [Dargol's Skull]|down|Drops from [hostile]Captain Dargol] inside the crypt",
		[25004] = "The Mills Overrun|1+ art:18:19 horde 25003|54.59 29.89|Coleman Farthing",
		[25029] = "Deaths in the Family|1+ art:18:19 horde 25003|54.59 29.89|Coleman Farthing",
		[25005] = "Speak with Sevren|1+ art:18:19 horde 25004 25029|54.59 29.89|Coleman Farthing",

		-- The Bulwark
		[25056] = "Grisly Grizzlies|1+ art:18:19 horde|83.28 69.24|Apothecary Dithers",
		[25013] = "A Little Oomph|1+ art:18:19 horde 25056|83.28 69.24|Apothecary Dithers",
		[25009] = "At War With The Scarlet Crusade|1+ art:18:19 horde 25007|83.26 68.99|High Executor Derrington",
		[25010] = "A Deadly New Ally|1+ art:18:19 horde 25009|83.26 68.99|High Executor Derrington",
		[25046] = "A Daughter's Embrace|1+ art:18:19 horde 25010|87.5 43.29|Lieutenant Sanders",
		[25011] = "To Bigger and Better Things|1+ art:18:19 horde 25046|83.26 68.99|High Executor Derrington",
		[25012] = "Take to the Skies|1+ art:18:19 horde 25011|83.57 69.94|Timothy Cunningham",

		-- Western Plaguelands
	},


	--[[ Silverpine Forest ]]--

	[21] = {
		-- Forsaken High Command
		[26965] = "The Warchief Cometh|5+ horde ~28568 ~26964|57.41 10.13|Grand Executor Mortuus", -- Invalidates breadcrumb 28568 -- mgiht not invalidate 26964?
	},


	--[[ Arathi Highlands ]]--

	[14] = {
		-- art:15 - Cataclysm
		-- art:1137 - Battle for Azeroth

		-- Death Knight - The Four Horsemen
		[42534] = "Our Oldest Enemies|10+ art:14:15 deathknight 42533|19.45 67.31|Prince Galen Trollbane|artifact",
		[42535] = "Death... and Decay|10+ art:14:15 deathknight 42533|19.45 67.31|Prince Galen Trollbane|artifact",
		[42536] = "Regicide|10+ art:14:15 deathknight 42534 42535|19.52 67.09|Thassarian|artifact",
		[42537] = "The King Rises|10+ art:14:15 deathknight 42536|23.39 61.4|Thassarian|artifact",
	},


	--[[ The Hinterlands ]]--

	[26] = {
		-- OOX-17/HL
		[485] = "Find OOX-22/HL!|10+|1 OOXDistressBeacon|{132836} [uncommon]OOX-17/HL Distress Beacon]|discovery|Zone Drop",
	},


	--[[ Darkmoon Island ]]--

	[407] = {
		[29433] = "Test Your Strength|1+|47.89 67.13|Kerri Hicks",

		-- Profession
		[29506] = "A Fizzy Fusion|1+ alchemy|50.53 69.56|Sylannia|alchemy",
		[29508] = "Baby Needs Two Pair of Shoes|1+ blacksmithing|51.09 82.04|Yebb Neblegear|blacksmithing",
		[29510] = "Putting Trash to Good Use|1+ enchanting|53.24 75.84|Sayge|enchanting",
		[29511] = "Talkin' Tonks|1+ engineering|49.25 60.78|Rinling|engineering",
		[29515] = "Writing the Future|1+ inscription|53.24 75.84|Sayge|inscription",
		[29514] = "Herbs for Healing|1+ herbalism|55 70.77|Chronos|herbalism",
		[29516] = "Keeping the Faire Sparkling|1+ jewelcrafting|55 70.77|Chronos|jewelcrafting",
		[29517] = "Eyes on the Prizes|1+ leatherworking|49.25 60.78|Rinling|leatherworking",
		[29518] = "Rearm, Reuse, Recycle|1+ mining|49.25 60.78|Rinling|mining",
		[29519] = "Tan My Hide|1+ skinning|55 70.77|Chronos|skinning",
		[29520] = "Banners, Banners Everywhere!|1+ tailoring|55.56 55.01|Selina Dourman|tailoring",
		[29509] = "Putting the Crunch in the Frog|1+ cooking|52.88 67.94|Stamp Thunderhorn|cooking",
		[29513] = "Spoilin' for Salty Sea Dogs|1+ fishing|52.88 67.94|Stamp Thunderhorn|fishing",
		[29507] = "Fun for the Little Ones|1+ archaeology|51.89 60.93|Professor Thaddeus Paleo|archaeology",
	},


	--[[ Hidden Quests ]]--

	["Hidden"] = {
		-- Dragon Isles
		[67030] = "Dragon Isles Adventure Mode (Account Unlock)|60+|||campaign",
		[75658] = "Zaralek Cavern World Quests (Account Unlock)|70+|||campaign",

		-- Aiding the Accord
		[72068] = "Aiding the Accord: A Feast For All|60+||Therezal|weekly campaign",
		[72373] = "Aiding the Accord: The Hunt is On|60+||Therezal|weekly campaign",
		[72374] = "Aiding the Accord: Dragonbane Keep|60+||Therezal|weekly campaign",
		[72375] = "Aiding the Accord: The Isles Call|60+||Therezal|weekly campaign",
		[75259] = "Aiding the Accord: Zskera Vaults|60+||Therezal|weekly campaign",
		[75859] = "Aiding the Accord: Sniffenseeking|60+||Therezal|weekly campaign",
		[75860] = "Aiding the Accord: Researchers Under Fire|60+||Therezal|weekly campaign",
		[75861] = "Aiding the Accord: Suffusion Camp|60+||Therezal|weekly campaign",

		-- Sniffenseeking
		--[75875] = "Sniffenseeking: Dig In Progress",
		--[75907] = "Sniffenseeking: Dig In Progress",
		[75390] = "Vertical Anomaly",
		[75234] = "Scratch and Sniff",
		[75516] = "Successful Interventions",
		[75996] = "Your Weight in Gold",
		[76016] = "The Living Drill",
		[75393] = "Making Scents",
		[76015] = "Heart of Iron",
		[76084] = "Frostfire Finesse",
		[76027] = "Flapping and Screaming",
		[75621] = "Element Whispers",
		[75397] = "Those Rascally Worms",
		[75517] = "Sneak and Sniff",
		[75619] = "Thieving Critters",
		[76014] = "Living Statue",
		[75620] = "Liars in Light",
		[76081] = "Liars of Spirit",
		[76081] = "Liars of Spirit",

		-- Treasure
		[76017] = "Three-Dimensional Compass",
		[75601] = "Crystal-encased Chest Unlocked|60+|||treasure",
	}
}


-- --------------------------------------------------


-- TomTom Waypoints
-- [QuestID] = "Map|Title|Coordinates|Icon",

Data.TomTomWaypoints = {
	-- A Hearty Thanks!
	[9612] = {
		"97|Draenei Youngling (Possible Location)|37.4 19.4|135923", -- West of Stillpine Hold
		"97|Draenei Youngling (Possible Location)|46.6 31.6|135923", -- South of Stillpine Hold
		"97|Draenei Youngling (Possible Location)|55 29|135923", -- South of Emberglade
		"97|Draenei Youngling (Possible Location)|39.4 37.2|135923", -- North of Valaar's Berth
		"97|Draenei Youngling (Possible Location)|42 57.4|135923", -- South of Valaar's Berth
		"97|Draenei Youngling (Possible Location)|40 71.6|135923", -- West of Odesyus' Landing
		"97|Draenei Youngling (Possible Location)|56.8 59.6|135923", -- East of the Pod Wreckage
		"97|Draenei Youngling (Possible Location)|53.4 42.4|135923", -- Northeast of Azure Watch
		"97|Draenei Youngling (Possible Location)|55 47|135923", -- East of Azure Watch
		"97|Draenei Youngling (Possible Location)|58.6 42.2|135923", -- Beach
	},

	-- Bandits!
	[9616] = {
		-- Thanks to Wowhead user axelia for these coordinates <https://www.wowhead.com/quest=9616/bandits#comments:id=1981342>
		"97|Blood Elf Bandit (Possible Location)|28.6 79.2|132320",
		"97|Blood Elf Bandit (Possible Location)|26.4 67.2|132320",
		"97|Blood Elf Bandit (Possible Location)|33.4 71|132320",
		"97|Blood Elf Bandit (Possible Location)|32.4 62.8|132320",
		"97|Blood Elf Bandit (Possible Location)|35.2 64.4|132320",
		"97|Blood Elf Bandit (Possible Location)|36 60.4|132320",
		"97|Blood Elf Bandit (Possible Location)|43 63.2|132320",
		"97|Blood Elf Bandit (Possible Location)|53.2 61.2|132320",
		"97|Blood Elf Bandit (Possible Location)|46.4 39.2|132320",
		"97|Blood Elf Bandit (Possible Location)|53.6 41.2|132320",
		"97|Blood Elf Bandit (Possible Location)|50.2 29|132320",
		"97|Blood Elf Bandit (Possible Location)|54.2 21.6|132320",
		"97|Blood Elf Bandit (Possible Location)|52 17.4|132320",
		"97|Blood Elf Bandit (Possible Location)|59 18.2|132320",
		"97|Blood Elf Bandit (Possible Location)|37 20.8|132320",
		"97|Blood Elf Bandit (Possible Location)|34 19.2|132320",
		"97|Blood Elf Bandit (Possible Location)|33.4 26.6|132320",
		"97|Blood Elf Bandit (Possible Location)|36.4 32.4|132320",
		"97|Blood Elf Bandit (Possible Location)|27.4 52|132320",
	},
}