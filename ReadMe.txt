============================
>>>                      <<<
>>> FinalFantasylization <<<
>>>  ReadMe for 3.2.0    <<<
>>>                      <<<
============================


>>> CREDITS <<<
===============

- Nackle 	- Original Author. From Shadowmoon(EU) - Alliance (kirest@doravoc.com) 
- Seravais 	- Modified. From Medivh(US) - Horde 
- Enaress 	- Edited Slightly. (Enaress@GMail.com) 
- LorDestinY 	- Full Renovation. (lorddestiny@hotmail.com) - http://www.ad-aeternum.org/ 
- Hellfox 	- Northrend additions and WoW 3.0 support 
- Darken5 	- GUI, Code renovation, improved soundpack support, and Chrono Trigger Soundpack. (darken5@verizon.net) 
- egingell 	- Made it so soundpacks could be switched in FinalFantasylization 


>>> LOCALIZATION <<<
====================

French Translation by Freiya (Uldaman-EU)
German Translation by Siloxis (Anub'Arak Horde - EU)


>>> DESCRIPTION <<<
===================

Will play various musics based on zones, actions, etc...
Will also play some sounds as well.

Will play musics in the following events:

-- Capital Cities Events --
Orgrimmar
Silvermoon City 
Thunder Bluff	
Undercity 	
Darnassus	
Exodar 		
Ironforge	 
Stormwind City	 
Shattrath City
Dalaran
	
-- Horde Towns Events --
10x "horde" musics chosen randomly 

-- Alliance Towns Events --
10x "alliance" musics chosen randomly

-- Neutral Towns Events --
20x musics chosen randomly

-- Zones and Subzones Change Events --
10x musics chosen randomly
	
-- Battlegrounds Events --
5x "battleground" musics chosen randomly

-- Normal Mount Events --
3x "mounted" musics chosen randomly

-- Escape Mount Events --
5x "escape while mounted" musics chosen randomly

-- Flying Mount/Taxi Events --
2x "flying" musics chosen randomly

-- Dead/Ghost Events --
1x "dead" music
2x "ghost" musics chosen randomly

-- Fighting Events--
4x "fighting" musics chosen depending NPC/PC classification

-- Misc Events --
1x "swim" music 	 
1x "resting" music	


Will play sounds in the following events:

Fanfare sound
Kill sound
Enter combat sound


*************************************************************
*************************************************************

>>> Sound Packs <<<
===================

Instructions:
Extract to World of Warcraft addon folder.
"\Interface\Addons\"


*************************************************************
*************************************************************


>>> USAGE <<<
=============

/FFsound brings up the addon interface menu

Type /FFsound or /FFs and then the <command> that you wish to use:

     <command>
	on 	- Enables the addon
	off 	- Disables the addon
	music 	- Toggles music on/off
    	sound 	- Toggles sound on/off
    
    	combat 	- Toggles Combat music on/off
	flight  - Toggles Flight music on/off
   	fanfare - Toggles Fanfare sound on/off
   	dungeon - Toggles Dungeon music on/off
   	mount 	- Toggles Mount music on/off
	sleep	- Toggles Sleep music on/off
	swim	- Toggles Swimming music on/off
	dead	- Toggles death music on/off
    
	debug 	- Toggles debug mode
	test 	- Toggles debug test


/FFsoundpack prints up the usage info for soundpack changing. 

Type /FFsoundpack or /FFsp and then the <command> that you wish to use: 

     <command> 

	ff7 	- switches to the Final Fantasy 7 soundpack (if installed)
	ff8 	- switches to Final Fantasy 8 Soundpack (if installed)
	ff9 	- switches to Final Fantasy 9 Soundpack (if installed)
	ff10 	- switches to Final Fantasy 10 Soundpack (if installed)
	ct 	- switches to the Chrono Trigger soundpack (if installed)
	khearts - Switches to Kingdom Hearts Soundpack (if installed)
	wildarms - Switches to Wild Arms Soundpack (if installed)
	srebirth - Switches to Sephiroths Rebirth Soundpack (if installed)
	fftribute - Switches to Tribute to the Fantasy Soundpack (if installed)
	bleukreuz - Switches to Bleukreuz's Soundpack (if installed)
	ambient	- Switches to Ambient Alternative Soundpack (if installed)

For soundpacks not listed, please see their download site for more info


*Note: Enabling and Disabling by the ingame command will not enable or disable the addon itself,
it will only prevent it to play any kinds of music or sounds.
This is mostly for disabling and enabling it while in Raids (or when your tired of FF VII(which would never happen, right? :)).


*************************************************************
*************************************************************

>>> VERSION HISTORY<<<
======================

[b]>> ToDo List <<[/b]
Fix Resting event song on Normal servers (only work on PvP servers)
Fix the Battle Music issue (it sometimes stops in middle of fight)
Fix the Fanfare sound issue on battlegrounds (bugged)
Fix the Fanfare sound issue on dungeons (bosses only)
Fix the Fanfare sound issue on world (sometimes doesn't play)
Fix Dungeon bosses music events (only play on "Skull" and "Rare Elite")
Add Dungeons music events.
Add /Dance emote song
Add Mounted jump sound (Kweh!)
Add more zone/subzone detections

*********************
06. November 2016 - FinalFantasylization 3.2.1 - Soundpack Interface Update >> Darken5 <<
	- Soundpack Interface pages reduced
		- Removed Soundpack page 2
		- Removed buttons for lost soundpacks
		- Kept buttons for FF7, FF7 Universe, and Legend of Zelda soundpacks
		- Added button for Steven 2016 soundpack
	- Changed "DUNGEON EVENTS" to "RAID EVENTS" in core .lua
		- just did this to pre-empt adding in Dungeon songs.

05. November 2016 - FinalFantasylization 3.2.0 - More Stuff >> Darken5 <<
	- Added LibBabble-Faction-3.0 
		- More localization work
	- Fixed bug with Stranglethorn Vale that popped up.

--. October 2016 - FinalFantasylization 3.1.9.1 - ...
	- Added areas to DarkSwimming:
		- "The Sludge Fen"in The Barrens
		- "Blackwolf River" in Stonetallon Mountains 

27. October 2016 - FinalFantasylization 3.1.9 - Swimming music is back! >> Darken5 <<
	- Fixed Swimming music.
	- Added Zone Detection to Swimming (or ability to determin when the water youre in is nasty, like that of Undercity) to 
	- Removed outdated code for FF7 SP  and Chrono Triger SP from Core and Localizations. Havnt needed them since around FFz 3.1.0.
	- Fixed music not playing after loading screens. (This one was a complete pain... but it was sooo simple its ridiculous...)
	- removed excess sound folder location's from soundpack .lua song lists 
	

24. October 2016 - FinalFantasylization 3.1.8 - Incorporate LibBabble >> Darken5 <<
	- convert over Zone and Subzone Localization to LibBabble. (342 Subzone edits, 401 Zone edits, 743 Total edits... yay its done!)
		- also removed now Osolete FFz Localization entries in the localizations for en, fr, de, and es (Saving 63.8kb's ^^)
	- Taxi and Flying now detects Player Faction so there can be seperate songs for Horde/Alliance
		- aslo Required me update Soundpacks to support this.
	- Explorers' League Outpost now detects Horde/Alliance
	- Windrunner's Overlook Horde detection fixed (Typo)
	- Elwynn Forest works on Fr servers now ^^


20. October 2016 - FinalFantasylization 3.1.7.1 - The "Took me long enough" Update. >> Darken5 << (Only usable for WotLK still)
	- added embeds.xml for updated loading of addon 
	- Fixed interface (updated FFzlibs. WoW 3.3.5 WotLK update broke message sending when they added the ability to have multiple Chat boxes.) 
		- Detailed fix: all "ChatFrameEditBox" changed to "ChatFrame1EditBox" in FFzlibs.lua (stupidly simple, but if you didnt know what broke....... ugh)
	- Added mapID info to debug "Test" button for a bit of future proofing.

	- Library's added:
		- LibStub
		- LibBabble-Zone-3.0 - 3.3-release42 (Last release for WotLK)
		- LibBabble-SubZone-3.0 - 3.3-release6 (Last release for WotLK)
	

==========

7. September 2009 - FinalFantasylization 3.1.7 - LDB/Minimap Button >> Darken5 <<

    Even more updates to the User Interface:
    Added LDB Support (use youre favorite LDB Bar addons to change FFz settings/soundpacks easily, FuBar, Titan Panel, etc)
    Added a Minimap Button
        Left Clicking it opens Main UI Page (all the On/Off Options)
        Right Clicking it opens the 1st Soundpack Page
        Ctrl + Clicking it opens the Debug Menu 

    (Hopefully) Fixed issue where all On/Off switches show "Off" but music still playing (the options were still on, just not showing checks )
    Cleaned up some excess code and better labeled FFz internally (more for my benefit as Author than anything)

==========

24. August 2009 - FinalFantasylization 3.1.5 Beta >> Darken5, Stevenm281, blackknight95857669 <<

-Fixed some areas that weren't working properly:
- -Talonbranch Glade (Kalimdor, Felwood)
- -Bloodvenom Post (Kalimdor, Felwood)
- -Refuge Pointe (Eastern Kingdoms, Arathi Highlands)
- -Crusader's Pinnacle (Northrend, Icecrown)
- -Argent Vanguard (Northrend, Icrecrown)
- -Stars Rest (Northrend, Dragonblight)
- -Explorer's League Outpost (Northrend, Howling Fjord)
- -The Stormspire (Outland, Netherstorm)
- -Fort Wildervar (Northrend, Howling Fjord)
- -Shadow Vault (Northrend, Icecrown)
- -Sun's Reach (Eastern Kingdoms, Isle of Quel'Danas)
- -SubZone Coldarra (Northrend, Borean Tundra)
- -Razorfen Kraul
- -Razorfen Downs 

-Ton of new areas:

- -All Races Starting Areas have been added !
- - -Tauren: Camp Narache
- - -Undead: Deathknell
- - -Orcs and Trolls: Valley of Trials
- - -Blood Elves: Sunstrider Isle
- - -Night Elves: Shadowglen
- - -Humans: Northshire Valley
- - -Dwarves and Gnomes: Coldridge Valley
- - -Draenei: Ammen Vale
- - -Death Knights: Plaguelands: The Scarlet Enclave 

- -Darrowshire
- -The Maclure Vineyards
- -Hillsbrad Fields
- -Bael Modan
- -Eastvale Logging Camp
- -Pyrewood Village
- -Rut'theran Village
- -Starfall Village
- -Brewnall Village
- -Aeris Landing
- -Kirin'Var Village
- -Midrealm Post
- -Ogri'la
- -Protectorate Watch Post
- -Ghost Walker Post 
- -Blackwatch
- -Dawn's Reach
- -Dorian's Outpost
- -Dubra'Jin
- -Granite Springs
- -Kartak's Hold
- -Lakeside Landing
- -Light's Trust
- -Mistwhisper Refuge
- -Scalawag Point
- -Sparktouched Haven
- -Spearborn Encampment
- -Venture Bay
- -Valor's Rest
- -Caverns of Time
- -Steamwheedle Port
- -Mirage Raceway
- -Timbermaw Hold (Azshara, Felwood, Moonglade, Winterspring)
- -The Harborage

-New Battleground:
- -Isle of Conquest

-Added a Level Up Song option

-Slightly Improved Interface Menu 

-Reorganized the options
- -added Capital City Music Toggle
- -added Level Up Music toggle

-Lots of Bug Fixes (So many we lost track)

-Updated French, German and Spanish translations

==========

5. August 2009 - FinalFantasylization 3.1.4 >> Darken5, Stevenm281, Starkiller <<
- Updated for WoW 3.2 (YAY!)
- Added Spanish Translation (thanks to Starkiller)
- Fixed several bugs/errors/typo's found by Stevenm281

- Refuge Pointe (Town)
- Windrunner's Overlook (Town)
- Fort Wildevar (Town)
- Frenzyheart Hill (Town)
- Rainspeaker Canopy (Town)
- Eastern Kingdoms Zones: Badlands

==========

4. July 2009 - FinalFantasylization 3.1.1 >> Darken5 <<
- Fixed Deeprun Tram music

==========

1. July 2009 - FinalFantasylization 3.1.1 >> Darken5 << 
- New slash commands added

- /FFs - shortened version of /FFsound
- /FFsp - shortened version of /FFsoundpack

- New On/Off switches added

- sleep - Turns On/Off the "Sleep" music heard in Inn's

- commands are: (use one or the other)

- /ffsound sleep
- /ffs sleep

- swim - Turns On/Off the "Swimming" music heard while swimming

- commands are: (use one or the other)

- /ffsound swim
- /ffs swim

- dead - Turns On/Off the music heard after you die and during youre corpse run

- commands are: (use one or the other)

- /ffsound dead
- /ffs dead

- All On/Off switches can also be used from the Addon's interface menu

- Made the "English" localization into the "default" localization in case someone is using a version of WoW that isnt supported yet.

- This should fix many of the "nil value" errors that have been reported (hopefully)

- Removed the delay between switching soundpacks, should switch as soon as the correct command is entered.

==========

29. May 2009 - FinalFantasylization 3.1.0 - Deutch Fix >> Darken5 <<
- fixed a problem where deutch users couldnt load the final fantasy 7 or chrono trigger sp's

==========

25. May 2009 - FinalFantasylization 3.1.0 - Quick Fix >> Darken5 <<
- fixed the Warsong Hold music problem (was only playing SleepSong)

==========

21. May 2009 - FinalFantasylization 3.1.0 >> Darken5 <<
- Northrend Towns Supported
- EbonHoldSong.mp3 new song for Ebon Hold (DK home) 
- 50 new towns supported (Horde, Alliance, Neutral) 
- 5 new Misc areas added below northrend that just werent supported at all... may be more in the future.
- Battle Music fix

==========

14. May 2009 - FinalFantasylization 3.0.97 >> Darken5, Freiya, Siloxis <<
- French Translation by Freiya
- German Translation by Siloxis
- small edit to how localization is handled and folder structure by Darken5
- Finally updated the ReadMe.txt

==========

10. May 2009 - FinalFantasylization 3.0.95 >> Darken5 <<
- English Localization finished for current FinalFantasylization
- - Fixed roughly 13 more typo's during localization. (I had my trusty can of "Typo's-Be-Gone" handy)

==========

6. May 2009 - FinalFantasylization 3.0.9 >> Darken5 <<
- Battleground workaround fix (not perfect, but better. Its not FinalFantasylizations fault, PlayMusic() is buggy in instances and battlegrounds, nothing more i can do about it, its a WoW problem) 
- PVP music "update" not sure if its a full fix or not, but it works ok for me.
- More localization work done (not complete quite yet...)
- Revised the combat music calls some (still cant figure out why in BG's the music is cutting out, working on it tho) 
- Recolored the /ffsound test to make it easier to read 
- Fixed the Instance/Battleground music On/Off toggle, now actually does something (turn off if you get tired of Instance/Battleground music errors)
- New library 
- Reworked the debug system so it doesnt spam the chatbox. 
- Color coded the debug mesages. 
- /ffsound test - updated, added instanceType classification: 
- - "none" when outside an instance 
- - "pvp" when in a battleground 
- - "arena" when in an arena 
- - "party" when in a 5-man instance 
- - "raid" when in a raid instance

==========

23. Apr 2009 - FinalFantasylization 3.0.81 (Bug Fix) >> Darken5 << 

- Only released on http://finalfantasylization.forumcircle.com/portal.php as a minor bug fix 
- Un'Goro Crater - Music Fix 
- The Storm Peaks - Music Fix 
- Crystalsong Forest - Debug mode fix (was saying you were in Storm Peaks, now says Crystalsong Forest)

==========

21. Apr 2009 - FinalFantasylization 3.0.8 >> Darken5 << 

- updating debug mesages (aka adding more to make my life easier ^^) 
- recoded soundpacks yet again, tho this should be the last time unless we add new songs or change when they play ( omg... 12 hour long last minute recode... this here is why 3.0.2 didn't get released. PS: Redbull kicks ass!!!!!) 
- now i can get on with making "NEW" soundpacks, yay! 
- My full support will be given to anyone interested in doing their own soundpacks as well.
- FIXED: Battleground music... 
- - i swear if another of these bugs that have been here forever is a typo... so help me god... lol

==========

Unreleased - FinalFantasylization 3.0.2 >> Darken5/egingell << 

- Can now change between soundpacks (HUGE THANK YOU'S go out to egingell over at wowace.com, he did the code for this) 
- reconfigured current soundpacks to work with new system 
- Added function to change soundpacks 
- new slash command /ffsoundpack <command> 
- - <command> 
- - ct = change soundpack to chrono trigger 
- - ff7 = change soundpack to Final Fantasy 7

==========

17. Apr 2009 - FinalFantasylization 3.0.1 >> Darken5 << 

- fixed bug where when you turn off "Sounds" ALL Combat music and sounds stop.(thanks bleukreuz for noticing that) 
- Updating Localization.lua to include all the internal debug mesages (work in progress) 
- alphabetized the neutral capital city's and Northrend zones sections in the lua. 
- added functionality for the zone Coldarra in Northrend. 
- hopefully fixed the Resting song event for non pvp servers... 
- fixed Mount toggle to turn on/off mounted escape music 
- added a Flight on/off command and GUI checkbox "/ffsound flight" 
- fixed a typo making the Blasted Lands not work properly (thanks Yuzi Shinku for noticing that) 
- and the equivalent of code "Spring Cleaning" to get it ready for next update faster.

==========

13. Apr 2009 - FinalFantasylization 3.0 >> Darken5 << 

- Added a graphical interface. 
- Reconfigured the code to save space. 
- Killed the "Sounds" folder by making the soundpacks into dependant addons. 
- Made a Chrono Trigger Soundpack.


********** 

29. Mar 2009 - FinalFantasylization Renewed Finalfantasylization code update 2 >> Hellfox << 

- Fixed obstinate folder structure problem with .zip file (aka. added a "Sounds" folder to the .zip file) 
-- Re-fixed stupid obstinate folder structure the next day as well, it zipped with wrong folder name...


23. Feb 2009 - FinalFantasylization Renewed v2.0.2 Alpha (A bit more) >> Hellfox << 

- Removed Chocobo Khew!khew! sound on Hawkstrider jump. (the function was removed from WoW. lotsa errors) 
- Added Northrend functionality. 
- Added World of Warcraft 3.0 functionality.


********** 

22. Aug 2008 - FinalFantasylization Renewed v2.0.2 Alpha >> LorDestinY << 

- Fixed issue with "Non PvP Servers" (works with both PvP and PvE servers) 
- Added 2 more commands (/FFsound fanfare; /FFsound combat) 
- Added enter combat sound event (Whoosh!! sound when entering combat)


06. Aug 2008 - FinalFantasylization Renewed v2.0.1b >> LorDestinY << 

- Temporary fix for non PvP servers.


06. Aug 2008 - FinalFantasylization Renewed v2.0.1 >> LorDestinY << 

- Fixed "Fanfare" issue (will only trigger after killing a NPC/PC and exit combat) 
- Added 4 random fighting music when fighting normal NPC 
- Added 1 more commands (/FFsound mount - Toogle mount sound on/off) 
- Disabled Fanfare sound on Battlegounds and on Dungeons (for debug purpose)


05. Aug 2008 - FinalFantasylization Renewed v2.0.0 >> LorDestinY << 

- Full code renovation. 
- Added music events to all capital cities. (Horde, Alliance and Neutral) 
- Added music events to all towns. (Horde, Alliance and Neutral) 
- Added music events to all zones and subzones. (Kalimdor, Eastern Kingdoms and Outland) 
- Added more musics to battlegrounds, battle and mount events. 
- Added Chocobo Khew!khew! sound on Hawkstrider jump.


30. Jul 2008 - FinalFantasylization Renewed v1.0.0 >> LorDestinY << 

- Official Release. 
- Improved considerably the event music start timing (all the game events trigger the music loading command) 
- Fixed starting addon music (well its not really fixed, its a workaround fix  ) 
- Removed the intro song (kinda bugged) 
- Removed kill sound (very annoying) 
- Remove Battleground Victory/Loss fanfare (bugged) 
- Removed Music starting and ending gap 
- Added The Crossroads music (Ahead On Our Way) 
- Added Ratchet and Booty Bay music (Costa Del Sol) 
- Added Undercity music (Anxious Heart) 
- Added Silvermoon City music (Oppressed People) 
- Added two musics to Escape while mounted event (Hurry and Escape music) 
- Changed Friendly Area Music (Tifa's Theme) 
- Fixed Resting Event (Doesn't work with Villages and Cities with music events) 
- Fixed PVE Victory Fanfare (sound fixed) 
- PVE Victory Fanfare sound is disabled by default (use /FF sound to enable/disable it) 
- Small cleaning of the code.


********** 

22. Apr 2008 - FinalFantasylization (Fan Update) >> unstoppableKhaos << 

- Minor updated to work on patch 2.4.x.


********** 

01. Apr 2008 - FinalFantasylization Ressurect >> Seravais << 

- Added flight music while flying on a flying mount.


********** 

26. Jan 2006 - FinalFantasylization v0.60 >> Nackle << 

- Made compatible for TBC, should work properly, swimming song has been added as well, PVP Zone Type based songs (friendly/neutral/hostile areas) should work better as well. 
- Should also properly stop the music playback when disabling the mod via slash command


13. Dec 2006 - FinalFantasylization v0.58b >> Nackle << 

- Fixed /FFSound Disable, should now also stop the music playback as well as preventing more. 
- BG fanfare/lose should now work properly as horde 
- Friendly zone should now play the correct song 
- Fixed a mix where some of the source of LazyFrostMage addon where in the source of this addon(Nackle is author of both and used that as template)


13. Dec 2006 - FinalFantasylization v0.58 >> Nackle << 

- Made compitable for WoW 2.0 
- Minor Fixes


25. Nov 2006 - FinalFantasylization v0.57 >> Nackle << 

- Added more songs for different events and areas 
- Fixed /FFSound Disable


10. Nov 2006 - FinalFantasylization v0.56 >> Nackle << 

- Fixed the problem playing music in contested and hostile territory. 
- Also modified IsMounted's Toc so it wont appear out of date(works fine and haven't found a newer version out yet)


10. Nov 2006 - FinalFantasylization v0.55 >> Nackle << 

- Official Release.


*************************************************************
*************************************************************
