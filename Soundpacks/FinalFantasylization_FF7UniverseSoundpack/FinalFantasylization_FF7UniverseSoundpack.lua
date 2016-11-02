--#######################################
--##
--##	 FinalFantasylization 3.1.0
--##
--##	 Final Fantasy 7 Universe 
--##
--##	        Soundpack
--##
--##       By: Steven Mailloux
--##
--#######################################

local flag = false -- off: used in the Code to determine which sound pack is enabled
local soundPackID = "ff7universe" -- Specific /ffsoundpack <command> for this soundpack, must be 1 word/acronym, and lowercase (example: "Final Fantasy Mix Project" would be "ffmix"  or similar)
_G["SoundPack" .. soundPackID  .. "_SetEnabled"] = function(enabled)
    flag = enabled
    if enabled then
		-- set all the sound effects variables for this pack (you know... the ones passed to PlaySoundFile())
		--#######################################
		--##
		--##		Song List
		--##
		--#######################################
		
		S = "Interface\\AddOns\\FinalFantasylization_FF7UniverseSoundpack\\Sounds\\"

		-- Capital Cities Events --
		BonusCapitalCitySong = "BonusCapitalCitySong.mp3" --
		AllianceCapitalCity1Song = "AllianceCapitalCity1Song.mp3" --
		AllianceCapitalCity2Song = "AllianceCapitalCity2Song.mp3" --
		HordeCapitalCity1Song = "HordeCapitalCity1Song.mp3" --
		HordeCapitalCity2Song = "HordeCapitalCity2Song.mp3" --
		
		ShattrathCitySong = "ShattrathCitySong.mp3" -- 
		DalaranSong = "DalaranSong.mp3" --
		Dalaran2Song = "Dalaran2Song.mp3" -- 
		EbonHoldSong = "EbonHoldSong.mp3" -- 

		-- Horde Towns Events --
		Horde1Town = "Horde1Town.mp3" -- 
		Horde2Town = "Horde2Town.mp3" -- 
		Horde3Town = "Horde3Town.mp3" -- 
		Horde4Town = "Horde4Town.mp3" -- 
		Horde5Town = "Horde5Town.mp3" --
		Horde6Town = "Horde6Town.mp3" -- 
		Horde7Town = "Horde7Town.mp3" -- 
		Horde8Town = "Horde8Town.mp3" -- 
		Horde9Town = "Horde9Town.mp3" -- 
		Horde10Town = "Horde10Town.mp3" --
		Horde11Town = "Horde11Town.mp3" --

		-- Alliance Towns Events --
		Alliance1Town = "Alliance1Town.mp3" -- 
		Alliance2Town = "Alliance2Town.mp3" -- 
		Alliance3Town = "Alliance3Town.mp3" -- 
		Alliance4Town = "Alliance4Town.mp3" -- 
		Alliance5Town = "Alliance5Town.mp3" -- 
		Alliance6Town = "Alliance6Town.mp3" -- 
		Alliance7Town = "Alliance7Town.mp3" -- 
		Alliance8Town = "Alliance8Town.mp3" -- 
		Alliance9Town = "Alliance9Town.mp3" -- 
		Alliance10Town = "Alliance10Town.mp3" --
		Alliance11Town = "Alliance11Town.mp3" --

		-- Neutral Towns Events -- 
		Neutral1Town = "Neutral1Town.mp3" -- 
		Neutral2Town = "Neutral2Town.mp3" -- 
		Neutral3Town = "Neutral3Town.mp3" -- 
		Neutral4Town = "Neutral4Town.mp3" -- 
		Neutral5Town = "Neutral5Town.mp3" -- 
		Neutral6Town = "Neutral6Town.mp3" -- 
		Neutral7Town = "Neutral7Town.mp3" -- 
		Neutral8Town = "Neutral8Town.mp3" -- 
		Neutral9Town = "Neutral9Town.mp3" -- 
		Neutral10Town = "Neutral10Town.mp3" --
		
		-- PvP Type Zones Events --
		FriendlySong = "FriendlySong.mp3" --
		Friendly2Song = "Friendly2Song.mp3" -- 
		ContestedSong = "ContestedSong.mp3" --
		Contested2Song = "Contested2Song.mp3" --
		Contested3Song = "Contested3Song.mp3" --
		Contested4Song = "Contested4Song.mp3" --
		Contested5Song = "Contested5Song.mp3" -- 
		HostileSong = "HostileSong.mp3" -- 
		Hostile2Song = "Hostile2Song.mp3" --

		ForestSong = "ForestSong.mp3" -- 
		Forest2Song = "Forest2Song.mp3" --
		LandSong = "LandSong.mp3" --
		Land2Song = "Land2Song.mp3" --
		PlagueSong = "PlagueSong.mp3" --
		Plague2Song = "Plague2Song.mp3" --
		Plague3Song = "Plague3Song.mp3" -- 
		SandSong = "SandSong.mp3" -- 
		SnowSong = "SnowSong.mp3" -- 
		Snow2Song = "Snow2Song.mp3" --
		Snow3Song = "Snow3Song.mp3" --
		SwampSong = "SwampSong.mp3" --
		Swamp2Song = "Swamp2Song.mp3" -- 
		BeachSong = "BeachSong.mp3" -- 

		-- Battlegrounds Events --
		BattleGround1 = "BattleGround1.mp3" -- 
		BattleGround2 = "BattleGround2.mp3" -- 
		BattleGround3 = "BattleGround3.mp3" -- 
		BattleGround4 = "BattleGround4.mp3" -- 
		BattleGround5 = "BattleGround5.mp3" --
		BattleGround6 = "BattleGround6.mp3" --
		BattleGround7 = "BattleGround7.mp3" --

		-- Raid Events -- 
		Raid1Song = "Raid1Song.mp3" -- 
		Raid2Song = "Raid2Song.mp3" -- 
		Raid3Song = "Raid3Song.mp3" -- 
		Raid4Song = "Raid4Song.mp3" -- 
		Raid5Song = "Raid5Song.mp3" --
		Raid6Song = "Raid6Song.mp3" --
		Raid7Song = "Raid7Song.mp3" --
		
		-- Normal Mount Events --
		Mounted1Song = "Mounted1Song.mp3" -- 
		Mounted2Song = "Mounted2Song.mp3" -- 
		Mounted3Song = "Mounted3Song.mp3" -- 
		Mounted4Song = "Mounted4Song.mp3" --
		Mounted5Song = "Mounted5Song.mp3" --

		Escape1Song = "Escape1Song.mp3" -- 
		Escape2Song = "Escape2Song.mp3" -- 
		Escape3Song = "Escape3Song.mp3" --
		
		-- Flying Mount Events --
		Flying1Song = "Flying1Song.mp3" -- 
		Flying2Song = "Flying2Song.mp3" -- 
		Taxi1Song = "Taxi1Song.mp3" -- 
		Taxi2Song = "Taxi2Song.mp3" -- 

		-- Dead/Ghost Events --
		Dead1Song = "Dead1Song.mp3" -- 
		Dead2Song = "Dead2Song.mp3" -- 
		Dead3Song = "Dead3Song.mp3" -- 
		Dead4Song = "Dead4Song.mp3" -- 
		Dead5Song = "Dead5Song.mp3" -- 
		Dead6Song = "Dead6Song.mp3" --
		Dead7Song = "Dead7Song.mp3" -- 
		DieSong = "DieSong.mp3" -- 
		Die2Song = "Die2Song.mp3" --
		Die3Song = "Die3Song.mp3" --

		-- Fighting Events --
		Fanfare = "Fanfare.mp3" -- Fanfare
		Fanfare2 = "Fanfare2.mp3" -- Fanfare
		Fighting1Song = "Fighting1Song.mp3" -- 
		Fighting2Song = "Fighting2Song.mp3" -- 
		Fighting3Song = "Fighting3Song.mp3" -- 
		Fighting4Song = "Fighting4Song.mp3" -- 
		Fighting5Song = "Fighting5Song.mp3" --
		Fighting6Song = "Fighting6Song.mp3" --
		Fighting7Song = "Fighting7Song.mp3" --
		Fighting8Song = "Fighting8Song.mp3" --
		Fighting9Song = "Fighting9Song.mp3" --
		Fighting10Song = "Fighting10Song.mp3" --
		Fighting11Song = "Fighting11Song.mp3" --
		Boss1Song = "Boss1Song.mp3" --
		Boss2Song = "Boss2Song.mp3" --
		Boss3Song = "Boss3Song.mp3" -- 
		Boss4Song = "Boss4Song.mp3" -- 
		Boss5Song = "Boss5Song.mp3" -- 
		Boss6Song = "Boss6Song.mp3" -- 

		-- Misc Events --
		SwimSong = "SwimSong.mp3" --
		Swim2Song = "Swim2Song.mp3" --
		Swim3Song = "Swim3Song.mp3" --
		DarkSwimSong = "DarkSwimSong.mp3" -- NEW!!!
		DarkSwim2Song = "DarkSwim2Song.mp3" -- NEW!!!
		DarkSwim3Song = "DarkSwim3Song.mp3" -- NEW!!!
		SleepSong = "SleepSong.mp3" -- 
		Sleep2Song = "Sleep2Song.mp3" -- 
		Sleep3Song = "Sleep3Song.mp3" -- 
		Sleep4Song = "Sleep4Song.mp3" -- 
		Sleep5Song = "Sleep5Song.mp3" -- 
		Sleep6Song = "Sleep6Song.mp3" -- 
		KillSound = "Kill.wav" -- Leave combat sound
		CombatSound = "Combat.wav" -- Enter combat sound
		LevelUpSong = "LevelUpSong.mp3" -- Level Up song

		
	--#######################################
	--##
	--##	MUSIC /SOUND CALLS
	--##
	--#######################################

	--#############
	-- ## SOUNDS
	--#############

	function FinalFantasylization_KillSound()
		FinalFantasylization_PlayFile(S ..  KillSound );
		FinalFantasylization_debugMsg("KillSound")
	end
	function FinalFantasylization_CombatSound()
		FinalFantasylization_PlayFile(S ..  CombatSound );
		FinalFantasylization_debugMsg("CombatSound")
	end
	function FinalFantasylization_LevelUpSong()
		FinalFantasylization_PlayFile(S ..  LevelUpSong );
		FinalFantasylization_debugMsg("LevelUpSong")
	end

	--########################
	-- ## BATTLEGROUNDS
	--########################
	function FinalFantasylization_AlteracValleyBG()
		FinalFantasylization_BattleGround();
	end
	function FinalFantasylization_ArathiBasinBG()
		FinalFantasylization_BattleGround();
	end	
	function FinalFantasylization_EyeoftheStormBG()
		FinalFantasylization_BattleGround();
	end	
	function FinalFantasylization_StrandsoftheAncientsBG()
		FinalFantasylization_BattleGround();
	end	
	function FinalFantasylization_WarsongGulchBG()
		FinalFantasylization_BattleGround();
	end
	function FinalFantasylization_IsleOfConquestBG()
		FinalFantasylization_BattleGround();
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
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. HordeCapitalCity1Song);
				FinalFantasylization_debugMsg("HordeCapitalCity1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. HordeCapitalCity2Song);
				FinalFantasylization_debugMsg("HordeCapitalCity2Song")
			else
				FinalFantasylization_PlayMusic(S .. BonusCapitalCitySong);
				FinalFantasylization_debugMsg("BonusCapitalCitySong")
			end
	end
	function FinalFantasylization_SilvermoonCitySong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. HordeCapitalCity1Song);
				FinalFantasylization_debugMsg("HordeCapitalCity1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. HordeCapitalCity2Song);
				FinalFantasylization_debugMsg("HordeCapitalCity2Song")
			else
				FinalFantasylization_PlayMusic(S .. BonusCapitalCitySong);
				FinalFantasylization_debugMsg("BonusCapitalCitySong")
			end
	end
	function FinalFantasylization_ThunderBluffSong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. HordeCapitalCity1Song);
				FinalFantasylization_debugMsg("HordeCapitalCity1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. HordeCapitalCity2Song);
				FinalFantasylization_debugMsg("HordeCapitalCity2Song")
			else
				FinalFantasylization_PlayMusic(S .. BonusCapitalCitySong);
				FinalFantasylization_debugMsg("BonusCapitalCitySong")
			end
	end
	function FinalFantasylization_UndercitySong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. "HordeCapitalCity1Song.mp3");
				FinalFantasylization_debugMsg("HordeCapitalCity1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. "HordeCapitalCity2Song.mp3");
				FinalFantasylization_debugMsg("HordeCapitalCity2Song")
			else
				FinalFantasylization_PlayMusic(S .. "BonusCapitalCitySong.mp3");
				FinalFantasylization_debugMsg("BonusCapitalCitySong")
			end
	end

	--########################
	-- ## ALLIANCE CAPITAL CITIES
	--########################

	function FinalFantasylization_DarnassusSong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. AllianceCapitalCity1Song);
				FinalFantasylization_debugMsg("AllianceCapitalCity1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. AllianceCapitalCity2Song);
				FinalFantasylization_debugMsg("AllianceCapitalCity2Song")
			else
				FinalFantasylization_PlayMusic(S .. BonusCapitalCitySong);
				FinalFantasylization_debugMsg("BonusCapitalCitySong")
			end
	end
	function FinalFantasylization_ExodarSong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. AllianceCapitalCity1Song);
				FinalFantasylization_debugMsg("AllianceCapitalCity1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. AllianceCapitalCity2Song);
				FinalFantasylization_debugMsg("AllianceCapitalCity2Song")
			else
				FinalFantasylization_PlayMusic(S .. BonusCapitalCitySong);
				FinalFantasylization_debugMsg("BonusCapitalCitySong")
			end
	end
	function FinalFantasylization_IronforgeSong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. AllianceCapitalCity1Song);
				FinalFantasylization_debugMsg("AllianceCapitalCity1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. AllianceCapitalCity2Song);
				FinalFantasylization_debugMsg("AllianceCapitalCity2Song")
			else
				FinalFantasylization_PlayMusic(S .. BonusCapitalCitySong);
				FinalFantasylization_debugMsg("BonusCapitalCitySong")
			end
	end
	function FinalFantasylization_StormwindCitySong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. AllianceCapitalCity1Song);
				FinalFantasylization_debugMsg("AllianceCapitalCity1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. AllianceCapitalCity2Song);
				FinalFantasylization_debugMsg("AllianceCapitalCity2Song")
			else
				FinalFantasylization_PlayMusic(S .. BonusCapitalCitySong);
				FinalFantasylization_debugMsg("BonusCapitalCitySong")
			end
	end

	--########################
	-- ## NEUTRAL CAPITAL CITIES
	--########################

	function FinalFantasylization_CityArea52()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_CityBootyBay()
		FinalFantasylization_BeachSong();
	end
	function FinalFantasylization_DalaranSong()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. DalaranSong);
				FinalFantasylization_debugMsg("DalaranSong")
			else
				FinalFantasylization_PlayMusic(S .. Dalaran2Song);
				FinalFantasylization_debugMsg("Dalaran2Song")
			end				
	end
	function FinalFantasylization_EbonHoldSong()
			FinalFantasylization_PlayMusic(S .. EbonHoldSong);
			FinalFantasylization_debugMsg("EbonHoldSong")
		end
	function FinalFantasylization_CityEverlook()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_CityGadgetzan()
		FinalFantasylization_NeutralTowns();
	end
	function FinalFantasylization_CityRatchet()
		FinalFantasylization_BeachSong();
	end
	function FinalFantasylization_ShattrathCitySong()
		FinalFantasylization_PlayMusic(S .. ShattrathCitySong);
		FinalFantasylization_debugMsg("ShattrathCitySong")
	end

	--########################
	-- ##   HORDE TOWNS
	--########################

	function FinalFantasylization_HordeTownAgmarsHammer()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownApothecaryCamp()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownBloodhoofVillage()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownBloodvenomPost()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownBrackenwallVillage()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownBrill()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownBorgorokOutpost()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownCampMojache()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownCampOneqwah()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownCampTaurajo()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownCampTunkalo()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownCampWinterhoof()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownConquestHold()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownFairbreezeVillage()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownFalconWatch()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownFalconwingSquare()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownFlameCrest()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownFreewindPost()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownGaradar()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownGromarshCrashSite()
		FinalFantasylization_HordeTowns();
	end	
	function FinalFantasylization_HordeTownGromgolBaseCamp()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownHammerfall()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownKargath()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownKorkronVanguard()
		FinalFantasylization_HordeTowns();
	end	
	function FinalFantasylization_HordeTownMokNathalVillage()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownNewAgamand()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownRazorHill()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownRevantuskVillage()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownSenjinVillage()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownSepulcher()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownShadowmoonVillage()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownShadowpreyVillage()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownSplintertreePost()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownStonard()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownStonebreakerHold()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownSunreaversCommand()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownSunRockRetreat()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownSwampratPost()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownTarrenMill()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownTaunkaleVillage()
		FinalFantasylization_HordeTowns();
	end	
	function FinalFantasylization_HordeTownCrossroads()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownThrallmar()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownThunderlordStronghold()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownTranquillien()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownValormok()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownVengeanceLanding()
		FinalFantasylization_HordeTowns();
	end	
	function FinalFantasylization_HordeTownVenomspite()
		FinalFantasylization_HordeTowns();
	end	
	function FinalFantasylization_HordeTownWarsongHold()
		FinalFantasylization_HordeTowns();
	end	
	function FinalFantasylization_HordeTownZabrajin()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownZoramgarOutpost()
		FinalFantasylization_HordeTowns();
	end
	function FinalFantasylization_HordeTownGhostWalkerPost()
		FinalFantasylization_HordeTowns();
	end

	--########################
	-- ##   ALLIANCE TOWNS
	--########################
	function FinalFantasylization_AllianceTownAeriePeak()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownAllerianStronghold()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownAmberpineLodge()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownAstranaar()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownAuberdine()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownAzureWatch()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownBloodWatch()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownChillwindCamp()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownDarkshire()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownDolanaar()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownExplorersLeagueOutpost()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownFeathermoonStronghold()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownFizzcrankAirstrip()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownFordragonHold()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownForestSong()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownFortWildervar()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownFrosthold()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownGoldshire()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownHonorHold()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownKharanos()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownLakeshire()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownMenethilHarbor()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownMorgansVigil()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownNethergardeKeep()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownNijelsPoint()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownOreborHarborage()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownRebelCamp()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownRefugePointe()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownSentinelHill()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownSouthshore()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownStarsRest()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownStonetalonPeak()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownSylvanaar()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownTalonbranchGlade()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownTalrendisPoint()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownTelaar()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownTelredor()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownTempleOfTelhamat()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownThalanaar()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownThelsamar()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownTheramoreIsle()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownToshleysStation()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownValianceKeep()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownValgarde()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownWestfallBrigadeEncampment()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownWestguardKeep()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownWildhammerStronghold()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownWindrunnersOverlook()
		FinalFantasylization_AllianceTowns();
	end	
	function FinalFantasylization_AllianceTownWintergardeKeep()
		FinalFantasylization_BattleGround();
	end
	function FinalFantasylization_AllianceTownBrewnallVillage()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownEastvaleLoggingCamp()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownPyrewoodVillage()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownRuttheranVillage()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownBaelModan()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownStarfallVillage()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownMaclureVineyards()
		FinalFantasylization_AllianceTowns();
	end
	function FinalFantasylization_AllianceTownHillsbradFields()
		FinalFantasylization_AllianceTowns();
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
		FinalFantasylization_ContestedSong()
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
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. FriendlySong);
				FinalFantasylization_debugMsg("FriendlySong")
			else
				FinalFantasylization_PlayMusic(S .. Friendly2Song);
				FinalFantasylization_debugMsg("Friendly2Song")
			end
	end

	function FinalFantasylization_ContestedSong()
		local x = math.random(1, 5);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. ContestedSong);
				FinalFantasylization_debugMsg("ContestedSong")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Contested2Song);
				FinalFantasylization_debugMsg("Contested2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Contested3Song);
				FinalFantasylization_debugMsg("Contested3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Contested4Song);
				FinalFantasylization_debugMsg("Contested4Song")
			else
				FinalFantasylization_PlayMusic(S .. Contested5Song);
				FinalFantasylization_debugMsg("Contested5Song")
			end
	end

	function FinalFantasylization_HostileSong()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. HostileSong);
				FinalFantasylization_debugMsg("HostileSong")
			else
				FinalFantasylization_PlayMusic(S .. Hostile2Song);
				FinalFantasylization_debugMsg("Hostile2Song")
			end
	end

	--#############
	-- ## ZONE SONGS
	--#############

	function FinalFantasylization_SnowSong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. SnowSong);
				FinalFantasylization_debugMsg("SnowSong")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Snow2Song);
				FinalFantasylization_debugMsg("Snow2Song")
			else
				FinalFantasylization_PlayMusic(S .. Snow3Song);
				FinalFantasylization_debugMsg("Snow3Song")
			end
	end

	function FinalFantasylization_ForestSong()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. ForestSong);
				FinalFantasylization_debugMsg("ForestSong")
			else
				FinalFantasylization_PlayMusic(S .. Forest2Song);
				FinalFantasylization_debugMsg("Forest2Song")
			end
	end

	function FinalFantasylization_SandSong()
		FinalFantasylization_PlayMusic(S .. SandSong);
		FinalFantasylization_debugMsg("SandSong")
	end

	function FinalFantasylization_PlagueSong()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. PlagueSong);
				FinalFantasylization_debugMsg("PlagueSong")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Plague2Song);
				FinalFantasylization_debugMsg("Plague2Song")
			else
				FinalFantasylization_PlayMusic(S .. Plague3Song);
				FinalFantasylization_debugMsg("Plague3Song")
			end
	end

	function FinalFantasylization_SwampSong()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. SwampSong);
				FinalFantasylization_debugMsg("SwampSong")
			else
				FinalFantasylization_PlayMusic(S .. Swamp2Song);
				FinalFantasylization_debugMsg("Swamp2Song")
			end
	end

	function FinalFantasylization_BeachSong()
		FinalFantasylization_PlayMusic(S .. BeachSong);
		FinalFantasylization_debugMsg("BeachSong")
	end

	function FinalFantasylization_LandSong()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. LandSong);
				FinalFantasylization_debugMsg("LandSong")
			else
				FinalFantasylization_PlayMusic(S .. Land2Song);
				FinalFantasylization_debugMsg("Land2Song")
			end
	end

	--#############
	-- ## RAID SONGS
	--#############

	function FinalFantasylization_RaidSong()
		local x = math.random(1, 7);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Raid1Song);
				FinalFantasylization_debugMsg("Raid1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Raid2Song);
				FinalFantasylization_debugMsg("Raid2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Raid3Song);
				FinalFantasylization_debugMsg("Raid3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Raid4Song);
				FinalFantasylization_debugMsg("Raid4Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Raid5Song);
				FinalFantasylization_debugMsg("Raid5Song")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. Raid6Song);
				FinalFantasylization_debugMsg("Raid6Song")
			else
				FinalFantasylization_PlayMusic(S .. Raid7Song);
				FinalFantasylization_debugMsg("Raid7Song")
			end
	end

	--#############
	-- ## FANFARE
	--#############

	function FinalFantasylization_Fanfare()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayFile(S .. Fanfare);
				FinalFantasylization_debugMsg("Fanfare")
			else
				FinalFantasylization_PlayFile(S .. Fanfare2);
				FinalFantasylization_debugMsg("Fanfare2")
			end
	end

	--################
	-- ## FIGHTING SONGS
	--################

	function FinalFantasylization_WorldBoss()
		local x = math.random(1, 6);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Boss1Song);
				FinalFantasylization_debugMsg("Boss1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Boss2Song);
				FinalFantasylization_debugMsg("Boss2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Boss3Song);
				FinalFantasylization_debugMsg("Boss3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Boss4Song);
				FinalFantasylization_debugMsg("Boss4Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Boss5Song);
				FinalFantasylization_debugMsg("Boss5Song")
			else
				FinalFantasylization_PlayMusic(S .. Boss6Song);
				FinalFantasylization_debugMsg("Boss6Song")
			end
	end

	function FinalFantasylization_DungeonBoss()
		local x = math.random(1, 6);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Boss1Song);
				FinalFantasylization_debugMsg("Boss1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Boss2Song);
				FinalFantasylization_debugMsg("Boss2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Boss3Song);
				FinalFantasylization_debugMsg("Boss3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Boss4Song);
				FinalFantasylization_debugMsg("Boss4Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Boss5Song);
				FinalFantasylization_debugMsg("Boss5Song")
			else
				FinalFantasylization_PlayMusic(S .. Boss6Song);
				FinalFantasylization_debugMsg("Boss6Song")
			end
	end

	function FinalFantasylization_WorldElite()
		local x = math.random(1, 6);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Boss1Song);
				FinalFantasylization_debugMsg("Boss1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Boss2Song);
				FinalFantasylization_debugMsg("Boss2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Boss3Song);
				FinalFantasylization_debugMsg("Boss3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Boss4Song);
				FinalFantasylization_debugMsg("Boss4Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Boss5Song);
				FinalFantasylization_debugMsg("Boss5Song")
			else
				FinalFantasylization_PlayMusic(S .. Boss6Song);
				FinalFantasylization_debugMsg("Boss6Song")
			end
	end

	function FinalFantasylization_BattlegroundBoss()
		local x = math.random(1, 6);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Boss1Song);
				FinalFantasylization_debugMsg("Boss1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Boss2Song);
				FinalFantasylization_debugMsg("Boss2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Boss3Song);
				FinalFantasylization_debugMsg("Boss3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Boss4Song);
				FinalFantasylization_debugMsg("Boss4Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Boss5Song);
				FinalFantasylization_debugMsg("Boss5Song")
			else
				FinalFantasylization_PlayMusic(S .. Boss6Song);
				FinalFantasylization_debugMsg("Boss6Song")
			end
	end

	function FinalFantasylization_BattlegroundPVP()
		local x = math.random(1, 8);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Fighting2Song);
				FinalFantasylization_debugMsg("Fighting2Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Fighting3Song);
				FinalFantasylization_debugMsg("Fighting3Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Fighting5Song);
				FinalFantasylization_debugMsg("Fighting5Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Fighting6Song);
				FinalFantasylization_debugMsg("Fighting6Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Fighting7Song);
				FinalFantasylization_debugMsg("Fighting7Song")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. Fighting9Song);
				FinalFantasylization_debugMsg("Fighting9Song")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(S .. Fighting10Song);
				FinalFantasylization_debugMsg("Fighting10Song")
			else
				FinalFantasylization_PlayMusic(S .. Fighting11Song);
				FinalFantasylization_debugMsg("Fighting11Song")
			end
	end

	function FinalFantasylization_WorldPVP()
		local x = math.random(1, 8);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Fighting2Song);
				FinalFantasylization_debugMsg("Fighting2Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Fighting3Song);
				FinalFantasylization_debugMsg("Fighting3Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Fighting5Song);
				FinalFantasylization_debugMsg("Fighting5Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Fighting6Song);
				FinalFantasylization_debugMsg("Fighting6Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Fighting7Song);
				FinalFantasylization_debugMsg("Fighting7Song")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. Fighting9Song);
				FinalFantasylization_debugMsg("Fighting9Song")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(S .. Fighting10Song);
				FinalFantasylization_debugMsg("Fighting10Song")
			else
				FinalFantasylization_PlayMusic(S .. Fighting11Song);
				FinalFantasylization_debugMsg("Fighting11Song")
			end
	end

	function FinalFantasylization_WorldNormalPVE()
		local x = math.random(1, 8);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Fighting1Song);
				FinalFantasylization_debugMsg("Fighting1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Fighting4Song);
				FinalFantasylization_debugMsg("Fighting4Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Fighting5Song);
				FinalFantasylization_debugMsg("Fighting5Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Fighting6Song);
				FinalFantasylization_debugMsg("Fighting6Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Fighting7Song);
				FinalFantasylization_debugMsg("Fighting7Song")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. Fighting8Song);
				FinalFantasylization_debugMsg("Fighting8Song")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(S .. Fighting10Song);
				FinalFantasylization_debugMsg("Fighting10Song")
			else
				FinalFantasylization_PlayMusic(S .. Fighting11Song);
				FinalFantasylization_debugMsg("Fighting11Song")
			end
	end

	--#############
	-- ## TOWN SONGS
	--#############

	function FinalFantasylization_HostileTowns()
		FinalFantasylization_HostileSong();
	end

	function FinalFantasylization_NeutralTowns()
		local x = math.random(1, 10);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Neutral1Town);
				FinalFantasylization_debugMsg("Neutral1Town")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Neutral2Town);
				FinalFantasylization_debugMsg("Neutral2Town")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Neutral3Town);
				FinalFantasylization_debugMsg("Neutral3Town")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Neutral4Town);
				FinalFantasylization_debugMsg("Neutral4Town")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Neutral5Town);
				FinalFantasylization_debugMsg("Neutral5Town")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. Neutral6Town);
				FinalFantasylization_debugMsg("Neutral6Town")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(S .. Neutral7Town);
				FinalFantasylization_debugMsg("Neutral7Town")
			elseif x == 8 then
				FinalFantasylization_PlayMusic(S .. Neutral8Town);
				FinalFantasylization_debugMsg("Neutral8Town")
			elseif x == 9 then
				FinalFantasylization_PlayMusic(S .. Neutral9Town);
				FinalFantasylization_debugMsg("Neutral9Town")
			else
				FinalFantasylization_PlayMusic(S .. Neutral10Town);
				FinalFantasylization_debugMsg("Neutral10Town")
			end
	end

	function FinalFantasylization_AllianceTowns()
		local x = math.random(1, 11);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Alliance1Town);
				FinalFantasylization_debugMsg("Alliance1Town")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Alliance2Town);
				FinalFantasylization_debugMsg("Alliance2Town")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Alliance3Town);
				FinalFantasylization_debugMsg("Alliance3Town")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Alliance4Town);
				FinalFantasylization_debugMsg("Alliance4Town")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Alliance5Town);
				FinalFantasylization_debugMsg("Alliance5Town")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. Alliance6Town);
				FinalFantasylization_debugMsg("Alliance6Town")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(S .. Alliance7Town);
				FinalFantasylization_debugMsg("Alliance7Town")
			elseif x == 8 then
				FinalFantasylization_PlayMusic(S .. Alliance8Town);
				FinalFantasylization_debugMsg("Alliance8Town")
			elseif x == 9 then
				FinalFantasylization_PlayMusic(S .. Alliance9Town);
				FinalFantasylization_debugMsg("Alliance9Town")
			elseif x == 10 then
				FinalFantasylization_PlayMusic(S .. Alliance10Town);
				FinalFantasylization_debugMsg("Alliance10Town")
			else
				FinalFantasylization_PlayMusic(S .. Alliance11Town);
				FinalFantasylization_debugMsg("Alliance11Town")
			end
	end
			
	function FinalFantasylization_HordeTowns()
		local x = math.random(1, 11);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Horde1Town);
				FinalFantasylization_debugMsg("Horde1Town")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Horde2Town);
				FinalFantasylization_debugMsg("Horde2Town")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Horde3Town);
				FinalFantasylization_debugMsg("Horde3Town")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Horde4Town);
				FinalFantasylization_debugMsg("Horde4Town")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Horde5Town);
				FinalFantasylization_debugMsg("Horde5Town")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. Horde6Town);
				FinalFantasylization_debugMsg("Horde6Town")
			elseif x == 7 then
				FinalFantasylization_PlayMusic(S .. Horde7Town);
				FinalFantasylization_debugMsg("Horde7Town")
			elseif x == 8 then
				FinalFantasylization_PlayMusic(S .. Horde8Town);
				FinalFantasylization_debugMsg("Horde8Town")
			elseif x == 9 then
				FinalFantasylization_PlayMusic(S .. Horde9Town);
				FinalFantasylization_debugMsg("Horde9Town")
			elseif x == 10 then
				FinalFantasylization_PlayMusic(S .. Horde10Town);
				FinalFantasylization_debugMsg("Horde10Town")
			else
				FinalFantasylization_PlayMusic(S .. Horde11Town);
				FinalFantasylization_debugMsg("Horde11Town")
			end
	end		

	--###############
	-- ## BATTLEGROUNDS
	--###############

	function FinalFantasylization_BattleGround()
		local x = math.random(1, 7);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. BattleGround1);
				FinalFantasylization_debugMsg("BattleGround1")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. BattleGround2);
				FinalFantasylization_debugMsg("BattleGround2")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. BattleGround3);
				FinalFantasylization_debugMsg("BattleGround3")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. BattleGround4);
				FinalFantasylization_debugMsg("BattleGround4")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. BattleGround5);
				FinalFantasylization_debugMsg("BattleGround5")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. BattleGround6);
				FinalFantasylization_debugMsg("BattleGround6")
			else
				FinalFantasylization_PlayMusic(S .. BattleGround7);
				FinalFantasylization_debugMsg("BattleGround7")
			end
	end

	--#############
	-- ## DIE/DEAD
	--#############

	function FinalFantasylization_PlayerDie()
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. DieSong);
				FinalFantasylization_debugMsg("DieSong")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Die2Song);
				FinalFantasylization_debugMsg("Die2Song")
			else
				FinalFantasylization_PlayMusic(S .. Die3Song);
				FinalFantasylization_debugMsg("Die3Song")
			end
	end

	function FinalFantasylization_PlayerGhost()
		local x = math.random(1, 7);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Dead1Song);
				FinalFantasylization_debugMsg("Dead1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Dead2Song);
				FinalFantasylization_debugMsg("Dead2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Dead3Song);
				FinalFantasylization_debugMsg("Dead3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Dead4Song);
				FinalFantasylization_debugMsg("Dead4Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Dead5Song);
				FinalFantasylization_debugMsg("Dead5Song")
			elseif x == 6 then
				FinalFantasylization_PlayMusic(S .. Dead6Song);
				FinalFantasylization_debugMsg("Dead6Song")
			else
				FinalFantasylization_PlayMusic(S .. Dead7Song);
				FinalFantasylization_debugMsg("Dead7Song")
			end
	end

	--#############
	-- ## SLEEPING
	--#############

	function FinalFantasylization_Sleeping()
		local x = math.random(1, 6);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. SleepSong);
				FinalFantasylization_debugMsg("SleepSong")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Sleep2Song);
				FinalFantasylization_debugMsg("Sleep2Song")
			elseif x == 3 then
				FinalFantasylization_PlayMusic(S .. Sleep3Song);
				FinalFantasylization_debugMsg("Sleep3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Sleep4Song);
				FinalFantasylization_debugMsg("Sleep4Song")
			elseif x == 5 then
				FinalFantasylization_PlayMusic(S .. Sleep5Song);
				FinalFantasylization_debugMsg("Sleep5Song")
			else
				FinalFantasylization_PlayMusic(S .. Sleep6Song);
				FinalFantasylization_debugMsg("Sleep6Song")
			end
	end

	--#############
	-- ## SWIMMING
	--#############

	function FinalFantasylization_Swimming(Zone)
		if Zone == 1 then
			local x = math.random(1, 3);
				if x == 1 then
					FinalFantasylization_PlayMusic(S .. DarkSwimSong);  -- alt Swim song
					FinalFantasylization_debugMsg("DarkSwimSong") -- alt Swim song
				elseif x == 2 then 
					FinalFantasylization_PlayMusic(S .. DarkSwim2Song); -- alt Swim song
					FinalFantasylization_debugMsg("DarkSwim2Song") -- alt Swim song
				else 
					FinalFantasylization_PlayMusic(S .. DarkSwim3Song); -- alt Swim song
					FinalFantasylization_debugMsg("DarkSwim3Song") -- alt Swim song
				end
			return
		else
			local x = math.random(1, 3);
				if x == 1 then
					FinalFantasylization_PlayMusic(S .. SwimSong);  -- Normal Swim song
					FinalFantasylization_debugMsg("SwimSong") -- Normal Swim song
				elseif x == 2 then 
					FinalFantasylization_PlayMusic(S .. Swim2Song); -- Normal Swim song
					FinalFantasylization_debugMsg("Swim2Song") -- Normal Swim song
				else 
					FinalFantasylization_PlayMusic(S .. Swim3Song); -- Normal Swim song
					FinalFantasylization_debugMsg("Swim3Song") -- Normal Swim song
				end		
		end
	end

	--#############
	-- ## TAXI
	--#############

	function FinalFantasylization_HordeTaxi()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Taxi1Song);
				FinalFantasylization_debugMsg("Taxi1Song")
			else
				FinalFantasylization_PlayMusic(S .. Taxi2Song);
				FinalFantasylization_debugMsg("Taxi2Song")
			end
	end
	
	function FinalFantasylization_AllianceTaxi()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Taxi1Song);
				FinalFantasylization_debugMsg("Taxi1Song")
			else
				FinalFantasylization_PlayMusic(S .. Taxi2Song);
				FinalFantasylization_debugMsg("Taxi2Song")
			end
	end
	
	--#############
	-- ## FLYING
	--#############
	
	function FinalFantasylization_HordeFlying()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Flying1Song);
				FinalFantasylization_debugMsg("Flying1Song")
			else
				FinalFantasylization_PlayMusic(S .. Flying2Song);
				FinalFantasylization_debugMsg("Flying2Song")
			end
	end
	
	function FinalFantasylization_AllianceFlying()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Flying1Song);
				FinalFantasylization_debugMsg("Flying1Song")
			else
				FinalFantasylization_PlayMusic(S .. Flying2Song);
				FinalFantasylization_debugMsg("Flying2Song")
			end
	end

	--#############
	-- ## MOUNTED
	--#############

	function FinalFantasylization_Mounted()					
		local x = math.random(1, 5);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Mounted1Song);
				FinalFantasylization_debugMsg("Mounted1Song")
			elseif x == 2 then 
				FinalFantasylization_PlayMusic(S .. Mounted2Song);
				FinalFantasylization_debugMsg("Mounted2Song")
			elseif x == 3 then 
				FinalFantasylization_PlayMusic(S .. Mounted3Song);
				FinalFantasylization_debugMsg("Mounted3Song")
			elseif x == 4 then
				FinalFantasylization_PlayMusic(S .. Mounted4Song);
				FinalFantasylization_debugMsg("Mounted4Song")
			else
				FinalFantasylization_PlayMusic(S .. Mounted5Song);
				FinalFantasylization_debugMsg("Mounted5Song")
			end
	end

	function FinalFantasylization_MountedEscape()		
		local x = math.random(1, 3);
			if x == 1 then
				FinalFantasylization_PlayMusic(S .. Escape1Song);
				FinalFantasylization_debugMsg("Escape1Song")
			elseif x == 2 then
				FinalFantasylization_PlayMusic(S .. Escape2Song);
				FinalFantasylization_debugMsg("Escape2Song")
			else
				FinalFantasylization_PlayMusic(S .. Escape3Song);
				FinalFantasylization_debugMsg("Escape3Song")
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
