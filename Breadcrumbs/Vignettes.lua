local _, Data = ...

-- Vignettes

--[[
	Data Structure

	[MapID] = {
		[QuestID|"follower:id"] = "Name|Requirements|Coordinates|Location|Flags|Tooltip|Tooltip|Tooltip|...", -- Comments
	},
]]--

Data.Vignettes = {


	--[[ Isle of Dorn ]]--
	
	-- Dornogal
	[2339] = {
		-- Alchemy Treasure
		[83840] = "Earthen Iron Powder|alchemy skill:alchemy11:1|32.46 60.33||treasure item:226265|Contains|!{133592} [epic]Earthen Iron Powder]",
		
		-- Blacksmithing Treasure
		[83849] = "Dornogal Hammer|blacksmithing skill:blacksmithing11:1|47.59 26.22||treasure item:226277|Contains|!{133060} [epic]Dornogal Hammer]",

		-- Enchanting Treasure
		[83859] = "Silver Dornogal Rod|enchanting skill:enchanting11:1|58.04 56.98||treasure item:226285|Contains|!{610576} [epic]Silver Dornogal Rod]",

		-- Engineering Treasure
		[83867] = "Dornogal Spectacles|engineering skill:engineering11:1|64.86 52.86||treasure item:226293|Contains|!{3779053} [epic]Dornogal Spectacles]",
		
		-- Herbalism Treasure
		[83875] = "Dornogal Gardening Scythe|herbalism skill:herbalism11:1|59.25 23.54||treasure item:226301|Contains|!{1060569} [epic]Dornogal Gardening Scythe]",
		
		-- Inscription Treasure
		[83882] = "Dornogal Scribe's Quill|inscription skill:inscription11:1|57.26 46.86|\"Inside the Auction House\"|treasure item:226308|Contains|!{2103812} [epic]Dornogal Scribe's Quill]",
		
		-- Jewelcrafting Treasure
		[83891] = "Earthen Gem Pliers|jewelcrafting skill:jewelcrafting11:1|34.84 52.16||treasure item:226317|Contains|!{1020376} [epic]Earthen Gem Pliers]",
		
		-- Leatherworking Treasure
		[83898] = "Earthen Lacing Tools|leatherworking skill:leatherworking11:1|68.24 23.34||treasure item:226324|Contains|!{136247} [epic]Earthen Lacing Tools]",
		
		-- Mining Treasure
		[83907] = "Dornogal Chisel|mining skill:mining11:1|36.72 79.36||treasure item:226333|Contains|!{1059115} [epic]Dornogal Chisel]",
		
		-- Skinning Treasure
		[83914] = "Dornogal Carving Knife|skinning skill:skinning11:1|28.77 51.65|\"Inside the ALliance Embassy bulding\"|treasure item:226340|Contains|!{5404237} [epic]Dornogal Carving Knife]",
		
		-- Tailoring Treasure
		[83922] = "Dornogal Seam Ripper|tailoring skill:tailoring11:1|61.56 1851|\"Inside a building\"|treasure item:226348|Contains|!{464119} [epic]Dornogal Seam Ripper]",
	},

	-- Isle of Dorn
	[2248] = {
		-- Treasure
		[82325] = "Kobold Pickaxe|68+|62.57 43.27||treasure item:223484|Contains|!{5559853} [rare]Kobold Mastermind's \"Pivel\"]",
		--[82714] = "Infused Cinderbrew|68+|56.22 60.94||treasure item:224263|Contains|!{645193} [rare]Infused Fire-Honey Milk]", -- Repeatable?

		-- Alchemy Treasure
		[83840] = "Earthen Iron Powder|alchemy skill:alchemy11:1|45.37 47.14||treasure link:2339 item:226265|Contains|!{133592} [epic]Earthen Iron Powder]",
		[83841] = "Metal Dornogal Frame|alchemy skill:alchemy11:1|57.7 61.82||treasure item:226266|Contains|!{4622302} [epic]Metal Dornogal Frame]",

		-- Blacksmithing Treasure
		[83849] = "Dornogal Hammer|blacksmithing skill:blacksmithing11:1|49.09 38.76||treasure link:2339 item:226277|Contains|!{133060} [epic]Dornogal Hammer]",
		[83848] = "Ancient Earthen Anvil|blacksmithing skill:blacksmithing11:1|59.83 61.91||treasure item:226276|Contains|!{2356069} [epic]Ancient Earthen Anvil]",

		-- Enchanting Treasure
		[83859] = "Silver Dornogal Rod|enchanting skill:enchanting11:1|51.66 46.32||treasure link:2339 item:226285|Contains|!{610576} [epic]Silver Dornogal Rod]",
		[83856] = "Grinded Earthen Gem|enchanting skill:enchanting11:1|57.59 61.64||treasure item:226284|Contains|!{134388} [epic]Grinded Earthen Gem]",

		-- Engineering Treasure
		[83867] = "Dornogal Spectacles|engineering skill:engineering11:1|53.33 45.31||treasure link:2339 item:226293|Contains|!{3779053} [epic]Dornogal Spectacles]",
		[83866] = "Rock Engineer's Wrench|engineering skill:engineering11:1|61.35 69.57||treasure item:226292|Contains|!{134520} [epic]Rock Engineer's Wrench]",
		
		-- Herbalism Treasure
		[83875] = "Dornogal Gardening Scythe|herbalism skill:herbalism11:1|51.96 38.11||treasure link:2339 item:226301|Contains|!{1060569} [epic]Dornogal Gardening Scythe]",
		[83874] = "Ancient Flower|herbalism skill:herbalism11:1|57.54 61.46||treasure item:226300|Contains|!{134205} [epic]Ancient Flower]",
		
		-- Inscription Treasure
		[83882] = "Dornogal Scribe's Quill|inscription skill:inscription11:1|51.47 43.84||treasure link:2339 item:226308|Contains|!{2103812} [epic]Dornogal Scribe's Quill]",
		[83883] = "Historian's Dip Pen|inscription skill:inscription11:1|55.98 60.02|\"Inside a building\"|treasure item:226309|Contains|!{4419478} [epic]Historian's Dip Pen]",
		
		-- Jewelcrafting Treasure
		[83891] = "Earthen Gem Pliers|jewelcrafting skill:jewelcrafting11:1|45.96 45.14||treasure link:2339 item:226317|Contains|!{1020376} [epic]Earthen Gem Pliers]",
		[83890] = "Gentle Jewel Hammer|jewelcrafting skill:jewelcrafting11:1|63.53 66.88|\"In the basement of a building\"|treasure down item:226316|Contains|!{133055} [epic]Gentle Jewel Hammer]",
		
		-- Leatherworking Treasure
		[83898] = "Earthen Lacing Tools|leatherworking skill:leatherworking11:1|54.17 38.06||treasure link:2339 item:226324|Contains|!{136247} [epic]Earthen Lacing Tools]",
		[83899] = "Dornogal Craftsman's Flat Knife|leatherworking skill:leatherworking11:1|58.65 30.77||treasure item:226325|Contains|!{5545563} [epic]Dornogal Craftsman's Flat Knife]",
		
		-- Mining Treasure
		[83907] = "Dornogal Chisel|mining skill:mining11:1|46.42 51.82||treasure link:2339 item:226333|Contains|!{1059115} [epic]Dornogal Chisel]",
		[83906] = "Earthen Miner's Gavel|mining skill:mining11:1|58.18 62.04||treasure item:226332|Contains|!{2578727} [epic]Earthen Miner's Gavel]",
		
		-- Skinning Treasure
		[83914] = "Dornogal Carving Knife|skinning skill:skinning11:1|44.47 45.01||treasure link:2339 item:226340|Contains|!{5404237} [epic]Dornogal Carving Knife]",
		[83915] = "Earthen Worker's Beams|skinning skill:skinning11:1|60.04 28||treasure item:226341|Contains|!{135435} [epic]Earthen Worker's Beams]",
		
		-- Tailoring Treasure
		[83922] = "Dornogal Seam Ripper|tailoring skill:tailoring11:1|52.52 36.87||treasure link:2339 item:226348|Contains|!{464119} [epic]Dornogal Seam Ripper]",
		[83923] = "Earthen Tape Measure|tailoring skill:tailoring11:1|56.2 61.02||treasure item:226349|Contains|!{134510} [epic]Earthen Tape Measure]",
	},


	--[[ The Ringing Deeps ]]--

	[2214] = {
		-- Treasure
		[82239] = "Discarded Toolbox|68+|45.51 17.45||treasure item:224644|Contains|!{4548872} [rare]Lava-Forged Cogwheel]|!{2967113} [Resonance Crystals]",
		[82235] = "Munderut's Forgotten Stash|68+|55.39 13.85||treasure item:212505|Contains|!{5931413} [rare]Extravagant Emerald]|!{5931416} [rare]Radiant Ruby]|!{5931414} [rare]Stunning Sapphire]|!{5931415} [uncommon]Ambivalent Amber] (2)",
		[83030] = "Waterlogged Refuse|68+|66.19 33.41||treasure|Contains|!{2967113} [Resonance Crystals]",
		[82230] = "Cursed Pickaxe|68+|63.08 63.11||treasure item:224837|Contains|!{5873892} [rare]Cursed Pickaxe]|!{2967113} [Resonance Crystals]",
		[82818] = "Scary Dark Chest|68+|58.93 30.28|\"Light all the nearby [Candle Stubs] to unlock the treasure\"|treasure atlas:VignetteLootElite item:224439|Contains|!{5869499} [rare]Oop'lajax]|!{2967113} [Resonance Crystals]",

		-- Alchemy Treasure
		[83843] = "Engraved Stirring Rod|alchemy skill:alchemy11:1|64.96 61.75|\"Inside a building\"|treasure item:226268|Contains|!{237445} [epic]Engraved Stirring Rod]",
		[83842] = "Reinforced Beaker|alchemy skill:alchemy11:1|42.21 24.18|\"Inside a building\"|treasure item:226267|Contains|!{134870} [epic]Reinforced Beaker]",
		
		-- Blacksmithing Treasure
		[83850] = "Ringing Hammer Vise|blacksmithing skill:blacksmithing11:1|47.7 33.16||treasure item:226278|Contains|!{4559194} [epic]Ringing Hammer Vise]",
		[83851] = "Earthen Chisels|blacksmithing skill:blacksmithing11:1|60.53 53.67||treasure item:226279|Contains|!{1059123} [epic]Earthen Chisels]",

		-- Enchanting Treasure
		[83861] = "Animated Enchanting Dust|enchanting skill:enchanting11:1|67.19 65.89||treasure item:226287|Contains|!{133851} [epic]Animated Enchanting Dust]",
		[83860] = "Soot-Coated Orb|enchanting skill:enchanting11:1|44.61 22.13||treasure item:226286|Contains|!{236514} [epic]Soot-Coated Orb]",

		-- Engineering Treasure
		[83869] = "Earthen Construct Blueprints|engineering skill:engineering11:1|64.49 58.74|\"Inside a building\"|treasure item:226295|Contains|!{2915721} [epic]Earthen Construct Blueprints]",
		[83868] = "Inert Mining Bomb|engineering skill:engineering11:1|42.62 27.25||treasure item:226294|Contains|!{133709} [epic]Inert Mining Bomb]",
		
		-- Herbalism Treasure
		[83877] = "Fungarian Slicer's Knife|herbalism skill:herbalism11:1|52.91 65.82||treasure item:226303|Contains|!{5169125} [epic]Fungarian Slicer's Knife]",
		[83876] = "Earthen Digging Fork|herbalism skill:herbalism11:1|48.24 35.04|\"On top of a table inside a house\"|treasure item:226302|Contains|!{5874233} [epic]Earthen Digging Fork]",
		
		-- Inscription Treasure
		[83885] = "Blue Earthen Pigment|inscription skill:inscription11:1|62.46 58.01|\"Inside a building\"|treasure item:226311|Contains|!{237157} [epic]Blue Earthen Pigment]",
		[83884] = "Runic Scroll|inscription skill:inscription11:1|48.55 34.31|\"Inside a building\"|treasure item:226310|Contains|!{1500889} [epic]Runic Scroll]",
		
		-- Jewelcrafting Treasure
		[83893] = "Jeweler's Delicate Drill|jewelcrafting skill:jewelcrafting11:1|56.99 54.53||treasure item:226319|Contains|!{133056} [epic]Jeweler's Delicate Drill]",
		[83892] = "Carved Stone File|jewelcrafting skill:jewelcrafting11:1|48.48 35.12|\"Inside a building\"|treasure item:226318|Contains|!{519379} [epic]Carved Stone File]",
		
		-- Leatherworking Treasure
		[83900] = "Underground Stropping Compound|leatherworking skill:leatherworking11:1|47.05 34.89|\"Inside a building\"|treasure item:226326|Contains|!{2066015} [epic]Underground Stropping Compound]",
		[83901] = "Earthen Awl|leatherworking skill:leatherworking11:1|64.28 65.28||treasure item:226327|Contains|!{4635252} [epic]Earthen Awl]",
		
		-- Mining Treasure
		[83909] = "Regenerating Ore|mining skill:mining11:1|66.26 66.24||treasure item:226335|Contains|!{961633} [epic]Regenerating Ore]",
		[83908] = "Earthen Excavator's Shovel|mining skill:mining11:1|49.42 27.53||treasure item:226334|Contains|!{134436} [epic]Earthen Excavator's Shovel]",
		
		-- Skinning Treasure
		[83916] = "Artisan's Drawing Knife|skinning skill:skinning11:1|47.3 28.33||treasure item:226342|Contains|!{1064503} [epic]Artisan's Drawing Knife]",
		[83917] = "Fungarian's Rich Tannin|skinning skill:skinning11:1|65.7 61.9||treasure item:226343|Contains|!{134382} [epic]Fungarian's Rich Tannin]",
		
		-- Tailoring Treasure
		[83925] = "Earthen Stitcher's Snips|tailoring skill:tailoring11:1|64.15 60.32||treasure item:226351|Contains|!{463557} [epic]Earthen Stitcher's Snips]",
		[83924] = "Runed Earthen Pins|tailoring skill:tailoring11:1|48.83 32.87|\"Deep inside the basement of the Gundargaz inn\"|treasure item:226350|Contains|!{454058} [epic]Runed Earthen Pins]",
	},


	--[[ Hallowfall ]]--

	[2215] = {
		-- Treasure
		[81978] = "Lost Memento|68+|50.05 13.83||treasure item:224575|Contains|!{133278} [rare]Lightbearer's Pendant]|!{2967113} [Resonance Crystals]",

		-- Alchemy Treasure
		[83844] = "Chemist's Purified Water|alchemy skill:alchemy11:1|42.65 55.1||treasure item:226269|Contains|!{132852} [epic]Chemist's Purified Water]",
		[83845] = "Sanctified Mortar and Pestle|alchemy skill:alchemy11:1|41.66 55.84|\"Bottom floor of the orphanage building\"|treasure item:226270|Contains|!{236229} [epic]Sanctified Mortar and Pestle]",
		
		-- Blacksmithing Treasure
		[83853] = "Radiant Tongs|blacksmithing skill:blacksmithing11:1|44.06 55.59||treasure item:226281|Contains|!{1020384} [epic]Radiant Tongs]",
		[83852] = "Holy Flame Forge|blacksmithing skill:blacksmithing11:1|47.58 61.06||treasure item:226280|Contains|!{1723995} [epic]Holy Flame Forge]",

		-- Enchanting Treasure
		[83863] = "Enchanted Arathi Scroll|enchanting skill:enchanting11:1|48.59 64.51|\"Inside the Althal Lab\"|treasure item:226289|Contains|!{4549168} [epic]Enchanted Arathi Scroll]",
		[83862] = "Essence of Holy Fire|enchanting skill:enchanting11:1|40.05 70.55|\"Inside the tower\"|treasure item:226288|Contains|!{535593} [epic]Essence of Holy Fire]",

		-- Engineering Treasure
		[83871] = "Arathi Safety Gloves|engineering skill:engineering11:1|41.63 48.93|\"Inside the skiff\"|treasure item:226297|Contains|!{133816} [epic]Arathi Safety Gloves]",
		[83870] = "Holy Firework Dud|engineering skill:engineering11:1|46.32 61.35||treasure item:226296|Contains|!{134286} [epic]Holy Firework Dud]",

		-- Herbalism Treasure
		[83879] = "Arathi Herb Pruner|herbalism skill:herbalism11:1|35.98 55.01||treasure item:226305|Contains|!{135653} [epic]Arathi Herb Pruner]",
		[83878] = "Arathi Garden Trowel|herbalism skill:herbalism11:1|47.78 63.32||treasure item:226304|Contains|!{1060568} [epic]Arathi Garden Trowel]",
		
		-- Inscription Treasure
		[83887] = "Calligrapher's Chiseled Marker|inscription skill:inscription11:1|42.83 49.07|\"In the tower\"|treasure item:226313|Contains|!{4620676} [epic]Calligrapher's Chiseled Marker]",
		[83886] = "Informant's Fountain Pen|inscription skill:inscription11:1|43.25 58.94||treasure item:226312|Contains|!{237171} [epic]Informant's Fountain Pen]",
		
		-- Jewelcrafting Treasure
		[83895] = "Librarian's Magnifiers|jewelcrafting skill:jewelcrafting11:1|44.69 50.97|\"Upstairs\"|treasure item:226321|Contains|!{4419344} [epic]Librarian's Magnifiers]",
		[83894] = "Arathi Sizing Gauges|jewelcrafting skill:jewelcrafting11:1|47.39 60.68|\"On top of a shelf\"|treasure item:226320|Contains|!{134509} [epic]Arathi Sizing Gauges]",
		
		-- Leatherworking Treasure
		[83903] = "Arathi Leather Burnisher|leatherworking skill:leatherworking11:1|41.5 57.83||treasure item:226329|Contains|!{135660} [epic]Arathi Leather Burnisher]",
		[83902] = "Arathi Beveler Set|leatherworking skill:leatherworking11:1|47.51 65.13||treasure item:226328|Contains|!{4635253} [epic]Arathi Beveler Set]",
		
		-- Mining Treasure
		[83911] = "Devout Archaeologist's Excavator|mining skill:mining11:1|43.1 56.85||treasure item:226337|Contains|!{5874233} [epic]Devout Archaeologist's Excavator]",
		[83910] = "Arathi Precision Drill|mining skill:mining11:1|46.07 64.39|\"Underneath the porch\"|treasure item:226336|Contains|!{135657} [epic]Arathi Precision Drill]",
		
		-- Skinning Treasure
		[83919] = "Arathi Craftsman's Spokeshave|skinning skill:skinning11:1|42.3 53.93|\"Inside a building\"|treasure item:226345|Contains|!{511729} [epic]Arathi Craftsman's Spokeshave]",
		[83918] = "Arathi Tanning Agent|skinning skill:skinning11:1|49.36 62.15|\"Inside the house\"|treasure item:226344|Contains|!{133587} [epic]Arathi Tanning Agent]",
		
		-- Tailoring Treasure
		[83926] = "Arathi Rotary Cutter|tailoring skill:tailoring11:1|49.32 62.31||treasure item:226352|Contains|!{237507} [epic]Arathi Rotary Cutter]",
		[83927] = "Royal Outfitter's Protractor|tailoring skill:tailoring11:1|40.09 68.13|\"Inside the pavillion\"|treasure item:226353|Contains|!{133878} [epic]Royal Outfitter's Protractor]",
	},


	--[[ Azj-Kahet ]]--
	
	-- Azj-Kahet
	[2255] = {
		-- Treasure
		[82721] = "Niffen Stash|68+|54.51 50.7|\"Under the bridge\"|treasure atlas:VignetteLootElite item:204790|Contains|!{5869499} [Strong Sniffin' Soup for Niffen] (3)|!{4549280} [Kej] (45)",

		-- Alchemy Treasure
		[83847] = "Dark Apothecary's Vial|alchemy skill:alchemy11:1|42.82 57.36|\"Inside the tower\"|treasure item:226272|Contains|!{463861} [epic]Dark Apothecary's Vial]",
		[83846] = "Nerubian Mixing Salts|alchemy skill:alchemy11:1|47.13 69.65||treasure link:2213 item:226271|Contains|!{1387651} [epic]Nerubian Mixing Salts]",
		[82633] = "[neutral]Siesbarg]|alchemy skill:alchemy11:1 -item:224024|47.19 69.57||treasure atlas:banker link:2213 item:224024|Sells|!{4624658} [rare]Theories of Bodily Transmutation, Chapter 8]",
		
		-- Blacksmithing Treasure
		[83855] = "Spiderling's Wire Brush|blacksmithing skill:blacksmithing11:1|52.96 51.26|\"Inside a building\"|treasure item:226283|Contains|!{5546082} [epic]Spiderling's Wire Brush]",
		[83854] = "Nerubian Smith's Kit|blacksmithing skill:blacksmithing11:1|47.56 73.02||treasure link:2213 item:226282|Contains|!{465841} [epic]Nerubian Smith's Kit]",
		[82631] = "[neutral]Rakka]|blacksmithing skill:blacksmithing11:1 -item:224038|47.6 72.69||treasure atlas:banker link:2213 item:224038|Sells|!{4624661} [rare]Smithing After Saronite]",

		-- Enchanting Treasure
		[83865] = "Void Shard|enchanting skill:enchanting11:1|57.35 44.03||treasure item:226291|Contains|!{1003592} [epic]Void Shard]",
		[83864] = "Book of Dark Magic|enchanting skill:enchanting11:1|52.86 72.71||treasure link:2213 item:226290|Contains|!{133737} [epic]Book of Dark Magic]",
		[82635] = "[neutral]Iliani]|enchanting skill:enchanting11:1 -item:224050|47.19 76.74||treasure atlas:banker link:2213 item:224050|Sells|!{4624666} [rare]Web Sparkles: Pretty and Powerful]",

		-- Engineering Treasure
		[83872] = "Puppeted Mechanical Spider|engineering skill:engineering11:1|56.85 38.58|\"On a table inside The Trap Door\"|treasure item:226298|Contains|!{2027945} [epic]Puppeted Mechanical Spider]",
		[83873] = "Emptied Venom Canister|engineering skill:engineering11:1|53.36 68.93||treasure link:2213 item:226299|Contains|!{967528} [epic]Emptied Venom Canister]",
		
		-- Herbalism Treasure
		[83880] = "Web-Entangled Lotus|herbalism skill:herbalism11:1|50.38 72.31||treasure link:2213 item:226306|Contains|!{876365} [epic]Web-Entangled Lotus]",
		[83881] = "Tunneler's Shovel|herbalism skill:herbalism11:1|47.65 70.65||treasure link:2213 item:226307|Contains|!{134435} [epic]Tunneler's Shovel]",
		
		-- Inscription Treasure
		[83888] = "Nerubian Texts|inscription skill:inscription11:1|55.83 43.9||treasure item:226314|Contains|!{133733} [epic]Nerubian Texts]",
		[83889] = "Venomancer's Ink Well|inscription skill:inscription11:1|48.85 75.70||treasure link:2213 item:226315|Contains|!{464026} [epic]Venomancer's Ink Well]",
		[82636] = "[neutral]Nuel Prill]|inscription skill:inscription11:1|46.06 74.53 -item:224053||treasure atlas:banker link:2213 item:224053|Sells|!{4624734} [rare]Eight Views on Defense against Hostile Runes]",
		
		-- Jewelcrafting Treasure
		[83897] = "Nerubian Bench Blocks|jewelcrafting skill:jewelcrafting11:1|56.17 58.65|\"Inside the tower\"|treasure item:226323|Contains|!{1060564} [epic]Nerubian Bench Blocks]",
		[83896] = "Ritual Caster's Crystal|jewelcrafting skill:jewelcrafting11:1|48.01 71.83||treasure link:2213 item:226322|Contains|!{132885} [epic]Ritual Caster's Crystal]",
		[82637] = "[neutral]Alvus Valavulu]|jewelcrafting skill:jewelcrafting11:1 -item:224054|47.99 71.56||treasure atlas:banker link:2213 item:224054|Sells|!{4624833} [rare]Emergent Crystals of the Surface-Dwellers]",

		-- Leatherworking Treasure
		[83905] = "Curved Nerubian Skinning Knife|leatherworking skill:leatherworking11:1|59.99 54.01||treasure item:226331|Contains|!{464119} [epic]Curved Nerubian Skinning Knife]",
		[83904] = "Nerubian Tanning Mallet|leatherworking skill:leatherworking11:1|50.53 74.43||treasure link:2213 item:226330|Contains|!{1059113} [epic]Nerubian Tanning Mallet]",
		[82626] = "[neutral]Kama]|leatherworking -skinning,82596 skill:leatherworking11:1 -item:224056|46.31 72.12||treasure atlas:banker link:2213 item:224056|Sells|!{4624911} [rare]Uses for Leftover Husks (After You Take Them Apart)]",

		-- Mining Treasure
		[83912] = "Heavy Spider Crusher|mining skill:mining11:1|47.66 72.6||treasure link:2213 item:226338|Contains|!{133046} [epic]Heavy Spider Crusher]",
		[83913] = "Nerubian Mining Cart|mining skill:mining11:1|48.07 79.21||treasure down link:2216 item:226339|Contains|!{4202229} [epic]Nerubian Mining Supplies]",
		[82614] = {
			"[neutral]Rakka]|mining -blacksmithing,82631,item:224038 skill:mining11:1 -item:224055|47.6 72.69||treasure atlas:banker link:2213 item:224055|Sells|!{4625027} [rare]A Rocky Start]",
			"[neutral]Rakka]|mining blacksmithing -82631 skill:mining11:1,skill:blacksmithing11:1 -item:224055 -item:224038|47.6 72.69||treasure atlas:banker link:2213 item:224055|Sells|!{4625027} [rare]A Rocky Start]|!{4624661} [rare]Smithing After Saronite]",
		},

		-- Skinning Treasure
		[83921] = "Carapace Shiner|skinning skill:skinning11:1|56.54 55.24||treasure item:226347|Contains|!{135034} [epic]Carapace Shiner]",
		[83920] = "Nerubian's Slicking Iron|skinning skill:skinning11:1|46.85 82.28||treasure down link:2216 item:226346|Contains|!{135655} [epic]Nerubian's Slicking Iron]",
		[82596] = {
			"[neutral]Kama]|skinning -leatherworking,82626,item:224056 skill:skinning11:1 -item:224007|46.31 72.12||treasure atlas:banker link:2213 item:224007|Sells|!{4624664} [rare]Uses for Leftover Husks (How to Take Them Apart)]",
			"[neutral]Kama]|skinning leatherworking -82626 skill:skinning11:1,skill:leatherworking11:1 -item:224007 -item:224056|46.31 72.12||treasure atlas:banker link:2213 item:224007|Sells|!{4624664} [rare]Uses for Leftover Husks (How to Take Them Apart)]|!{4624911} [rare]Uses for Leftover Husks (After You Take Them Apart)]",
		},
		
		-- Tailoring Treasure
		[83928] = "Nerubian Quilt|tailoring skill:tailoring11:1|53.27 53.12|\"Inside a building\"|treasure item:226354|Contains|!{1379171} [epic]Nerubian Quilt]",
		[83929] = "Nerubian's Pincushion|tailoring skill:tailoring11:1|48.89 70.89||treasure link:2213 item:226355|Contains|!{1044082} [epic]Nerubian's Pincushion]",
		[82634] = "[neutral]Saaria]|tailoring skill:tailoring11:1 -item:224036|48.91 70.95||treasure atlas:banker link:2213 item:224036|Sells|!{4625110} [rare]And That's A Web-Wrap!]",
	},

	-- City of Threads
	[2213] = {
		-- Alchemy Treasure
		[83846] = "Nerubian Mixing Salts|alchemy skill:alchemy11:1|45.29 13.24|\"Inside a building\"|treasure item:226271|Contains|!{1387651} [epic]Nerubian Mixing Salts]",
		[82633] = "[neutral]Siesbarg]|alchemy skill:alchemy11:1 -item:224024|45.46 13.02||treasure atlas:banker item:224024|Sells|!{4624658} [rare]Theories of Bodily Transmutation, Chapter 8]",

		-- Blacksmithing Treasure
		[83854] = "Nerubian Smith's Kit|blacksmithing skill:blacksmithing11:1|46.52 22.91||treasure item:226282|Contains|!{465841} [epic]Nerubian Smith's Kit]",
		[82631] = "[neutral]Rakka]|blacksmithing skill:blacksmithing11:1 -item:224038|46.64 21.96||treasure atlas:banker item:224038|Sells|!{4624661} [rare]Smithing After Saronite]",

		-- Enchanting Treasure
		[83864] = "Book of Dark Magic|enchanting skill:enchanting11:1|61.72 22||treasure item:226290|Contains|!{133737} [epic]Book of Dark Magic]",
		[82635] = "[neutral]Iliani]|enchanting skill:enchanting11:1 -item:224050|45.46 33.58|\"Inside the Infuser building\"|treasure atlas:banker item:224050|Sells|!{4624666} [rare]Web Sparkles: Pretty and Powerful]",
		
		-- Engineering Treasure
		[83873] = "Emptied Venom Canister|engineering skill:engineering11:1|63.14 11.16||treasure item:226299|Contains|!{967528} [epic]Emptied Venom Canister]",

		-- Herbalism Treasure
		[83880] = "Web-Entangled Lotus|herbalism skill:herbalism11:1|54.6 20.88||treasure item:226306|Contains|!{876365} [epic]Web-Entangled Lotus]",
		[83881] = "Tunneler's Shovel|herbalism skill:herbalism11:1|46.78 16.13||treasure item:226307|Contains|!{134435} [epic]Tunneler's Shovel]",
		
		-- Inscription Treasure
		[83889] = "Venomancer's Ink Well|inscription skill:inscription11:1|50.23 30.84|\"Inside a building\"|treasure item:226315|Contains|!{464026} [epic]Venomancer's Ink Well]",
		[82636] = "[neutral]Nuel Prill]|inscription skill:inscription11:1|42.23 27.23 -item:224053|\"Inside a building\"|treasure atlas:banker item:224053|Sells|!{4624734} [rare]Eight Views on Defense against Hostile Runes]",
		
		-- Jewelcrafting Treasure
		[83896] = "Ritual Caster's Crystal|jewelcrafting skill:jewelcrafting11:1|47.81 19.5|\"On top of a table\"|treasure item:226322|Contains|!{132885} [epic]Ritual Caster's Crystal]",
		[82637] = "[neutral]Alvus Valavulu]|jewelcrafting skill:jewelcrafting11:1 -item:224054|47.75 18.73||treasure atlas:banker item:224054|Sells|!{4624833} [rare]Emergent Crystals of the Surface-Dwellers]",
		
		-- Leatherworking Treasure
		[83904] = "Nerubian Tanning Mallet|leatherworking skill:leatherworking11:1|55.03 26.94|\"Inside the tower\"|treasure item:226330|Contains|!{1059113} [epic]Nerubian Tanning Mallet]",
		[82626] = "[neutral]Kama]|leatherworking -skinning,82596 skill:leatherworking11:1 -item:224056|42.93 20.33||treasure atlas:banker item:224056|Sells|!{4624911} [rare]Uses for Leftover Husks (After You Take Them Apart)]",

		-- Mining Treasure
		[83912] = "Heavy Spider Crusher|mining skill:mining11:1|46.82 21.71||treasure item:226338|Contains|!{133046} [epic]Heavy Spider Crusher]",
		[83913] = "Nerubian Mining Cart|mining skill:mining11:1|47.96 40.63||treasure down link:2216 item:226339|Contains|!{4202229} [epic]Nerubian Mining Supplies]",
		[82614] = {
			"[neutral]Rakka]|mining -blacksmithing,82631,item:224038 skill:mining11:1 -item:224055|46.64 21.96||treasure atlas:banker item:224055|Sells|!{4625027} [rare]A Rocky Start]",
			"[neutral]Rakka]|mining blacksmithing -82631 skill:mining11:1,skill:blacksmithing11:1 -item:224055 -item:224038|46.64 21.96||treasure atlas:banker item:224055|Sells|!{4625027} [rare]A Rocky Start]|!{4624661} [rare]Smithing After Saronite]",
		},

		-- Skinning Treasure
		[83920] = "Nerubian's Slicking Iron|skinning skill:skinning11:1|44.48 49.46||treasure down link:2216 item:226346|Contains|!{135655} [epic]Nerubian's Slicking Iron]",
		[82596] = {
			"[neutral]Kama]|skinning -leatherworking,82626,item:224056 skill:skinning11:1 -item:224007|42.93 20.33||treasure atlas:banker item:224007|Sells|!{4624664} [rare]Uses for Leftover Husks (How to Take Them Apart)]",
			"[neutral]Kama]|skinning leatherworking -82626 skill:skinning11:1,skill:leatherworking11:1 -item:224007 -item:224056|42.93 20.33||treasure atlas:banker item:224007|Sells|!{4624664} [rare]Uses for Leftover Husks (How to Take Them Apart)]|!{4624911} [rare]Uses for Leftover Husks (After You Take Them Apart)]",
		},

		-- Tailoring Treasure
		[83929] = "Nerubian's Pincushion|tailoring skill:tailoring11:1|50.32 16.81||treasure item:226355|Contains|!{1044082} [epic]Nerubian's Pincushion]",
		[82634] = "[neutral]Saaria]|tailoring skill:tailoring11:1 -item:224036|50.39 16.97||treasure atlas:banker item:224036|Sells|!{4625110} [rare]And That's A Web-Wrap!]",
	},

	-- City of Threads - Lower (The Burrows)
	[2216] = {
		-- Alchemy Treasure
		[83846] = "Nerubian Mixing Salts|alchemy skill:alchemy11:1|45.29 13.24||treasure up link:2213 item:226271|Contains|!{1387651} [epic]Nerubian Mixing Salts]",
		[82633] = "[neutral]Siesbarg]|alchemy skill:alchemy11:1 -item:224024|45.46 13.02||treasure atlas:banker up link:2213 item:224024|Sells|!{4624658} [rare]Theories of Bodily Transmutation, Chapter 8]",

		-- Blacksmithing Treasure
		[83854] = "Nerubian Smith's Kit|blacksmithing skill:blacksmithing11:1|46.52 22.91||treasure up link:2213 item:226282|Contains|!{465841} [epic]Nerubian Smith's Kit]",
		[82631] = "[neutral]Rakka]|blacksmithing skill:blacksmithing11:1 -item:224038|46.64 21.96||treasure up atlas:banker link:2213 item:224038|Sells|!{4624661} [rare]Smithing After Saronite]",

		-- Enchanting Treasure
		[83864] = "Book of Dark Magic|enchanting skill:enchanting11:1|61.72 22||treasure up link:2213 item:226290|Contains|!{133737} [epic]Book of Dark Magic]",
		[82635] = "[neutral]Iliani]|enchanting skill:enchanting11:1 -item:224050|45.46 33.58|\"Inside the Infuser building\"|treasure atlas:banker up link:2213 item:224050|Sells|!{4624666} [rare]Web Sparkles: Pretty and Powerful]",

		-- Engineering Treasure
		[83873] = "Emptied Venom Canister|engineering skill:engineering11:1|63.14 11.16||treasure up link:2213 item:226299|Contains|!{967528} [epic]Emptied Venom Canister]",

		-- Herbalism Treasure
		[83880] = "Web-Entangled Lotus|herbalism skill:herbalism11:1|54.6 20.88||treasure up link:2213 item:226306|Contains|!{876365} [epic]Web-Entangled Lotus]",
		[83881] = "Tunneler's Shovel|herbalism skill:herbalism11:1|46.78 16.13||treasure up link:2213 item:226307|Contains|!{134435} [epic]Tunneler's Shovel]",

		-- Inscription Treasure
		[83889] = "Venomancer's Ink Well|inscription skill:inscription11:1|50.23 30.84||treasure up link:2213 item:226315|Contains|!{464026} [epic]Venomancer's Ink Well]",
		[82636] = "[neutral]Nuel Prill]|inscription skill:inscription11:1 -item:224053|42.23 27.23||treasure atlas:banker up link:2213 item:224053|Sells|!{4624734} [rare]Eight Views on Defense against Hostile Runes]",
		
		-- Jewelcrafting Treasure
		[83896] = "Ritual Caster's Crystal|jewelcrafting skill:jewelcrafting11:1|47.81 19.5||treasure up link:2213 item:226322|Contains|!{132885} [epic]Ritual Caster's Crystal]",
		[82637] = "[neutral]Alvus Valavulu]|jewelcrafting skill:jewelcrafting11:1 -item:224054|47.75 18.73||treasure atlas:banker up link:2213 item:224054|Sells|!{4624833} [rare]Emergent Crystals of the Surface-Dwellers]",
		
		-- Leatherworking Treasure
		[83904] = "Nerubian Tanning Mallet|leatherworking skill:leatherworking11:1|55.03 26.94||treasure up link:2213 item:226330|Contains|!{1059113} [epic]Nerubian Tanning Mallet]",
		[82626] = "[neutral]Kama]|leatherworking -skinning,82596 skill:leatherworking11:1 -item:224056|42.93 20.33||treasure atlas:banker up link:2213 item:224056|Sells|!{4624911} [rare]Uses for Leftover Husks (After You Take Them Apart)]",
		
		-- Mining Treasure
		[83912] = "Heavy Spider Crusher|mining skill:mining11:1|46.82 21.71||treasure up link:2213 item:226338|Contains|!{133046} [epic]Heavy Spider Crusher]",
		[83913] = "Nerubian Mining Cart|mining skill:mining11:1|47.96 40.63||treasure item:226339|Contains|!{4202229} [epic]Nerubian Mining Supplies]",
		[82614] = {
			"[neutral]Rakka]|mining -blacksmithing,82631,item:224038 skill:mining11:1 -item:224055|46.64 21.96||treasure atlas:banker up link:2213 item:224055|Sells|!{4625027} [rare]A Rocky Start]",
			"[neutral]Rakka]|mining blacksmithing -82631 skill:mining11:1,skill:blacksmithing11:1 -item:224055 -item:224038|46.64 21.96||treasure atlas:banker up link:2213 item:224055|Sells|!{4625027} [rare]A Rocky Start]|!{4624661} [rare]Smithing After Saronite]",
		},

		-- Skinning Treasure
		[83920] = "Nerubian's Slicking Iron|skinning skill:skinning11:1|44.48 49.46|\"Inside the Warehouse building\"|treasure item:226346|Contains|!{135655} [epic]Nerubian's Slicking Iron]",
		[82596] = {
			"[neutral]Kama]|skinning -leatherworking,82626,item:224056 skill:skinning11:1 -item:224007|42.93 20.33||treasure atlas:banker up link:2213 item:224007|Sells|!{4624664} [rare]Uses for Leftover Husks (How to Take Them Apart)]",
			"[neutral]Kama]|skinning leatherworking -82626 skill:skinning11:1,skill:leatherworking11:1 -item:224007 -item:224056|42.93 20.33||treasure atlas:banker up link:2213 item:224007|Sells|!{4624664} [rare]Uses for Leftover Husks (How to Take Them Apart)]|!{4624911} [rare]Uses for Leftover Husks (After You Take Them Apart)]",
		},

		-- Tailoring Treasure
		[83929] = "Nerubian's Pincushion|tailoring skill:tailoring11:1|50.32 16.81||treasure up link:2213 item:226355|Contains|!{1044082} [epic]Nerubian's Pincushion]",
		[82634] = "[neutral]Saaria]|tailoring skill:tailoring11:1 -item:224036|50.39 16.97||treasure atlas:banker up link:2213 item:224036|Sells|!{4625110} [rare]And That's A Web-Wrap!]",
	},

	
	--[[ Emerald Dream ]]--

	-- Emerald Dream
	[2200] = {
		-- Alchemy Treasure
		[78264] = "Half-Filled Dreamless Sleep Potion|60+ alchemy skill:alchemy10:25|54.05 32.64||treasure item:210184|Contains|!{134863} [epic]Half-Filled Dreamless Sleep Potion]",
		[78269] = {
			"Splash Potion of Narcolepsy|60+ §76506 alchemy skill:alchemy10:25|62.73 73.75|\"You are currently phased out from this treasure due to a world quest\"|treasure down link:2254 item:210185 atlas:vignetteloot-locked|Contains|!{463861} [epic]Splash Potion of Narcolepsy]",
			"Splash Potion of Narcolepsy|60+ ~76506 alchemy skill:alchemy10:25|62.73 73.75||treasure down link:2254 item:210185|Contains|!{463861} [epic]Splash Potion of Narcolepsy]",
		},
		[78275] = "Root of the Problem|60+ alchemy skill:alchemy10:25|36.21 46.63||treasure item:210190|Contains|!{236301} [epic]Blazeroot]",

		-- Blacksmithing Treasure
		[78417] = "Amirdrassil Defender's Shield|blacksmithing skill:blacksmithing10:25|49.83 62.98||treasure item:210464|Contains|!{5150876} [epic]Amirdrassil Defender's Shield]",
		[78418] = "Deathstalker Chassis|blacksmithing skill:blacksmithing10:25|36.34 46.79||treasure item:210465|Contains|!{464143} [epic]Deathstalker Chassis]",
		[78419] = "Flamesworn Render|blacksmithing skill:blacksmithing10:25|37.26 22.95||treasure item:210466|Contains|!{4392916} [epic]Flamesworn Render]",

		-- Engineering Treasure
		[78308] = "Pure Dream Water|enchanting skill:enchanting10:25|38.37 30.2||treasure item:210234|Contains|!{1020349} [epic]Pure Dream Water]",
		[78309] = "Everburning Core|enchanting skill:enchanting10:25|46.16 20.51||treasure item:210231|Contains|!{132839} [epic]Everburning Core]",
		[78310] = "Essence of Dreams|enchanting skill:enchanting10:25|66.36 74.2|\"On top of a floating branch\"|treasure item:210234|Contains|!{237556} [epic]Essence of Dreams]",

		-- Engineering Treasure
		[78278] = "Experimental Dreamcatcher|engineering skill:engineering10:25|39.58 52.27|\"On top of a floating branch\"|treasure item:210193|Contains|!{3694922} [epic]Experimental Dreamcatcher]",
		[78279] = {
			"Insomniotron|§76506 engineering skill:engineering10:25|62.65 74.79|\"You are currently phased out from this treasure due to a world quest\"|treasure down link:2254 item:210194 atlas:vignetteloot-locked|Contains|!{4548868} [epic]Insomniotron]",
			"Insomniotron|~76506 engineering skill:engineering10:25|62.65 74.79||treasure down link:2254 item:210194|Contains|!{4548868} [epic]Insomniotron]",
		},
		[78281] = "Unhatched Battery|engineering skill:engineering10:25|62.69 36.26||treasure item:210197|Contains|!{2032173} [epic]Unhatched Battery]",
		
		-- Inscription Treasure
		[78411] = "Winnie's Notes on Flora and Fauna|inscription skill:inscription10:25|55.64 27.49||treasure item:210458|Contains|!{133739} [epic]Winnie's Notes on Flora and Fauna]",
		[78412] = "Grove Keeper's Pillar|inscription skill:inscription10:25|63.5 71.52||treasure item:210459|Contains|!{5263786} [epic]Grove Keeper's Pillar]",
		[78413] = "Primalist Shadowbinding Rune|inscription skill:inscription10:25|36.04 46.64||treasure item:210460|Contains|!{4643988} [epic]Primalist Shadowbinding Rune]",
		
		-- Jewelcrafting Treasure
		[78282] = "Petrified Hope|jewelcrafting skill:jewelcrafting10:25|33.23 46.57||treasure item:210200|Contains|!{840007} [epic]Petrified Hope]",
		[78283] = "Unpolished Blemish|jewelcrafting skill:jewelcrafting10:25|43.51 33.36||treasure item:210201|Contains|!{646672} [epic]Handful of Pebbles]",
		[78285] = "Coalesced Dreamstone|jewelcrafting skill:jewelcrafting10:25|58.95 53.89||treasure item:210202|Contains|!{134104} [epic]Coalesced Dreamstone]",
		
		-- Leatherworking Treasure
		[78298] = "Tuft of Dreamsaber Fur|leatherworking skill:leatherworking10:25|41.75 66.49||treasure item:210208|Contains|!{1508485} [epic]Tuft of Dreamsaber Fur]",
		[78299] = "Molted Faerie Dragon Scales|leatherworking skill:leatherworking10:25|37.45 71.02||treasure item:210211|Contains|!{4559240} [epic]Molted Faerie Dragon Scales]",
		[78305] = "Dreamtalon Claw|leatherworking skill:leatherworking10:25|33.99 29.68||treasure item:210215|Contains|!{1508485} [epic]Dreamtalon Claw]",
		
		-- Tailoring Treasure
		[78414] = "Exceedingly Soft Wildercloth|tailoring skill:tailoring10:25|53.27 27.92||treasure item:210461|Contains|!{4549243} [epic]Exceedingly Soft Wildercloth]",
		[78415] = "Plush Pillow|tailoring skill:tailoring10:25|49.83 61.48||treasure item:210462|Contains|!{4624627} [epic]Plush Pillow]",
		[78416] = "Snuggle Buddy|tailoring skill:tailoring10:25|40.70 86.16||treasure item:210463|Contains|!{458256} [epic]Snuggle Buddy]",

		-- Treasure
		[78547] = "Unwaking Echo|70+|55.67 22.57|\"You must be sleeping to open the treasure\"|treasure item:210675|Contains|!{5173328} [rare]Gardener's Lightstaff]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
		[78550] = "Unwaking Echo|70+|69.57 52.84|\"You must be sleeping to open the treasure\"|treasure item:210686|Contains|!{1084301} [rare]Grovekeeper's Barrier]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
		[78551] = "Unwaking Echo|70+|55.32 45.38|\"You must be sleeping to open the treasure\"|treasure down item:210678|Contains|!{5171388} [rare]Verdant Gleaner's Scythe]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
		[78552] = "Unwaking Echo|70+|46.4 86.15|\"You must be sleeping to open the treasure\"|treasure item:210682|Contains|!{5169125} [rare]Camper's Knife]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
		[77858] = "Hidden Moonkin Stash|70+|47.49 34.85|\"On top of a floating branch\"|treasure item:210725|Contains|!{4067367} [rare]Owl Post]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
		[78120] = "Pineshrew Cache|70+|37.26 30.69||treasure item:210411|Contains|!{464030} [rare]Fast Growing Seed]",
		[77950] = "Crystalline Glowblossom|70+|39.11 65.52|\"Hanging from a tree branch\"|treasure item:208047|Contains|!{656681} [epic]Gigantic Dreamseed]",
		[77855] = {
			"Triflesnatch's Roving Trove|70+|42.23 56.3|\"Wake and follow the nearby [friendly]Triflesnatcher] to unlock the treasure\"|treasure item:208067 atlas:vignetteloot-locked|Contains|!{656679} [rare]Plump Dreamseed]",
			"Triflesnatcher|70+|39.72 52.15|Triflesnatch's Roving Trove|treasure atlas:questobjective",
		},
		[77857] = {
			"Triflesnatch's Roving Trove|77855|41.74 62.6|\"Wake and follow the nearby [friendly]Triflesnatcher] to unlock the treasure\"|treasure item:208067 atlas:vignetteloot-locked|Contains|!{656679} [rare]Plump Dreamseed]",
			"Triflesnatcher|77855|42.23 56.3|Triflesnatch's Roving Trove|treasure atlas:questobjective",
		},
		[77860] = {
			"Triflesnatch's Roving Trove|77857|34.09 56.35|\"Wake and follow the nearby [friendly]Triflesnatcher] to unlock the treasure\"|treasure item:208067 atlas:vignetteloot-locked|Contains|!{656679} [rare]Plump Dreamseed]",
			"Triflesnatcher|77857|41.74 62.6|Triflesnatch's Roving Trove|treasure atlas:questobjective",
		},
		[77872] = "Triflesnatch's Roving Trove|77860|34.09 56.35|\"On top of a floating branch\"|treasure item:208067|Contains|!{656679} [rare]Plump Dreamseed]",
		[78365] = {
			"Statue of the Ashen Panther|70+ §76506|63.43 72.98||treasure down item:210631 link:2254|Boon of Ashamane|{237473} [rare]Branch of Ashamane]",
			"Statue of the Ashen Panther|70+ ~76506|63.43 72.98||treasure down item:210631 link:2254|Boon of Ashamane|{237473} [rare]Branch of Ashamane]",
		},
		[78359] = "Boon of Ashamane|78365|63.39 73.04||treasure down item:210631 link:2254|Contains|{237473} [rare]Branch of Ashamane]",
		[78033] = {
			"Magical Bloom|70+ §76320 -achievement:19317:5|61.62 59.58|\"You are currently phased out from this treasure due to a quest\"|treasure item:208047 atlas:vignetteloot-locked|Contains|!{656681} [epic]Gigantic Dreamseed]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
			"Magical Bloom|70+ ~76320 -achievement:19317:5|61.62 59.58|\"Chase the nearby [unfriendly]Laughing Podling] to unlock the treasure\"|treasure item:208047 atlas:vignetteloot-locked|Contains|!{656681} [epic]Gigantic Dreamseed]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
			"[unfriendly]Laughing Podling]|70+ ~76320 -achievement:19317:5|64.34 61.31|Magical Bloom|treasure atlas:questobjective|\"First location\"",
			"[unfriendly]Laughing Podling]|70+ ~76320 -achievement:19317:5|62.95 60.39|Magical Bloom|treasure atlas:questobjective|\"Second location\"",
		},
		[78005] = {
			"Magical Bloom|78033 §76320 -achievement:19317:5|61.62 59.58|\"You are currently phased out from this treasure due to a quest\"|treasure item:208047 atlas:vignetteloot-locked|Contains|!{656681} [epic]Gigantic Dreamseed]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
			"Magical Bloom|78033 ~76320 -achievement:19317:5|61.62 59.58||treasure item:208047|Contains|!{656681} [epic]Gigantic Dreamseed]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
		},
		[78006] = "Odd Burl|70+|55.26 57.25|\"On top of a large tree\"|treasure item:208067|Contains|!{656679} [rare]Plump Dreamseed]|!{2065578} [Dragon Isles Supplies]||Grants Reputation|!{5244643} [Dream Wardens] (200)",
		[78095] = {
			"Statue of the Bear Lord|70+ pandaren|47.05 53.09||treasure item:210434|Boon of Ursol|!{1629944} [rare]Visage of Ursol]",
			"Statue of the Bear Lord|70+ druid -pandaren|47.05 53.09|\"Shift into {132276} [spell]Bear Form] to unlock the treasure\"|treasure item:210434|Boon of Ursol|!{1629944} [rare]Visage of Ursol]",
			"Statue of the Bear Lord|70+ -druid -pandaren|47.05 53.09|\"Use the nearby [Mark of Ursol] to unlock the treasure\"|treasure item:210434|Boon of Ursol|!{1629944} [rare]Visage of Ursol]",
			"[Mark of Ursol]|70+ -pandaren -druid|48.01 52.46|Statue of the Bear Lord|treasure atlas:questobjective",
		},
		[78107] = "Boon of Ursol|78095|47.08 53.05||treasure item:210434|Contains|!{1629944} [rare]Visage of Ursol]",
		[78367] = {
			"Statue of the Sky Mistress|70+ dracthyr|64.22 19.27||treasure item:210659|Boon of Aviana|!{237472} [rare]Branch of Aviana]",
			"Statue of the Sky Mistress|70+ druid -dracthyr|64.22 19.27|\"Shift into {132128} [spell]Flight Form] to unlock the treasure\"|treasure item:210659|Boon of Aviana|!{237472} [rare]Branch of Aviana]",
			"Statue of the Sky Mistress|70+ -druid -dracthyr|64.22 19.27|\"Use the nearby [Mark of Aviana] to unlock the treasure\"|treasure item:210659|Boon of Aviana|!{237472} [rare]Branch of Aviana]",
			"[Mark of Aviana]|70+ -dracthyr -druid|59.93 18.96|Statue of the Sky Mistress|treasure atlas:questobjective",
		},
		[78360] = "Boon of Aviana|78367|64.05 19.17||treasure item:210659|Contains|!{237472} [rare]Branch of Aviana]",
		[78368] = {
			"Statue of the Great Wolf|70+ worgen|32.94 83.23||treasure down item:210660|Boon of Goldrinn|!{3515606} [rare]Claw of Lo'Gosh]",
			"Statue of the Great Wolf|70+ shaman -worgen|32.94 83.23|\"Use {136095} [spell]Ghost Wolf] or the nearby [Mark of Goldrinn] to unlock the treasure\"|treasure down item:210660|Boon of Goldrinn|!{3515606} [rare]Claw of Lo'Gosh]",
			"Statue of the Great Wolf|70+ -shaman -worgen|32.94 83.23|\"Use the nearby [Mark of Goldrinn] to unlock the treasure\"|treasure down item:210660|Boon of Goldrinn|!{3515606} [rare]Claw of Lo'Gosh]",
			"[Mark of Goldrinn]|70+ -worgen|34.5 82.65|Statue of the Great Wolf|treasure atlas:questobjective",
		},
		[78361] = "Boon of Goldrinn|78368|33.06 83.27||treasure down item:210660|Contains|!{3515606} [rare]Claw of Lo'Gosh]",

		-- Alara'shinu
		[78606] = "Landeron Felfury|70+ demonhunter|50.54 60.97||treasure speak item:210961|\"Speaking to Landeron Felfury is the first step in unlocking the secret warglaive [epic]Alara'shinu]\"",
		[78622] = "Alara'shinu|70+ demonhunter 78606|50.54 60.97||treasure elsewhere link:646 item:210961|\"The next step in unlocking the secret warglaive [epic]Alara'shinu] takes place in Broken Shore\"",
		[78623] = "Alara'shinu|70+ demonhunter 78622|50.54 60.97||treasure elsewhere link:641 item:210961|\"The next step in unlocking the secret warglaive [epic]Alara'shinu] takes place in Val'sharah\"",
	},

	-- Barrows of Reverie
	[2254] = {
		-- Alchemy Treasure
		[78269] = {
			"Splash Potion of Narcolepsy|60+ §76506 alchemy skill:alchemy10:25|50.96 49.65|\"You are currently phased out from this treasure due to a world quest\"|treasure item:210185 atlas:vignetteloot-locked|Contains|!{463861} [epic]Splash Potion of Narcolepsy]",
			"Splash Potion of Narcolepsy|60+ ~76506 alchemy skill:alchemy10:25|50.96 49.65||treasure item:210185|Contains|!{463861} [epic]Splash Potion of Narcolepsy]",
		},

		-- Engineering Treasure
		[78279] = {
			"Insomniotron|§76506 engineering skill:engineering10:25|49.4 69.17|\"You are currently phased out from this treasure due to a world quest\"|treasure item:210194 atlas:vignetteloot-locked|Contains|!{4548868} [epic]Insomniotron]",
			"Insomniotron|~76506 engineering skill:engineering10:25|49.4 69.17||treasure item:210194|Contains|!{4548868} [epic]Insomniotron]",
		},

		-- Treasure
		[78365] = {
			"Statue of the Ashen Panther|70+ §76506|63.96 35.05|\"You are currently phased out from this treasure due to a world quest\"|treasure item:210631 atlas:vignetteloot-locked|Boon of Ashamane|{237473} [rare]Branch of Ashamane]",
			"Statue of the Ashen Panther|70+ ~76506 druid|63.96 35.05|\"Shift into {132115} [spell]Cat Form] to unlock the treasure\"|treasure item:210631|Boon of Ashamane|{237473} [rare]Branch of Ashamane]",
			"Statue of the Ashen Panther|70+ ~76506 hunter -nightelf|63.96 35.05|\"Use {461113} [spell]Camouflage] or the nearby [Mark of Ashamane] to unlock the treasure\"|treasure item:210631|Boon of Ashamane|{237473} [rare]Branch of Ashamane]",
			"Statue of the Ashen Panther|70+ ~76506 hunter nightelf|63.96 35.05|\"Use {461113} [spell]Camouflage], {132089} [spell]Shadowmeld] or the nearby [Mark of Ashamane] to unlock the treasure\"|treasure item:210631|Boon of Ashamane|{237473} [rare]Branch of Ashamane]",
			"Statue of the Ashen Panther|70+ ~76506 nightelf -druid -hunter|63.96 35.05|\"Use {132089} [spell]Shadowmeld] or the nearby [Mark of Ashamane] to unlock the treasure\"|treasure item:210631|Boon of Ashamane|{237473} [rare]Branch of Ashamane]",
			"Statue of the Ashen Panther|70+ ~76506 -nightelf -druid -hunter|63.96 35.05|\"Use the nearby [Mark of Ashamane] to unlock the treasure\"|treasure item:210631|Boon of Ashamane|{237473} [rare]Branch of Ashamane]",
			"[Mark of Ashamane]|70+ ~76506 -druid|62.5 60.07|Statue of the Ashen Panther|treasure atlas:questobjective",
		},
		[78359] = {
			"Boon of Ashamane|78365 §76506|63.51 36.24|\"You are currently phased out from this treasure due to a world quest\"|treasure item:210631 atlas:vignetteloot-locked|Contains|{237473} [rare]Branch of Ashamane]",
			"Boon of Ashamane|78365 ~76506|63.51 36.24||treasure item:210631|Contains|{237473} [rare]Branch of Ashamane]",
		},
	},

	
	--[[ Zaralek Cavern ]]--

	-- Zaralek Cavern
	[2133] = {
		-- Alchemy Treasure
		[75646] = "Malnourished Specimen|alchemy skill:alchemy10:25|52.68 18.3||treasure item:205211|Contains|!{1001622} [epic]Nutrient Diluted Protofluid]",
		[75649] = "Marrow-Ripened Slime|alchemy skill:alchemy10:25|62.12 41.12||treasure item:205212|Contains|!{3459153} [epic]Marrow-Ripened Slime]",
		[75651] = "Suspicious Mold|alchemy skill:alchemy10:25|40.43 59.21||treasure item:205213|Contains|!{959835} [epic]Suspicious Mold]",
		
		-- Blacksmithing Treasure
		[76078] = "Well-Worn Kiln|blacksmithing skill:blacksmithing10:25|57.15 54.67||treasure item:205986|Contains|!{5140835} [epic]Well-Worn Kiln]",
		[76079] = "Brimstone Rescue Ring|blacksmithing skill:blacksmithing10:25|48.31 22.01||treasure item:205987|Contains|!{2000808} [epic]Brimstone Rescue Ring]",
		[76080] = "Zaqali Elder Spear|blacksmithing skill:blacksmithing10:25|27.51 42.88||treasure item:205988|Contains|!{135124} [epic]Zaqali Elder Spear]",
		
		-- Enchanting Treasure
		[75508] = "Lava-Drenched Shadow Crystal|enchanting skill:enchanting10:25|48.25 17.02|\"Inside the lava sewage outflow cave underneath Brimstone Garrison\"|treasure item:204990|Contains|!{1003588} [epic]Lava-Drenched Shadow Crystal]",
		[75509] = "Shimmering Aqueous Orb|enchanting skill:enchanting10:25|62.38 53.79||treasure item:204999|Contains|!{132852} [epic]Shimmering Aqueous Orb]",
		[75510] = "Resonating Arcane Crystal|enchanting skill:enchanting10:25|36.65 69.34||treasure item:205001|Contains|!{237013} [epic]Resonating Arcane Crystal]",
		
		-- Engineering Treasure
		[75186] = "Busted Wyrmhole Generator|engineering skill:engineering10:25|37.83 58.85||treasure item:205954|Contains|!{4548860} [epic]Busted Wyrmhole Generator]|!{4635196} [rare]Three-Dimensional Compass]",
		[75183] = "Haphazardly Discarded Bombs|engineering skill:engineering10:25|48.15 27.89||treasure item:204470|Contains|!{133710} [epic]Haphazardly Discarded Bomb]",
		[75433] = "Molten Scoutbot|engineering skill:engineering10:25|48.12 16.6|\"Inside the lava sewage outflow cave underneath Brimstone Garrison\"|treasure item:204855|Contains|!{2735923} [epic]Overclocked Determination Core]",
		[75180] = "Misplaced Aberrus Outflow Blueprints|engineering skill:engineering10:25|48.48 48.64||treasure item:204469|Contains|!{1392956} [epic]Misplaced Aberrus Outflow Blueprints]",
		[75184] = "Defective Survival Pack|engineering skill:engineering10:25|50.51 47.95||treasure item:204471|Contains|!{1405807} [epic]Defective Survival Pack]",
		[75188] = "Inconspicuous Data Miner|engineering skill:engineering10:25|49.89 59.26||treasure item:204480|Contains|!{892830} [epic]Inconspicuous Data Miner]",
		[75431] = "Discarded Dracothyst Drill|engineering skill:engineering10:25|49.47 79.02||treasure item:204853|Contains|!{893841} [epic]Discarded Dracothyst Drill]",
		[75430] = "Bolts and Brass|engineering skill:engineering10:25|57.65 73.94||treasure item:204850|Contains|!{4548875} [epic]Handful of Khaz'gorite Bolts]",
		
		-- Inscription Treasure
		[76120] = "Hissing Rune Draft|inscription skill:inscription10:25|53.02 74.26||treasure item:206034|Contains|!{237450} [epic]Hissing Rune Draft]",
		[76121] = {
			"Ancient Research|inscription skill:inscription10:25|54.57 20.21|\"Inside a building, under a table\"|treasure item:206035|Contains|!{4549134} [epic]Ancient Research]",
			"Building Entrance|inscription skill:inscription10:25|52.78 18.85|Ancient Research|treasure atlas:questobjective",
		},
		[76117] = "Intricate Zaqali Runes|inscription skill:inscription10:25|36.67 46.15||treasure item:206031|Contains|!{1029027} [epic]Intricate Zaqali Runes]",
		
		-- Jewelcrafting Treasure
		[75652] = "Snubbed Snail Shells|jewelcrafting skill:jewelcrafting10:25|40.38 80.65||treasure item:205214|Contains|!{4632789} [epic]Snubbed Snail Shells]",
		[75653] = "Gently Jostled Jewels|jewelcrafting skill:jewelcrafting10:25|34.5 45.42||treasure item:205216|Contains|!{1379185} [epic]Gently Jostled Jewels]",
		[75654] = "Broken Barter Boulder|jewelcrafting skill:jewelcrafting10:25|54.39 32.45|\"Inside a small cave\"|treasure item:205219|Contains|!{2066015} [epic]Broken Barter Boulder]",
		
		-- Leatherworking Treasure
		[75502] = "Sulfur-Soaked Skins|leatherworking skill:leatherworking10:25|49.52 54.67|\"Inside a broken cart\"|treasure item:204988|Contains|!{4635271} [epic]Sulfur-Soaked Skins]",
		[75495] = "Flame-Infused Scale Oil|leatherworking skill:leatherworking10:25|41.16 48.81||treasure item:204986|Contains|!{252176} [epic]Flame-Infused Scale Oil]",
		[75496] = "Lava-Forged Leatherworker's \"Knife\"|leatherworking skill:leatherworking10:25|45.24 21.09||treasure item:204987|Contains|!{4732313} [epic]Lava-Forged Leatherworker's \"Knife\"]",

		-- Tailoring Treasure
		[76110] = "Used Medical Wrap Kit|tailoring skill:tailoring10:25|59.11 73.18||treasure item:206025|Contains|!{1387611} [epic]Used Medical Wrap Kit]",
		[76102] = "Abandoned Reserve Chute|tailoring skill:tailoring10:25|47.21 48.55|\"On a ledge on top of the tower\"|treasure item:206019|Contains|!{133633} [epic]Abandoned Reserve Chute]",
		[76116] = "Exquisitely Embroidered Banner|tailoring skill:tailoring10:25|44.55 15.67||treasure item:206030|Contains|!{4624616} [epic]Exquisitely Embroidered Banner]",
		
		-- Treasure
		[72986] = {
			"Blazing Shadowflame Chest|70+ item:15138|28.53 47.94|\"You must equip an Onyxia Scale Cloak to be able to open the chest\"|treasure item:205418|Requires|{133757} [hasitem:15138]Onyxia Scale Cloak]||Contains|!{4914678} [rare]Blazing Shadowflame Cinder]|!{2065578} [Dragon Isles Supplies]",
			"Blazing Shadowflame Chest|70+ -item:15138|28.53 47.94|\"You must equip an Onyxia Scale Cloak to be able to open the chest\"|treasure item:205418 atlas:vignetteloot-locked|Requires|{133757} [hasitem:15138]Onyxia Scale Cloak]||Contains|!{4914678} [rare]Blazing Shadowflame Cinder]|!{2065578} [Dragon Isles Supplies]",
		},
		[73706] = "Charred Egg|70+|30.05 41.93||treasure|Contains|!{2065578} [Dragon Isles Supplies]",
		--[75187] = "Chest of the Flights|70+|56.04 3.05|\"Activate the nearby gems in the same order as the banner above the chest\"|treasure daily|Contains|!{2065578} [Dragon Isles Supplies]",
		[73395] = "Well-Chewed Chest|70+|29.77 40.55|\"The key can be found underneath the dead [dead]Massive Corebeast] inside the cave\"|treasure item:204075|Requires|{2032583} [hasitem:202869]Scorching Key]||Contains|!{2065578} [Dragon Isles Supplies]",
		[75515] = "Molten Hoard|70+|48.42 16.35|\"Inside the lava sewage outflow cave underneath Brimstone Garrison\"|treasure item:205981|Contains|!{5148757} [epic]Molten Primal Fang]",
		--[75302] = "Stolen Stash|70+|60.66 46.23||treasure|Contains|!{2065578} [Dragon Isles Supplies]",
		[75559] = "Attunement Crystal|70+|39.41 73.28|Crystal-encased Chest|treasure atlas:questobjective",
		[74987] = "Attunement Crystal|70+|37.75 68.86|Crystal-encased Chest|treasure atlas:questobjective",
		[74986] = {
			"Crystal-encased Chest|70+ -75559,-74987|36.4 74.26|\"Find two [Attunement Crystals] nearby in order to unlock the treasure\"|treasure item:204075 atlas:vignetteloot-locked|Contains|!{/Random} [rare]Random Trinket]|!{2065578} [Dragon Isles Supplies]",
			"Crystal-encased Chest|70+ 75559 74987|36.4 74.26||treasure|Contains|!{/Random} [rare]Random Trinket]|!{2065578} [Dragon Isles Supplies]",
		},
		[75019] = "Long-Lost Cache|70+|62.71 53.75||treasure weekly|Contains|!{2065578} [Dragon Isles Supplies]",
		--[75814] = "Waterlogged Bundle|70+|62.07 55.33||treasure|Contains|!{2065578} [Dragon Isles Supplies]", -- also flags 75015
		[75514] = {
			"Fealty's Reward|70+|48.45 10.83|\"To open the chest you must first kneel before the statue of Neltharion in the western part of Brimstone Garrison\"|treasure item:204075|Contains|!{/Random} [rare]Random Trinket]|!{2065578} [Dragon Isles Supplies]",
			"Statue of Neltharion|70+|43.54 23.02|Fealty's Reward|treasure atlas:questobjective",
		},
		[75745] = {
			"Nal ks'kol Reliquary|70+ -72964|64.07 75.07|\"You must progress further in the Embers of Neltharion campaign to gain acces to Nal ks'kol.\"|treasure item:191784 atlas:vignetteloot-locked|Contains|!{4643982} [epic]Dragon Shard of Knowledge]|!{2065578} [Dragon Isles Supplies]",
			"Nal ks'kol Reliquary|70+ +72964|64.07 75.07|\"Interact with the [Reliquary Access Console] and solve its puzzle to gain access to the treasure.\"|treasure item:191784|Contains|!{4643982} [epic]Dragon Shard of Knowledge]|!{2065578} [Dragon Isles Supplies]",
		},
		
	},

	-- Deeplayer Nest
	[2184] = {
		[75303] = "Stolen Stash|70+|63.86 82.66||treasure|Contains|!{2065578} [Dragon Isles Supplies]",
	},


	--[[ The Forbidden Reach ]]--

	[2151] = {
		-- High Peak
		[73700] = "High Peak|10+ research:2164|36.93 37.92||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[73699] = "High Peak|10+ research:2164|54.58 34.64||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",

		-- Signal Transmitter
		[73145] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|39.99 81.83|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[73143] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|31.78 26.2|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[73144] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|78.04 51.1|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
	},


	--[[ Thaldraszus ]]--

	-- Valdrakken
	[2112] = {
		-- Treasure
		[70731] = "Barrel of Confiscated Treats|skill:cooking10:1|9.6 56.34|\"Behind a bookshelf\"|treasure item:198106|Contains|!{1500865} [rare]Recipe: Tasty Hatchling's Treat]|!{1500918} [Tasty Hatchling's Treat] (2)",
		
		-- Inscription Treasure
		[70281] = {
			"[red]How to Train Your Whelpling]|inscription skill:inscription10:25 -70306|13.43 63.29||treasure item:198669 atlas:vignetteloot-locked link:2022|{services-icon-warning} [red]Warning: There is currently a bug with this treasure which makes it drop the wrong item if you have not yet looted Pulsing Earth Rune.]||[red]You should loot [epic]Pulsing Earth Rune] in the Waking Shores before looting this treasure.||[poor]Contains]|!{4549132} [poor]How to Train Your Whelpling]",
			"How to Train Your Whelpling|inscription skill:inscription10:25 70306|13.43 63.29||treasure item:198669|Contains|!{4549132} [epic]How to Train Your Whelpling]",
		},

		-- Tailoring Master
		[70260] = "Elysa Raywinder|tailoring skill:2831:25|27.9 45.76|\"On top of a ledge on the western side of the large tower, underneath a black banner\"|vignette speak currency:2026|Master Seamstress|!{3615523} [rare]Dragon Isles Tailoring Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
	},

	-- Thaldraszus
	[2025] = {
		-- Treasure
		[70731] = "Barrel of Confiscated Treats|skill:cooking10:1|34.1 60.79||treasure item:198106 link:2112|Contains|!{1500865} [rare]Recipe: Tasty Hatchling's Treat]|!{1500918} [Tasty Hatchling's Treat] (2)",
		[70609] = "Elegant Canvas Brush|10+|60.25 41.64||treasure item:203206|Contains|!{2103804} [poor]Elegant Canvas Brush]",
		[70538] = "Yennu's Map|10+|54.94 75.43||treasure item:199069|Contains|!{1505955} [uncommon]Yennu's Map]",
		[70611] = "Acorn Harvester|10+|49.44 62.9|\"Pick up the nearby [Acorn] and give it to the [friendly]Acorn Harvester]\"|treasure item:193066|Rewards|!{4528722} [rare]Chestnut]",
		[70610] = "Surveyor's Magnifying Glass|10+|64.86 16.56|\"Inside a cave\"|treasure item:193036|Contains|!{4419345} [uncommon]Left-Handed Magnifying Glass]",
		
		-- Alchemy Treasure
		[70301] = "Contraband Concoction|alchemy skill:alchemy10:25|59.53 38.46|\"Hidden inside the foliage on the ground next to a flying book\"|treasure item:198697|Contains|!{1416156} [epic]Contraband Concoction]",
		[70278] = "Mysterious Cauldrons|alchemy skill:alchemy10:25|55.23 30.54|\"Find three [Discarded Toys] on the ground nearby and bring one to each cauldron to unlock the treasure\"|treasure item:203471|Rewards|!{236546} [epic]Tasty Candy]",
		[70309] = "Small Basket of Firewater Powder|alchemy skill:alchemy10:25 link:2024|48.66 90.21||treasure item:198712|Contains|!{133850} [epic]Firewater Powder Sample]",
		
		-- Blacksmithing Treasure
		[70311] = "Draconic Flux|blacksmithing skill:blacksmithing10:25|52.22 80.55||treasure item:201006|Rewards|!{1387609} [epic]Draconic Flux]",
		
		-- Enchanting Treasure
		[70342] = "Fractured Titanic Sphere|enchanting skill:enchanting10:25|59.89 70.33||treasure item:198800|Contains|!{442739} [epic]Fractured Titanic Sphere]",
		
		-- Inscription Treasure
		[70281] = {
			"[red]How to Train Your Whelpling]|inscription skill:inscription10:25 -70306|34.66 61.8||treasure item:198669 atlas:vignetteloot-locked link:2022|{services-icon-warning} [red]Warning: There is currently a bug with this treasure which makes it drop the wrong item if you have not yet looted Pulsing Earth Rune.]||[red]You should loot [epic]Pulsing Earth Rune] in the Waking Shores before looting this treasure.||[poor]Contains]|!{4549132} [poor]How to Train Your Whelpling]",
			"How to Train Your Whelpling|inscription skill:inscription10:25 70306|34.66 61.8||treasure item:198669 link:2112|Contains|!{4549132} [epic]How to Train Your Whelpling]",
		},
		[70248] = {
			"Curious Glyph|inscription skill:inscription10:25 -item:198672|47.09 40.07|\"Interact with the [Curious Glyph] and then kill the [neutral]Confusion Manifest] across the bridge to obtain the key.\"|treasure item:198659 atlas:vignetteloot-locked|Requires|{4638737} [hasitem:198672]Decryption Key]||Contains|!{1499566} [epic]Forgetful Apprentice's Tome]",
			"Curious Glyph|inscription skill:inscription10:25 item:198672|47.09 40.07|\"Return the key to the [Curious Glyph], then interact with it another time to loot the treasure.\"|treasure item:198659 atlas:vignetteloot-locked|Requires|{4638737} [hasitem:198672]Decryption Key]||Contains|!{1499566} [epic]Forgetful Apprentice's Tome]",
		},
		[70287] = "Siennagosa|inscription skill:inscription10:25|56.08 41.02|\"Help Siennagosa gather her Darkmoon cards. Make sure you pick them up in order or she might drop them again.\"|treasure speak item:201015|Rewards|!{4644010} [epic]Counterfeit Darkmoon Deck]",
		[70264] = "Forgetful Apprentice's Tome|inscription skill:inscription10:25|56.26 41.18||treasure item:198659|Contains|!{1499566} [epic]Forgetful Apprentice's Tome]",
		
		-- Jewelcrafting Treasure
		[70261] = "Painter's Pretty Jewel|jewelcrafting skill:jewelcrafting10:25|56.91 43.68|\"Use [spell]Anomaly Detection Mark I] to reveal the treasure inside an urn with a lantern on top\"|treasure item:198656|Contains|!{4555548} [epic]Painter's Pretty Jewel]",
		[70285] = "Erupted Alexstraszite Cluster|jewelcrafting skill:jewelcrafting10:25|59.85 65.17||treasure item:198682|Contains|!{133238} [epic]Alexstraszite Cluster]|!{4555569} [rare]Alexstraszite] (2)",
		
		-- Leatherworking Treasure
		[70294] = "Bag of Decayed Scales|leatherworking skill:2830:25|56.82 30.57||treasure item:198690|Contains|!{4631333} [epic]Decayed Scales]",

		-- Tailoring Treasure
		[70372] = "Ancient Dragonweave Loom|tailoring skill:tailoring10:25|58.69 45.9|\"Solve a series of puzzles to unlock the treasure\"|treasure item:201019|Contains|!{4549298} [epic]Ancient Dragonweave Bolt]",
		[70288] = "Miniature Bronze Dragonflight Banner|tailoring skill:tailoring10:25|60.41 79.66|\"On top of the platform in a pile of sand\"|treasure item:198684|Contains|!{4624621} [epic]Miniature Bronze Dragonflight Banner]",
		

		-- High Peak
		[70039] = "High Peak|10+ research:2164|50.16 81.63||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[70024] = "High Peak|10+ research:2164|46.11 73.98||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71222] = "High Peak|10+ research:2164|34.05 84.85||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71223] = "High Peak|10+ research:2164|65.72 74.98||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71224] = "High Peak|10+ research:2164|64.64 56.72||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71217] = "High Peak|10+ research:2164|59.81 95.81||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71208] = "High Peak|10+ research:2164|28 70.63||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",

		-- Signal Transmitter
		[70583] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|50.63 55.6|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70584] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|70.3 44.3|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70585] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|63.67 77.1|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",

		-- Profession Master
		[70258] = "Bridgette Holdug|mining skill:2833:25|61.43 76.87||vignette speak currency:2035|Master Miner|!{3615521} [rare]Dragon Isles Mining Knowledge] (10)|!{4643977} [rare]Artisan's Mettle] (50)",
		[70260] = "Elysa Raywinder|tailoring skill:2831:25|36.75 59.26||vignette speak currency:2026 link:2112|Master Seamstress|!{3615523} [rare]Dragon Isles Tailoring Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
	},


	--[[ The Azure Span ]]--

	-- The Azure Span
	[2024] = {
		-- Treasure
		[70266] = "Decay-Infused Tanning Oil|leatherworking skill:2830:25|16.73 38.79||treasure item:198658|Contains|!{650640} [epic]Decay-Infused Tanning Oil]",
		[70269] = "Broken Drum|leatherworking skill:2830:25|12.51 49.41|\"Repair the Broken Drum for Raq inside The Filled Bowl\"|treasure item:201018|Rewards|!{1001627} [epic]Well-Danced Drum]",
		[70286] = "Crate of Treated Hides|leatherworking skill:2830:25|57.51 41.35||treasure item:198683|Contains|!{4559254} [epic]Treated Hides]",
		[70267] = "Intriguing Bolt of Blue Cloth|tailoring skill:tailoring10:25|40.67 54.93||treasure item:198662|Contains|!{132909} [epic]Intriguing Bolt of Blue Cloth]",
		[70284] = "Decaying Brackenhide Blanket|tailoring skill:tailoring10:25|16.2 38.94||treasure item:198680|Contains|!{237277} [epic]Decaying Brackenhide Blanket]",
		[70277] = "Crystalline Overgrowth|jewelcrafting skill:jewelcrafting10:25|45.06 61.22||treasure item:198664|Contains|!{132778} [epic]Crystalline Overgrowth]",
		[70271] = "Harmonic Chest|jewelcrafting skill:jewelcrafting10:25|44.65 61.38|\"Pick up the nearby [Resonant Key] and then activate three [Humming Crystals] scattered throughout the lake to unlock the chest\"|treasure item:201016|Contains|!{1060568} [epic]Harmonic Crystal Harmonizer]",
		[70237] = "Snow Covered Scroll|cooking skill:cooking10:1|58.02 42.02||treasure scroll item:198103|Contains|!{1500865} [rare]Recipe: Snow in a Cone]|!{132387} [Snowball] (8-18)",
		[70293] = "Frosted Parchment|inscription skill:inscription10:25|43.64 30.82||treasure item:198686|Contains|!{1392956} [epic]Frosted Parchment]",
		[70297] = "Dusty Darkmoon Card|inscription skill:inscription10:25|46.19 24|\"On the upper ledge inside the building\"|treasure item:198693|Contains|!{1392956} [epic]Dusty Darkmoon Card]",
		[70298] = "Enriched Earthen Shard|enchanting skill:enchanting10:25|21.56 45.54||treasure item:198694|Contains|!{1016245} [epic]Enriched Earthen Shard]",
		[70336] = "Forgotten Arcane Tome|enchanting skill:enchanting10:25|38.51 59.13||treasure item:198799|Contains|!{134544} [epic]Forgotten Arcane Tome]",
		[70290] = "Mana-Starved Crystal Cluster|enchanting skill:enchanting10:25|45.16 61.12|\"Defeat an [hostile]Enchanted Crystalline Construct] to reveal the treasure\"|treasure item:201013|Contains|!{1016245} [epic]Faintly Enchanted Remains]",
		[70309] = "Small Basket of Firewater Powder|alchemy skill:alchemy10:25|67.06 13.16||treasure item:198712|Contains|!{133850} [epic]Firewater Powder Sample]",
		[70208] = "Experimental Decay Cauldron|alchemy skill:alchemy10:25|16.31 38.5||treasure item:198599|Contains|!{650637} [epic]Experimental Decay Sample]",
		[70314] = {
			"Spelltouched Tongs|blacksmithing skill:blacksmithing10:25 -mining|53.14 66.14|\"You may need [hasitem:198727]Expedition Explosives] to break open the rock wall.\n\nThey can be bought from the Dragonscale Expedition quartermaster in the Waking Shores.\"|treasure item:201011|Contains|!{1020378} [epic]Spelltouched Tongs]",
			"Spelltouched Tongs|blacksmithing skill:blacksmithing10:25 mining|53.14 66.14|\"You may need to break the rock wall using your Mining skill\"|treasure item:201011|Contains|!{1020378} [epic]Spelltouched Tongs]",
		},
		[70441] = "Pepper Hammer|10+|26.56 46.29|\"Loot the [Tree Sap] on top of the dead tree trunk and then use the [Stick] to summon [friendly]Pepper Hammer]\"|treasure item:193834|Rewards|!{3998670} [rare]Blackfeather Nester]",
		[70380] = "Rubber Fish|10+|54.61 29.32||treasure item:202712|Contains|!{237308} [uncommon]Rubber Fish] (5)",
		[70606] = "Lost Compass|10+|74.9 55.01||treasure item:202711|Contains|!{4635196} [rare]Lost Compass]",

		-- High Peak
		[71215] = "High Peak|10+ research:2164|31.92 27.03||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71218] = "High Peak|10+ research:2164|46.14 24.99||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71216] = "High Peak|10+ research:2164|37.47 66.21||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71220] = "High Peak|10+ research:2164|63.08 48.66||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71221] = "High Peak|10+ research:2164|74.85 43.24||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71217] = "High Peak|10+ research:2164|77.44 18.38||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		
		-- Misaligned Ley Crystal
		[72138] = "Misaligned Ley Crystal|10+|43.48 62.24||vignette atlas:AzeriteReady|Grants Reputation|!{4687630} [Valdrakken Accord] (20)",
		[72139] = "Misaligned Ley Crystal|10+|26.53 35.91||vignette atlas:AzeriteReady|Grants Reputation|!{4687630} [Valdrakken Accord] (20)",
		[72140] = "Misaligned Ley Crystal|10+|65.73 28.14||vignette atlas:AzeriteReady|Grants Reputation|!{4687630} [Valdrakken Accord] (20)",
		[72141] = "Misaligned Ley Crystal|10+|66.39 59.51||vignette atlas:AzeriteReady|Grants Reputation|!{4687630} [Valdrakken Accord] (20)",
		[72136] = {"Misaligned Ley Crystal|10+ -mining|65.88 50.66|\"You may need [hasitem:198727]Expedition Explosives] to break open the rock wall.\n\nThey can be bought from the Dragonscale Expedition quartermaster in the Waking Shores.\"|vignette atlas:AzeriteReady item:198727|Grants Reputation|!{4687630} [Valdrakken Accord] (20)", "Misaligned Ley Crystal|10+ mining|65.88 50.66|\"You may need to break the rock wall using your Mining skill\"|vignette atlas:AzeriteReady|Grants Reputation|!{4687630} [Valdrakken Accord] (20)",},

		-- Signal Transmitter
		[70579] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|27.56 26.45|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70580] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|45.77 65.25|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70581] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|71.04 47.82|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70578] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|34.91 26.77|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large link:2023",

		-- Profession Master
		[70252] = "Frizz Buzzcrank|engineering skill:engineering10:25|17.76 21.68||vignette speak currency:2027|Master Engineer|!{4624728} [rare]Dragon Isles Engineering Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
		[70254] = "Lydiara Whisperfeather|inscription skill:2828:25|40.14 64.34||vignette speak currency:2028|Master Scribe|!{4624734} [rare]Dragon Isles Inscription Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
		[70255] = "Pluutar|jewelcrafting skill:2829:25|46.22 40.76||vignette speak currency:2029|Master Jewelcrafter|!{4624793} [rare]Dragon Isles Jewelcrafting Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
	},

	-- Traitor's Rest
	[2262] = {
		-- Treasure
		[70441] = "Pepper Hammer|10+|53.39 50.52|\"Loot the [Tree Sap] on top of the dead tree trunk and then use the [Stick] to summon [friendly]Pepper Hammer]\"|treasure item:193834|Rewards|!{3998670} [rare]Blackfeather Nester]",
	},


	--[[ Ohn'ahran Plains ]]--

	[2023] = {
		-- Treasure
		[70300] = "Wind-Blessed Hide|leatherworking skill:2830:25|86.28 53.63||treasure item:198696|Contains|!{4559248} [epic]Wind-Blessed Hide]",
		[70295] = "Battle Hardened Centaur Carpet|tailoring skill:tailoring10:25|35.34 40.12||treasure item:198692|Contains|!{134517} [epic]Noteworthy Scrap of Carpet]",
		[70303] = "Catnip Frond|tailoring skill:tailoring10:25|65.65 53|\"Gather five Catnip Leaves, then throw them at the [friendly]Playful Prowler] to reveal the treasure\"|treasure item:201020|Requires|{3387975} [hasitem:198688:5]Catnip Leaf] (<itemcount:198688>/5)||Rewards|!{4549280} [epic]Silky Surprise]",
		[70282] = "Lofty Malygite|jewelcrafting skill:jewelcrafting10:25|25.12 34.86||treasure item:198670|Contains|!{4555596} [epic]Lofty Malygite]|!{4555644} [rare]Stormy Malygite]|!{4555566} [rare]Malygite]",
		[70263] = "Forgotten Jewelry Box|jewelcrafting skill:jewelcrafting10:25|61.76 13.03||treasure item:198660|Contains|!{4555596} [epic]Fragmented Key]|!{647735} [epic]Forgotten Jewelry Box]",
		[70307] = "Sign Language Reference Sheet|inscription skill:inscription10:25|85.75 25.2||treasure item:198703|Contains|!{134329} [epic]Sign Language Reference Sheet]",
		[70291] = "Stormbound Horn|enchanting skill:enchanting10:25|61.55 67.7||treasure item:198689|Contains|!{134229} [epic]Stormbound Horn]",
		[70305] = "Canteen of Suspicious Water|alchemy skill:alchemy10:25|79.24 83.75|\"Inside the Roaring Dragonsprings cavern\"|treasure item:198710|Contains|!{4621580} [epic]Canteen of Suspicious Water]",
		[70246] = "Ancient Monument|blacksmithing skill:blacksmithing10:25|52.03 14.1|\"Defeat the four [neutral]Enchanted Bulwarks] to reveal the treasure\"|treasure item:201007 link:2022|Contains|!{135418} [epic]Ancient Monument]",
		[70353] = "Falconer Gauntlet Drawings|blacksmithing skill:blacksmithing10:25|50.91 66.48|\"Inside a hut\"|treasure item:201009|Contains|!{1505931} [epic]Falconer Gauntlet Drawings]",
		[70313] = {
			"Ancient Spear Shards|blacksmithing skill:blacksmithing10:25|81.11 37.88|\"Inside a cave\"|treasure item:201004 down|Contains|!{1717146} [epic]Ancient Spear Shards]",
			"Cave Entrance|blacksmithing skill:blacksmithing10:25|79.39 36.47|Ancient Spear Shards|treasure atlas:questobjective",
		},
		[67718] = "Ludo|10+|61.04 43.13|\"Pet [friendly]Ludo] to get the map\"|treasure item:195453|Rewards|!{237385} [uncommon]Ludo's Stash Map]",
		[70402] = "Centaur Horn|10+|73.49 56.14||treasure item:200869|Contains|!{516667} [uncommon]Ohn Lite Branded Horn]",
		[70379] = "Gold Coin|10+|82.33 73.4|\"Next to The Great Swog\"|treasure item:199338|Contains|!{4638724} [Copper Coin of the Isles]",
		[70400] = "Tuskarr Toy Boat|10+|51.99 58.39||treasure item:200876|Contains|!{1126431} [Yennu's Toy Boat]",

		-- High Peak
		[71208] = "High Peak|10+ research:2164|86.31 39.28||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[70827] = "High Peak|10+ research:2164|57.75 30.81||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71207] = "High Peak|10+ research:2164|30.39 36.46||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71200] = "High Peak|10+ research:2164|28.32 77.64||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71218] = "High Peak|10+ research:2164|83.85 82.42||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71215] = "High Peak|10+ research:2164|63.4 85.35||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		
		-- Signal Transmitter
		[70576] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|28.02 35.67|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70577] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|56.89 28.91|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70578] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|67.7 84.97|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70579] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|57.14 84.52|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large link:2024",

		-- Profession Master
		[70251] = "Shalasar Glimmerdusk|enchanting skill:2825:25|62.42 18.7|\"On top of the building\"|vignette speak currency:2030|Master Enchantress|!{3615911} [rare]Dragon Isles Enchanting Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
		[70253] = "Hua Greenpaw|herbalism skill:2832:25|58.38 50.01||vignette speak currency:2034|Master Herbalist|!{4624731} [rare]Dragon Isles Herbalism Knowledge] (10)|!{4643977} [rare]Artisan's Mettle] (50)",
		[70256] = "Erden|leatherworking skill:2830:25|82.43 50.64||vignette speak currency:2025|Master Leatherworker|!{4624911} [rare]Dragon Isles Leatherworking Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
		[70252] = "Frizz Buzzcrank|engineering skill:engineering10:25|43.07 77.66||vignette speak currency:2027 link:2024|Master Engineer|!{4624728} [rare]Dragon Isles Engineering Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
	},


	--[[ The Waking Shores ]]--

	[2022] = {
		-- Treasure
		[65646] = "Misty Treasure Chest|10+|58.54 53.03|\"Inside a small cave behind the waterfall\"|treasure item:202194|Contains|!{133660} [rare]Misty Satchel]|!{2065578} [Dragon Isles Supplies]",
		[67048] = { -- 70864 Possesive Hornswog moved
			"Hidden Hornswog Hostage|10+ -70864 -item:200063 -item:200066,-item:200064,-item:200065|64.93 69.59|\"To access the treasure, you must collect three items to craft a treat for the Possesive Hornswog\"|treasure atlas:vignetteloot-locked item:199916|Required Items|!{133718} [hasitem:200066]Well-Preserved Bone]|!{133980} [hasitem:200064]Marmoni's Prize]|!{512902} [hasitem:200065]Adventurer's Lost Soap Bar]||Contains|!{2399259} [rare]Roseate Hopper]",
			"Hidden Hornswog Hostage|10+ -70864 -item:200063 item:200066 item:200064 item:200065|64.47 69.12|\"Combine the three items near the hostage notes to create the treat\"|treasure item:199916|Required Items|!{133718} [hasitem:200066]Well-Preserved Bone]|!{133980} [hasitem:200064]Marmoni's Prize]|!{512902} [hasitem:200065]Adventurer's Lost Soap Bar]||Contains|!{2399259} [rare]Roseate Hopper]",
			"Hidden Hornswog Hostage|10+ -70864 item:200063|64.93 69.59|\"Throw the [Observant Riddle \"Treat\"] on the Possesive Hornswog to gain access to the treasure\"|treasure item:199916|Contains|!{2399259} [rare]Roseate Hopper]",
			"Hidden Hornswog Hostage|10+ 70864|64.93 69.59|\"May take up to five minutes to respawn after someone else has looted it\"|treasure item:199916|Contains|!{2399259} [rare]Roseate Hopper]",
			"Well-Preserved Bone|10+ -item:200066 -70864|66.17 55.3|\"On top of the tower\"|treasure item:200066|Contains|!{133718} [Well-Preserved Bone]",
			"Marmoni's Prize|10+ -item:200064 -70864|47.72 83.6|\"Inside a box behind the tent\"|treasure item:200064|Contains|!{133980} [Marmoni's Prize]",
			"Adventurer's Lost Soap Bar|10+ -item:200065 -70864|39.64 84.68|\"In a tub of water\"|treasure item:200065|Contains|!{512902} [Adventurer's Lost Soap Bar]",
		},
		[70270] = {
			"Boomthyr Rocket|engineering skill:engineering10:25 -item:198815 -item:198816,-item:198814,-item:198817|56.02 44.82|\"Pick up the notes and then collect four parts nearby to restore the treasure|treasure atlas:vignetteloot-locked item:201014|[Ash] can be found in the same room as the notes and the rest can be found in the building on the opposite side\"||Required Items|!{133218} [hasitem:198816]Aerospace Grade Draconium]|!{443368} [hasitem:198815]Ash]|!{4497570} [hasitem:198814]Boom Fumes]|!{132781} [hasitem:198817]Durable Crystal]||Rewards|!{511727} [epic]Boomthyr Rocket]",
			"Boomthyr Rocket|engineering skill:engineering10:25 item:198815 -item:198816,-item:198814,-item:198817|56.02 44.82|\"Pick up the notes and then collect four parts nearby to restore the treasure|treasure atlas:vignetteloot-locked item:201014|The remaining parts can be found in the building on the opposite side of the notes\"||Required Items|!{133218} [hasitem:198816]Aerospace Grade Draconium]|!{443368} [hasitem:198815]Ash]|!{4497570} [hasitem:198814]Boom Fumes]|!{132781} [hasitem:198817]Durable Crystal]||Rewards|!{511727} [epic]Boomthyr Rocket]",
			"Boomthyr Rocket|engineering skill:engineering10:25 item:198815 item:198816 item:198814 item:198817|56.02 44.82||treasure item:201014|Required Items|!{133218} [hasitem:198816]Aerospace Grade Draconium]|!{443368} [hasitem:198815]Ash]|!{4497570} [hasitem:198814]Boom Fumes]|!{132781} [hasitem:198817]Durable Crystal]||Rewards|!{511727} [epic]Boomthyr Rocket]",
			"Boomthyr Rocket Parts|engineering skill:engineering10:25 item:198815 -item:198816,-item:198814,-item:198817|57.96 44.49||treasure atlas:questobjective",
		},
		[70275] = "Disabled Tesla Coil|engineering skill:engineering10:25|49.11 77.51|\"Clear three [Exposed Wires] after interacting with the coil to unlock it\"|treasure item:198789|Contains|!{133870} [epic]Intact Coil Capacitor]",
		[70292] = "Closely Guarded Shiny|jewelcrafting skill:jewelcrafting10:25|50.36 45.06|\"Hidden inside a tree trunk\"|treasure item:198687|Contains|!{317243} [epic]Closely Guarded Shiny]",
		[70273] = "Igneous Gem|jewelcrafting skill:jewelcrafting10:25|33.94 63.67|\"Activate three [Focusing Crystals] nearby to reveal the treasure\"|treasure item:201017|Contains|!{237200} [epic]Igneous Gem]",
		[70308] = "Poacher's Pack|leatherworking skill:leatherworking10:25|39.36 86.38||treasure item:198711|Contains|!{3056991} [epic]Poacher's Pack]",
		[70280] = "Spare Djaradin Tools|leatherworking skill:leatherworking10:25|64.37 25.77||treasure item:198667|Contains|!{4615799} [epic]Spare Djaradin Tools]",
		[70304] = "Itinerant Singed Fabric|tailoring skill:tailoring10:25|25.09 69.73||treasure item:198702|Contains|!{134266} [epic]Itinerant Singed Fabric]",
		[70302] = "Mysterious Banner|tailoring skill:tailoring10:25|74.74 37.92||treasure item:198699|Contains|!{4624620} [epic]Mysterious Banner]",
		[70263] = "Forgotten Jewelry Box|jewelcrafting skill:jewelcrafting10:25|31.48 86.61||treasure item:198660|Contains|!{4555596} [epic]Fragmented Key]|!{647735} [epic]Forgotten Jewelry Box]",
		[70306] = "Pulsing Earth Rune|inscription skill:inscription10:25|67.87 57.95||treasure item:198704|Contains|!{2491064} [epic]Pulsing Earth Rune]",
		[70320] = "Flashfrozen Scroll|enchanting skill:enchanting10:25|57.46 83.65||treasure item:198798|Contains|!{4549198} [epic]Flashfrozen Scroll]",
		[70272] = {
			"Enchanted Debris|enchanting skill:enchanting10:25|59.87 57.09|\"Enchant a broom nearby to clean up the debris\"|treasure item:201012|Contains|!{2451603} [epic]Enchanted Debris]",
			"Broom|enchanting skill:enchanting10:25|57.49 58.46||treasure atlas:questobjective",
		},
		[70283] = "Lava-Infused Seed|enchanting skill:enchanting10:25|67.91 26.78|\"Inside a flower\"|treasure item:198675|Contains|!{4554352} [epic]Lava-Infused Seed]",
		[70289] = "Well Insulated Mug|alchemy skill:alchemy10:25|25.11 74.11||treasure item:198685|Contains|!{1385153} [epic]Well Insulated Mug]",
		[70274] = "Frostforged Potion|alchemy skill:alchemy10:25|55.16 81.12||treasure item:198663|Contains|!{134791} [epic]Frostforged Potion]",
		[70296] = "Singed Chest|blacksmithing skill:blacksmithing10:25|35.45 64.48|\"Kick three ingots into the lava pool and then defeat the [hostile]Hungry Hungry Lava] to reveal the treasure\"|treasure item:201008|Contains|!{576649} [epic]Molten Ingot]",
		[70232] = "Dim Forge|blacksmithing skill:blacksmithing10:25|56.33 19.52|\"Craft a {4622288} [rare]Primal Molten Alloy] near the [Dim Forge] to reveal the treasure\"|treasure item:198791|Rewards|!{132877} [rare]Glimmer of Blacksmithing Wisdom]",
		[70230] = "Glimmer of Wisdom|blacksmithing skill:blacksmithing10:25 70232|56.35 19.5|\"Inside the [Slack Tub] in front of the [Dim Forge]\"|treasure item:198791|Contains|!{132877} [rare]Glimmer of Blacksmithing Wisdom]",
		[70312] = "Curious Ingots|blacksmithing skill:blacksmithing10:25|65.6 25.69||treasure item:201005|Contains|!{133218} [epic]Curious Ingots]",
		[70246] = "Ancient Monument|blacksmithing skill:blacksmithing10:25|22.25 87.62|\"Defeat the four [neutral]Enchanted Bulwarks] to reveal the treasure\"|treasure item:201007|Contains|!{135418} [epic]Ancient Monument]",
		[70310] = "Qalashi Weapon Diagram|blacksmithing skill:blacksmithing10:25|34.52 67.14||treasure item:201010|Contains|!{1505957} [epic]Qalashi Weapon Diagram]",
		[70346] = {
			"Dead Man's Chestplate|10+ cloth|69.3 46.59|\"In the middle section of the tower\"|treasure item:202193|Contains|!{4623197} [rare]Dead Man's Tunic]",
			"Dead Man's Chestplate|10+ leather|69.3 46.59|\"In the middle section of the tower\"|treasure item:202192|Contains|!{4581056} [rare]Dead Man's Leathers]",
			"Dead Man's Chestplate|10+ mail|69.3 46.59|\"In the middle section of the tower\"|treasure item:202190|Contains|!{4628906} [rare]Dead Man's Chains]",
			"Dead Man's Chestplate|10+ plate|69.3 46.59|\"In the middle section of the tower\"|treasure item:202191|Contains|!{4615258} [rare]Dead Man's Breastplate]",
		},
		[70345] = {
			"Yennu's Kite|10+ -toy:202022|46.74 31.28|\"Up on a tree branch\"|treasure item:202022|Contains|!{318523} [rare]Yennu's Kite]",
			"Yennu's Kite|10+ toy:202022|46.74 31.28|\"Up on a tree branch\"|treasure|Contains|!{2065578} [Dragon Isles Supplies]", -- Drops supplies instead if you have learned the toy already
		},
		
		-- High Peak
		[70824] = "High Peak|10+ research:2164|73.35 38.85||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[70823] = "High Peak|10+ research:2164|56.02 45.41||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[70825] = "High Peak|10+ research:2164|43.45 61.96||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[70826] = "High Peak|10+ research:2164|28.71 47.73||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",
		[71204] = "High Peak|10+ research:2164|54.80 74.12||vignette atlas:Warfronts-FieldMapIcons-Empty-Banner-Minimap large|Grants Reputation|!{4687628} [Dragonscale Expedition] (250)",

		-- Signal Transmitter
		[70573] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|74.6 25.51|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",
		[70574] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|62.2 78.97|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large|\"Hidden on top of a ledge underneath two tree canopies.\"",
		[70575] = "Deactivated Signal Transmitter|engineering skill:engineering10:25 profperk:2827:50930|23.43 43.83|[spell]Wyrmhole Generator]|treasure atlas:Warfronts-BaseMapIcons-Empty-Workshop large",

		-- Profession Master
		[70247] = "Grigori Vialtry|alchemy skill:2823:25|60.83 75.9||vignette speak currency:2024|Master Alchemist|!{4624656} [rare]Dragon Isles Alchemy Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
		[70250] = "Grekka Anvilsmash|blacksmithing skill:2822:25|43.27 66.63||vignette speak currency:2023|Master Blacksmith|!{4624660} [rare]Dragon Isles Blacksmithing Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
		[70259] = "Zenzi|skinning skill:2834:25|73.28 69.73||vignette speak currency:2033|Masta Skinna|!{4625106} [rare]Dragon Isles Skinning Knowledge] (10)|!{4643977} [rare]Artisan's Mettle] (50)",
		[70251] = "Shalasar Glimmerdusk|enchanting skill:2825:25|32.13 91.98|\"On top of a building\"|vignette speak currency:2030 link:2023|Master Enchantress|!{3615911} [rare]Dragon Isles Enchanting Knowledge] (5)|!{4643977} [rare]Artisan's Mettle] (25)",
	},


	--[[ Bastion ]]--

	[1533] = {
		-- Treasure
		[58298] = {
			"Scroll of Aeons|10+ -58293,-58294|53.5 80.38|\"Loot nearby Purians and place them in two separate Tribute bowls in order to unlock this treasure\"|treasure atlas:vignetteloot-locked item:173984|Contains|!{1392955} [rare]Scroll of Aeons]",
			"Scroll of Aeons|10+ 58293 58294|53.5 80.38||treasure item:173984|Contains|!{1392955} [rare]Scroll of Aeons]",
			"Purians|10+ -58293,-58294 -item:173973|54.37 81.87||treasure interact",
			"Purians|10+ -58293,-58294 -item:173973|54.37 82.66||treasure interact",
			"Tribute|10+ -58293 item:173973|56.17 83.06||treasure interact",
			"Tribute|10+ -58294 item:173973|54.43 83.87||treasure interact",
		},
		[58329] = "Purifying Draught|10+|52.04 86.07||treasure item:174007|Contains|!{1528676} [Purifying Draught]",
		[60478] = "Vesper of Virtues|10+ 57037|58.66 71.35||treasure item:179982|Contains|!{133706} [rare]Kyrian Bell]",
		[61044] = "Stolen Equipment|10+|40.51 49.81||treasure item:182561::::::::60::512::1:6706:60|Contains|!{3386277} [rare]Fallen Disciple's Cloak]",
		[61048] = "Lost Disciple's Notes|10+|59.33 60.92||treasure item:182693|Contains|!{1506459} [uncommon]Lost Disciple's Notes]",
		[61049] = "Larion Tamer's Harness|10+|58.23 39.99|\"Inside the Hall of Beasts\"|treasure down item:183126|Contains|!{1059112} [rare]Kyrian Smith's Kit] (2)|!{134372} [uncommon]Larion Treats] (3)",
	},


	--[[ Maldraxxus ]]--

	[1536] = {
		-- Treasure
		[59358] = "Ornate Bone Shield|10+|47.25 62.17||treasure item:180749::::::::60::512::1:6706:60|Contains|!{3160514} [rare]Hauk's Battle-Scarred Bulwark]",
		[59429] = "Strange Growth|10+|55.89 38.97||treasure item:182607|Contains|!{134430} [uncommon]Hairy Egg]", -- 59428 completed after pulling the growth
		[60587] = "Kyrian Corpse|10+ -item:180085|32.74 21.28||treasure item:175708|!{134344} [rare]Kyrian Keepsake]||Contains|!{3536074} [rare]Reconstructed Family Locket]|!{133471} [Handwritten Note]", -- Quest completes when Kyrian Keepsake is opened
		[60730] = "Halis's Lunch Pail|10+|30.79 28.75||treasure|Contains|!{134028} [Finger Food] (7)|!{1509635} [Tasty Toes] (2)|!{132810} [Corpse Reanimator]",
		[61470] = {
			"The Necronom-i-nom|10+ -toy:182732|42.35 23.34||treasure item:182732|Contains|!{133737} [rare]The Necronom-i-nom]",
			"The Necronom-i-nom|10+ toy:182732|42.35 23.34||treasure item:183120|Contains|!{3087534} [rare]Partially Digested Encyclopedia]",
		},
		[61451] = "Stolen Jar|10+|66.29 49.9|\"Only the Fungrets know the exact location of the Stolen Jar, but it can probably be found inside one of their many small caves in Glutharn's Decay\"|treasure item:182618|Contains|!{237058} [uncommon]Reclaimed Vessel]",
	},


	--[[ Ardenweald ]]--

	[1565] = {
		-- Treasure
		[61065] = "Ancient Cloudfeather Egg|10+|52.95 37.3||treasure item:180642|Contains|!{657490} [uncommon]Cloudfeather Fledgling]",
		[61067] = "Hearty Dragon Plume|10+|48.22 39.28||treasure item:182729|Contains|!{2103819} [rare]Hearty Dragon Plume]",
		[61072] = "Aerto|10+|56.02 21.01||treasure item:180630|Contains|!{3084139} [uncommon]Gorm Harrier]",
		[61073] = "Faerie Trove|10+|49.71 55.89||treasure item:182673|Contains|!{3749005} [uncommon]Shimmerbough Hoarder]",
		[62259] = "Enchanted Dreamcatcher|55+,62704 -item:183129|36.42 25.06||treasure item:183129|Contains|!{3489827} [uncommon]Anima-Laden Dreamcatcher]",
		[62186] = "Swollen Anima Seed|55+,62704 -item:182730|76.68 29.75||treasure item:182730|Contains|!{3610497} [uncommon]Swollen Anima Seed]",
		[62187] = "Lost Satchel|55+,62704 -item:182731|48.27 20.39||treasure item:182731|Contains|!{348524} [uncommon]Satchel of Culexwood]",
	},


	--[[ Revendreth ]]--

	[1525] = {
		-- Treasure
		[59883] = "Filcher's Prize|10+|64.19 72.65||treasure item:179392|Contains|!{613397} [rare]Orb of Burgeoning Ambition]|!{133250} [Infused Ruby] (5)||\"A nearby gargoyle might not be very happy if you loot this treasure\"",
		[59884] = "Wayfarer's Abandoned Spoils|10+|68.45 64.46||treasure|Contains|!{/Random} [Random Trade Goods]|!{133250} [Infused Ruby] (5)",
		[59885] = "Remlate's Hidden Cache|10+|61.53 58.65||treasure|Contains|!{/Random} [uncommon]Random Equipment] (2)|!{133250} [Infused Ruby] (5)",
		[59888] = "Abandoned Curios|57159|51.85 59.55||treasure item:182744|Contains|!{1450755} [uncommon]Ornate Belt Buckle]|!{133250} [Infused Ruby] (5)",
		[59889] = "Smuggled Cache|10+|31.05 55.06||treasure item:182738|Contains|!{133640} [uncommon]Bundle of Smuggled Parasol Components]|!{/Random} [Random Food] (5)|!{133250} [Infused Ruby] (5)||\"There is a high chance that you will be ambushed after looting this treasure\"",
		[62199] = {
			"Taskmaster's Trove|10+|62.82 75.3|\"Use the nearby Ingress and Egress Rites to reveal this treasure\"|treasure item:183986|Contains|!{1311628} [rare]Bondable Sinstone]",
			"Ingress and Egress Rites|10+|63.01 72.36||treasure interact",
		},
		[62164] = "Vyrtha's Dredglaive|10+|70.17 60.06||treasure item:177807|Contains|!{3150768} [rare]Vyrtha's Dredglaive]",
		[59886] = "Fleeing Soul's Bundle|10+|46.39 58.16||treasure item:182737|Contains|!{134044} [Deep Fried Seraph Tenders] (8)|!{133250} [Infused Ruby] (5)",
		
		-- Thanks to Wowhead users Raapnaap, Frimlin and Emerno for all the details on Broken Mirrors
		-- Broken Mirror "Group 1"
		[61833] = { -- Repaired: 61818
			"Forgotten Chest|10+ venthyr research:1049 active:61879,61879 -61818|29.43 37.29|[green]Mirror Network]|treasure|\"Repair Broken Mirror inside the Outcast room with the pot to access the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61879,61879 61818|29.43 37.29|[green]Mirror Network]|treasure|\"Repair Broken Mirror inside the Outcast room with the pot to access the Forgotten Chamber\"||[green]Repaired]",
		},
		[61834] = { -- Repaired: 61822
			"Forgotten Chest|10+ venthyr research:1049 active:61879,61879 -61822|40.41 73.34|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the house to access the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61879,61879 61822|40.41 73.34|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the house to access the Forgotten Chamber\"||[green]Repaired]",
		},
		[61835] = { -- Repaired: 61826
			"Forgotten Chest|10+ venthyr research:1049 active:61879,61879 -61826|27.12 21.6|[green]Mirror Network]|treasure|\"Repair the Broken Mirror in the spider infested room to gain access to the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61879,61879 61826|27.12 21.6|[green]Mirror Network]|treasure|\"Repair the Broken Mirror in the spider infested room to gain access to the Forgotten Chamber\"||[green]Repaired]",
		},

		-- Broken Mirror "Group 2"
		[61836] = { -- Repaired: 61819
			"Forgotten Chest|10+ venthyr research:1049 active:61883,61883 -61819|39.11 52.22|[green]Mirror Network]|treasure|\"Repair the Broken Mirror on the ground floor to gain access to the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61883,61883 61819|39.11 52.22|[green]Mirror Network]|treasure|\"Repair the Broken Mirror on the ground floor to gain access to the Forgotten Chamber\"||[green]Repaired]",
		},
		[61837] = { -- Repaired: 61823
			"Forgotten Chest|10+ venthyr research:1049 active:61883,61883 -61823|58.8 67.8|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the house to gain access to the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61883,61883 61823|58.8 67.8|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the house to gain access to the Forgotten Chamber\"||[green]Repaired]",
		},
		[61838] = { -- Repaired: 61827
			"Forgotten Chest|10+ venthyr research:1049 active:61883,61883 -61827|70.94 43.61|[green]Mirror Network]|treasure|\"Repair the Broken Mirror to gain access to the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61883,61883 61827|70.94 43.61|[green]Mirror Network]|treasure|\"Repair the Broken Mirror to gain access to the Forgotten Chamber\"||[green]Repaired]",
		},

		-- Broken Mirror "Group 3"
		[61830] = { -- Repaired: 61817
			"Forgotten Chest|10+ venthyr research:1049 active:61885,61885 -61817|72.55 43.64|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the Depraved crypt to access the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61885,61885 61817|72.55 43.64|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the Depraved crypt to access the Forgotten Chamber\"||[green]Repaired]",
		},
		[61831] = { -- Repaired: 61821
			"Forgotten Chest|10+ venthyr research:1049 active:61885,61885 -61821|40.33 77.18|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the house to access the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61885,61885 61821|40.33 77.18|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the house to access the Forgotten Chamber\"||[green]Repaired]",
		},
		[61832] = { -- Repaired: 61825
			"Forgotten Chest|10+ venthyr research:1049 active:61885,61885 -61825|77.15 65.49|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside Caretaker's Manor to access the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61885,61885 61825|77.15 65.49|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside Caretaker's Manor to access the Forgotten Chamber\"||[green]Repaired]",
		},

		-- Broken Mirror "Group 4"
		[60297] = { -- Repaired: 59236
			"Forgotten Chest|10+ venthyr research:1049 active:61886,61886 -59236|20.75 54.26|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the building to access the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61886,61886 -59236 item:181363|20.75 54.26|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the building to access the Forgotten Chamber\"||Requires|!{133617} [green]Handcrafted Mirror Repair Kit]",
			"Forgotten Chest|10+ venthyr research:1049 active:61886,61886 59236|20.75 54.26|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside the building to access the Forgotten Chamber\"||[green]]Repaired]",
		},
		[61828] = { -- Repaired: 61820
			"Forgotten Chest|10+ venthyr research:1049 active:61886,61886 -61820|55.12 35.67|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside Redelav Hall to access the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kits from Simone in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61886,61886 -61820 item:181363|55.12 35.67|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside Redelav Hall to access the Forgotten Chamber\"||Requires|!{133617} [green]Handcrafted Mirror Repair Kit]",
			"Forgotten Chest|10+ venthyr research:1049 active:61886,61886 61820|55.12 35.67|[green]Mirror Network]|treasure|\"Repair the Broken Mirror inside Redelav Hall to access the Forgotten Chamber\"||[green]Repaired]",
		},
		[61829] = { -- Repaired: 61824
			"Forgotten Chest|10+ venthyr research:1049 active:61886,61886 -61824|29.6 25.89|[green]Mirror Network]|treasure|\"Repair the Broken Mirror to access the Forgotten Chamber\"||Requires|!{133617} [hasitem:181363]Handcrafted Mirror Repair Kit] (<itemcount:181363>)||\"You can buy Repair Kit from Simones in Sinfall.\"",
			"Forgotten Chest|10+ venthyr research:1049 active:61886,61886 61824|29.6 25.89|[green]Mirror Network]|treasure|\"Repair the Broken Mirror to access the Forgotten Chamber\"||[green]Repaired]",
		}, 
	},


	--[[ Zereth Mortis ]]--

	-- Zereth Mortis
	[1970] = {
		-- Treasure
		[65670] = {
			"{4238797} Runic Syllable|60+ 64953 64952|78.07 53.39||treasure interact",
			"{4238797} Runic Syllable|60+ 64953 64952|76.94 46.68||treasure interact",
			"{4238797} Runic Syllable|60+ 64953 64952|81.27 50.47||treasure interact",
			"{4238797} Runic Syllable|60+ 64953 64952|80.94 56.24||treasure interact",
			"{4238797} Runic Syllable|60+ 64953 64952|77.05 60.31||treasure interact",
		},
		[65565] = {
			"Syntactic Vault|60+ 64953 64952 -65670|77.51 58.23|\"Find six different Runic Syllables around the area to unlock the Syntactic Seal - one can be found inside this cave and the others are marked on the map\"|treasure down item:190457|Requires|!{4238797} [spell]Syllabic Recall] (6)||Contains|!{4254892} [rare]Protopological Cube]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Syntactic Vault|60+ 64953 64952 65670|77.51 58.23||treasure down item:190457|Contains|!{4254892} [rare]Protopological Cube]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[64545] = {
			"Dangerous Orb of Power|60+ 64953 64952|59.43 76.83||treasure interact",
			"Submerged Chest|60+ 64953 64952|58.57 72.85|\"To access the treasure, carry the Dangerous Orb of Power to the nearby Forgotten Pump\"|treasure item:190061|Contains|!{1676466} [rare]Admiral Pocopoc]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[64667] = "Damaged Jiro Stash|60+ 64953 64952|38.26 37.24||treasure item:190637|Contains|!{4284643} [epic]Percussive Maintenance Instrument]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65173] = {"{4238930} Tablet|60+ 64953 64952 65419|57.87 78.9||treasure interact down", "Library Vault|60+ 64953 64952 65419|58.85 77.06|\"Pick up the nearby Tablet with the correct symbol to reveal the treasure\"|treasure scroll down item:189447|Requires|!{4238930} [spell]Memorized]||Contains|!{4217590} [rare]Schematic: Viperid Menace]",},
		[65175] = "Template Archive|60+ 64953 64952|59.61 46.16||treasure down link:2030 item:190060|Contains|!{774766} [rare]Adventurous Pocopoc]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65178] = {"Forgotten Proto-Vault|60+ 64953 64952 _65427|66.99 69.4||treasure|Unlocks|!{4217590} [rare]Schematic: Prototype Leaper]", "Forgotten Proto-Vault|60+ 64953 64952 65427|66.9 69.4||treasure item:189469|Contains|!{4217590} [rare]Schematic: Prototype Leaper]|!{4381149} [legendary]Cosmic Flux] (200)",},
		[65270] = "Symphonic Vault|60+ 64953 64952|52.6 62.97|\"Use the four nearby Broken Consoles in the correct sequence to unlock this treasure\"|treasure|Unlock Sequence|1. [spell]Right, furthest in]|2. [spell]Left, on top of platform]|3. [spell]Right, closest to entrance]|4. [spell]Left, near treasure]||Contains|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65333] = "Protoform Schematic|60+ 64953 64952 65522 -item:189435|53.66 72.62||treasure scroll down item:189435|Contains|!{4217590} [rare]Schematic: Multichicken]",
		[65383] = "Protoform Schematic|60+ 64953 64952 65427 -item:189460|67.4 40.24|\"Inside the Chamber of Shaping behind the Dominated Architect\"|treasure scroll down item:189460|Contains|!{4217590} [rare]Schematic: Raptora Swooper]",
		[65393] = "Protoform Schematic|60+ 64953 64952 65178 65427 -item:189469|66.97 69.42||treasure scroll item:189469|Contains|!{4217590} [rare]Schematic: Prototype Leaper]",
		[65401] = "Protoform Schematic|60+ 64953 64952 65545 65427 -item:189478|36.95 78.26||treasure scroll item:189478|Contains|!{4217590} [rare]Schematic: Adorned Vombata]",
		[65447] = "Stolen Relic|60+ 64953 64952|37.9 65.2||treasure|Contains|!{/Random} [rare]Random Jewelry (236+)]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65465] = {
			"Domination Cache|60+ 64953 64952 item:189704|60.02 18.98|\"The key is a rare drop from elites in the Endless Sands\"|treasure item:190638|Requires|!{134245} [hasitem:189704]Dominance Key]||Contains|!{3734530} [epic]Tormented Mawsteel Greatsword]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Domination Cache|60+ 64953 64952 -item:189704|60.02 18.98|\"The key is a rare drop from elites in the Endless Sands\"|treasure atlas:vignetteloot-locked item:190638|Requires|!{134245} [hasitem:189704]Dominance Key]||Contains|!{3734530} [epic]Tormented Mawsteel Greatsword]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65480] = "Gnawed Valise|60+ 64953 64952|38.98 73.21||treasure item:188054::::::::60:::27:3:6652:8108:1482:1:28:2057|Contains|!{4096872} [rare]Antecedent Drape]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65487] = "Fallen Vault|60+ 64953 64952|51.56 9.9||treasure|Contains|!{4038106} [rare]Spatial Opener]|!{/Random} [uncommon]Random Equipment (229)]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65489] = {
			"Crushed Supply Crate|60+ 64953 64952 mage,priest,warlock|56.76 64.17|\"Pick up the Repair Tool next to the treasure and then speak to Hiu Fi nearby to trade it for a Jiro Hammer\"|treasure item:188007::::::::60:257::27:3:6652:8108:1482:1:28:2057|Contains|!{4076043} [rare]Choral Slippers]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Crushed Supply Crate|60+ 64953 64952 demonhunter,druid,monk,rogue|56.76 64.17|\"Pick up the Repair Tool next to the treasure and then speak to Hiu Fi nearby to trade it for a Jiro Hammer\"|treasure item:188013::::::::60:257::27:3:6652:8108:1482:1:28:2057|Contains|!{4076043} [rare]Staccato Boots]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Crushed Supply Crate|60+ 64953 64952 evoker,hunter,shaman|56.76 64.17|\"Pick up the Repair Tool next to the treasure and then speak to Hiu Fi nearby to trade it for a Jiro Hammer\"|treasure item:188020::::::::60:257::27:3:6652:8108:1482:1:28:2057|Contains|!{4076043} [rare]Anthemic Greaves]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Crushed Supply Crate|60+ 64953 64952 deathknight,paladin,warrior|56.76 64.17|\"Pick up the Repair Tool next to the treasure and then speak to Hiu Fi nearby to trade it for a Jiro Hammer\"|treasure item:188029::::::::60:257::27:3:6652:8108:1482:1:28:2057|Contains|!{4076043} [rare]Harmonium Percussive Stompers]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65503] = "Filched Artifact|60+ 64953 64952|49.77 87.23||treasure|Contains|!{/Random} [rare]Random Jewelry (236+)]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65520] = "Architect's Reserve|60+ 64953 64952 65426|61.16 37.15||treasure item:187833|Contains|!{133146} [rare]Dapper Pocopoc]|!{4381149} [legendary]Cosmic Flux] (200)", -- maybe only requires 65420
		[65522] = {
			"Mistaken Ovoid|60+ 64953 64952 65419 item:190239:5|53.66 72.62|\"Lost Ovoids are tiny orbs that can be found all around Zereth Mortis\"|treasure down item:189435|Requires|!{651737} [hasitem:190239:5]Lost Ovoid] (<itemcount:190239>/5)||Contains|!{4217590} [rare]Schematic: Multichicken]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Mistaken Ovoid|60+ 64953 64952 _65419 item:190239:5|53.66 72.62|\"Lost Ovoids are tiny orbs that can be found all around Zereth Mortis\"|treasure down|Requires|!{651737} [hasitem:190239:5]Lost Ovoid] (<itemcount:190239>/5)||Contains|!{4381149} [legendary]Cosmic Flux] (200)||Unlocks|!{4217590} [rare]Schematic: Multichicken]",
			"Mistaken Ovoid|60+ 64953 64952 65419 -item:190239:5|53.66 72.62|\"Lost Ovoids are tiny orbs that can be found all around Zereth Mortis\"|treasure down atlas:vignetteloot-locked item:189435|Requires|!{651737} [hasitem:190239:5]Lost Ovoid] (<itemcount:190239>/5)||Contains|!{4217590} [rare]Schematic: Multichicken]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Mistaken Ovoid|60+ 64953 64952 _65419 -item:190239:5|53.66 72.62|\"Lost Ovoids are tiny orbs that can be found all around Zereth Mortis\"|treasure down atlas:vignetteloot-locked|Requires|!{651737} [hasitem:190239:5]Lost Ovoid] (<itemcount:190239>/5)||Contains|!{4381149} [legendary]Cosmic Flux] (200)||Unlocks|!{4217590} [rare]Schematic: Multichicken]",},
		[65523] = "Drowned Broker Supplies|60+ 64953 64952 research:1932|34.96 69.96|\"Encourage Pocopoc to control the nearby Coreless Aurelid in order to retrieve the treasure\"|treasure item:190059|Contains|!{2055035} [rare]Pirate Pocopoc]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65536] = "Overgrown Protofruit|60+ 64953 64952|35.25 44.12||treasure item:190953|Contains|!{645345} [Protofruit Flesh] (20)|!{4381149} [legendary]Cosmic Flux] (200)",
		[65537] = "Offering to the First Ones|60+ 64953 64952|34.81 56.04|\"Takes up to 5 minutes to respawn after someone loots it\"|treasure item:190339|Contains|!{4254041} [rare]Enlightened Offering]",
		[65540] = "Protomineral Extractor|60+ 64953 64952|46.65 30.94||treasure item:190942|Contains|!{4284642} [epic]Protomineral Extractor]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65542] = "Pilfered Curio|60+ 64953 64952|60.87 42.95||treasure item:190098|Contains|!{1044996} [rare]Pepepec]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65543] = "Stolen Scroll|60+ 64953 64952|34.04 67.65||treasure item:190941|Contains|!{4217591} [rare]Teachings of the Elders]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65545] = {"Grateful Boon|60+ 64953 64952 _65427|37.18 78.31|\"Pet all the agitated animals nearby to unlock the treasure\"|treasure|Contains|!{4381149} [legendary]Cosmic Flux] (200)||Unlocks|!{4217590} [rare]Schematic: Adorned Vombata]", "Grateful Boon|60+ 64953 64952 65427|37.18 78.31|\"Pet all the agitated animals nearby to unlock the treasure\"|treasure item:189478|Contains|!{4217590} [rare]Schematic: Adorned Vombata]|!{4381149} [legendary]Cosmic Flux] (200)",},
		[65546] = "Protoflora Harvester|60+ 64953 64952|52.57 71.47|\"Takes up to 5 minutes to respawn after someone loots it\"|treasure item:190952|Contains|!{4284644} [epic]Protoflora Harvester]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65566] = "Protopear|60+ 64953 64952 64645|66.71 76.8||treasure down link:2027 item:190058|Contains|!{1658612} [rare]Peaceful Pocopoc]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65572] = {"Undulating Foliage|60+ 64953 64952 65589 65590 65591 65592|51.69 79.61|\"Open the four Teleporter Locks to unlock this treasure\"|treasure down link:2066 item:190926|Contains|!{3950360} [rare]Infested Automa Core]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)", "Undulating Foliage|60+ 64953 64952 -65589,-65590,-65591,-65592|51.69 79.61|\"Open the four Teleporter Locks to unlock this treasure\"|treasure atlas:vignetteloot-locked down link:2066 item:190926|Contains|!{3950360} [rare]Infested Automa Core]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)",},
		[65573] = "Bushel of Progenitor Produce|60+ 64953 64952|47.44 95.23|\"Defeating Nascent Servitors will give you a stacking buff required to open the door\"|treasure item:190853|Requires|!{4038102} [spell]Creation Catalyst Overcharge] (5)||Contains|!{237269} [rare]Bushel of Mysterious Fruit]|!{236571} [rare]Chef Pocopoc]|!{4381149} [legendary]Cosmic Flux] (200)",
		[65592] = "Teleporter Lock|60+ 64953 64952|50.01 76.71|\"Underneath a Bloomthorn Vine\"|treasure interact",
		[65381] = "Protoform Schematic|60+ 64953 64952 65427 -item:189458|62.03 43.53|\"On top of a pillar\"|treasure scroll item:189458|Contains|!{4217590} [rare]Schematic: Desertwing Hunter]",
		[65400] = "Protoform Schematic|60+ 64953 64952 65427 -item:189477|64.2 35.6|\"In a cage\"|treasure scroll item:189477|Contains|!{4217590} [rare]Schematic: Darkened Vombata]",
		[65389] = "Protoform Schematic|60+ +64811 64953 64952 65427 -item:189466|63.03 21.49|\"Inside a vault\"|treasure scroll item:189466|Contains|!{4217590} [rare]Schematic: Tarachnid Creeper]",
		[65396] = "Protoform Schematic|60+ 64953 64952 65427 -item:189473|48.89 34.74||treasure scroll down link:2029 item:189473|Contains|!{4217590} [rare]Schematic: Bronzewing Vespoid]",
		[65388] = "Protoform Schematic|60+ 64953 64952 65427 -item:189465|31.48 50.33||treasure scroll item:189465|Contains|!{4217590} [rare]Schematic: Genesis Crawler]",
		
		[65441] = {
			"Mawsworn Cache|60+ 64953 64952 -65427|60.59 30.54||treasure|Contains|!{4381149} [legendary]Cosmic Flux] (200)||Unlocks|!{4217590} [rare]Schematic: Sundered Zerethsteed]",
			"Mawsworn Cache|60+ 64953 64952 65427|60.59 30.54||treasure item:189456|Contains|!{4217590} [rare]Schematic: Sundered Zerethsteed]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65379] = "Protoform Schematic|60+ 64953 64952 65427 65441 -item:189456|60.61 30.53||treasure scroll item:189456|Contains|!{4217590} [rare]Schematic: Sundered Zerethsteed]",
		
		[65395] = "Protoform Schematic|60+ 64953 64952 65427 -item:189472|50.32 27.05|\"Buried in a sand pile on the first platform of Resonant Peaks\"|treasure scroll item:189472|Contains|!{4217590} [rare]Schematic: Vespoid Flutterer]",
		[65346] = "{4238934} Dormant Alcove Arrangement|60+ 65328|51.04 32.48|\"On top of a pillar\"|treasure interact|Unlocks access to the Repertory Alcove",
		[65344] = "{4238930} Repertory Alcove Arrangement|60+ 65328|49.62 30.93|\"Inside the Terrestrial Cache\"|treasure interact|Unlocks access to the Dormant Alcove",
		[65343] = "{4238929} Camber Alcove Arrangement|60+ 65328|47.68 34.48|\"On the wall at the back side of the building\"|treasure interact|Unlocks access to the Camber Alcove",
		[65347] = "{4238937} Fulgore Alcove Arrangement|60+ 65328|47.84 30.38|\"At one of the lower pillar platforms\"|treasure interact|Unlocks access to the Fulgor Alcove",
		[65345] = "{4238933} Rondure Alcove Arrangement|60+ 65328|50.45 27.6|\"Underneath the top pillar platform\"|treasure interact|Unlocks access to the Rondure Alcove",
		[65387] = "Protoform Schematic|60+ 64953 64952 65427 -item:189464|47.69 9.55|\"On top of the arch\"|treasure scroll item:189464|Contains|!{4217590} [rare]Schematic: Scarlet Helicid]",
		[65386] = "Prototype Schematic|60+ 64953 64952 65427 65343 -item:189463|50.3 34.9||treasure link:2029 down item:189463|Contains|!{4217590} [rare]Schematic: Unsuccessful Prototype Fleetpod]|!{4381149} [legendary]Cosmic Flux] (200)",
		
	},

	-- Crystal Wards
	[2066] = {
		-- Treasure
		[65572] = {"Undulating Foliage|60+ 64953 64952 65589 65590 65591 65592|49.14 34.57|\"Use the unlocked Teleporter\"|treasure item:190926|Contains|!{3950360} [rare]Infested Automa Core]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)", "Undulating Foliage|60+ 64953 64952 -65589,-65590,-65591,-65592|49.14 34.57|\"Open the four Teleporter Locks to unlock this treasure\"|treasure atlas:vignetteloot-locked item:190926|Contains|!{3950360} [rare]Infested Automa Core]|!{4038106} [rare]Spatial Opener]|!{4381149} [legendary]Cosmic Flux] (200)",},
		[65589] = "Teleporter Lock|60+ 64953 64952|39.5 68.65|\"In a bush\"|treasure interact",
		[65590] = "Teleporter Lock|60+ 64953 64952|60.22 87.14|\"Underneath a Bloomthorn Vine\"|treasure interact",
		[65591] = "Teleporter Lock|60+ 64953 64952|69.79 52.57|\"Underneath a Bloomthorn Vine\"|treasure interact",
	},

	-- Nexus of Actualization
	[2030] = {
		-- Treasure
		[65175] = {"Orb|60+ 64953 64952|71.8 48.98||treasure interact", "Template Archive|60+ 64953 64952|51.59 87.82|\"Push the Orb in order to gain access to the inner chamber\"|treasure item:190060|Contains|!{774766} [rare]Adventurous Pocopoc]",},
	},

	-- Blooming Foundry
	[2027] = {
		-- Treasure
		[65566] = "Protopear|60+ 64953 64952 64645|65.73 50.15|\"Bring up to 5 Pollen Clouds to the Protopear one at a time until it ripens\"|treasure item:190058|Contains|!{1658612} [rare]Peaceful Pocopoc]",
	},

	-- Gravid Repose
	[2029] = {
		-- Treasure
		[65396] = "Protoform Schematic|60+ 64953 64952 65427 -item:189473|48.99 40.49|\"Hidden in a container\"|treasure scroll item:189473|Contains|!{4217590} [rare]Schematic: Bronzewing Vespoid]",
		[65650] = {
			"Inert Prototype|60+ 64953 64952 65427 65328 -65343 -item:189463|51.94 79.56|Camber Alcove|treasure atlas:vignetteloot-locked|\"Retrieve the Camber Arrangement to unlock the Locus Shift to this location.\"",
			"Inert Prototype|60+ 64953 64952 65427 65328 65343 -item:189463|51.94 79.56|Camber Alcove|treasure interact|\"Starts the Inert Protoype mini game. Collect five golden rings without hitting too many dust piles to unlock the Prototype Schematic.\"",
		},
		[65386] = {
			"Prototype Schematic|60+ 64953 64952 65427 65328 -65650 -item:189463|49.68 72.03|Camber Alcove|treasure atlas:vignetteloot-locked item:189463|Contains|!{4217590} [rare]Schematic: Unsuccessful Prototype Fleetpod]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Prototype Schematic|60+ 64953 64952 65427 65328 65650 -item:189463|49.68 72.03|Camber Alcove|treasure item:189463|Contains|!{4217590} [rare]Schematic: Unsuccessful Prototype Fleetpod]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65643] = {
			"Torn Ethereal Drape|60+ 64953 64952 65328 -65347|28 88|Fulgor Alcove|treasure atlas:vignetteloot-locked item:188054::::::::60:::27:3:6652:8108:1482:1:28:2057|\"Retrieve the Fulgore Arrangement to unlock the Locus Shift to this location.\"||Contains|!{4096872} [rare]Antecedent Drape]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Torn Ethereal Drape|60+ 64953 64952 65328 65347|28 88|Fulgor Alcove|treasure item:188054::::::::60:::27:3:6652:8108:1482:1:28:2057|\"Activate the Automa Console directly opposite of the Locus Shift to spawn a Progenitor Orb that can carry you to the treasure\"||Contains|!{4096872} [rare]Antecedent Drape]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65567] = {
			"Rondure Cache|60+ 64953 64952 65328 -65345|10 88|Rondure Alcove|treasure atlas:vignetteloot-locked item:190096|\"Retrieve the Rondure Alcove Arrangement to unlock the Locus Shift to this location.\"||Contains|!{2061718} [rare]Pocobold]|!{/Random} [epic]Random Cypher Equipment]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Rondure Cache|60+ 64953 64952 65328 65345|10 88|Rondure Alcove|treasure item:190096|\"A diabolical jumping puzzle. Having any sort of movement speed increase usually makes it more difficult.\"||Contains|!{2061718} [rare]Pocobold]|!{/Random} [epic]Random Cypher Equipment]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65348] = {
			"Protoform Schematic|60+ 64953 64952 65419 65328 -65345 -item:189440|12.5 88|Rondure Alcove|treasure atlas:vignetteloot-locked item:189440|\"Retrieve the Rondure Alcove Arrangement to unlock the Locus Shift to this location.\"||Contains|!{4217590} [rare]Schematic: Omnipotential Core]",
			"Protoform Schematic|60+ 64953 64952 65419 65328 65345 -item:189440|12.5 88|Rondure Alcove|treasure scroll item:189440|\"Hidden on top of the large arch near one of the walls.\"||Contains|!{4217590} [rare]Schematic: Omnipotential Core]",
		},
		-- Rondure Cache 65567
		-- Schematic: Omnipotential Core 65348

		[65498] = {
			"Misshapen Sand Pile|60+ 64953 64952 65328 -65346 -item:189863|10 40|Dormant Alcove|treasure atlas:vignetteloot-locked|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{/Random} [epic]Random Cypher Trinket (242+)]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Misshapen Sand Pile|60+ 64953 64952 65328 65346 -item:189863|10 40|Dormant Alcove|treasure atlas:vignetteloot-locked|Requires|!{4038106} [red]Spatial Opener]||Contains|!{/Random} [epic]Random Cypher Trinket (242+)]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Misshapen Sand Pile|60+ 64953 64952 65328 -65346 item:189863|10 40|Dormant Alcove|treasure atlas:vignetteloot-locked|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{/Random} [epic]Random Cypher Trinket (242+)]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Misshapen Sand Pile|60+ 64953 64952 65328 65346 item:189863|10 40|Dormant Alcove|treasure|Requires|!{4038106} [green]Spatial Opener]||Contains|!{/Random} [epic]Random Cypher Trinket (242+)]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65499] = {
			"Sparkling Sand Pile|60+ 64953 64952 65328 -65346 -item:189863|12.5 40|Dormant Alcove|treasure atlas:vignetteloot-locked item:190374::::::::60::::1:0|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{237185} [epic]Gemstone of Prismatic Brilliance]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Sparkling Sand Pile|60+ 64953 64952 65328 65346 -item:189863|12.5 40|Dormant Alcove|treasure atlas:vignetteloot-locked item:190374::::::::60::::1:0|Requires|!{4038106} [red]Spatial Opener]||Contains|!{237185} [epic]Gemstone of Prismatic Brilliance]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Sparkling Sand Pile|60+ 64953 64952 65328 -65346 item:189863|12.5 40|Dormant Alcove|treasure atlas:vignetteloot-locked item:190374::::::::60::::1:0|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{237185} [epic]Gemstone of Prismatic Brilliance]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Sparkling Sand Pile|60+ 64953 64952 65328 65346 item:189863|12.5 40|Dormant Alcove|treasure item:190374::::::::60::::1:0|Requires|!{4038106} [green]Spatial Opener]||Contains|!{237185} [epic]Gemstone of Prismatic Brilliance]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65494] = {
			"Lumpy Sand Pile|60+ 64953 64952 65328 -65346 -item:189863|10 43.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188045::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3950347} [epic]Salvaged Viperid Band]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Lumpy Sand Pile|60+ 64953 64952 65328 65346 -item:189863|10 43.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188045::::::::60::::2:1492:8093|Requires|!{4038106} [red]Spatial Opener]||Contains|!{3950347} [epic]Salvaged Viperid Band]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Lumpy Sand Pile|60+ 64953 64952 65328 -65346 item:189863|10 43.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188045::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3950347} [epic]Salvaged Viperid Band]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Lumpy Sand Pile|60+ 64953 64952 65328 65346 item:189863|10 43.5|Dormant Alcove|treasure item:188045::::::::60::::2:1492:8093|Requires|!{4038106} [green]Spatial Opener]||Contains|!{3950347} [epic]Salvaged Viperid Band]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65495] = {
			"Glinting Sand Pile|60+ 64953 64952 65328 -65346 -item:189863|12.5 43.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188055::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3950354} [epic]Impossibly Ancient Band]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Glinting Sand Pile|60+ 64953 64952 65328 65346 -item:189863|12.5 43.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188055::::::::60::::2:1492:8093|Requires|!{4038106} [red]Spatial Opener]||Contains|!{3950354} [epic]Impossibly Ancient Band]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Glinting Sand Pile|60+ 64953 64952 65328 -65346 item:189863|12.5 43.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188055::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3950354} [epic]Impossibly Ancient Band]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Glinting Sand Pile|60+ 64953 64952 65328 65346 item:189863|12.5 43.5|Dormant Alcove|treasure item:188055::::::::60::::2:1492:8093|Requires|!{4038106} [green]Spatial Opener]||Contains|!{3950354} [epic]Impossibly Ancient Band]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65497] = {
			"Humming Sand Pile|60+ 64953 64952 65328 -65346 -item:189863|10 47|Dormant Alcove|treasure atlas:vignetteloot-locked item:188053::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3950351} [epic]Abandoned Automa Loop]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Humming Sand Pile|60+ 64953 64952 65328 65346 -item:189863|10 47|Dormant Alcove|treasure atlas:vignetteloot-locked item:188053::::::::60::::2:1492:8093|Requires|!{4038106} [red]Spatial Opener]||Contains|!{3950351} [epic]Abandoned Automa Loop]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Humming Sand Pile|60+ 64953 64952 65328 -65346 item:189863|10 47|Dormant Alcove|treasure atlas:vignetteloot-locked item:188053::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3950351} [epic]Abandoned Automa Loop]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Humming Sand Pile|60+ 64953 64952 65328 65346 item:189863|10 47|Dormant Alcove|treasure item:188053::::::::60::::2:1492:8093|Requires|!{4038106} [green]Spatial Opener]||Contains|!{3950351} [epic]Abandoned Automa Loop]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65496] = {
			"Shifting Sand Pile|60+ 64953 64952 65328 -65346 -item:189863|12.5 47|Dormant Alcove|treasure atlas:vignetteloot-locked item:188044::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3536115} [epic]Discarded Cartel Al Signet]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Shifting Sand Pile|60+ 64953 64952 65328 65346 -item:189863|12.5 47|Dormant Alcove|treasure atlas:vignetteloot-locked item:188044::::::::60::::2:1492:8093|Requires|!{4038106} [red]Spatial Opener]||Contains|!{3536115} [epic]Discarded Cartel Al Signet]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Shifting Sand Pile|60+ 64953 64952 65328 -65346 item:189863|12.5 47|Dormant Alcove|treasure atlas:vignetteloot-locked item:188044::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3536115} [epic]Discarded Cartel Al Signet]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Shifting Sand Pile|60+ 64953 64952 65328 65346 item:189863|12.5 47|Dormant Alcove|treasure item:188044::::::::60::::2:1492:8093|Requires|!{4038106} [green]Spatial Opener]||Contains|!{3536115} [epic]Discarded Cartel Al Signet]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		[65500] = {
			"Ticking Sand Pile|60+ 64953 64952 65328 -65346 -item:189863|10 50.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188106::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3950338} [epic]Unfathomable Pendant]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Ticking Sand Pile|60+ 64953 64952 65328 65346 -item:189863|10 50.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188106::::::::60::::2:1492:8093|Requires|!{4038106} [red]Spatial Opener]||Contains|!{3950338} [epic]Unfathomable Pendant]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Ticking Sand Pile|60+ 64953 64952 65328 -65346 item:189863|10 50.5|Dormant Alcove|treasure atlas:vignetteloot-locked item:188106::::::::60::::2:1492:8093|\"Retrieve the Dormant Arrangement to unlock the Locus Shift to this location.\"||Requires|!{4038106} [hasitem:189863]Spatial Opener]||Contains|!{3950338} [epic]Unfathomable Pendant]|!{4381149} [legendary]Cosmic Flux] (200)",
			"Ticking Sand Pile|60+ 64953 64952 65328 65346 item:189863|10 50.5|Dormant Alcove|treasure item:188106::::::::60::::2:1492:8093|Requires|!{4038106} [green]Spatial Opener]||Contains|!{3950338} [epic]Unfathomable Pendant]|!{4381149} [legendary]Cosmic Flux] (200)",
		},
		-- Lumpy 65494
		-- Glinting 65495
		-- Shifting 65496
		-- Humming 65497
		-- Misshapen 65498
		-- Sparkling 65499
		-- Ticking 65500
	},


	--[[ Tiragarde Sound ]]--

	-- Boralus
	[1161] = {
		-- Treasure
		[52870] = "Scrimshaw Cache|10+|63.21 6.5|\"Inside a cave\"|treasure down|Contains|!{2032600} [War Resources]",

		-- Vignette
		--[51877] = {"Sawtooth|10+ -paladin -shaman -monk|\"Swims around the area\"|vignette", "Sawtooth|10+ paladin,shaman,monk|\"Swims around the area\"|vignette item:155273|Rewards|!{1698637} [rare]Sharktooth Hatchet]",},
	},

	-- Tiragarde Sound
	[895] = {
		-- Treasure
		[49963] = "Hay Covered Chest|10+ 49983|67.36 51.64||treasure item:155571|Contains|!{1726328} [rare]Garyl's Riding Blanket]", -- Boralus
		[49983] = {"Guardian of the Spring|10+|61.37 51.28|\"Bring to Roan Berthold for a reward\"|vignette", "Roan Berthold|10+|67.4 51.66|\"Bring Guardian of the Spring here to reveal the chest\"|treasure item:155571|Hay Covered Chest|!{1726328} [rare]Garyl's Riding Blanket]",},
		[52866] = "Cutwater Treasure Chest|10+|72.49 58.14|\"Inside a cave\"|treasure down item:155381|Contains|!{1048292} [rare]Cutwater-Captain's Sapphire Ring]",
		[52866] = "Precarious Noble Cache|10+|56.03 33.19||treasure|Contains|!{2004597} [Polished Pet Charm] (5)|!{2032600} [War Resources]",
		[52867] = "Forgotten Smuggler's Stash|10+|61.78 62.75|\"Inside a cave\"|treasure down|Contains|!{2032600} [War Resources]",
		[52870] = "Scrimshaw Cache|10+|72.65 21.34|\"Inside a cave\"|treasure down link:1161|Contains|!{2032600} [War Resources]", -- Boralus
	},


	--[[ Drustvar ]]--

	[896] = {
		-- Treasure
		[53356] = "Web-Covered Chest|10+|33.71 30.08||treasure|Contains|!{2032600} [War Resources]",
		[53357] = {"Merchant's Chest|10+ item:163710|25.75 19.94|\"Nearby Gorging Ravens have a chance to drop the key\"|treasure|Requires|!{136058} [hasitem:163710]Merchant's Key]||Contains|!{2004597} [Polished Pet Charm] (5)|!{2032600} [War Resources]", "Merchant's Chest|10+ -item:163710|25.75 19.94|\"Nearby Gorging Ravens have a chance to drop the key\"|treasure atlas:vignetteloot-locked|Requires|!{136058} [hasitem:163710]Merchant's Key]||Contains|!{2004597} [Polished Pet Charm] (5)|!{2032600} [War Resources]",},
		[53385] = "Runebound Cache|10+|63.3 65.85||treasure item:163743|Unlock Sequence|!{1323037} [spell]Left]|!{1323035} [spell]Bottom]|!{1323038} [spell]Top]|!{1323039} [spell]Right]||Contains|!{896907} [rare]Drust Soulcatcher]|!{2032600} [War Resources]",
		[53386] = "Runebound Chest|10+|44.22 27.7||treasure item:163742|Unlock Sequence|!{1323038} [spell]Left]|!{1323037} [spell]Right]|!{1323035} [spell]Bottom]|!{1323039} [spell]Top]||Contains|!{2101967} [rare]Heartsbane Grimoire]|!{2032600} [War Resources]",
		[53387] = "Runebound Coffer|10+|33.69 71.73||treasure item:163740|Unlock Sequence|!{1323035} [spell]Right]|!{1323039} [spell]Top]|!{1323038} [spell]Left]|!{1323037} [spell]Bottom]||Contains|!{940537} [rare]Drust Ritual Knife]|!{2032600} [War Resources]",
		[53471] = "Hexed Chest|10+|18.53 51.32||treasure item:163789|Contains|!{135437} [uncommon]Bundle of Wicker Sticks]|!{2032600} [War Resources]",
		[53472] = "Bespelled Chest|10+|55.59 51.83||treasure item:163790|Contains|!{134937} [uncommon]Spooky Incantation]|!{2032600} [War Resources]",
		[53473] = "Ensorcelled Chest|10+|67.77 73.67||treasure item:163791|Contains|!{1516565} [uncommon]Miniature Stag Skull]|!{2032600} [War Resources]",
		[53474] = "Enchanted Chest|10+|25.45 24.18||treasure item:163796|Contains|!{133720} [uncommon]Wolf Pup Spine]|!{2032600} [War Resources]",
		[53475] = "Stolen Thornspeaker Cache|10+|24.26 48.31||treasure|Contains|!{2004597} [Polished Pet Charm] (5)|!{2032600} [War Resources]",
	},


	--[[ Stormsong Valley ]]--

	-- Stormsong Valley
	[942] = {
		-- Treasure
		[49811] = "Smuggler's Stash|10+|58.6 83.88|\"Underneath the docks\"|treasure|Contains|!{2032600} [War Resources]",
		[50089] = "Old Ironbound Chest|10+|42.86 47.23|\"Inside a cave\"|treasure down|Contains|!{2032600} [War Resources]",
		[50526] = "Frosty Treasure Chest|10+|48.97 84.1||treasure|Contains|!{2032600} [War Resources]",
		[50734] = "Sunken Strongbox|10+|67.21 43.21|\"In the water underneath the ship\"|treasure|Contains|!{2004597} [Polished Pet Charm] (5)|!{2032600} [War Resources]",
		[50937] = "Hidden Scholar's Chest|10+|59.91 39.06||treasure|Contains|!{2032600} [War Resources]",
		[51449] = "Weathered Treasure Chest|10+|66.93 12.06|\"Inside a cave\"|treasure down|Contains|!{2032600} [War Resources]",
		[52429] = "Carved Wooden Chest|10+|44.44 73.53|\"Inside a cave on top of a platform\"|treasure down item:162000|Contains|!{2114667} [uncommon]Pig Nose]|!{2032600} [War Resources]",
		[52976] = "Venture Co. Supply Chest|10+|36.69 23.23||treasure|Contains|!{2032600} [War Resources]",
		[52980] = "Forgotten Chest|10+|46 30.69||treasure|Contains|!{2032600} [War Resources]",
		-- Discarded Lunchbox
	},

	-- Thornheart
	[1183] = {
		-- Treasure
		[52429] = "Carved Wooden Chest|10+|59.6 29.2|\"Inside a cave on top of a platform\"|treasure item:162000|Contains|!{2114667} [uncommon]Pig Nose]|!{2032600} [War Resources]",
	},


	--[[ Zuldazar ]]--

	-- Dazar'alor
	[1165] = {
		[48938] = "Offerings of the Chosen|10+|38.28 7.14||treasure|Contains|!{2032600} [War Resources]",
		[50947] = "Da White Shark's Bounty|10+|59.31 88.66|\"Revealed after killing Da White Shark\"|treasure|Contains|!{2032600} [War Resources]",
		[51338] = "Cache of Secrets|10+|44.47 26.91|\"Inside a cave behind a waterfall\"|treasure down|Contains|!{2032600} [War Resources]",
		[51624] = "Riches of Tor'nowa|10+|34.93 54.4||treasure|Contains|!{2032600} [War Resources]",
	},

	-- Zuldazar
	[862] = {
		-- Treasure
		[48938] = "Offerings of the Chosen|10+|54.08 31.48||treasure link:1165|Contains|!{2032600} [War Resources]", -- Dazar'alor
		[49257] = "Warlord's Cache|10+|49.5 65.26||treasure|Contains|!{2032600} [War Resources]",
		[49936] = "Spoils of Pandaria|10+|51.71 86.88|Breath of Pa'ku|treasure down link:1177|Contains|!{2032600} [War Resources]", -- Breath of Pa'ku
		[50259] = "Witch Doctor's Hoard|10+|64.71 21.67||treasure|Contains|!{2032600} [War Resources]",
		[50582] = {"Gift of the Brokenhearted|10+ -50950|51.43 26.61|Incense|treasure|Contains|!{2032600} [War Resources]", "Gift of the Brokenhearted|10+ 50950|51.43 26.61||treasure|Contains|!{2032600} [War Resources]",},
		[50707] = "Dazar's Forgotten Chest|10+|38.79 34.44||treasure item:153702|Contains|!{2003614} [uncommon]Kubiline]|!{2032600} [War Resources]",
		[50947] = {"Da White Shark's Bounty|10+|61.07 58.6|Da White Shark|treasure link:1165|Contains|!{2032600} [War Resources]",},
		[50949] = "The Exile's Lament|10+|71.9 16.8|\"Inside the Exile's Hideaway\"|treasure down|Contains|!{2004597} [Polished Pet Charm] (5)|!{2032600} [War Resources]", -- check exact coords
		[51338] = "Cache of Secrets|10+|56.14 38.05|\"Inside a cave behind a waterfall\"|treasure link:1165|Contains|!{2032600} [War Resources]", -- Dazar'alor
		[51624] = "Riches of Tor'nowa|10+|52.96 47.2||treasure|Contains|!{2032600} [War Resources]",

		-- Vignette
		[50677] = {"Hakbi the Risen|10+ paladin,shaman,warrior|42.03 36.22||vignette item:160978|Drops|!{797509} [rare]Golden Tomb Defender]", "Hakbi the Risen|10+ -paladin -shaman -warrior|42.03 36.22||vignette",},
	},

	-- Breath of Pa'ku - Upper Deck
	[1176] = {
		-- Treasure
		[49936] = "Spoils of Pandaria|10+|23.02 23.82||treasure down link:1177|Contains|!{2032600} [War Resources]",
	},

	-- Breath of Pa'ku - Lower Deck
	[1177] = {
		-- Treasure
		[49936] = "Spoils of Pandaria|10+|23.02 23.82||treasure|Contains|!{2032600} [War Resources]",
	},


	--[[ Nazmir ]]--

	[863] = {
		-- Treasure
		[49313] = "Wunja's Trove|10+|35.43 54.99|\"Inside a burial mound\"|treasure down|Contains|!{2032600} [War Resources]",
		[49483] = "Shipwrecked Chest|10+|66.79 17.33||treasure|Contains|!{2032600} [War Resources]",
		[49484] = "Offering to Bwonsamdi|10+|42.77 26.2||treasure|Contains|!{2032600} [War Resources]",
		[49867] = "Lucky Horace's Lucky Chest|10+|77.68 36.15||treasure|Contains|!{2032600} [War Resources]",
		[49885] = "\"Cleverly\" Disguised Chest|10+|35.64 85.61||treasure|Contains|!{2032600} [War Resources]",
		[49889] = "Venomous Seal|10+|46.23 82.95||treasure|Contains|!{2032600} [War Resources]",
		[49891] = "Lost Nazmani Treasure|10+|62.1 34.86|\"Inside an underwater cave\"|treasure down|Contains|!{2032600} [War Resources]",
		[49979] = "Cursed Nazmani Chest|10+|43.06 50.79|\"Inside a burial mound\"|treasure down|Contains|!{2032600} [War Resources]",
		[50045] = "Swallowed Chest|10+|76.88 62.15||treasure|Contains|!{2032600} [War Resources]",
		[50061] = "Partially-Digested Treasure|10+|77.9 46.36||treasure|Contains|!{2032600} [War Resources]",
	},


	--[[ Vol'dun ]]--

	[864] = {
		-- Treasure
		[50237] = {"Ashvane Spoils|10+ -47326|46.59 88.01|Mine Cart|treasure|Contains|!{2032600} [War Resources]", "Ashvane Spoils|10+ 47326|44.33 92.22||treasure|Contains|!{2032600} [War Resources]",}, -- 47326 tracks the Mine Cart
		[51093] = {"Grayal's Last Offering|10+ -51094|48.17 64.7|Ancient Altar\n\"Inside Atul'Aman\"|treasure down|Contains|!{2032600} [War Resources]", "Grayal's Last Offering|10+ 51094|48.17 64.7|\"Inside Atul'Aman\"|treasure down|Contains|!{2032600} [War Resources]",},
		[51132] = "Lost Explorer's Bounty|10+|49.78 79.39||treasure|Contains|!{2032600} [War Resources]",
		[51133] = "Sandfury Reserve|10+|47.19 58.46||treasure|Contains|!{2032600} [War Resources]",
		[51135] = "Stranded Cache|10+|44.51 26.15||treasure|Contains|!{2032600} [War Resources]",
		[51136] = "Excavator's Greed|10+|57.74 64.63||treasure down|Contains|!{2032600} [War Resources]",
		[51137] = {"Zem'lan's Buried Treasure|10+ -51138|29.38 87.42|Disturbed Sand|treasure|Contains|!{2032600} [War Resources]", "Zem'lan's Buried Treasure|10+ 51138|29.38 87.42||treasure|Contains|!{2032600} [War Resources]",},
		[52992] = "Lost Offerings of Kimbul|10+|57.06 11.2||treasure|Contains|!{2032600} [War Resources]",
		[52994] = "Deadwood Chest|10+|40.57 85.75||treasure|Contains|!{2004597} [Polished Pet Charm] (10)|!{2032600} [War Resources]",
		[53004] = {"Sandsunken Treasure|10+ -53005|26.48 45.35|Abandoned Bobber|treasure|Contains|!{2004597} [Polished Pet Charm] (5)|!{2032600} [War Resources]", "Sandsunken Treasure|10+ 53005|26.48 45.35||treasure|Contains|!{2004597} [Polished Pet Charm] (5)|!{2032600} [War Resources]",},
	},


	--[[ Azsuna ]]--

	-- Azsuna
	[630] = {
		-- Treasure
		[42272] = "Small Treasure Chest|10+|59.88 63.19||treasure|Contains|!{1397630} [Order Resources]",
		[37596] = "Small Treasure Chest|10+|53.03 37.26||treasure|Contains|!{1397630} [Order Resources]",
		[37649] = "Glimmering Treasure Chest|10+|50.41 54.38||treasure down link:632|Contains|!{1397630} [Order Resources]", -- Oceanus Cove
		[37829] = "Small Treasure Chest|10+|53.17 64.46||treasure|Contains|!{1397630} [Order Resources]",
		[37831] = "Small Treasure Chest|10+|49.64 34.47||treasure|Contains|!{1397630} [Order Resources]",
		[38367] = "Glimmering Treasure Chest|10+|42.63 8.08||treasure|Contains|!{1397630} [Order Resources]",
		[40711] = {"Small Treasure Chest|10+ -flying|55.62 18.53|\"Take the Ley Portal inside the tower\"|treasure up|Contains|!{1397630} [Order Resources]", "Small Treasure Chest|10+ flying|55.62 18.53|\"On top of the tower\"|treasure|Contains|!{1397630} [Order Resources]",},
		[42273] = "Small Treasure Chest|10+|62.38 58.4||treasure|Contains|!{1397630} [Order Resources]",
		[42278] = "Small Treasure Chest|10+|62.99 54.18|\"Inside Gloombound Barrow\"|treasure down|Contains|!{1397630} [Order Resources]",
		[42284] = "Small Treasure Chest|10+|53.64 39.82||treasure down link:631|Contains|!{1397630} [Order Resources]", -- Nar'thalas Academy
		[42285] = "Small Treasure Chest|10+ 37730|54.3 39||treasure down link:631|Contains|!{1397630} [Order Resources]", -- Nar'thalas Academy - door is open after completing 37730
		[42290] = {"Small Treasure Chest|10+ -37536|50.2 50.29|\"Inside the Shipwreck Arena cave\"|treasure down|Contains|!{1397630} [Order Resources]", "Small Treasure Chest|10+ 37538|50.2 50.29|\"Inside the Shipwreck Arena cave\"|treasure down|Contains|!{1397630} [Order Resources]",}, -- Phased out once 37536 completes and comes back after 37538 is turned in
		[42291] = "Small Treasure Chest|10+|48.01 56.24||treasure down link:632|Contains|!{1397630} [Order Resources]", -- Oceanus Cove
		[42293] = "Small Treasure Chest|10+|63.64 39.17||treasure|Contains|!{1397630} [Order Resources]",
		[44104] = "Small Treasure Chest|10+|53.61 18.14||treasure down|Contains|!{1397630} [Order Resources]",
		[42294] = "Small Treasure Chest|10+|62.81 44.8||treasure down|Contains|!{1397630} [Order Resources]",

		-- Vignette
		[38061] = {"Pridelord Meowl|10+ leather|56.1 29.08||vignette item:138395|Drops|!{1115106} [rare]Meowl's Mane]|!{1397630} [Order Resources]", "Pridelord Meowl|10+ -leather|56.1 29.08||vignette|Drops|!{1397630} [Order Resources]", },
	},

	-- Nar'thalas Academy
	[631] = {
		-- Treasure
		[42284] = "Small Treasure Chest|10+|62.02 83.77||treasure|Contains|!{1397630} [Order Resources]",
		[42285] = "Small Treasure Chest|10+ 37730|71.73 21.62||treasure|Contains|!{1397630} [Order Resources]", -- door is open after completing 37730
	},

	-- Oceanus Cove
	[632] = {
		-- Treasure
		[37649] = "Glimmering Treasure Chest|10+|69.68 48||treasure|Contains|!{1397630} [Order Resources]",
		[42291] = "Small Treasure Chest|10+|45.36 66.86||treasure|Contains|!{1397630} [Order Resources]",
	},


	--[[ Val'sharah ]]--

	-- Val'sharah
	[641] = {
		-- Treasure
		[38355] = "Small Treasure Chest|10+|64.7 51.26||treasure|Contains|!{1397630} [Order Resources]",
		[38363] = "Small Treasure Chest|10+|43.39 75.9||treasure|Contains|!{1397630} [Order Resources]",
		[38366] = "Small Treasure Chest|10+|48.68 73.79|\"In a tree trunk\"|treasure|Contains|!{1397630} [Order Resources]",
		[38369] = "Small Treasure Chest|10+|39.95 54.6||treasure|Contains|!{1397630} [Order Resources]", -- has phasing issues with the healer Broken Shore quest line
		[38386] = "Small Treasure Chest|10+|67.39 53.41||treasure|Contains|!{1397630} [Order Resources]",
		[39079] = "Small Treasure Chest|10+|38.64 67.18||treasure|Contains|!{1397630} [Order Resources]",
		[39080] = {"Small Treasure Chest|10+ §38644|38.4 65.32|Heathrow Cellar|treasure|Contains|!{1397630} [Order Resources]", "Small Treasure Chest|10+ 38644|38.4 65.32|Heathrow Cellar|treasure hardcore|Contains|!{1397630} [Order Resources]||[ff0000]To get inside Heathrow Cellar you will have to die near the door and resurrect on the other side]",}, -- approx coords -- Door can only be opened while doing quest 38644
		[39084] = "Small Treasure Chest|10+|43.22 54.88||treasure|Contains|!{1397630} [Order Resources]",
		[39085] = "Small Treasure Chest|10+|40.51 44.69||treasure down link:642|Contains|!{1397630} [Order Resources]", -- Darkpens
		[44139] = "Small Treasure Chest|10+|63.91 45.57||treasure|Contains|!{1397630} [Order Resources]",

		-- Alara'shinu
		[78623] = "Memory of Landeron Felfury|70+ demonhunter 78622|51.19 56.9||treasure speak item:210961|\"Witnessing the memory of Landeron Felfury inside the Temple of Elune is the final step in unlocking the secret warglaive [epic]Alara'shinu]",
		[78677] = "Warglaive|70+ demonhunter 78623|51.16 57.14||treasure item:210961|Contains|!{5061798} [epic]Alara'shinu]",
		[78678] = "Warglaive|70+ demonhunter 78677|51.16 57.14||treasure item:210961|Contains|!{5061798} [epic]Alara'shinu]",

		-- Vignette
		[40079] = {
			"Lyrath Moonfeather|10+ cloth|61.83 29.61||vignette item:130118|Drops|!{1113073} [rare]Moonfeather Handwraps]|!{1397630} [Order Resources]",
			"Lyrath Moonfeather|10+ -cloth|61.83 29.61||vignette|Drops|!{1397630} [Order Resources]",
		},
		[40079] = {
			"Wrathtalon|10+ leather|66.67 36.78||vignette item:130116|Drops|!{1115105} [rare]Twisted Wraithtalon Gloves]|!{1397630} [Order Resources]",
			"Wrathtalon|10+ -leather|66.67 36.78||vignette|Drops|!{1397630} [Order Resources]",
		},
		[38780] = {
			"Thondrax|10+ mail|62.66 47.52||vignette item:130121|Drops|!{1116923} [rare]Thondrax's Night-Runed Bands]|!{1397630} [Order Resources]",
			"Thondrax|10+ -mail|62.66 47.52||vignette|Drops|!{1397630} [Order Resources]",
		},
		[38767] = "Darkshade|10+|43.42 54.04||vignette item:130166|Drops|!{132225} [rare]Risen Saber Kitten]|!{1397630} [Order Resources]",
	},

	-- Darkpens
	[642] = {
		-- Treasure
		[39085] = "Small Treasure Chest|10+|41.94 88.35||treasure|Contains|!{1397630} [Order Resources]",
	},


	--[[ Highmountain ]]--

	-- Highmountain
	[650] = {
		-- Treasure
		[39531] = "A Steamy Jewelry Box|10+|63.49 59.32||treasure link:750|Contains|!{454054} [Shiny Silver Necklace]", -- Thunder Totem
		[40471] = "Treasure Chest|10+ 38909|47.1 61.32||treasure link:652|Contains|!{1397630} [Order Resources]", -- double check prereq 38909 -- Hall of Chieftains
		[40475] = "Highmountain Clan Chest|10+|45.13 59.92||treasure link:750|Contains|!{1397630} [Order Resources]", -- Thunder Totem
		[40475] = "Small Treasure Chest|10+|45.13 59.92||treasure link:750|Contains|!{1397630} [Order Resources]", -- Thunder Totem
		[40476] = "Glimmering Treasure Chest|10+|38.3 61.01||treasure down link:655|Contains|!{1397630} [Order Resources]", -- Lifespring Cavern
		[40484] = "Small Treasure Chest|10+|53.04 52.23|\"Inside Candle Rock\"|treasure down|Contains|!{1397630} [Order Resources]", -- Candle Rock
		--[40489] = "Treasure Chest|10+|85.23 37.96||treasure down link:651|Contains|!{1397630} [Order Resources]", -- Bitestone Enclave
		[40493] = "Small Treasure Chest|10+|53.04 52.23|\"On the furthest ledge inside Crystal Fissure\"|treasure down|Contains|!{1397630} [Order Resources]", -- Crystal Fissure
		[40506] = "Small Treasure Chest|10+|50.81 35.04||treasure|Contains|!{1397630} [Order Resources]",

		-- Vignette
		[39606] = "Treasures of Deathwing|10+|49.66 71.17|Highmountain Brazier|vignette down link:657|Glimmering Treasure Chest|!{1397630} [Order Resources]", -- Neltharion's Vault
		[48381] = "Obsidian Deathwarder|10+|49.08 83.35||vignette down link:658|Drops|!{634013} [poor]Curio of Neltharion]", -- Path of Huln
	},

	-- Thunder Totem
	[750] = {
		-- Treasure
		[40475] = "Small Treasure Chest|10+|32.36 41.72||treasure|Contains|!{1397630} [Order Resources]",
		[40471] = "Treasure Chest|10+ 38909|47.34 52.34||treasure down link:652|Contains|!{1397630} [Order Resources]", -- double check prereq 38909 -- Hall of Chieftains
		[39531] = "A Steamy Jewelry Box|10+|63.49 59.32||treasure|Contains|!{454054} [Shiny Silver Necklace]",
	},

	-- Hall of Chieftains, Thunder Totem
	[652] = {
		-- Treasure
		[40471] = "Treasure Chest|10+ 38909|62.95 67.85||treasure|Contains|!{1397630} [Order Resources]", -- double check prereq 38909
	},

	-- Lifespring Lower Cavern
	[656] = {
		-- Treasure
		[40476] = "Glimmering Treasure Chest|10+|52.87 23.96||treasure down link:655|Contains|!{1397630} [Order Resources]",
	},

	-- Lifespring Upper Cavern
	[655] = {
		-- Treasure
		[40476] = "Glimmering Treasure Chest|10+|52.87 23.96||treasure|Contains|!{1397630} [Order Resources]",
	},

	-- Bitestone Enclave
	[651] = {
		-- Treasure
		[40489] = "Treasure Chest|10+|85.23 37.96||treasure|Contains|!{1397630} [Order Resources]",
	},

	-- Neltharion's Vault
	[657] = {
		-- Vignette
		[39606] = "Treasures of Deathwing|10+|63.78 37.51|Highmountain Brazier|vignette|Glimmering Treasure Chest|!{1397630} [Order Resources]",
	},

	-- Path of Huln
	[658] = {
		-- Vignette
		[48381] = "Obsidian Deathwarder|10+|54.67 84.03||vignette|Drops|!{634013} [poor]Curio of Neltharion]",
	},


	--[[ Stormheim ]]--

	-- Stormheim
	[634] = {
		-- Treasure
		[43238] = "Small Treasure Chest|10+|43.16 40.49||treasure|Contains|!{1397630} [Order Resources]",
		[38477] = "Small Treasure Chest|10+|42.34 61.12||treasure|Contains|!{1397630} [Order Resources]",
		[42628] = "Small Treasure Chest|10+|72.13 54.89||treasure|Contains|!{1397630} [Order Resources]",
		[42629] = "Small Treasure Chest|10+|75.15 49.47||treasure|Contains|!{1397630} [Order Resources]",
		[42632] = "Small Treasure Chest|10+|73.96 52.23||treasure|Contains|!{1397630} [Order Resources]",
		[43237] = "Small Treasure Chest|10+|73.98 58.58||treasure|Contains|!{1397630} [Order Resources]",
		[43307] = "Small Treasure Chest|10+|78.42 71.39||treasure|Contains|!{1397630} [Order Resources]",
	},


	--[[ Suramar ]]--

	-- Suramar
	[680] = {
		-- Vignette
		[43580] = {
			"Apothecary Faldren|45+ cloth|42.29 56.62||vignette item:121754|Drops|!{1134730} [rare]Mana-Flecked Mantle]|!{1397630} [Order Resources]",
			"Apothecary Faldren|45+ -cloth|42.29 56.62||vignette|Drops|!{1397630} [Order Resources]",
		},
		[43954] = "Anax|45+|42.29 56.62||vignette item:140934|Drops|!{804967} [rare]Benax]|!{1397630} [Order Resources]",
	},


	--[[ Broken Shore ]]--

	[646] = {
		-- Alara'shinu
		[78622] = "Memory of Landeron Felfury|70+ demonhunter 78606|71.6 41.49||treasure speak item:210961|\"Witnessing the memory of Landeron Felfury inside The Lost Temple is the second step in unlocking the secret warglaive [epic]Alara'shinu]\"",
		[78623] = "Alara'shinu|70+ demonhunter 78622|71.6 41.49||treasure elsewhere link:641 item:210961|\"The next step in unlocking the secret warglaive [epic]Alara'shinu] takes place in Val'sharah\"",
	},


	--[[ Frostfire Ridge ]]--

	-- Frostfire Ridge
	[525] = {
		[33942] = "Supply Dump|10+|16.12 49.72||treasure|Contains|!{1005027} [Garrison Resources]",
	},


	--[[ Shadowmoon Valley ]]--

	-- Lunarfall
	[582] = {
		-- Treasure
		[35530] = "Lunarfall Egg|10+ alliance garrison:1|49.99 43.52||treasure|Contains|!{1005027} [Garrison Resources]",
		[35381] = "Pipper's Buried Supplies|10+ alliance garrison:1|42.39 54.4||treasure|Contains|!{1005027} [Garrison Resources]",
		[35384] = "Pipper's Buried Supplies|10+ alliance garrison:1|49.15 76.9||treasure|Contains|!{1005027} [Garrison Resources]",
		[35383] = "Pipper's Buried Supplies|10+ alliance garrison:1|30.9 27.7||treasure|Contains|!{1005027} [Garrison Resources]",
	},

	-- Shadowmoon Valley
	[539] = {
		-- Treasure
		[35280] = "Stolen Treasure|10+|27.05 2.49||treasure down|Contains|!{1005027} [Garrison Resources]",
		[34174] = "Fantastic Fish|10+|26.53 5.68||treasure|Contains|!{1005027} [Garrison Resources]",

		-- Vignette
		[35281] = "Bahameye|10+|29.06 5.67||vignette|Drops|!{1005027} [Garrison Resources]",
		[35847] = "Voidseer Kalurg|10+|32.67 41.37|\"Kill the nearby [hostile]Shadowmoon Channellers] to remove the barrier\"|vignette item:109074|Drops|!{937854} [rare]Fine Void-Chain Cinch]|!{1005027} [Garrison Resources]",
	},


	--[[ Nagrand ]]--

	[550] = {
		-- Vignette
		[35898] = "Gorepetal|10+|93.1 28.39|\"Pick the Pristine Lily to force Gorepetal out of hiding\"|vignette item:116916|Drops|!{944150} [rare]Gorepetal's Gentle Grasp]",
	},


	--[[ Elwynn Forest ]]--

	[37] = {
		-- Treasure
		[54131] = "Waterlogged Chest|1+|32.2 63.5||treasure item:3678|Contains|!{135274} [Pitted Defias Shortsword]|!{134939} [Recipe: Crocolisk Steak]|!{133694} [poor]Red Defias Mask]|!{133994} [Stormwind Brie]",
	},


	--[[ Redridge Mountains ]]--

	[49] = {
		-- Vignette
		[54214] = "Gnollfeaster|7+|24.36 70.97||vignette item:165722|Drops|!{132834} [rare]Redridge Tarantula Egg]",
	},

}