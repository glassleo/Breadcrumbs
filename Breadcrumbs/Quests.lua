local _, Data = ...

-- Quests

--[[
	Data Structure

	[MapID] = {
		[QuestID] = "Name|Requirements|Coordinates|Source|Flags|Help", -- Comments
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
		-n				Must not have completed or picked up quest ID n
		~n				Must not have picked up quest ID n

		class			Must be any of following classes (deathknight demonhunter druid hunter mage monk paladin, priest, rogue, shaman, warlock, warrior)
		profession		Must have any of the following professions learned (alchemy, blacksmithing, enchanting, engineering, herbalism, inscription, jewelcrafting, leatherworking, mining, skinning, tailoring, archaeology, cooking, fishing)
		race			Must be any of the following races (bloodelf, draenei darkiron dwarf gnome goblin highmountain human kultiran lightforged maghar mechagnome nightborne nightelf orc pandaren undead tauren troll voidelf vulpera worgen zandalari)
		alliance		Must be Alliance
		horde			Must be Horde
		covenant		Must belong to any of the following covenants (kyrian, venthyr, nightfae, necrolord)
		-x				Must not be class/have profession/be race/be Alliance/be Horde/belong to covenant

		broken			Quest is broken and cannot be completed, it will be hidden unless the user has decided to display broken quests
		broken:n		Quest is broken if you are level n or higher and cannot be completed, it will be hidden unless the user has decided to display broken quests

	Coordinates: Coordinates for the map pin(s)
		X Y				Coordinates for the map pin indicating where to pick up the quest
		XX YY			Coordinates for an optional map pin indicating where an entrance or exit is; should only provided if you also provide a positional flag (up, down, inside, outside)

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
		inside			Quest is inside on the same map, also changes the XX YY pin to an entrance marker if provided
		outside			Quest is outside on the same map, also changes the XX YY pin to an exit marker if provided

		chromiesync		Quest can only be picked up during Chromie Time or in Party Sync; adds a dynamic help tip depending on level and Chromie Time status

	Help: Tooltip help text
		{!}				Quest bang
		{n}				Texture/icon with ID n
		{atlas}			Atlas
		[text]			White text
		[color]text]	Colored text where color is either a hex (like ff0800) or a named color (spell, friendly, neutral, hostile, daily, poor, uncommon, rare, epic, legendary, artifact, heirloom)

	These predefined variables can be used anywhere in the string to provide text replacements:
		$order_hall_name				Name of the player's Order Hall depending on class
		$order_hall_map_id				Map ID for the player's Order Hall depending on class
		$scouting_map_in_order_hall		Description text for the location of the Legion Scouting Map depending on class

	--------------------------------------------------

	Notes

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
		41099,41069 - Demon Hunter, frist zone picked
		39799 - Death Knight, first zone picked
]]--

Data.Quests = {

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

		-- Mysterious Lightbound Object
		-- Need to check prereqs for each class (Paladin done)
		[44009] = "A Falling Star|10+ -paladin|28.49 48.34|Archmage Khadgar",
		[44257] = "A Falling Star|10+ 42866 paladin|28.49 48.34|Archmage Khadgar", -- Paladin

		-- Uniting the Isles (Always use both 45727,43341)
		[45727] = "Uniting the Isles|45+ -43341|28.49 48.34|Archmage Khadgar", -- First time on account is 43341
		
		-- Armies of Legionfall
		[46730] = "Armies of Legionfall|45+ 45727,43341|66.22 41.99|Archmage Khadgar",
		[46734] = "Assault on Broken Shore|45+ 46730|69.35 43.88|Archmage Khadgar",

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
		[39390] = "A Mysterious Text|10+ alchemy 39325|41.33 33.39|Alchemy Book|alchemy elsewhere link:630",
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
		[40863] = "Alaways the Last Thing|10+ engineering 40858|38.97 25.42|Didi the Wrench|engineering",
		[40864] = "Modular Modifications|10+ engineering 40863|38.97 25.42|Didi the Wrench|engineering",
		[40865] = "It's Not Rocket Science|10+ engineering 40861 40862 40864|38.36 25.57|Hobart Grapplehammer|engineering",

		-- Herbalism
		[40014] = "Spayed by the Spade|10+ herbalism 40013|43 33.36|Kuhuine Tenderstride|herbalism",

		-- Mining
		[38777] = "Leystone Deposit Sample|10+ mining|1 1394960|{1394960} [Leystone Deposit Sample]|mining discovery link:619|Obtained from mining Leystone Deposits on the Broken Isles",
		[38784] = "Leystone Seam Sample|10+ mining|2 1394960|{1394960} [Leystone Seam Sample]|mining discovery link:619|Obtained from mining Leystone Seams on the Broken Isles",
		[38785] = "Living Leystone Sample|10+ mining|3 1394960|{1394960} [Living Leystone Sample]|mining discovery link:619|Obtained from mining Leystone creatures on the Broken Isles",
		[38888] = "The Highmountain Tauren|10+ mining 38777 38784 38785|46.09 26.66|Mama Diggs|mining", -- Available after completing all rank 1 Leystone quests
		[38786] = "Where Respect is Due|10+ mining 38888|47.7 26.66|Ronos Ironhorn|mining elsewhere link:650",
		[38787] = "The Legend of Rethu Ironhorn|10+ mining 38786|47.7 26.66|Ronos Ironhorn|mining elsewhere link:650",
		[38789] = "Rethu's Journal|10+ mining 38787|1 1394960|{237388} [Torn Journal Page]|mining discovery link:619|Obtained from mining Leystone Deposits on the Broken Isles",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 1394960|[Auto Accept]|mining discovery link:619|Obtained from mining Leystone Deposits on the Broken Isles",
		[38790] = "Rethu's Pick|10+ mining 38787|1 1394960|{1060565} [Battered Mining Pick]|mining discovery link:619|Obtained from mining Leystone Seams on the Broken Isles",
		[38793] = "Rethu's Experience|10+ mining 38790|1 1394960|[Auto Accept]|mining discovery link:619|Obtained from mining Leystone Seams on the Broken Isles",
		[38791] = "Rethu's Horn|10+ mining 38787|1 1394960|{237403} [Chunk of Horn]|mining discovery link:619|Obtained from mining Leystone creatures on the Broken Isles",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|1 1394960|[Auto Accept]|mining discovery link:619|Obtained from mining Leystone creatures on the Broken Isles",
		[38795] = "Felslate Deposit Sample|10+ mining|4 1394961|{1394961} [Felslate Deposit Sample]|mining discovery link:619|Obtained from mining Felslate Deposits on the Broken Isles",
		[38796] = "Felslate Seam Sample|10+ mining|5 1394961|{1394961} [Felslate Seam Sample]|mining discovery link:619|Obtained from mining Felslate Seams on the Broken Isles",
		[38797] = "Living Felslate Sample|10+ mining|6 1394961|{1394961} [Living Felslate Sample]|mining discovery link:619|Obtained from mining Felslate creatures on the Broken Isles",
		[38901] = "The Felsmiths|10+ mining 38795 38796 38797|46.09 26.66|Mama Diggs|mining", -- Available after completing all rank 1 Felslate quests
		[38798] = "A Shred of Your Humanity|10+ mining 38901|47.7 26.66|Felsmith Nal'ryssa|mining elsewhere link:680",
		[38799] = "Darkheart Thicket: Nal'ryssa's Sisters|10+ mining 38798|47.7 26.66|Felsmith Nal'ryssa|mining dungeon elsewhere link:680",
	},

	-- The Underbelly
	[628] = {
		-- Engineering
		[40854] = "Endless Possibilities|10+ engineering 40545|65.96 52.87|Filgo Scrapbottom|engineering",
	},

	-- Dungeon: The Violet Hold
	[723] = {
		-- Demon Hunter - Twinblades of the Deceiver
		[41119] = "The Hunt|10+ demonhunter 41121,39051 40375|50.31 71.1|Altruis the Sufferer|artifact", -- Altruis
		[39247] = "The Hunt|10+ demonhunter 41121,39051 40374|50.31 71.1|Kayn Sunfury|artifact", -- Kayn
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

		-- Deathlord's Battleplate
		[44217] = "Armor Fit For A Deathlord|45+ deathknight|43.94 37.63|Quartermaster Ozorg|up link:647",
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

		-- Guise of the Unseen Path
		[44233] = "Walk This Way|45+ hunter 40954|44.57 48.87|Outfitter Reynolds",
	},

	-- Monk - Wandering Isle
	[709] = {
		-- Grandmaster's Finery
		[44249] = "Inner Sanctuary|45+ monk|50.33 59.13|Caydori Brightstar",
	},

	-- Paladin - Sanctum of Light
	[24] = {
		-- Battleplate of the Silver Hand
		[44250] = "Champion of the Light|45+ paladin|41.35 61.09|Eadric the Pure",
	},

	-- Priest - Netherlight Temple
	[702] = {
		-- Regalia of the High Priest
		[44251] = "Power Word: Armor|45+ priest|38.65 23.81|Meridelle Lightspark",
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
		[37856] = "Runas the Shamed|10+ 37855|48.62 16.51|Agapanthus",
		[37859] = "The Consumed|10+ 37855|49.39 15.54|Mana-Drained Whelpling",
		[37957] = "Runas the Shamed|10+ 37855|46.62 15.82|Stellagosa",
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
		-- Check if 37727 37728 37492 are preeqs
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
		[42213] = "Eye of Azshara: The Tidestone of Golganneth|10+ 38286|59 41|Tidestone of Golganneth|dungeon down link:713|Available after defeating Wrath of Azshara in Eye of Azshara",

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
		[38460] = "Let's Make A Deal|10+ 42238|61.24 50.74|Daglop",
		[38232] = "Minion! Kill Them!|10+ 38460|61.24 50.74|Daglop",
		[38237] = "This IS In My Contract.|10+ 38232|62.46 51.42|Daglop",

		-- Felblaze Ingress
		[42372] = "Felblaze Ingress|10+ -42375|50.46 30.73|Marius Felbane",
		[42375] = "Eye See You|10+ 42372|63.85 29.94|Tehd Shoemaker",
		[42369] = "They're Doing it Wrong|10+ 42375|63.85 29.94|Tehd Shoemaker",
		[42368] = "Quantity Over Quality|10+ 42375|63.88 28.88|Marius Felbane",
		[42367] = "Arkethrax|10+ 42375|63.88 28.88|Marius Felbane",

		-- Alchemy
		[39390] = "A Mysterious Text|10+ alchemy 39325|44.96 52.11|Alchemy Book|alchemy",

		-- Engineering
		[40856] = "It'll Cost You|10+ engineering 40855|65.21 24.91|Fargo Flintlocke|engineering",
		[40859] = "The Latest Fashion: Headguns!|10+ engineering 40855|65.21 24.91|Fargo Flintlocke|engineering",
		[40858] = "The Missing Pieces|10+ engineering 40856|65.21 24.91|Fargo Flintlocke|engineering",
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

		-- Engineering
		[40861] = "In My Sights|10+ engineering 40860|59.83 62.26|Fargo Flintlocke|engineering",
		[40862] = "All Charged Up|10+ engineering 40860|59.83 62.26|Fargo Flintlocke|engineering",
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
	},

	-- Thunder Totem
	[750] = {
		-- The Rivermane Tribe
		[42590] = "Moozy's Reunion|10+ 39572|45.89 54.92 49.74 53.59|Sella Waterwise|inside",
		[38911] = "The Rivermane Tribe|10+ 38907|44.5 50.71|Mayla Highmountain|down link:652",

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

		-- What a Ripoff!
		[39789] = "Eating Into Our Business|10+|51.46 56.95|Ootasa Galehoof",
		[39793] = "Only the Finest|10+ 39789|51.46 57.06|Rax Sixtrigger",
		[39787] = "Rigging the Wager|10+ 39789|51.27 57.2|Snaggle Sixtrigger",
		[39792] = "A Stack of Racks|10+ 39793 39787|51.37 57.28|Rax Sixtrigger",
		[39786] = "A Stone Cold Gamble|10+ 39793 39787|51.32 56.99|Snaggle Sixtrigger",
		[42483] = "Put It All on Red|10+ 39792 39786|51.38 57.32|Snaggle Sixtrigger",
		
		-- Lock, Stock and Two Smoking Goblins
		[43331] = "Time to Collect|45+ 42483|51.38 57.19|Gazrix Gearlock|elsewhere link:627|Visit {!}Gazrix Gearlock in Dalaran to get revenge on the Sixtrigger brothers",

		-- Plight of the Blackfeather
		[42444] = "Plight of the Blackfeather|10+|50.31 34.04|Frightened Ravenbear",
		[42446] = "Singed Feathers|10+ 42444|49.79 32.63 50.69 31.06|Cukkaw|inside",
		[42445] = "Nithogg's Tribute|10+ 42444|49.98 32.65 50.69 31.06|Intact Greatstag Antler|inside",
		[42447] = "Dances With Ravenbears|10+ 42446 42445|49.79 32.63 50.69 31.06|Cukkaw|inside",

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

	[680] = {
		-- Magic Message
		[39985] = "Khadgar's Discovery|45+ -39986 -44555|35.9 47.7|Archmage Khadgar|elsewhere link:627|Visit {!}Archmage Khadgar in the Violet Citadel to start the Suramar campaign", -- There are two versions of this quest that get marked as completed at the same time
		[39986] = "Magic Message|45+ 39985,44555|35.9 47.7|Archmage Khadgar|elsewhere link:627|Visit {!}Archmage Khadgar in the Violet Citadel to continue the Suramar campaign",
		[39987] = "Trail of Echoes|45+ 39986|35.9 47.7|Archmage Khadgar|elsewhere link:627|Visit {!}Archmage Khadgar in the Violet Citadel to continue the Suramar campaign",

		-- An Ancient Gift
		[40008] = "The Only Way Out is Through|45+ 39987|34.65 53.4|Frist Archanist Thalyssra",

		-- Mining
		[38777] = "Leystone Deposit Sample|10+ mining|1 1394960|{1394960} [Leystone Deposit Sample]|mining discovery|Obtained from mining Leystone Deposits on the Broken Isles",
		[38784] = "Leystone Seam Sample|10+ mining|2 1394960|{1394960} [Leystone Seam Sample]|mining discovery|Obtained from mining Leystone Seams on the Broken Isles",
		[38785] = "Living Leystone Sample|10+ mining|3 1394960|{1394960} [Living Leystone Sample]|mining discovery|Obtained from mining Leystone creatures on the Broken Isles",
		[38789] = "Rethu's Journal|10+ mining 38787|1 1394960|{237388} [Torn Journal Page]|mining discovery|Obtained from mining Leystone Deposits on the Broken Isles",
		[38792] = "Rethu's Lesson|10+ mining 38789|1 1394960|[Auto Accept]|mining discovery|Obtained from mining Leystone Deposits on the Broken Isles",
		[38790] = "Rethu's Pick|10+ mining 38787|1 1394960|{1060565} [Battered Mining Pick]|mining discovery|Obtained from mining Leystone Seams on the Broken Isles",
		[38793] = "Rethu's Experience|10+ mining 38790|1 1394960|[Auto Accept]|mining discovery|Obtained from mining Leystone Seams on the Broken Isles",
		[38791] = "Rethu's Horn|10+ mining 38787|1 1394960|{237403} [Chunk of Horn]|mining discovery|Obtained from mining Leystone creatures on the Broken Isles",
		[38794] = "Rethu's Sacrifice|10+ mining 38791|1 1394960|[Auto Accept]|mining discovery|Obtained from mining Leystone creatures on the Broken Isles",
		[38795] = "Felslate Deposit Sample|10+ mining|4 1394961|{1394961} [Felslate Deposit Sample]|mining discovery|Obtained from mining Felslate Deposits on the Broken Isles",
		[38796] = "Felslate Seam Sample|10+ mining|5 1394961|{1394961} [Felslate Seam Sample]|mining discovery|Obtained from mining Felslate Seams on the Broken Isles",
		[38797] = "Living Felslate Sample|10+ mining|6 1394961|{1394961} [Living Felslate Sample]|mining discovery|Obtained from mining Felslate creatures on the Broken Isles",
		[38798] = "A Shred of Your Humanity|10+ mining 38901|29.93 53.32|Felsmith Nal'ryssa|mining",
		[38799] = "Darkheart Thicket: Nal'ryssa's Sisters|10+ mining 38798|29.93 53.32|Felsmith Nal'ryssa|mining dungeon",
	},


	-- [[ Broken Shore ]]

	[646] = {
		-- Armies of Legionfall
		[45727] = "Uniting the Isles|45+ -43341|7.22 32.9|Archmage Khadgar|link:627|Visit {!}Archmage Khadgar in the Violet Citadel to start the Broken Shore campaign",
		[46730] = "Armies of Legionfall|45+ 45727|7.22 32.9|Archmage Khadgar|link:627|Visit {!}Archmage Khadgar in Krasus' Landing to start the Broken Shore campaign",
		
		-- Assault on Broken Shore
		[46734] = "Assault on Broken Shore|45+ 46730|7.22 32.9|Archmage Khadgar|link:627|Visit {!}Archmage Khadgar in Krasus' Landing to continue the Broken Shore campaign",
		
		-- Begin Construction
		[46286] = "Legionfall Supplies|45+ 46734|44.54 63.15|Commander Chambers",

		-- Aalgen Point
		[46832] = "Aalgen Point|45+ 46734|44.54 63.15|Commander Chambers",
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


	--[[ Stormwind City ]]--

	[84] = {
		-- Stormheim - Greymane's Gambit
		[38206] = "Making the Rounds|10+ 38035 alliance|18.92 42.78|Sky Admiral Rogers",
		[39800] = "Greymane's Gambit|10+ 38206 alliance|18.66 51.1|Genn Greymane",
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
		-- Death Knight - The Four Horsemen
		[42534] = "Our Oldest Enemies|10+ deathknight 42533|19.45 67.31|Prince Galen Trollbane|artifact",
		[42535] = "Death... and Decay|10+ deathknight 42533|19.45 67.31|Prince Galen Trollbane|artifact",
		[42536] = "Regicide|10+ deathknight 42534 42535|19.52 67.09|Thassarian|artifact",
		[42537] = "The King Rises|10+ deathknight 42536|23.39 61.4|Thassarian|artifact",
	},


	--[[ Durotar ]]--

	[1] = {
		-- Stormheim - Greymane's Gambit
		[39698] = "Making the Rounds|10+ 38307 horde|61.37 8.86|Lady Sylvanas Windrunner",
		[39801] = "The Splintered Fleet|10+ 39698 horde|61.49 8.77|Lady Sylvanas Windrunner",

		-- Death Knight - The Four Horsemen
		[42484] = "The Firstborn Rises|10+ deathknight 42449|47.32 17.67|Thassarian|artifact",
	},
}