# Breadcrumbs

Breadcrumbs is an addon for World of Warcraft that adds dynamic pins to your World Map. It lets you quickly see exactly which Quests, Treasures and Vignettes are available to pick up in any given zone without having to check any external resources. It also adds a few additional quality of life features to your World Map.

A great deal of care has been taken to make sure that the addon integrates with the map interface seamlessly without being obstructing, while using as few resources as possible.

All data has been compiled and tested manually to ensure accuracy and seamlessness.

![Screenshot](https://i.imgur.com/k3zVLC9.png)

## Features

- Show currently available quests on the World Map with accurate locations
- Show currently available treasures and vignettes on the World Map with helpful tooltips
- Add additional Points of Interest such as portals, doors, profession trainers and missing Flight Masters to the World Map
- Fix several map related Blizzard bugs/oversights
- Add missing information or objective locations for certain quests
- Show warnings for some buggy quests directly on the map and in tooltips (for example [The Spruted Fronds](https://www.wowhead.com/quest=2399/the-sprouted-fronds#comments))
- Optional TomTom integration for some quests
- Lots of options to tailor the addon to your liking (GUI NYI)

![Screenshot](https://i.imgur.com/N43xls7.png)

![Screenshot](https://i.imgur.com/t0071Ad.png)

## How to Try

This addon does not currently have an official release available since so much quest data is still missing and it is being worked on almost daily. That said, it is very stable and the data that *is* there is very accurate. Most of the POI features are also more or less complete.

If you would like to try it out, you can [download the current build from GitHub](https://github.com/glassleo/Breadcrumbs/archive/refs/heads/main.zip). Then extract the folder named ``Breadcrumbs`` (which is inside ``Breadcrumbs-main``) into your AddOns folder.

The addon does have a lot of options available but you'll have to change them manually by editing ``Breadcrumbs.lua`` as there is no in-game GUI implemented for them yet. There are options to disable the questing parts of the addon if you only want to use the POI features.

## Current Progress

While the addon itself is more or less feature complete, only a tiny fraction of all required data has been compiled and tested so far.

If you'd like to help, please [get in touch](mailto:hello@leo.glass)!

So far, the following zones are entirely complete or in a near-complete state:

### Dragon Isles (2/5 Complete)
- The Waking Shores (including Adventure Mode)
- Ohn'ahran Plains (including Adventure Mode)
- Valdrakken POIs

### Shadowlands (6/8 Complete)
- Zereth Mortis and the Secrets of the First Ones campaign
- Oribos
- Bastion (Threads of Fate only)
- Maldraxxus (Threads of Fate only)
- Ardenweald (Threads of Fate only)
- Revendreth (Threads of Fate only)

### Broken Isles (5/8 Complete)
- Azsuna
- Val'sharah
- Highmountain
- Stormheim
- Broken Shore

### Eastern Kingdoms
- Tirisfal Glades
- Eversong Woods
- Elwynn Forest
- Westfall
- Dun Morogh
- Loch Modan

### Kalimdor
- Teldrassil
- Azuremyst Isle
- Durotar
- Mulgore
- Azshara
