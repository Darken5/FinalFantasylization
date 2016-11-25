--#######################################
--##
--##	   FinalFantasylization 3.1.0
--##
--##	     My Soundpack Name 
--##
--##	        Soundpack
--##
--##       By: My Name
--##
--#######################################

local flag = false -- off: used in the Code to determine which sound pack is enabled
local soundPackID = "MySoundpackID" -- Specific /ffsoundpack <command> for this soundpack, must be 1 word/acronym, and lowercase (example: "Final Fantasy Mix Project" would be "ffmix"  or similar)
_G["SoundPack" .. soundPackID  .. "_SetEnabled"] = function(enabled)
    flag = enabled
    if enabled then
		-- set all the sound effects variables for this pack (you know... the ones passed to PlaySoundFile())
		--#######################################
		--##
		--##		Song List
		--##
		--#######################################

		-- Capital Cities Events --
		OrgrimmarSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\OrgrimmarSong.mp3" -- 
		SilvermoonCitySong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\SilvermoonCitySong.mp3" -- 
		ThunderBluffSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\ThunderbluffSong.mp3" -- 
		UndercitySong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\UndercitySong.mp3" -- 

		DarnassusSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\DarnassusSong.mp3" -- 
		ExodarSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\ExodarSong.mp3" -- 
		IronforgeSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\IronforgeSong.mp3" -- 
		StormwindCitySong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\StormwindCitySong.mp3" -- 

		ShattrathCitySong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\ShattrathCitySong.mp3" -- 
		DalaranSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\DalaranSong.mp3" -- 
		EbonHoldSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\EbonHoldSong.mp3" -- 

		-- Horde Towns Events --
		Horde1Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde1Town.mp3" -- 
		Horde2Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde2Town.mp3" -- 
		Horde3Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde3Town.mp3" -- 
		Horde4Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde4Town.mp3" -- 
		Horde5Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde5Town.mp3" --
		Horde6Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde6Town.mp3" -- 
		Horde7Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde7Town.mp3" -- 
		Horde8Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde8Town.mp3" -- 
		Horde9Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde9Town.mp3" -- 
		Horde10Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Horde10Town.mp3" --

		-- Alliance Towns Events --
		Alliance1Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance1Town.mp3" -- 
		Alliance2Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance2Town.mp3" -- 
		Alliance3Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance3Town.mp3" -- 
		Alliance4Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance4Town.mp3" -- 
		Alliance5Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance5Town.mp3" -- 
		Alliance6Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance6Town.mp3" -- 
		Alliance7Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance7Town.mp3" -- 
		Alliance8Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance8Town.mp3" -- 
		Alliance9Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance9Town.mp3" -- 
		Alliance10Town = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Alliance10Town.mp3" --

		-- PvP Type Zones Events --
		FriendlySong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\FriendlySong.mp3" -- 
		ContestedSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\ContestedSong.mp3" -- 
		HostileSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\HostileSong.mp3" -- 

		ForestSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\ForestSong.mp3" -- 
		LandSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\LandSong.mp3" -- 
		PlagueSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\PlagueSong.mp3" -- 
		SandSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\SandSong.mp3" -- 
		SnowSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\SnowSong.mp3" -- 
		SwampSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\SwampSong.mp3" -- 
		BeachSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\BeachSong.mp3" -- 

		-- Battlegrounds Events --
		BattleGround1 = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\BattleGround1.mp3" -- 
		BattleGround2 = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\BattleGround2.mp3" -- 
		BattleGround3 = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\BattleGround3.mp3" -- 
		BattleGround4 = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\BattleGround4.mp3" -- 
		BattleGround5 = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\BattleGround5.mp3" --

		-- Normal Mount Events --
		Mounted1Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Mounted1Song.mp3" -- 
		Mounted2Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Mounted2Song.mp3" -- 
		Mounted3Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Mounted3Song.mp3" -- 

		Escape1Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Escape1Song.mp3" -- 
		Escape2Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Escape2Song.mp3" -- 
		Escape3Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Escape3Song.mp3" -- 
		Escape4Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Escape4Song.mp3" -- 
		Escape5Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Escape5Song.mp3" -- 

		-- Flying Mount Events --
		Flying1Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Flying1Song.mp3" -- 
		Flying2Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Flying2Song.mp3" -- 

		-- Dead/Ghost Events --
		Dead1Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Dead1Song.mp3" -- 
		Dead2Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Dead2Song.mp3" -- 
		DieSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\DieSong.mp3" -- 

		-- Fighting Events --
		Fanfare = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Fanfare.mp3" -- Fanfare
		Fighting1Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Fighting1Song.mp3" -- 
		Fighting2Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Fighting2Song.mp3" -- 
		Fighting3Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Fighting3Song.mp3" -- 
		Fighting4Song = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Fighting4Song.mp3" -- 

		-- Misc Events --
		SwimSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\SwimSong.mp3" -- 
		SleepSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\SleepSong.mp3" -- 
		KillSound = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Kill.wav" -- Leave combat sound
		CombatSound = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\Combat.wav" -- Enter combat sound
		LevelUpSong = "Interface\\AddOns\\FinalFantasylization_MySoundpackName\\Sounds\\LevelUpSong.mp3" -- Level Up song

		
	--#######################################
	--##
	--##	MUSIC /SOUND CALLS
	--##
	--#######################################

	--#############
	-- ## SOUNDS
	--#############

	function FinalFantasylization_KillSound()
		FinalFantasylization_PlayFile( KillSound );
		FinalFantasylization_debugMsg("KillSound")
	end
	function FinalFantasylization_CombatSound()
		FinalFantasylization_PlayFile( CombatSound );
		FinalFantasylization_debugMsg("CombatSound")
	end
	function FinalFantasylization_LevelUpSong()
		FinalFantasylization_PlayFile( LevelUpSong );
		FinalFantasylization_debugMsg("LevelUpSong")
	end

	--########################
	-- ## BATTLEGROUNDS
	--########################
	function FinalFantasylization_AlteracValleyBG()
		FinalFantasylization_BattleGround()
	end
	function FinalFantasylization_ArathiBasinBG()
		FinalFantasylization_BattleGround()
	end	
	function FinalFantasylization_EyeoftheStormBG()
		FinalFantasylization_BattleGround()
	end	
	function FinalFantasylization_StrandsoftheAncientsBG()
		FinalFantasylization_BattleGround()
	end	
	function FinalFantasylization_WarsongGulchBG()
		FinalFantasylization_BattleGround()
	end
	function FinalFantasylization_IsleOfConquestBG()
		FinalFantasylization_BattleGround()
	end
	--########################
	-- ## STARTING AREAS
	--########################
	function FinalFantasylization_StarterAreaSunstriderIsle()
		FinalFantasylization_ForestSong();
	end
	function FinalFantasylization_StarterAreaDeathknell()
		FinalFantasylization_PlagueSong();
	end
	function FinalFantasylization_StarterAreaValleyOfTrials()
		FinalFantasylization_LandSong();
	end
	function FinalFantasylization_StarterAreaCampNarache()
		FinalFantasylization_LandSong();
	end
	function FinalFantasylization_StarterAreaColdridgeValley()
		FinalFantasylization_SnowSong();
	end
	function FinalFantasylization_StarterAreaNorthshireValley()
		FinalFantasylization_ForestSong();
	end
	function FinalFantasylization_StarterAreaAmmenVale()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_PlagueSong()
			end
	end
	function FinalFantasylization_StarterAreaShadowglen()
		FinalFantasylization_ForestSong();
	end
	function FinalFantasylization_StarterAreaScarletEnclave()
		FinalFantasylization_BattleGround();
	end
	--########################
	-- ## HORDE CAPITAL CITIES
	--########################

	function FinalFantasylization_OrgrimmarSong()
		FinalFantasylization_PlayMusic(OrgrimmarSong);
		FinalFantasylization_debugMsg("OrgrimmarSong")
	end
	function FinalFantasylization_SilvermoonCitySong()
		FinalFantasylization_PlayMusic(SilvermoonCitySong);
		FinalFantasylization_debugMsg("SilvermoonCitySong")
	end
	function FinalFantasylization_ThunderBluffSong()
		FinalFantasylization_PlayMusic(ThunderBluffSong);
		FinalFantasylization_debugMsg("ThunderBluffSong")
	end
	function FinalFantasylization_UndercitySong()
		FinalFantasylization_PlayMusic(UndercitySong);
		FinalFantasylization_debugMsg("UndercitySong")
	end

	--########################
	-- ## ALLIANCE CAPITAL CITIES
	--########################

	function FinalFantasylization_DarnassusSong()
		FinalFantasylization_PlayMusic(DarnassusSong);
		FinalFantasylization_debugMsg("DarnassusSong")
	end
	function FinalFantasylization_ExodarSong()
		FinalFantasylization_PlayMusic(ExodarSong);
		FinalFantasylization_debugMsg("ExodarSong")
	end
	function FinalFantasylization_IronforgeSong()
		FinalFantasylization_PlayMusic(IronforgeSong);
		FinalFantasylization_debugMsg("IronforgeSong")
	end
	function FinalFantasylization_StormwindCitySong()
		FinalFantasylization_PlayMusic(StormwindCitySong);
		FinalFantasylization_debugMsg("StormwindCitySong")
	end

	--########################
	-- ## NEUTRAL CAPITAL CITIES
	--########################

	function FinalFantasylization_CityArea52()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_CityBootyBay()
		FinalFantasylization_BeachSong()
	end
	function FinalFantasylization_DalaranSong()
		FinalFantasylization_PlayMusic(DalaranSong);
		FinalFantasylization_debugMsg("DalaranSong")
	end
	function FinalFantasylization_EbonHoldSong()
			FinalFantasylization_PlayMusic(EbonHoldSong);
			FinalFantasylization_debugMsg("EbonHoldSong")
		end
	function FinalFantasylization_CityEverlook()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_CityGadgetzan()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_CityRatchet()
		FinalFantasylization_BeachSong()
	end
	function FinalFantasylization_ShattrathCitySong()
		FinalFantasylization_PlayMusic(ShattrathCitySong);
		FinalFantasylization_debugMsg("ShattrathCitySong")
	end

	--########################
	-- ##   HORDE TOWNS
	--########################

	function FinalFantasylization_HordeTownAgmarsHammer()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownApothecaryCamp()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownBloodhoofVillage()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownBloodvenomPost()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownBrackenwallVillage()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownBrill()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownBorgorokOutpost()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownCampMojache()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownCampOneqwah()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownCampTaurajo()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownCampTunkalo()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownCampWinterhoof()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownConquestHold()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownFairbreezeVillage()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownFalconWatch()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownFalconwingSquare()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownFlameCrest()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownFreewindPost()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownGaradar()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownGromarshCrashSite()
		FinalFantasylization_HordeTowns()
	end	
	function FinalFantasylization_HordeTownGromgolBaseCamp()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownHammerfall()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownKargath()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownKorkronVanguard()
		FinalFantasylization_HordeTowns()
	end	
	function FinalFantasylization_HordeTownMokNathalVillage()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownNewAgamand()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownRazorHill()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownRevantuskVillage()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownSenjinVillage()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownSepulcher()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownShadowmoonVillage()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownShadowpreyVillage()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownSplintertreePost()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownStonard()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownStonebreakerHold()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownSunreaversCommand()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownSunRockRetreat()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownSwampratPost()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownTarrenMill()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownTaunkaleVillage()
		FinalFantasylization_HordeTowns()
	end	
	function FinalFantasylization_HordeTownCrossroads()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownThrallmar()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownThunderlordStronghold()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownTranquillien()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownValormok()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownVengeanceLanding()
		FinalFantasylization_HordeTowns()
	end	
	function FinalFantasylization_HordeTownVenomspite()
		FinalFantasylization_HordeTowns()
	end	
	function FinalFantasylization_HordeTownWarsongHold()
		FinalFantasylization_HordeTowns()
	end	
	function FinalFantasylization_HordeTownZabrajin()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownZoramgarOutpost()
		FinalFantasylization_HordeTowns()
	end
	function FinalFantasylization_HordeTownGhostWalkerPost()
		FinalFantasylization_HordeTowns()
	end


	--########################
	-- ##   ALLIANCE TOWNS
	--########################
	function FinalFantasylization_AllianceTownAeriePeak()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownAllerianStronghold()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownAmberpineLodge()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownAstranaar()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownAuberdine()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownAzureWatch()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownBloodWatch()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownChillwindCamp()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownDarkshire()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownDolanaar()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownExplorersLeagueOutpost()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownFeathermoonStronghold()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownFizzcrankAirstrip()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownFordragonHold()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownForestSong()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownFortWildervar()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownFrosthold()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownGoldshire()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownHonorHold()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownKharanos()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownLakeshire()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownMenethilHarbor()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownMorgansVigil()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownNethergardeKeep()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownNijelsPoint()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownOreborHarborage()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownRebelCamp()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownRefugePointe()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownSentinelHill()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownSouthshore()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownStarsRest()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownStonetalonPeak()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownSylvanaar()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownTalonbranchGlade()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownTalrendisPoint()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownTelaar()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownTelredor()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownTempleOfTelhamat()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownThalanaar()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownThelsamar()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownTheramoreIsle()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownToshleysStation()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownValianceKeep()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownValgarde()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownWestfallBrigadeEncampment()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownWestguardKeep()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownWildhammerStronghold()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownWindrunnersOverlook()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownWintergardeKeep()
		FinalFantasylization_AllianceTowns()
	end	
	function FinalFantasylization_AllianceTownBrewnallVillage()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownEastvaleLoggingCamp()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownPyrewoodVillage()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownRuttheranVillage()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownBaelModan()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownStarfallVillage()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownMaclureVineyards()
		FinalFantasylization_AllianceTowns()
	end
	function FinalFantasylization_AllianceTownHillsbradFields()
		FinalFantasylization_AllianceTowns()
	end


	--########################
	-- ##   NEUTRAL TOWNS
	--########################
	function FinalFantasylization_NeutralTownAltarOfShatar()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownAmberLedge()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownArgentTournamentGrounds()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownArgentVanguard()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownBouldercragsRefuge()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownCenarionHold()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownCenarionRefuge()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownCosmowrench()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownCrusadersPinnacle()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownDeathsRise()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownDunNiffelem()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownEbonWatch()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownEmeraldSanctuary()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownEvergrove()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownFrenzyheartHill()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownHalaa()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownK3()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownKamagua()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownLightsBreach()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownLightsHopeChapel()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownMarshalsRefuge()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownMoakiHarbor()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownMudsprocket()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownNesingwaryBaseCamp()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownNighthaven()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownRainspeakerCanopy()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownRiversHeart()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownSanctumOfTheStars()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownShadowVault()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownSporeggar()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownStormspire()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownSunsReach()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownTheArgentStand()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownThoriumPoint()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownTransitusShield()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownUnupe()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownWyrmrestTemple()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownZimTorga()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownTheHarborage()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownValorsRest()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownSteamwheedlePort()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownMirageRaceway()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownAerisLanding()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownMidrealmPost()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownProtectorateWatchPost()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownDawnsReach()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownLightsTrust()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownGraniteSprings()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownVentureBay()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownScalawagPoint()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownBlackwatch()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownDoriansOutpost()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownKartaksHold()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownLakesideLanding()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownMistwhisperRefuge()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownSparktouchedHaven()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownSpearbornEncampment()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownDubraJin()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_NeutralTownOgrila()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownTimbermawHold()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownDarrowshire()
		FinalFantasylization_NeutralTowns();
	end	
	function FinalFantasylization_NeutralTownKirinVarVillage()
		FinalFantasylization_NeutralTowns();
	end

	
	--########################
	-- ##   MISCELANEOUS ZONES
	--########################
	function FinalFantasylization_MiscAreaScarletMonastery()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_HostileSong()
			end
	end	
	function FinalFantasylization_MiscAreaRazorfenKraul()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_HostileSong()
			end
	end	
	function FinalFantasylization_MiscAreaWailingCaverns()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_HostileSong()
			end
	end	
	function FinalFantasylization_MiscAreaTheDeadmines()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_HostileSong()
			end
	end	
	function FinalFantasylization_MiscAreaDeeprunTram()
		FinalFantasylization_FriendlySong()
	end	
	function FinalFantasylization_MiscAreaCavernsOfTime()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end	


	--########################
	-- ##   EASTERN KINGDOMS ZONES
	--########################
	function FinalFantasylization_EasternKingdomsAlteracMountains()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SnowSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsArathiHighlands()		
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsBadlands()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsBlackrockMountain()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsBurningSteppes()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsDeadwindPass()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end				
	function FinalFantasylization_EasternKingdomsDunMorogh()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SnowSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_EasternKingdomsDunMoroghHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SnowSong()
			else
				FinalFantasylization_HostileSong()
			end
	end				
	function FinalFantasylization_EasternKingdomsDuskwood()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsEasternPlaguelands()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsElwynnForest()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_EasternKingdomsElwynnForestHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_EasternKingdomsEversongWoods()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end				
	function FinalFantasylization_EasternKingdomsEversongWoodsHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_EasternKingdomsGhostlands()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_EasternKingdomsGhostlandsHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_EasternKingdomsHillsbradFoothills()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsIsleofQuelDanas()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsLochModan()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_EasternKingdomsLochModanHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_EasternKingdomsRedridgeMountains()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end				
	function FinalFantasylization_EasternKingdomsSearingGorge()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsSilverpineForest()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_EasternKingdomsSilverpineForestHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_EasternKingdomsStranglethornVale()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsSwampOfSorrows()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsBlastedLands()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsTheHinterlands()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsTirisfalGlades()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_EasternKingdomsTirisfalGladesHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_EasternKingdomsWesternPlaguelands()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_EasternKingdomsWestfall()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_EasternKingdomsWestfallHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_EasternKingdomsWetlands()
		local x = math.random(1, 2);
					if x == 1 then
						FinalFantasylization_SwampSong()
					else
						FinalFantasylization_ContestedSong()
					end
	end

					
	--########################
	-- ##   KALIMDOR ZONES
	--########################
	function FinalFantasylization_KalimdorAshenvale()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorAzshara()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorAzuremystIsle()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_KalimdorAzuremystIsleHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_KalimdorBloodmystIsle()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_KalimdorBloodmystIsleHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_KalimdorDarkshore()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_KalimdorDarkshoreHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_KalimdorDesolace()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorDurotar()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_LandSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_KalimdorDurotarHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_LandSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_KalimdorDustwallowMarsh()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorFelwood()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorFeralas()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorMoonglade()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorMulgore()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_KalimdorMulgoreHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_KalimdorSilithus()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorStonetalonMountains()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_LandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorTanaris()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorTeldrassil()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_KalimdorTeldrassilHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_KalimdorTheBarrens()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_FriendlySong()
			end
	end
	function FinalFantasylization_KalimdorTheBarrensHostile()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_HostileSong()
			end
	end
	function FinalFantasylization_KalimdorThousandNeedles()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_LandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorUngoroCrater()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_KalimdorWinterspring()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SnowSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end


	--########################
	-- ##   OUTLAND ZONES
	--########################
	function FinalFantasylization_OutlandBladesEdgeMountains()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_OutlandHellfirePeninsula()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_LandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_OutlandNagrand()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_OutlandNetherstorm()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_OutlandShadowmoonValley()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_OutlandTerokkarForest()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_OutlandZangarmarsh()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end


	--########################
	-- ##   NORTHREND ZONES
	--########################
	function FinalFantasylization_NorthrendBoreanTundra()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SnowSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_NorthrendColdarra()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SnowSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_NorthrendCrystalsongForest()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ForestSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_NorthrendDragonblight()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SwampSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_NorthrendGrizzlyHills()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_ThunderBluffSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_NorthrendHowlingFjord()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SnowSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end
	function FinalFantasylization_NorthrendIcecrown()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end		
	function FinalFantasylization_NorthrendSholazarBasin()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_SandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end		
	function FinalFantasylization_NorthrendStormPeaks()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_LandSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end		
	function FinalFantasylization_NorthrendWintergrasp()
			FinalFantasylization_BattleGround()
	end		
	function FinalFantasylization_NorthrendZulDrak()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlagueSong()
			else
				FinalFantasylization_ContestedSong()
			end
	end		


	--#############
	-- ## PVP ZONES
	--#############

	function FinalFantasylization_FriendlySong()
		FinalFantasylization_PlayMusic(FriendlySong);
		FinalFantasylization_debugMsg("FriendlySong")
	end

	function FinalFantasylization_ContestedSong()
		FinalFantasylization_PlayMusic(ContestedSong);
		FinalFantasylization_debugMsg("ContestedSong")
	end

	function FinalFantasylization_HostileSong()
		FinalFantasylization_PlayMusic(HostileSong);
		FinalFantasylization_debugMsg("HostileSong")
	end

	--#############
	-- ## ZONE SONGS
	--#############

	function FinalFantasylization_SnowSong()
		FinalFantasylization_PlayMusic(SnowSong);
		FinalFantasylization_debugMsg("SnowSong")
	end

	function FinalFantasylization_ForestSong()
		FinalFantasylization_PlayMusic(ForestSong);
		FinalFantasylization_debugMsg("ForestSong")
	end

	function FinalFantasylization_SandSong()
		FinalFantasylization_PlayMusic(SandSong);
		FinalFantasylization_debugMsg("SandSong")
	end

	function FinalFantasylization_PlagueSong()
		FinalFantasylization_PlayMusic(PlagueSong);
		FinalFantasylization_debugMsg("PlagueSong")
	end

	function FinalFantasylization_SwampSong()
		FinalFantasylization_PlayMusic(SwampSong);
		FinalFantasylization_debugMsg("SwampSong")
	end

	function FinalFantasylization_BeachSong()
		FinalFantasylization_PlayMusic(BeachSong);
		FinalFantasylization_debugMsg("BeachSong")
	end

	function FinalFantasylization_LandSong()
		FinalFantasylization_PlayMusic(LandSong);
		FinalFantasylization_debugMsg("LandSong")
	end

	--#############
	-- ## RAID SONGS
	--#############

	function FinalFantasylization_RaidSong()
		FinalFantasylization_PlayMusic(ContestedSong);
		FinalFantasylization_debugMsg("ContestedSong")
	end

	--#############
	-- ## FANFARE
	--#############

	function FinalFantasylization_Fanfare()
		FinalFantasylization_PlayFile( Fanfare );
		FinalFantasylization_debugMsg("Fanfare")
	end

	--################
	-- ## FIGHTING SONGS
	--################

	function FinalFantasylization_WorldBoss()
		FinalFantasylization_PlayMusic(Fighting4Song);
		FinalFantasylization_debugMsg("Fighting4Song")
	end

	function FinalFantasylization_DungeonBoss()
		FinalFantasylization_PlayMusic(Fighting4Song);
		FinalFantasylization_debugMsg("Fighting4Song")
	end

	function FinalFantasylization_WorldElite()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(Fighting3Song);
				FinalFantasylization_debugMsg("Fighting3Song")
			else
				FinalFantasylization_PlayMusic(Fighting2Song);
				FinalFantasylization_debugMsg("Fighting2Song")
			end
	end

	function FinalFantasylization_BattlegroundBoss()
		FinalFantasylization_PlayMusic(Fighting4Song);
		FinalFantasylization_debugMsg("Fighting4Song")
	end

	function FinalFantasylization_BattlegroundPVP()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(Fighting3Song);
				FinalFantasylization_debugMsg("Fighting3Song")
			else
				FinalFantasylization_PlayMusic(Fighting2Song);
				FinalFantasylization_debugMsg("Fighting2Song")
			end
	end

	function FinalFantasylization_WorldPVP()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(Fighting3Song);
				FinalFantasylization_debugMsg("Fighting3Song")
			else
				FinalFantasylization_PlayMusic(Fighting2Song);
				FinalFantasylization_debugMsg("Fighting2Song")
			end
	end

	function FinalFantasylization_WorldNormalPVE()
		FinalFantasylization_PlayMusic(Fighting1Song);
		FinalFantasylization_debugMsg("Fighting1Song")
	end

	--#############
	-- ## TOWN SONGS
	--#############

	function FinalFantasylization_HostileTowns()
		FinalFantasylization_PlayMusic(Fighting4Song);
		FinalFantasylization_debugMsg("Fighting4Song")
	end

	function FinalFantasylization_NeutralTowns()
		local x = math.random(1, 20);
			if x == 1 then
				FinalFantasylization_PlayMusic(Horde1Town);
				FinalFantasylization_debugMsg("Horde1Town")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(Horde2Town);
				FinalFantasylization_debugMsg("Horde2Town")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(Horde3Town);
				FinalFantasylization_debugMsg("Horde3Town")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(Horde4Town);
				FinalFantasylization_debugMsg("Horde4Town")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(Horde5Town);
				FinalFantasylization_debugMsg("Horde5Town")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(Horde6Town);
				FinalFantasylization_debugMsg("Horde6Town")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(Horde7Town);
				FinalFantasylization_debugMsg("Horde7Town")
			elseif x == 8 then
				FinalFantasylization_PlayMusic(Horde8Town);
				FinalFantasylization_debugMsg("Horde8Town")
			elseif x == 9 then
				FinalFantasylization_PlayMusic(Horde9Town);
				FinalFantasylization_debugMsg("Horde9Town")
			elseif x == 10 then
				FinalFantasylization_PlayMusic(Horde10Town);
				FinalFantasylization_debugMsg("Horde10Town")
			elseif x == 11 then
				FinalFantasylization_PlayMusic(Alliance1Town);
				FinalFantasylization_debugMsg("Alliance1Town")
			elseif x == 12 then
				FinalFantasylization_PlayMusic(Alliance2Town);
				FinalFantasylization_debugMsg("Alliance2Town")
			elseif x == 13 then
				FinalFantasylization_PlayMusic(Alliance3Town);
				FinalFantasylization_debugMsg("Alliance3Town")
			elseif x == 14 then
				FinalFantasylization_PlayMusic(Alliance4Town);
				FinalFantasylization_debugMsg("Alliance4Town")
			elseif x == 15 then
				FinalFantasylization_PlayMusic(Alliance5Town);
				FinalFantasylization_debugMsg("Alliance5Town")
			elseif x == 16 then
				FinalFantasylization_PlayMusic(Alliance6Town);
				FinalFantasylization_debugMsg("Alliance6Townn")
			elseif x == 17 then
				FinalFantasylization_PlayMusic(Alliance7Town);
				FinalFantasylization_debugMsg("Alliance7Town")
			elseif x == 18 then
				FinalFantasylization_PlayMusic(Alliance8Town);
				FinalFantasylization_debugMsg("Alliance8Town")
			elseif x == 19 then
				FinalFantasylization_PlayMusic(Alliance9Town);
				FinalFantasylization_debugMsg("Alliance9Town")
			else
				FinalFantasylization_PlayMusic(Alliance10Town);
				FinalFantasylization_debugMsg("Alliance10Town")
			end
	end

	function FinalFantasylization_AllianceTowns()
		local x = math.random(1, 10);
			if x == 1 then
				FinalFantasylization_PlayMusic(Alliance1Town);
				FinalFantasylization_debugMsg("Alliance1Town")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(Alliance2Town);
				FinalFantasylization_debugMsg("Alliance2Town")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(Alliance3Town);
				FinalFantasylization_debugMsg("Alliance3Town")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(Alliance4Town);
				FinalFantasylization_debugMsg("Alliance4Town")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(Alliance5Town);
				FinalFantasylization_debugMsg("Alliance5Town")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(Alliance6Town);
				FinalFantasylization_debugMsg("Alliance6Town")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(Alliance7Town);
				FinalFantasylization_debugMsg("Alliance7Town")
			elseif x == 8 then
				FinalFantasylization_PlayMusic(Alliance8Town);
				FinalFantasylization_debugMsg("Alliance8Town")
			elseif x == 9 then
				FinalFantasylization_PlayMusic(Alliance9Town);
				FinalFantasylization_debugMsg("Alliance9Town")
			else
				FinalFantasylization_PlayMusic(Alliance10Town);
				FinalFantasylization_debugMsg("Alliance10Town")
			end
	end
			
	function FinalFantasylization_HordeTowns()
		local x = math.random(1, 10);
			if x == 1 then
				FinalFantasylization_PlayMusic(Horde1Town);
				FinalFantasylization_debugMsg("Horde1Town")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(Horde2Town);
				FinalFantasylization_debugMsg("Horde2Town")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(Horde3Town);
				FinalFantasylization_debugMsg("Horde3Town")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(Horde4Town);
				FinalFantasylization_debugMsg("Horde4Town")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(Horde5Town);
				FinalFantasylization_debugMsg("Horde5Town")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(Horde6Town);
				FinalFantasylization_debugMsg("Horde6Town")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(Horde7Town);
				FinalFantasylization_debugMsg("Horde7Town")
			elseif x == 8 then
				FinalFantasylization_PlayMusic(Horde8Town);
				FinalFantasylization_debugMsg("Horde8Town")
			elseif x == 9 then
				FinalFantasylization_PlayMusic(Horde9Town);
				FinalFantasylization_debugMsg("Horde9Town")
			else
				FinalFantasylization_PlayMusic(Horde10Town);
				FinalFantasylization_debugMsg("Horde10Town")
			end
	end		

	--###############
	-- ## BATTLEGROUNDS
	--###############

	function FinalFantasylization_BattleGround()
		local x = math.random(1, 5);
			if x == 1 then
				FinalFantasylization_PlayMusic(BattleGround1);
				FinalFantasylization_debugMsg("BattleGround1")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(BattleGround2);
				FinalFantasylization_debugMsg("BattleGround2")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(BattleGround3);
				FinalFantasylization_debugMsg("BattleGround3")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(BattleGround4);
				FinalFantasylization_debugMsg("BattleGround4")
			else
				FinalFantasylization_PlayMusic(BattleGround5);
				FinalFantasylization_debugMsg("BattleGround5")
			end
	end

	--#############
	-- ## DIE/DEAD
	--#############

	function FinalFantasylization_PlayerDie()
		FinalFantasylization_PlayMusic(DieSong);
		FinalFantasylization_debugMsg("DieSong")
	end

	function FinalFantasylization_PlayerGhost()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(Dead1Song);
				FinalFantasylization_debugMsg("Dead1Song")
			else
				FinalFantasylization_PlayMusic(Dead2Song);
				FinalFantasylization_debugMsg("Dead2Song")
			end
	end

	--#############
	-- ## SLEEPING
	--#############

	function FinalFantasylization_Sleeping()
		FinalFantasylization_PlayMusic(SleepSong);
		FinalFantasylization_debugMsg("SleepSong")
	end

	--#############
	-- ## SWIMMING
	--#############

	function FinalFantasylization_Swimming()
		FinalFantasylization_PlayMusic(SwimSong);
		FinalFantasylization_debugMsg("SwimSong")
	end

	--#############
	-- ## TAXI/FLYING
	--#############

	function FinalFantasylization_Taxi()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(Flying1Song);
				FinalFantasylization_debugMsg("Flying1Song")
			else
				FinalFantasylization_PlayMusic(Flying2Song);
				FinalFantasylization_debugMsg("Flying2Song")
			end
	end
					
	function FinalFantasylization_Flying()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(Flying1Song);
				FinalFantasylization_debugMsg("Flying1Song")
			else
				FinalFantasylization_PlayMusic(Flying2Song);
				FinalFantasylization_debugMsg("Flying2Song")
			end
	end

	--#############
	-- ## MOUNTED
	--#############

	function FinalFantasylization_Mounted()					
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(Mounted1Song);
				FinalFantasylization_debugMsg("Mounted1Song")
			elseif x == 2 then 
				FinalFantasylization_PlayMusic(Mounted2Song);
				FinalFantasylization_debugMsg("Mounted2Song")
			else 
				FinalFantasylization_PlayMusic(Mounted3Song);
				FinalFantasylization_debugMsg("Mounted3Song")
			end
	end

	function FinalFantasylization_MountedEscape()		
		local x = math.random(1, 5);
			if x == 1 then
				FinalFantasylization_PlayMusic(Escape1Song);
				FinalFantasylization_debugMsg("Escape1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(Escape2Song);
				FinalFantasylization_debugMsg("Escape2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(Escape3Song);
				FinalFantasylization_debugMsg("Escape3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(Escape4Song);
				FinalFantasylization_debugMsg("Escape4Song")
			else
				FinalFantasylization_PlayMusic(Escape5Song);
				FinalFantasylization_debugMsg("Escape5Song")
			end
	end
		
--END of music calls
        CoreSavedVariable = soundPackID
        for i = 1, NUM_SOUND_PACKS do -- set NUM_SOUND_PACKS in the Core
            local func = _G["SoundPack" .. soundPackID  .. "_SetEnabled"]
            if i ~= soundPackID and func then
                func(not enabled)
            end
        end
    end
end
_G["SoundPack" .. soundPackID  .. "_GetEnabled"] = function()
    return flag
end
