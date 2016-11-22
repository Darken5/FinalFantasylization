--#######################################
--##
--##	   FinalFantasylization 3.3.0
--##
--##	     Steven 2016
--##
--##	        Soundpack
--##
--##       By: Steven Mailloux
--##
--#######################################

local flag = false -- off: used in the Code to determine which sound pack is enabled
local soundPackID = "steven2016" -- Specific /ffsoundpack <command> for this soundpack, must be 1 word/acronym, and lowercase (example: "Final Fantasy Mix Project" would be "ffmix"  or similar)
_G["SoundPack" .. soundPackID  .. "_SetEnabled"] = function(enabled)
    flag = enabled
    if enabled then
		-- set all the sound effects variables for this pack (you know... the ones passed to PlaySoundFile())
		--#######################################
		--##
		--##		Song List
		--##
		--#######################################

		S = "Interface\\AddOns\\FinalFantasylization_Steven2016Soundpack\\Sounds\\"
		SS = "Interface\\AddOns\\FinalFantasylization_Steven2016Soundpack\\Dance\\"
		
		-- Capital Cities Events --
		OrgrimmarSong = "OrgrimmarSong.mp3" -- 
		SilvermoonCitySong = "SilvermoonCitySong.mp3" --
		ThunderBluffSong = "ThunderbluffSong.mp3" -- 
		UndercitySong = "UndercitySong.mp3" --
		
		DarnassusSong = "DarnassusSong.mp3" -- 
		ExodarSong = "ExodarSong.mp3" -- 
		IronforgeSong = "IronforgeSong.mp3" -- 
		StormwindCitySong = "StormwindCitySong.mp3" --

		ShattrathCitySong = "ShattrathCitySong.mp3" --
		DalaranSong = "DalaranSong.mp3" --
		Dalaran2Song = "Dalaran2Song.mp3" --
		EbonHoldSong = "EbonHoldSong.mp3" --
		Area52Song = "Area52Song.mp3" --
		BootyBaySong = "BootyBaySong.mp3" --
		EverlookSong = "EverlookSong.mp3" --
		GadgetzanSong = "GadgetzanSong.mp3" --
		RatchetSong = "RatchetSong.mp3" --

		-- Horde Towns Events --
		AgmarsHammerSong = "AgmarsHammerSong.mp3" -- 
		ApothecaryCampSong = "ApothecaryCampSong.mp3" --
		BloodhoofVillageSong = "BloodhoofVillageSong.mp3" --
		BloodvenomPostSong = "BloodvenomPostSong.mp3" --
		BrackenwallVillageSong = "BrackenwallVillageSong.mp3" --
		BrillSong = "BrillSong.mp3" --
		BorgorokOutpostSong = "BorgorokOutpostSong.mp3" --
		CampMojacheSong = "CampMojacheSong.mp3" --
		CampOneqwahSong = "CampOneqwahSong.mp3" --
		CampTaurajoSong = "CampTaurajoSong.mp3" --
		CampTunkaloSong = "CampTunkaloSong.mp3" --
		CampWinterhoofSong = "CampWinterhoofSong.mp3" --
		ConquestHoldSong = "ConquestHoldSong.mp3" --
		CrossroadsSong = "CrossroadsSong.mp3" --
		FairbreezeVillageSong = "FairbreezeVillageSong.mp3" --
		FalconWatchSong = "FalconWatchSong.mp3" --
		FalconwingSquareSong = "FalconwingSquareSong.mp3" --
		FlameCrestSong = "FlameCrestSong.mp3" --
		FreewindPostSong = "FreewindPostSong.mp3" --
		GaradarSong = "GaradarSong.mp3" --
		GromarshCrashSiteSong = "GromarshCrashSiteSong.mp3" --
		GromgolBaseCampSong = "GromgolBaseCampSong.mp3" --
		HammerfallSong = "HammerfallSong.mp3" --
		KargathSong = "KargathSong.mp3" --
		KorkronVanguardSong = "KorkronVanguardSong.mp3" --
		MokNathalVillageSong = "MokNathalVillageSong.mp3" --
		NewAgamandSong = "NewAgamandSong.mp3" --
		RazorHillSong = "RazorHillSong.mp3" --
		RevantuskVillageSong = "RevantuskVillageSong.mp3" --
		SenjinVillageSong = "SenjinVillageSong.mp3" --
		SepulcherSong = "SepulcherSong.mp3" --
		ShadowmoonVillageSong = "ShadowmoonVillageSong.mp3" --
		ShadowpreyVillageSong = "ShadowpreyVillageSong.mp3" --
		SplintertreePostSong = "SplintertreePostSong.mp3" --
		StonardSong = "StonardSong.mp3" --
		StonebreakerHoldSong = "StonebreakerHoldSong.mp3" --
		SunreaversCommandSong = "SunreaversCommandSong.mp3" --
		SunRockRetreatSong = "SunRockRetreatSong.mp3" --
		SwampratPostSong = "SwampratPostSong.mp3" --
		TarrenMillSong = "TarrenMillSong.mp3" --
		TaunkaleVillageSong = "TaunkaleVillageSong.mp3" --
		ThrallmarSong = "ThrallmarSong.mp3" --
		ThunderlordStrongholdSong = "ThunderlordStrongholdSong.mp3" --
		TranquillienSong = "TranquillienSong.mp3" --
		ValormokSong = "ValormokSong.mp3" --
		VengeanceLandingSong = "VengeanceLandingSong.mp3" --
		VenomspiteSong = "VenomspiteSong.mp3" --
		WarsongHoldSong = "WarsongHoldSong.mp3" --
		ZabrajinSong = "ZabrajinSong.mp3" --
		ZoramgarOutpostSong = "ZoramgarOutpostSong.mp3" --

		-- Alliance Towns Events --
		AeriePeakSong = "AeriePeakSong.mp3" -- 
		AllerianStrongholdSong = "AllerianStrongholdSong.mp3" --
		AmberpineLodgeSong = "AmberpineLodgeSong.mp3" --
		AstranaarSong = "AstranaarSong.mp3" --
		AuberdineSong = "AuberdineSong.mp3" --
		AzureWatchSong = "AzureWatchSong.mp3" --
		BloodWatchSong = "BloodWatchSong.mp3" --
		ChillwindCampSong = "ChillwindCampSong.mp3" --
		DarkshireSong = "DarkshireSong.mp3" --
		DolanaarSong = "DolanaarSong.mp3" --
		ExplorersLeagueOutpostSong = "ExplorersLeagueOutpostSong.mp3" --
		FeathermoonStrongholdSong = "FeathermoonStrongholdSong.mp3" --
		FizzcrankAirstripSong = "FizzcrankAirstripSong.mp3" --
		FordragonHoldSong = "FordragonHoldSong.mp3" --
		ForestSongSong = "ForestSongSong.mp3" --
		FortWildervarSong = "FortWildervarSong.mp3" --
		FrostholdSong = "FrostholdSong.mp3" --
		GoldshireSong = "GoldshireSong.mp3" --
		HonorHoldSong = "HonorHoldSong.mp3" --
		KharanosSong = "KharanosSong.mp3" --
		LakeshireSong = "LakeshireSong.mp3" --
		MenethilHarborSong = "MenethilHarborSong.mp3" --
		MorgansVigilSong = "MorgansVigilSong.mp3" --
		NethergardeKeepSong = "NethergardeKeepSong.mp3" --
		NijelsPointSong = "NijelsPointSong.mp3" --
		OreborHarborageSong = "OreborHarborageSong.mp3" --
		RebelCampSong = "RebelCampSong.mp3" --
		RefugePointeSong = "RefugePointeSong.mp3" --
		SentinelHillSong = "SentinelHillSong.mp3" --
		SouthshoreSong = "SouthshoreSong.mp3" --
		StarsRestSong = "StarsRestSong.mp3" --
		StonetalonPeakSong = "StonetalonPeakSong.mp3" --
		SylvanaarSong = "SylvanaarSong.mp3" --
		TalrendisPointSong = "TalrendisPointSong.mp3" --
		TalonbranchGladeSong = "TalonbranchGladeSong.mp3" --
		TelaarSong = "TelaarSong.mp3" --
		TelredorSong = "TelredorSong.mp3" --
		TempleOfTelhamatSong = "TempleOfTelhamatSong.mp3" --
		ThalanaarSong = "ThalanaarSong.mp3" --
		ThelsamarSong = "ThelsamarSong.mp3" --
		TheramoreIsleSong = "TheramoreIsleSong.mp3" --
		ToshleysStationSong = "ToshleysStationSong.mp3" --
		ValianceKeepSong = "ValianceKeepSong.mp3" --
		ValgardeSong = "ValgardeSong.mp3" --
		WestfallBrigadeEncampmentSong = "WestfallBrigadeEncampmentSong.mp3" --
		WestguardKeepSong = "WestguardKeepSong.mp3" --
		WildhammerStrongholdSong = "WildhammerStrongholdSong.mp3" --
		WindrunnersOverlookSong = "WindrunnersOverlookSong.mp3" --
		
		-- Neutral Towns Events --
		AltarofShatarSong = "AltarofShatarSong.mp3" --
		AmberLedgeSong = "AmberLedgeSong.mp3" --
		ArgentTournamentGroundsSong = "ArgentTournamentGroundsSong.mp3" --
		ArgentVanguardSong = "ArgentVanguardSong.mp3" --
		BouldercragsRefugeSong = "BouldercragsRefugeSong.mp3" --
		CenarionHoldSong = "CenarionHoldSong.mp3" --
		CenarionRefugeSong = "CenarionRefugeSong.mp3" --
		CosmowrenchSong = "CosmowrenchSong.mp3" --
		CrusadersPinnacleSong = "CrusadersPinnacleSong.mp3" --
		DeathsRiseSong = "DeathsRiseSong.mp3" --
		DunNiffelemSong = "DunNiffelemSong.mp3" --
		EbonWatchSong = "EbonWatchSong.mp3" --
		EmeraldSanctuarySong = "EmeraldSanctuarySong.mp3" --
		EvergroveSong = "EvergroveSong.mp3" --
		FrenzyheartHillSong = "FrenzyheartHillSong.mp3" --
		HalaaSong = "HalaaSong.mp3" --
		K3Song = "K3Song.mp3" --
		KamaguaSong = "KamaguaSong.mp3" --
		LightsBreachSong = "LightsBreachSong.mp3" --
		LightsHopeChapelSong = "LightsHopeChapelSong.mp3" --
		MarshalsRefugeSong = "MarshalsRefugeSong.mp3" --
		MoakiHarborSong = "MoakiHarborSong.mp3" --
		MudsprocketSong = "MudsprocketSong.mp3" --
		NesingwaryBaseCampSong = "NesingwaryBaseCampSong.mp3" --
		NighthavenSong = "NighthavenSong.mp3" --
		RainspeakerCanopySong = "RainspeakerCanopySong.mp3" --
		RiversHeartSong = "RiversHeartSong.mp3" --
		SanctumOfTheStarsSong = "SanctumOfTheStarsSong.mp3" --
		ShadowVaultSong = "ShadowVaultSong.mp3" --
		SporeggarSong = "SporeggarSong.mp3" --
		StormspireSong = "StormspireSong.mp3" --
		SunsReachSong = "SunsReachSong.mp3" --
		ThoriumPointSong = "ThoriumPointSong.mp3" --
		TransitusShieldSong = "TransitusShieldSong.mp3" --
		UnupeSong = "UnupeSong.mp3" --
		WyrmrestTempleSong = "WyrmrestTempleSong.mp3" --
		ZimTorgaSong = "ZimTorgaSong.mp3" --

		-- Eastern Kingdoms Zones Events --
		AlteracMountainsSong = "AlteracMountainsSong.mp3" --
		ArathiHighlandsSong = "ArathiHighlandsSong.mp3" --
		BadlandsSong = "BadlandsSong.mp3" --
		BlackrockMountainSong = "BlackrockMountainSong.mp3" --
		BlastedLandsSong = "BlastedLandsSong.mp3" --
		BrewnallVillageSong = "BrewnallVillageSong.mp3" --
		BurningSteppesSong = "BurningSteppesSong.mp3" --
		ColdridgeValleySong = "ColdridgeValleySong.mp3" --
		DarrowshireSong = "DarrowshireSong.mp3" --
		DeadwindPassSong = "DeadwindPassSong.mp3" --
		DeathknellSong = "DeathknellSong.mp3" --
		DunMoroghSong = "DunMoroghSong.mp3" --
		DuskwoodSong = "DuskwoodSong.mp3" --
		EasternPlaguelandsSong = "EasternPlaguelandsSong.mp3" --
		EastvaleLoggingCampSong = "EastvaleLoggingCampSong.mp3" --
		ElwynnForestSong = "ElwynnForestSong.mp3" --
		EversongWoodsSong = "EversongWoodsSong.mp3" --
		GhostlandsSong = "GhostlandsSong.mp3" --
		HillsbradFieldsSong = "HillsbradFieldsSong.mp3" --
		HillsbradFoothillsSong = "HillsbradFoothillsSong.mp3" --
		IsleofQuelDanasSong = "IsleofQuelDanasSong.mp3" --
		LochModanSong = "LochModanSong.mp3" --
		MaclureVineyardsSong = "MaclureVineyardsSong.mp3" --
		NorthshireValleySong = "NorthshireValleySong.mp3" --
		RedridgeMountainsSong = "RedridgeMountainsSong.mp3" --
		SearingGorgeSong = "SearingGorgeSong.mp3" --
		PyrewoodVillageSong = "PyrewoodVillageSong.mp3" --
		SilverpineForestSong = "SilverpineForestSong.mp3" --
		StranglethornValeSong = "StranglethornValeSong.mp3" --
		SwampOfSorrowsSong = "SwampOfSorrowsSong.mp3" --
		SunstriderIsleSong = "SunstriderIsleSong.mp3" --
		TheHarborageSong = "TheHarborageSong.mp3" --
		TheHinterlandsSong = "TheHinterlandsSong.mp3" --
		TirisfalGladesSong = "TirisfalGladesSong.mp3" --
		WesternPlaguelandsSong = "WesternPlaguelandsSong.mp3" --
		WestfallSong = "WestfallSong.mp3" --
		WetlandsSong = "WetlandsSong.mp3" --

		-- Kalimdor Zones Events --
		AmmenValeSong = "AmmenValeSong.mp3" --
		AshenvaleSong = "AshenvaleSong.mp3" --
		AzsharaSong = "AzsharaSong.mp3" --
		AzuremystIsleSong = "AzuremystIsleSong.mp3" --
		BaelModanSong = "BaelModanSong.mp3" --
		BloodmystIsleSong = "BloodmystIsleSong.mp3" --
		CampNaracheSong = "CampNaracheSong.mp3" --
		CavernsOfTimeSong = "CavernsOfTimeSong.mp3" --
		DarkshoreSong = "DarkshoreSong.mp3" --
		DesolaceSong = "DesolaceSong.mp3" --
		DurotarSong = "DurotarSong.mp3" --
		DustwallowMarshSong = "DustwallowMarshSong.mp3" --
		FelwoodSong = "FelwoodSong.mp3" --
		FeralasSong = "FeralasSong.mp3" --
		GhostWalkerPostSong = "GhostWalkerPostSong.mp3" --
		MirageRacewaySong = "MirageRacewaySong.mp3" --
		MoongladeSong = "MoongladeSong.mp3" --
		MulgoreSong = "MulgoreSong.mp3" --
		RuttheranVillageSong = "RuttheranVillageSong.mp3" --
		ShadowglenSong = "ShadowglenSong.mp3" --
		SilithusSong = "SilithusSong.mp3" --
		StarfallVillageSong = "StarfallVillageSong.mp3" --
		SteamwheedlePortSong = "SteamwheedlePortSong.mp3" --
		StonetalonMountainsSong = "StonetalonMountainsSong.mp3" --
		TanarisSong = "TanarisSong.mp3" --
		TeldrassilSong = "TeldrassilSong.mp3" --
		TheBarrensSong = "TheBarrensSong.mp3" --
		ThousandNeedlesSong = "ThousandNeedlesSong.mp3" --
		TimbermawHoldSong = "TimbermawHoldSong.mp3" --
		UngoroCraterSong = "UngoroCraterSong.mp3" --
		ValleyOfTrialsSong = "ValleyOfTrialsSong.mp3" --
		ValorsRestSong = "ValorsRestSong.mp3" --
		WinterspringSong = "WinterspringSong.mp3" --

		-- Outland Zones Event --
		AerisLandingSong = "AerisLandingSong.mp3" --
		BladesEdgeMountainsSong = "BladesEdgeMountainsSong.mp3" --
		HellfirePeninsulaSong = "HellfirePeninsulaSong.mp3" --
		KirinVarVillageSong = "KirinVarVillageSong.mp3" --
		MidrealmPostSong = "MidrealmPostSong.mp3" --
		NagrandSong = "NagrandSong.mp3" --
		NetherstormSong = "NetherstormSong.mp3" --
		OgrilaSong = "OgrilaSong.mp3" --
		ProtectorateWatchPostSong = "ProtectorateWatchPostSong.mp3" --
		ShadowmoonValleySong = "ShadowmoonValleySong.mp3" --
		TerokkarForestSong = "TerokkarForestSong.mp3" --
		ZangarmarshSong = "ZangarmarshSong.mp3" --

		-- Northrend Zones Events --
		ColdarraSong = "ColdarraSong.mp3" --
		BlackwatchSong = "BlackwatchSong.mp3" --
		BoreanTundraSong = "BoreanTundraSong.mp3" --
		CrystalsongForestSong = "CrystalsongForestSong.mp3" --
		DawnsReachSong = "DawnsReachSong.mp3" --
		DoriansOutpostSong = "DoriansOutpostSong.mp3" --
		DragonblightSong = "DragonblightSong.mp3" --
		DubraJinSong = "DubraJinSong.mp3" --
		GraniteSpringsSong = "GraniteSpringsSong.mp3" --
		GrizzlyHillsSong = "GrizzlyHillsSong.mp3" --
		HowlingFjordSong = "HowlingFjordSong.mp3" --
		IcecrownSong = "IcecrownSong.mp3" --
		KartaksHoldSong = "KartaksHoldSong.mp3" --
		LakesideLandingSong = "LakesideLandingSong.mp3" --
		LightsTrustSong = "LightsTrustSong.mp3" --
		MistwhisperRefugeSong = "MistwhisperRefugeSong.mp3" --
		ScalawagPointSong = "ScalawagPointSong.mp3" --
		SholazarBasinSong = "SholazarBasinSong.mp3" --
		SparktouchedHavenSong = "SparktouchedHavenSong.mp3" --
		StormPeaksSong = "StormPeaksSong.mp3" --
		VentureBaySong = "VentureBaySong.mp3" --
		ZulDrakSong = "ZulDrakSong.mp3" --

		-- Dungeons Events --
		RagefireChasmSong = "RagefireChasmSong.mp3" --
		WailingCavernsDungeonSong = "WailingCavernsDungeonSong.mp3" --
		DeadminesSong = "DeadminesSong.mp3" --
		GnomereganSong = "GnomereganSong.mp3" --

		-- Battlegrounds Events --
		BattleGround1 = "BattleGround1.mp3" -- 
		BattleGround2 = "BattleGround2.mp3" -- 
		BattleGround3 = "BattleGround3.mp3" -- 
		BattleGround4 = "BattleGround4.mp3" -- 
		BattleGround5 = "BattleGround5.mp3" --
		BattleGround6 = "BattleGround6.mp3" --
		BattleGround7 = "BattleGround7.mp3" --
		BattleGround8 = "BattleGround8.mp3" --
		BattleGround9 = "BattleGround9.mp3" --
		BattleGround10 = "BattleGround10.mp3" --

		-- Raid Events --
		RaidSong = "RaidSong.mp3" -- 
		Raid2Song = "Raid2Song.mp3" -- 
		Raid3Song = "Raid3Song.mp3" --
		Raid4Song = "Raid4Song.mp3" --
		Raid5Song = "Raid5Song.mp3" --
		Raid6Song = "Raid6Song.mp3" --
		Raid7Song = "Raid7Song.mp3" -- 
		Raid8Song = "Raid8Song.mp3" --

		-- Normal Mount Events --
		Mounted1Song = "Mounted1Song.mp3" -- 
		Mounted2Song = "Mounted2Song.mp3" -- 
		Mounted3Song = "Mounted3Song.mp3" --
		Mounted4Song = "Mounted4Song.mp3" --
		Mounted5Song = "Mounted5Song.mp3" --
		Mounted6Song = "Mounted6Song.mp3" --
		Mounted7Song = "Mounted7Song.mp3" --

		Escape1Song = "Escape1Song.mp3" -- 
		Escape2Song = "Escape2Song.mp3" -- 
		Escape3Song = "Escape3Song.mp3" -- 
		Escape4Song = "Escape4Song.mp3" -- 
		Escape5Song = "Escape5Song.mp3" --
 		Escape6Song = "Escape6Song.mp3" --
		Escape7Song = "Escape7Song.mp3" --
		Escape8Song = "Escape8Song.mp3" --
		Escape9Song = "Escape9Song.mp3" --
		
		-- Flying Mount Events --
		FP1Song = "FP1Song.mp3" -- 
		FP2Song = "FP2Song.mp3" --
		FP3Song = "FP3Song.mp3" --
		FP4Song = "FP4Song.mp3" --
		FP5Song = "FP5Song.mp3" -- 
		FP6Song = "FP6Song.mp3" --
		HordeFP1Song = "HordeFP1Song.mp3" --
		HordeFP2Song = "HordeFP2Song.mp3" --
		HordeFP3Song = "HordeFP3Song.mp3" --
		HordeFP4Song = "HordeFP4Song.mp3" --
		HordeFP5Song = "HordeFP5Song.mp3" --
		FlyingMountSong = "FlyingMountSong.mp3" --
		FlyingMount2Song = "FlyingMount2Song.mp3" --
		FlyingMount3Song = "FlyingMount3Song.mp3" --
		FlyingMount4Song = "FlyingMount4Song.mp3" --

		-- Dead/Ghost Events --
		Dead1Song = "Dead1Song.mp3" -- 
		Dead2Song = "Dead2Song.mp3" --
		Dead3Song = "Dead3Song.mp3" --
		Dead4Song = "Dead4Song.mp3" --
		Dead5Song = "Dead5Song.mp3" --
		Dead6Song = "Dead6Song.mp3" --
		Dead7Song = "Dead7Song.mp3" --
		Dead8Song = "Dead8Song.mp3" --

		DieSong = "DieSong.mp3" --
		Die2Song = "Die2Song.mp3" --
		Die3Song = "Die3Song.mp3" --
		Die4Song = "Die4Song.mp3" --
		Die5Song = "Die5Song.mp3" --
		Die6Song = "Die6Song.mp3" --
		Die7Song = "Die7Song.mp3" --
		Die8Song = "Die8Song.mp3" -- 

		-- Fighting Events --
		LevelUpSong = "LevelUpSong.mp3" --
		LevelUp2Song = "LevelUp2Song.mp3" --
		LevelUp3Song = "LevelUp3Song.mp3" --
		LevelUp4Song = "LevelUp4Song.mp3" --
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
		Fighting12Song = "Fighting12Song.mp3" --
		Fighting13Song = "Fighting13Song.mp3" --
		Fighting14Song = "Fighting14Song.mp3" --
		Fighting15Song = "Fighting15Song.mp3" --
		Fighting16Song = "Fighting16Song.mp3" --
		Fighting17Song = "Fighting17Song.mp3" --
		Fighting18Song = "Fighting18Song.mp3" --
		Fighting19Song = "Fighting19Song.mp3" --

		BossSong = "BossSong.mp3" -- 
		Boss2Song = "Boss2Song.mp3" -- 
		Boss3Song = "Boss3Song.mp3" --
		Boss4Song = "Boss4Song.mp3" --
		Boss5Song = "Boss5Song.mp3" --
		Boss6Song = "Boss6Song.mp3" --
		Boss7Song = "Boss7Song.mp3" --
		Boss8Song = "Boss8Song.mp3" --
		Boss9Song = "Boss9Song.mp3" --
		Boss10Song = "Boss10Song.mp3" --
		Boss11Song = "Boss11Song.mp3" --
		Boss12Song = "Boss12Song.mp3" --

		-- PvP Events --
		HostileSong = "HostileSong.mp3" --

		-- Dance Event
		BloodElfFemaleDanceSong = "BloodElfFemale.mp3" -- 
		BloodElfMaleDanceSong = "BloodElfMale.mp3" -- 
		DraeneiFemaleDanceSong = "DraeneiFemale.mp3" -- 
		DraeneiMaleDanceSong = "DraeneiMale.mp3" -- 
		DwarfFemaleDanceSong = "DwarfFemale.mp3" -- 
		DwarfMaleDanceSong = "DwarfMale.mp3" -- 
		GnomeFemaleDanceSong = "GnomeFemale.mp3" -- 
		GnomeMaleDanceSong = "GnomeMale.mp3" -- 
		HumanFemaleDanceSong = "HumanFemale.mp3" -- 
		HumanMaleDanceSong = "HumanMale.mp3" -- 
		NightElfFemaleDanceSong = "NightElfFemale.mp3" -- 
		NightElfMaleDanceSong = "NightElfMale.mp3" -- 
		OrcFemaleDanceSong = "OrcFemale.mp3" -- 
		OrcMaleDanceSong = "OrcMale.mp3" -- 
		TaurenFemaleDanceSong = "TaurenFemale.mp3" -- 
		TaurenMaleDanceSong = "TaurenMale.mp3" -- 
		TrollFemaleDanceSong = "TrollFemale.mp3" -- 
		TrollMaleDanceSong = "TrollMale.mp3" -- 
		UndeadFemaleDanceSong = "UndeadFemale.mp3" -- 
		UndeadMaleDanceSong = "UndeadMale.mp3" -- 
		DruidBearDanceSong = "DruidBear.mp3" -- 
		DruidCatDanceSong = "DruidCat.mp3" -- 
		DruidOwlBearDanceSong = "DruidOwlBear.mp3" -- 
		DruidTreeFormDanceSong = "DruidTreeForm.mp3" -- 
		WolfDanceSong = "Wolf.mp3" -- 
		
		-- Misc Events --
		ChocoboKweh = "kweh.mp3" -- Chocobo Kweh Sound
		SwimSong = "SwimSong.mp3" --
		Swim2Song = "Swim2Song.mp3" --
		Swim3Song = "Swim3Song.mp3" -- 
		DarkSwimSong = "DarkSwimSong.mp3" -- NEW!!!!
		SleepSong = "SleepSong.mp3" --
		Sleep2Song = "Sleep2Song.mp3" --
		Sleep3Song = "Sleep3Song.mp3" --
		Sleep4Song = "Sleep4Song.mp3" --
		Sleep5Song = "Sleep5Song.mp3" --
		Sleep6Song = "Sleep6Song.mp3" --
		Sleep7Song = "Sleep7Song.mp3" --
		Sleep8Song = "Sleep8Song.mp3" --
		Sleep9Song = "Sleep9Song.mp3" --
		Sleep10Song = "Sleep10Song.mp3" --
		Sleep11Song = "Sleep11Song.mp3" -- 
		Sleep12Song = "Sleep12Song.mp3" --
		Sleep13Song = "Sleep13Song.mp3" --
		KillSound = "Kill.wav" -- Leave combat sound
		CombatSound = "Combat.wav" -- Enter combat sound
		DeeprunTramSong = "DeeprunTramSong.mp3" --
		ScarletMonasterySong = "ScarletMonasterySong.mp3" --
		RazorfenSong = "RazorfenSong.mp3" --
		WailingCavernsSong = "WailingCavernsSong.mp3" --
		TheDeadminesSong = "TheDeadminesSong.mp3" --

		
	--#######################################
	--##
	--##	MUSIC /SOUND CALLS
	--##
	--#######################################

	--#############
	-- ## SOUNDS
	--#############
	function FinalFantasylization_KillSound()
		FinalFantasylization_PlayFile( S ..  KillSound );
		FinalFantasylization_debugMsg("KillSound")
	end
	function FinalFantasylization_CombatSound()
		FinalFantasylization_PlayFile( S ..  CombatSound );
		FinalFantasylization_debugMsg("CombatSound")
	end
	function FinalFantasylization_ChocoboKweh()
		FinalFantasylization_PlayFile( S ..  ChocoboKweh );
		FinalFantasylization_debugMsg("Chocobo Kweh!")
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
	-- ## HORDE CAPITAL CITIES
	--########################
	function FinalFantasylization_OrgrimmarSong()
		FinalFantasylization_PlayMusic( S .. OrgrimmarSong);
		FinalFantasylization_debugMsg("OrgrimmarSong Dragon Age Origins The Deep Roads")
	end
	function FinalFantasylization_SilvermoonCitySong()
		FinalFantasylization_PlayMusic( S .. SilvermoonCitySong);
		FinalFantasylization_debugMsg("SilvermoonCitySong Arcania Gothic 4 Silverlake 2")
	end
	function FinalFantasylization_ThunderBluffSong()
		FinalFantasylization_PlayMusic( S .. ThunderBluffSong);
		FinalFantasylization_debugMsg("ThunderBluffSong LRFF13 Monoculus")
	end
	function FinalFantasylization_UndercitySong()
		FinalFantasylization_PlayMusic( S .. UndercitySong);
		FinalFantasylization_debugMsg("UndercitySong Kingdom Hearts This is Halloween")	
	end

	--########################
	-- ## ALLIANCE CAPITAL CITIES
	--########################
	function FinalFantasylization_DarnassusSong()
		FinalFantasylization_PlayMusic( S .. DarnassusSong);
		FinalFantasylization_debugMsg("DarnassusSong FFBE Tree of Tales")
	end
	function FinalFantasylization_ExodarSong()
		FinalFantasylization_PlayMusic( S .. ExodarSong);
		FinalFantasylization_debugMsg("ExodarSong FF13 Taejin's Tower")
	end
	function FinalFantasylization_IronforgeSong()
		FinalFantasylization_PlayMusic( S .. IronforgeSong);
		FinalFantasylization_debugMsg("IronforgeSong Baldur's Gate Main Theme")
	end
	function FinalFantasylization_StormwindCitySong()
		FinalFantasylization_PlayMusic( S .. StormwindCitySong);
		FinalFantasylization_debugMsg("StormwindCitySong Final Fantasy XI Vanadiel March")
	end

	--########################
	-- ## NEUTRAL CAPITAL CITIES
	--########################
	function FinalFantasylization_CityArea52()
		FinalFantasylization_PlayMusic( S .. Area52Song);
		FinalFantasylization_debugMsg("Area52Song Legend of Dragoon City of Commerce Lohan")
	end
	function FinalFantasylization_CityBootyBay()
		FinalFantasylization_PlayMusic( S .. BootyBaySong);
		FinalFantasylization_debugMsg("BootyBaySong Chrono Cross Optimism")
	end
	function FinalFantasylization_DalaranSong()
		FinalFantasylization_PlayMusic( S .. DalaranSong);
		FinalFantasylization_debugMsg("DalaranSong Final Fantasy 12 The Skycity of Bhujerba")
	end
	function FinalFantasylization_EbonHoldSong()
		FinalFantasylization_PlayMusic( S .. EbonHoldSong);
		FinalFantasylization_debugMsg("EbonHoldSong Guild Wars 2 March of the Legions")
	end
	function FinalFantasylization_CityEverlook()
		FinalFantasylization_PlayMusic( S .. EverlookSong);
		FinalFantasylization_debugMsg("EverlookSong Legend of Legaia Title")
	end
	function FinalFantasylization_CityGadgetzan()
		FinalFantasylization_PlayMusic( S .. GadgetzanSong);
		FinalFantasylization_debugMsg("GadgetzanSong Legend of Zelda Ocarina of Time Gerudo Valley")
	end
	function FinalFantasylization_CityRatchet()
		FinalFantasylization_PlayMusic( S .. RatchetSong);
		FinalFantasylization_debugMsg("RatchetSong Final Fantasy 7 Costa Del Sol")
	end
	function FinalFantasylization_ShattrathCitySong()
		FinalFantasylization_PlayMusic( S .. ShattrathCitySong);
		FinalFantasylization_debugMsg("ShattrathCitySong Baldur's Gate 2 Romance 1")
	end

	--########################
	-- ##   HORDE TOWNS
	--########################
	function FinalFantasylization_HordeTownAgmarsHammer()
		FinalFantasylization_PlayMusic( S .. AgmarsHammerSong);
		FinalFantasylization_debugMsg("AgmarsHammerSong Jeff Van Dyck Barbarian")
	end
	function FinalFantasylization_HordeTownApothecaryCamp()
		FinalFantasylization_PlayMusic( S .. ApothecaryCampSong);
		FinalFantasylization_debugMsg("ApothecaryCampSong Final Fantasy 4 Celtic Moon Dancing Calcobrena")
	end
	function FinalFantasylization_HordeTownBloodhoofVillage()
		FinalFantasylization_PlayMusic( S .. BloodhoofVillageSong);
		FinalFantasylization_debugMsg("BloodhoofVillageSong Final Fantasy 7 Cosmo Canyon")
	end
	function FinalFantasylization_HordeTownBloodvenomPost()
		FinalFantasylization_PlayMusic( S .. BloodvenomPostSong);
		FinalFantasylization_debugMsg("BloodvenomPostSong Final Fantasy Tactics The Pervert")
	end
	function FinalFantasylization_HordeTownBrackenwallVillage()
		FinalFantasylization_PlayMusic( S .. BrackenwallVillageSong);
		FinalFantasylization_debugMsg("BrackenwallVillageSong Breath of Fire 4 Song of the Plains")
	end
	function FinalFantasylization_HordeTownBrill()
		FinalFantasylization_PlayMusic( S .. BrillSong);
		FinalFantasylization_debugMsg("BrillSong Breath of Fire 4 Darkness")
	end
	function FinalFantasylization_HordeTownBorgorokOutpost()
		FinalFantasylization_PlayMusic( S .. BorgorokOutpostSong);
		FinalFantasylization_debugMsg("BorgorokOutpostSong Chrono Cross Phantom Ship")
	end
	function FinalFantasylization_HordeTownCampMojache()
		FinalFantasylization_PlayMusic( S .. CampMojacheSong);
		FinalFantasylization_debugMsg("CampMojacheSong Final Fantasy XI Galka")
	end
	function FinalFantasylization_HordeTownCampOneqwah()
		FinalFantasylization_PlayMusic( S .. CampOneqwahSong);
		FinalFantasylization_debugMsg("CampOneqwahSong Final Fantasy 12 Jahara Land of the Garif")
	end
	function FinalFantasylization_HordeTownCampTaurajo()
		FinalFantasylization_PlayMusic( S .. CampTaurajoSong);
		FinalFantasylization_debugMsg("CampTaurajoSong Kingdom Hearts 2 The Home of Dragons")
	end
	function FinalFantasylization_HordeTownCampTunkalo()
		FinalFantasylization_PlayMusic( S .. CampTunkaloSong);
		FinalFantasylization_debugMsg("CampTunkaloSong Legaia 2 Duel Saga Shriek of the Earth")
	end
	function FinalFantasylization_HordeTownCampWinterhoof()
		FinalFantasylization_PlayMusic( S .. CampWinterhoofSong);
		FinalFantasylization_debugMsg("CampWinterhoofSong Radiata Stories Outsiders")
	end
	function FinalFantasylization_HordeTownConquestHold()
		FinalFantasylization_PlayMusic( S .. ConquestHoldSong);
		FinalFantasylization_debugMsg("ConquestHoldSong Star Wars 5 The Imperial March")
	end
	function FinalFantasylization_HordeTownFairbreezeVillage()
		FinalFantasylization_PlayMusic( S .. FairbreezeVillageSong);
		FinalFantasylization_debugMsg("FairbreezeVillageSong Legend of Dragoon Lloyd theme")
	end
	function FinalFantasylization_HordeTownFalconWatch()
		FinalFantasylization_PlayMusic( S .. FalconWatchSong);
		FinalFantasylization_debugMsg("FalconWatchSong Breath of Fire 3 Questionable Century")
	end
	function FinalFantasylization_HordeTownFalconwingSquare()
		FinalFantasylization_PlayMusic( S .. FalconwingSquareSong);
		FinalFantasylization_debugMsg("FalconwingSquareSong Final Fantasy 7 Anxious Heart")
	end
	function FinalFantasylization_HordeTownFlameCrest()
		FinalFantasylization_PlayMusic( S .. FlameCrestSong);
		FinalFantasylization_debugMsg("FlameCrestSong Diablo 2 New Options Menu")
	end
	function FinalFantasylization_HordeTownFreewindPost()
		FinalFantasylization_PlayMusic( S .. FreewindPostSong);
		FinalFantasylization_debugMsg("FreewindPostSong Legend of Zelda Ocarina of Time Goron City")
	end
	function FinalFantasylization_HordeTownGaradar()
		FinalFantasylization_PlayMusic( S .. GaradarSong);
		FinalFantasylization_debugMsg("GaradarSong Final Fantasy 8 Seed")
	end
	function FinalFantasylization_HordeTownGromarshCrashSite()
		FinalFantasylization_PlayMusic( S .. GromarshCrashSiteSong);
		FinalFantasylization_debugMsg("GromarshCrashSiteSong Final Fantasy 8 Starting Up")
	end
	function FinalFantasylization_HordeTownGromgolBaseCamp()
		FinalFantasylization_PlayMusic( S .. GromgolBaseCampSong);
		FinalFantasylization_debugMsg("GromgolBaseCampSong Chrono Cross Dragonrider")
	end
	function FinalFantasylization_HordeTownHammerfall()
		FinalFantasylization_PlayMusic( S .. HammerfallSong);
		FinalFantasylization_debugMsg("HammerfallSong Final Fantasy XI Fury")
	end
	function FinalFantasylization_HordeTownKargath()
		FinalFantasylization_PlayMusic( S .. KargathSong);
		FinalFantasylization_debugMsg("KargathSong Kingdom Hearts 2 The Underworld")
	end
	function FinalFantasylization_HordeTownKorkronVanguard()
		FinalFantasylization_PlayMusic( S .. KorkronVanguardSong);
		FinalFantasylization_debugMsg("KorkronVanguardSong Kingdom Hearts 2 Sacred Moon")
	end
	function FinalFantasylization_HordeTownMokNathalVillage()
		FinalFantasylization_PlayMusic( S .. MokNathalVillageSong);
		FinalFantasylization_debugMsg("MokNathalVillageSong Legaia 2 Duel Saga God Fist")
	end
	function FinalFantasylization_HordeTownNewAgamand()
		FinalFantasylization_PlayMusic( S .. NewAgamandSong);
		FinalFantasylization_debugMsg("NewAgamandSong Lord of The Ring The Two Towers Treebeard")
	end
	function FinalFantasylization_HordeTownRazorHill()
		FinalFantasylization_PlayMusic( S .. RazorHillSong);
		FinalFantasylization_debugMsg("RazorHillSong Final Fantasy 6 Troops March On")
	end
	function FinalFantasylization_HordeTownRevantuskVillage()
		FinalFantasylization_PlayMusic( S .. RevantuskVillageSong);
		FinalFantasylization_debugMsg("RevantuskVillageSong Final Fantasy 9 Tantalus theme")
	end
	function FinalFantasylization_HordeTownSenjinVillage()
		FinalFantasylization_PlayMusic( S .. SenjinVillageSong);
		FinalFantasylization_debugMsg("SenjinVillageSong Final Fantasy 7 Fort Condor")
	end
	function FinalFantasylization_HordeTownSepulcher()
		FinalFantasylization_PlayMusic( S .. SepulcherSong);
		FinalFantasylization_debugMsg("SepulcherSong Final Fantasy 9 Sword of Doubt")
	end
	function FinalFantasylization_HordeTownShadowmoonVillage()
		FinalFantasylization_PlayMusic( S .. ShadowmoonVillageSong);
		FinalFantasylization_debugMsg("ShadowmoonVillageSong Final Fantasy XI Shadow Lord")
	end
	function FinalFantasylization_HordeTownShadowpreyVillage()
		FinalFantasylization_PlayMusic( S .. ShadowpreyVillageSong);
		FinalFantasylization_debugMsg("ShadowpreyVillageSong Final Fantasy 7 Barret theme")
	end
	function FinalFantasylization_HordeTownSplintertreePost()
		FinalFantasylization_PlayMusic( S .. SplintertreePostSong);
		FinalFantasylization_debugMsg("SplintertreePostSong Final Fantasy 7 Turks theme")
	end
	function FinalFantasylization_HordeTownStonard()
		FinalFantasylization_PlayMusic( S .. StonardSong);
		FinalFantasylization_debugMsg("StonardSong Chrono Cross Hydra Swamp")
	end
	function FinalFantasylization_HordeTownStonebreakerHold()
		FinalFantasylization_PlayMusic( S .. StonebreakerHoldSong);
		FinalFantasylization_debugMsg("StonebreakerHoldSong Final Fantasy 12 Theme of the Empire")
	end
	function FinalFantasylization_HordeTownSunreaversCommand()
		FinalFantasylization_PlayMusic( S .. SunreaversCommandSong);
		FinalFantasylization_debugMsg("SunreaversCommandSong Final Fantasy 10 People of the North Pole")
	end
	function FinalFantasylization_HordeTownSunRockRetreat()
		FinalFantasylization_PlayMusic( S .. SunRockRetreatSong);
		FinalFantasylization_debugMsg("SunRockRetreatSong Final Fantasy 7 Wutai")
	end
	function FinalFantasylization_HordeTownSwampratPost()
		FinalFantasylization_PlayMusic( S .. SwampratPostSong);
		FinalFantasylization_debugMsg("SwampratPostSong Kingdom Hearts 2 Nights of the Cursed")
	end
	function FinalFantasylization_HordeTownTarrenMill()
		FinalFantasylization_PlayMusic( S .. TarrenMillSong);
		FinalFantasylization_debugMsg("TarrenMillSong Kingdom Hearts 2 This is Halloween")
	end
	function FinalFantasylization_HordeTownTaunkaleVillage()
		FinalFantasylization_PlayMusic( S .. TaunkaleVillageSong);
		FinalFantasylization_debugMsg("TaunkaleVillageSong Legend of Legaia Mist")
	end
	function FinalFantasylization_HordeTownCrossroads()
		FinalFantasylization_PlayMusic( S .. CrossroadsSong);
		FinalFantasylization_debugMsg("CrossroadsSong Legend of Legaia Rim Elm")
	end
	function FinalFantasylization_HordeTownThrallmar()
		FinalFantasylization_PlayMusic( S .. ThrallmarSong);
		FinalFantasylization_debugMsg("ThrallmarSong Legend of Legaia Songi First Appearance")
	end
	function FinalFantasylization_HordeTownThunderlordStronghold()
		FinalFantasylization_PlayMusic( S .. ThunderlordStrongholdSong);
		FinalFantasylization_debugMsg("ThunderlordStrongholdSong Legend of Dragoon Hellena Prison")
	end
	function FinalFantasylization_HordeTownTranquillien()
		FinalFantasylization_PlayMusic( S .. TranquillienSong);
		FinalFantasylization_debugMsg("TranquillienSong Final Fantasy 7 Sending a Dream into the Universe")
	end
	function FinalFantasylization_HordeTownValormok()
		FinalFantasylization_PlayMusic( S .. ValormokSong);
		FinalFantasylization_debugMsg("ValormokSong Legend of Dragoon Imperial City Kazas")
	end
	function FinalFantasylization_HordeTownVengeanceLanding()
		FinalFantasylization_PlayMusic( S .. VengeanceLandingSong);
		FinalFantasylization_debugMsg("VengeanceLandingSong Final Fantasy 7 Shinra Corporation")
	end
	function FinalFantasylization_HordeTownVenomspite()
		FinalFantasylization_PlayMusic( S .. VenomspiteSong);
		FinalFantasylization_debugMsg("VenomspiteSong Final Fantasy XI Rise of the Zilart Norg")
	end
	function FinalFantasylization_HordeTownWarsongHold()
		FinalFantasylization_PlayMusic( S .. WarsongHoldSong);
		FinalFantasylization_debugMsg("WarsongHoldSong FF 13 2 Condition Omega")
	end
	function FinalFantasylization_HordeTownZabrajin()
		FinalFantasylization_PlayMusic( S .. ZabrajinSong);
		FinalFantasylization_debugMsg("ZabrajinSong Kingdom Hearts Deep Jungle")
	end
	function FinalFantasylization_HordeTownZoramgarOutpost()
		FinalFantasylization_PlayMusic( S .. ZoramgarOutpostSong);
		FinalFantasylization_debugMsg("ZoramgarOutpostSong Breath of Fire 3 My favorite trick")
	end
	function FinalFantasylization_HordeTownGhostWalkerPost()
		FinalFantasylization_PlayMusic( S .. GhostWalkerPostSong);
		FinalFantasylization_debugMsg("GhostWalkerPostSong Final Fantasy 7 Mining Town")
	end

	--########################
	-- ##   ALLIANCE TOWNS
	--########################
	function FinalFantasylization_AllianceTownAeriePeak()
		FinalFantasylization_PlayMusic( S .. AeriePeakSong);
		FinalFantasylization_debugMsg("AeriePeakSong Final Fantasy 14 The Twin Faces of Fate The Theme of Ul'dah")
	end
	function FinalFantasylization_AllianceTownAllerianStronghold()
		FinalFantasylization_PlayMusic( S .. AllerianStrongholdSong);
		FinalFantasylization_debugMsg("AllerianStrongholdSong Breath of Fire 3 Eden")
	end
	function FinalFantasylization_AllianceTownAmberpineLodge()
		FinalFantasylization_PlayMusic( S .. AmberpineLodgeSong);
		FinalFantasylization_debugMsg("AmberpineLodgeSong Breath of Fire 4 Tototon Toton To")
	end
	function FinalFantasylization_AllianceTownAstranaar()
		FinalFantasylization_PlayMusic( S .. AstranaarSong);
		FinalFantasylization_debugMsg("AstranaarSong Final Fantasy 9 Dali")
	end
	function FinalFantasylization_AllianceTownAuberdine()
		FinalFantasylization_PlayMusic( S .. AuberdineSong);
		FinalFantasylization_debugMsg("AuberdineSong Final Fantasy 7 On that Day 5 years Ago")
	end
	function FinalFantasylization_AllianceTownAzureWatch()
		FinalFantasylization_PlayMusic( S .. AzureWatchSong);
		FinalFantasylization_debugMsg("AzureWatchSong Legend of Legaia Cave of Warmth")
	end
	function FinalFantasylization_AllianceTownBloodWatch()
		FinalFantasylization_PlayMusic( S .. BloodWatchSong);
		FinalFantasylization_debugMsg("BloodWatchSong Final Fantasy 7 Judgment Day")
	end
	function FinalFantasylization_AllianceTownBrackwellPumpkinPatch()
		FinalFantasylization_PlayMusic( S .. ElwynnForestSong);
		FinalFantasylization_debugMsg("ElwynnForestSong - Brackwell Pumpkin Patch")
	end
	function FinalFantasylization_AllianceTownChillwindCamp()
		FinalFantasylization_PlayMusic( S .. ChillwindCampSong);
		FinalFantasylization_debugMsg("ChillwindCampSong Kingdom Hearts Dearly Beloved")
	end
	function FinalFantasylization_AllianceTownDarkshire()
		FinalFantasylization_PlayMusic( S .. DarkshireSong);
		FinalFantasylization_debugMsg("DarkshireSong Breath of Fire 4 How Long Will the Rain Last")
	end
	function FinalFantasylization_AllianceTownDolanaar()
		FinalFantasylization_PlayMusic( S .. DolanaarSong);
		FinalFantasylization_debugMsg("DolanaarSong Rogue Galaxy Timeless Town")
	end
	function FinalFantasylization_AllianceTownExplorersLeagueOutpost()
		FinalFantasylization_PlayMusic( S .. ExplorersLeagueOutpostSong);
		FinalFantasylization_debugMsg("ExplorersLeagueOutpostSong Final Fantasy 7 On our Way")
	end
	function FinalFantasylization_AllianceTownFeathermoonStronghold()
		FinalFantasylization_PlayMusic( S .. FeathermoonStrongholdSong);
		FinalFantasylization_debugMsg("FeathermoonStrongholdSong Final Fantasy 12 Eruyt Village")
	end
	function FinalFantasylization_AllianceTownFizzcrankAirstrip()
		FinalFantasylization_PlayMusic( S .. FizzcrankAirstripSong);
		FinalFantasylization_debugMsg("FizzcrankAirstripSong Final Fantasy 7 Oppressed People")
	end
	function FinalFantasylization_AllianceTownFordragonHold()
		FinalFantasylization_PlayMusic( S .. FordragonHoldSong);
		FinalFantasylization_debugMsg("FordragonHoldSong Kingdom Hearts End of the World")
	end
	function FinalFantasylization_AllianceTownForestSong()
		FinalFantasylization_PlayMusic( S .. ForestSongSong);
		FinalFantasylization_debugMsg("ForestSongSong Radiata Stories Sending Feelings over the Distance")
	end
	function FinalFantasylization_AllianceTownFortWildervar()
		FinalFantasylization_PlayMusic( S .. FortWildervarSong);
		FinalFantasylization_debugMsg("FortWildervarSong Legend of Legaia Lively Imperial Palace")
	end
	function FinalFantasylization_AllianceTownFrosthold()
		FinalFantasylization_PlayMusic( S .. FrostholdSong);
		FinalFantasylization_debugMsg("FrostholdSong Legend of Legaia Light of the Town")
	end
	function FinalFantasylization_AllianceTownGoldshire()
		FinalFantasylization_PlayMusic( S .. GoldshireSong);
		FinalFantasylization_debugMsg("GoldshireSong Kingdom Hearts Traverse Town")
	end
	function FinalFantasylization_AllianceTownHonorHold()
		FinalFantasylization_PlayMusic( S .. HonorHoldSong);
		FinalFantasylization_debugMsg("HonorHoldSong Breath of Fire 4 The World Beneath your Feet")
	end
	function FinalFantasylization_AllianceTownKharanos()
		FinalFantasylization_PlayMusic( S .. KharanosSong);
		FinalFantasylization_debugMsg("KharanosSong Breath of Fire 4 Airily")
	end
	function FinalFantasylization_AllianceTownLakeshire()
		FinalFantasylization_PlayMusic( S .. LakeshireSong);
		FinalFantasylization_debugMsg("LakeshireSong Chrono Cross Home Arni")
	end
	function FinalFantasylization_AllianceTownMenethilHarbor()
		FinalFantasylization_PlayMusic( S .. MenethilHarborSong);
		FinalFantasylization_debugMsg("MenethilHarborSong Assassin Creed 4 Black Flag The Islands of the West Indies")
	end
	function FinalFantasylization_AllianceTownMorgansVigil()
		FinalFantasylization_PlayMusic( S .. MorgansVigilSong);
		FinalFantasylization_debugMsg("MorgansVigilSong Final Fantasy 7 Crisis Core Dreams and Honor")
	end
	function FinalFantasylization_AllianceTownNethergardeKeep()
		FinalFantasylization_PlayMusic( S .. NethergardeKeepSong);
		FinalFantasylization_debugMsg("NethergardeKeepSong Diablo Town")
	end
	function FinalFantasylization_AllianceTownNijelsPoint()
		FinalFantasylization_PlayMusic( S .. NijelsPointSong);
		FinalFantasylization_debugMsg("NijelsPointSong Final Fantasy 7 Mark of a Traitor")
	end
	function FinalFantasylization_AllianceTownOreborHarborage()
		FinalFantasylization_PlayMusic( S .. OreborHarborageSong);
		FinalFantasylization_debugMsg("OreborHarborageSong Final Fantasy 12 Rabanastre Lowtown")
	end
	function FinalFantasylization_AllianceTownRebelCamp()
		FinalFantasylization_PlayMusic( S .. RebelCampSong);
		FinalFantasylization_debugMsg("RebelCampSong Kingdom Hearts 2 Sora")
	end
	function FinalFantasylization_AllianceTownRefugePointe()
		FinalFantasylization_PlayMusic( S .. RefugePointeSong);
		FinalFantasylization_debugMsg("RefugePointeSong Legaia 2 Duel Saga Everyday Tranquility")
	end
	function FinalFantasylization_AllianceTownSentinelHill()
		FinalFantasylization_PlayMusic( S .. SentinelHillSong);
		FinalFantasylization_debugMsg("SentinelHillSong Breath of Fire 3 Country Living")
	end
	function FinalFantasylization_AllianceTownSouthshore()
		FinalFantasylization_PlayMusic( S .. SouthshoreSong);
		FinalFantasylization_debugMsg("SouthshoreSong Lord of The Ring The Fellowship of the Ring Concerning Hobbits")
	end
	function FinalFantasylization_AllianceTownStarsRest()
		FinalFantasylization_PlayMusic( S .. StarsRestSong);
		FinalFantasylization_debugMsg("StarsRestSong Lord of The Ring The Two Towers Evenstar")	
	end
	function FinalFantasylization_AllianceTownSteelgrillsDepot()
		FinalFantasylization_PlayMusic( S .. DunMoroghSong);
		FinalFantasylization_debugMsg("DunMoroghSong")	
	end
	function FinalFantasylization_AllianceTownStonefieldFarm()
		FinalFantasylization_PlayMusic( S .. ElwynnForestSong);
		FinalFantasylization_debugMsg("ElwynnForestSong - StonefieldFarm")	
	end
	function FinalFantasylization_AllianceTownStonetalonPeak()
		FinalFantasylization_PlayMusic( S .. StonetalonPeakSong);
		FinalFantasylization_debugMsg("StonetalonPeakSong Final Fantasy XI Rise of the Zilart Sanctuary")
	end
	function FinalFantasylization_AllianceTownSylvanaar()
		FinalFantasylization_PlayMusic( S .. SylvanaarSong);
		FinalFantasylization_debugMsg("SylvanaarSong Final Fantasy 9 Bran Bal")
	end
	function FinalFantasylization_AllianceTownTalonbranchGlade()
		FinalFantasylization_PlayMusic( S .. TalonbranchGladeSong);
		FinalFantasylization_debugMsg("TalonbranchGladeSong Legaia 2 Duel Saga Tanza")
	end
	function FinalFantasylization_AllianceTownTalrendisPoint()
		FinalFantasylization_PlayMusic( S .. TalrendisPointSong);
		FinalFantasylization_debugMsg("TalrendisPointSong Final Fantasy 8 My mind")
	end
	function FinalFantasylization_AllianceTownTelaar()
		FinalFantasylization_PlayMusic( S .. TelaarSong);
		FinalFantasylization_debugMsg("TelaarSong Lunar 2 Promenade")
	end
	function FinalFantasylization_AllianceTownTelredor()
		FinalFantasylization_PlayMusic( S .. TelredorSong);
		FinalFantasylization_debugMsg("TelredorSong Final Fantasy 9 Kingdom of Burmecia")
	end
	function FinalFantasylization_AllianceTownTempleOfTelhamat()
		FinalFantasylization_PlayMusic( S .. TempleOfTelhamatSong);
		FinalFantasylization_debugMsg("TempleOfTelhamatSong Legend of Dragoon Hokes Village")
	end
	function FinalFantasylization_AllianceTownThalanaar()
		FinalFantasylization_PlayMusic( S .. ThalanaarSong);
		FinalFantasylization_debugMsg("ThalanaarSong Final Fantasy 7 Descendants of the Shinobi")
	end
	function FinalFantasylization_AllianceTownThelsamar()
		FinalFantasylization_PlayMusic( S .. ThelsamarSong);
		FinalFantasylization_debugMsg("ThelsamarSong Final Fantasy 7 Ahead on our Way")
	end
	function FinalFantasylization_AllianceTownTheramoreIsle()
		FinalFantasylization_PlayMusic( S .. TheramoreIsleSong);
		FinalFantasylization_debugMsg("TheramoreIsleSong Final Fantasy 7 Rufus Welcoming Ceremony")
	end
	function FinalFantasylization_AllianceTownToshleysStation()
		FinalFantasylization_PlayMusic( S .. ToshleysStationSong);
		FinalFantasylization_debugMsg("ToshleysStationSong Final Fantasy 7 Wall Market")
	end
	function FinalFantasylization_AllianceTownValianceKeep()
		FinalFantasylization_PlayMusic( S .. ValianceKeepSong);
		FinalFantasylization_debugMsg("ValianceKeepSong Final Fantasy 8 Balamb Garden")
	end
	function FinalFantasylization_AllianceTownValgarde()
		FinalFantasylization_PlayMusic( S .. ValgardeSong);
		FinalFantasylization_debugMsg("ValgardeSong Kingdom Hearts Under the Sea")
	end
	function FinalFantasylization_AllianceTownWestfallBrigadeEncampment()
		FinalFantasylization_PlayMusic( S .. WestfallBrigadeEncampmentSong);
		FinalFantasylization_debugMsg("WestfallBrigadeEncampmentSong Breath of Fire 4 Brave Heart")
	end
	function FinalFantasylization_AllianceTownWestguardKeep()
		FinalFantasylization_PlayMusic( S .. WestguardKeepSong);
		FinalFantasylization_debugMsg("WestguardKeepSong Legend of Dragoon Royal Castle")
	end
	function FinalFantasylization_AllianceTownWildhammerStronghold()
		FinalFantasylization_PlayMusic( S .. WildhammerStrongholdSong);
		FinalFantasylization_debugMsg("WildhammerStrongholdSong Final Fantasy 7 Crisis Core A Closed off Village")
	end
	function FinalFantasylization_AllianceTownWindrunnersOverlook()
		FinalFantasylization_PlayMusic( S .. WindrunnersOverlookSong);
		FinalFantasylization_debugMsg("WindrunnersOverlookSong Joanie Meden Woman of Ireland")
	end
	function FinalFantasylization_AllianceTownWintergardeKeep()
		FinalFantasylization_BattleGround();
	end
	function FinalFantasylization_AllianceTownBrewnallVillage()
		FinalFantasylization_PlayMusic( S .. BrewnallVillageSong);
		FinalFantasylization_debugMsg("BrewnallVillageSong Final Fantasy Best Collection 1987 1994 Legend of the Great Forest from Final Fantasy 5 Dear Friends")
	end
	function FinalFantasylization_AllianceTownEastvaleLoggingCamp()
		FinalFantasylization_PlayMusic( S .. EastvaleLoggingCampSong);
		FinalFantasylization_debugMsg("EastvaleLoggingCampSong Legend of Dragoon Grassy Plains")
	end
	function FinalFantasylization_AllianceTownHillsbradFields()
		FinalFantasylization_PlayMusic( S .. HillsbradFieldsSong);
		FinalFantasylization_debugMsg("HillsbradFieldsSong Final Fantasy 7 Farm Boy")
	end
	function FinalFantasylization_AllianceTownMaclureVineyards()
		FinalFantasylization_PlayMusic( S .. MaclureVineyardsSong);
		FinalFantasylization_debugMsg("MaclureVineyardsSong Baldur's Gate Exploring the Plains")
	end
	function FinalFantasylization_AllianceTownPyrewoodVillage()
		FinalFantasylization_PlayMusic( S .. PyrewoodVillageSong);
		FinalFantasylization_debugMsg("PyrewoodVillageSong WoW Cataclysm Curse of the Worgen")
	end
	function FinalFantasylization_AllianceTownBaelModan()
		FinalFantasylization_PlayMusic( S .. BaelModanSong);
		FinalFantasylization_debugMsg("BaelModanSong Breath of Fire 3 Life is a Beach")
	end
	function FinalFantasylization_AllianceTownRuttheranVillage()
		FinalFantasylization_PlayMusic( S .. RuttheranVillageSong);
		FinalFantasylization_debugMsg("RuttheranVillageSong Dissidia Final Fantasy Main theme FF1")
	end
	function FinalFantasylization_AllianceTownStarfallVillage()
		FinalFantasylization_PlayMusic( S .. StarfallVillageSong);
		FinalFantasylization_debugMsg("StarfallVillageSong Legend of Dragoon Whispering of the Trees")
	end

	--########################
	-- ##   NEUTRAL TOWNS
	--########################
	function FinalFantasylization_NeutralTownAltarOfShatar()
		FinalFantasylization_PlayMusic( S .. AltarofShatarSong);
		FinalFantasylization_debugMsg("AltarofShatarSong Final Fantasy 7 One Winged Angel")
	end
	function FinalFantasylization_NeutralTownAmberLedge()
		FinalFantasylization_PlayMusic( S .. AmberLedgeSong);
		FinalFantasylization_debugMsg("AmberledgeSong Final Fantasy 4 Celtic Moon Mystic Mysidia")
	end
	function FinalFantasylization_NeutralTownArgentTournamentGrounds()
		FinalFantasylization_PlayMusic( S .. ArgentTournamentGroundsSong);
		FinalFantasylization_debugMsg("ArgentTournamentGroundsSong Legaia 2 Duel Saga Barracks")
	end
	function FinalFantasylization_NeutralTownArgentVanguard()
		FinalFantasylization_PlayMusic( S .. ArgentVanguardSong);
		FinalFantasylization_debugMsg("ArgentVanguardSong Lord of the Ring The Two Towers The Hornburg")
	end
	function FinalFantasylization_NeutralTownBouldercragsRefuge()
		FinalFantasylization_PlayMusic( S .. BouldercragsRefugeSong);
		FinalFantasylization_debugMsg("BouldercragsRefugeSong Breath of Fire 4 Tiny Village in the Desert")
	end
	function FinalFantasylization_NeutralTownCenarionHold()
		FinalFantasylization_PlayMusic( S .. CenarionHoldSong);
		FinalFantasylization_debugMsg("CenarionHoldSong Breath of Fire 3 Guild")
	end
	function FinalFantasylization_NeutralTownCenarionRefuge()
		FinalFantasylization_PlayMusic( S .. CenarionRefugeSong);
		FinalFantasylization_debugMsg("CenarionRefugeSong Legend of Dragoon Uneasy State")
	end
	function FinalFantasylization_NeutralTownCosmowrench()
		FinalFantasylization_PlayMusic( S .. CosmowrenchSong);
		FinalFantasylization_debugMsg("CosmowrenchSong Final Fantasy 8 Shuffle or Boogie")
	end
	function FinalFantasylization_NeutralTownCrusadersPinnacle()
		FinalFantasylization_PlayMusic( S .. CrusadersPinnacleSong);
		FinalFantasylization_debugMsg("CrusadersPinnacleSong Final Fantasy 8 Fithos Lusec Wecos Vinosec Orchestrated")
	end
	function FinalFantasylization_NeutralTownDeathsRise()
		FinalFantasylization_PlayMusic( S .. DeathsRiseSong);
		FinalFantasylization_debugMsg("DeathsRiseSong Final Fantasy 7 Parochial Town")
	end
	function FinalFantasylization_NeutralTownDunNiffelem()
		FinalFantasylization_PlayMusic( S .. DunNiffelemSong);
		FinalFantasylization_debugMsg("DunNiffelemSong Breath of Fire 4 Working Today Too")
	end
	function FinalFantasylization_NeutralTownEbonWatch()
		FinalFantasylization_PlayMusic( S .. EbonWatchSong);
		FinalFantasylization_debugMsg("EbonWatchSong Final Fantasy XI Sometime Somewhere")
	end
	function FinalFantasylization_NeutralTownEmeraldSanctuary()
		FinalFantasylization_PlayMusic( S .. EmeraldSanctuarySong);
		FinalFantasylization_debugMsg("EmeraldSanctuarySong Radiata Stories The White Town of Deception")
	end
	function FinalFantasylization_NeutralTownEvergrove()
		FinalFantasylization_PlayMusic( S .. EvergroveSong);
		FinalFantasylization_debugMsg("EvergroveSong Chrono Cross Another Guldove")
	end
	function FinalFantasylization_NeutralTownFrenzyheartHill()
		FinalFantasylization_PlayMusic( S .. FrenzyheartHillSong);
		FinalFantasylization_debugMsg("FrenzyheartHillSong Final Fantasy XI Rise of the Zilart Kazham")
	end
	function FinalFantasylization_NeutralTownHalaa()
		FinalFantasylization_PlayMusic( S .. HalaaSong);
		FinalFantasylization_debugMsg("HalaaSong Final Fantasy 7 Stolen Materia")
	end
	function FinalFantasylization_NeutralTownK3()
		FinalFantasylization_PlayMusic( S .. K3Song);
		FinalFantasylization_debugMsg("K3Song Breath of Fire 3 Steam Locomotion")
	end
	function FinalFantasylization_NeutralTownKamagua()
		FinalFantasylization_PlayMusic( S .. KamaguaSong);
		FinalFantasylization_debugMsg("KamaguaSong Star Wars 6 Jabba Baroque Recital")
	end
	function FinalFantasylization_NeutralTownLightsBreach()
		FinalFantasylization_PlayMusic( S .. LightsBreachSong);
		FinalFantasylization_debugMsg("LightsBreachSong Breath of Fire 3 Island")
	end
	function FinalFantasylization_NeutralTownLightsHopeChapel()
		FinalFantasylization_PlayMusic( S .. LightsHopeChapelSong);
		FinalFantasylization_debugMsg("LightsHopeChapelSong Kingdom Hearts 2 A Day in Agrabah")
	end
	function FinalFantasylization_NeutralTownMarshalsRefuge()
		FinalFantasylization_PlayMusic( S .. MarshalsRefugeSong);
		FinalFantasylization_debugMsg("MarshalsRefugeSong Kingdom Hearts 2 A day in the Savannah")
	end
	function FinalFantasylization_NeutralTownMoakiHarbor()
		FinalFantasylization_PlayMusic( S .. MoakiHarborSong);
		FinalFantasylization_debugMsg("MoakiHarborSong Legend of Zelda Ocarina of Time Zora Domain")
	end
	function FinalFantasylization_NeutralTownMudsprocket()
		FinalFantasylization_PlayMusic( S .. MudsprocketSong);
		FinalFantasylization_debugMsg("MudsprocketSong Breath of Fire 4 Watch your Step")
	end 
	function FinalFantasylization_NeutralTownNesingwaryBaseCamp()
		FinalFantasylization_PlayMusic( S .. NesingwaryBaseCampSong);
		FinalFantasylization_debugMsg("NesingwaryBaseCampSong Legaia 2 Duel Saga Pirate Pride")
	end
	function FinalFantasylization_NeutralTownNesingwaryExpedition()
		FinalFantasylization_PlayMusic( S .. NesingwaryBaseCampSong);
		FinalFantasylization_debugMsg("NesingwaryBaseCampSong Legaia 2 Duel Saga Pirate Pride")
	end
	function FinalFantasylization_NeutralTownNighthaven()
		FinalFantasylization_PlayMusic( S .. NighthavenSong);
		FinalFantasylization_debugMsg("NighthavenSong Chrono Cross Home Termina")
	end
	function FinalFantasylization_NeutralTownRainspeakerCanopy()
		FinalFantasylization_PlayMusic( S .. RainspeakerCanopySong);
		FinalFantasylization_debugMsg("RainspeakerCanopySong Breath of Fire 4 Pabu Pabu Puka Puka")
	end
	function FinalFantasylization_NeutralTownRiversHeart()
		FinalFantasylization_PlayMusic( S .. RiversHeartSong);
		FinalFantasylization_debugMsg("RiversHeartSong Chrono Cross Another Termina")
	end
	function FinalFantasylization_NeutralTownSanctumOfTheStars()
		FinalFantasylization_PlayMusic( S .. SanctumOfTheStarsSong);
		FinalFantasylization_debugMsg("SanctumOfTheStarsSong Final Fantasy 7 Its hard to stand on both feet")
	end
	function FinalFantasylization_NeutralTownShadowVault()
		FinalFantasylization_PlayMusic( S .. ShadowVaultSong);
		FinalFantasylization_debugMsg("ShadowVaultSong Final Fantasy 7 Lurking in the Darkness")
	end
	function FinalFantasylization_NeutralTownSporeggar()
		FinalFantasylization_PlayMusic( S .. SporeggarSong);
		FinalFantasylization_debugMsg("SporeggarSong Final Fantasy 4 Celtic Moon Palom and Polom")
	end
	function FinalFantasylization_NeutralTownStormspire()
		FinalFantasylization_PlayMusic( S .. StormspireSong);
		FinalFantasylization_debugMsg("StormspireSong Breath of Fire 4 Seagull Flies")
	end
	function FinalFantasylization_NeutralTownSunsReach()
		FinalFantasylization_PlayMusic( S .. SunsReachSong);
		FinalFantasylization_debugMsg("SunsReachSong Breath of Fire 3 Even the suns happy")
	end
	function FinalFantasylization_NeutralTownTheArgentStand()
		FinalFantasylization_BattleGround()
	end
	function FinalFantasylization_NeutralTownThoriumPoint()
		FinalFantasylization_PlayMusic( S .. ThoriumPointSong);
		FinalFantasylization_debugMsg("ThoriumPointSong Final Fantasy XI Mithra")
	end
	function FinalFantasylization_NeutralTownTransitusShield()
		FinalFantasylization_PlayMusic( S .. TransitusShieldSong);
		FinalFantasylization_debugMsg("TransitusShieldSong Kingdom Hearts Captain Hook Pirate Ship")
	end
	function FinalFantasylization_NeutralTownUnupe()
		FinalFantasylization_PlayMusic( S .. UnupeSong);
		FinalFantasylization_debugMsg("UnupeSong Legaia 2 Duel Saga Wasteland of Far Away Places")
	end
	function FinalFantasylization_NeutralTownWyrmrestTemple()
		FinalFantasylization_PlayMusic( S .. WyrmrestTempleSong);
		FinalFantasylization_debugMsg("WyrmrestTempleSong Legend of Zelda Ocarina of Time Spirit Temple")
	end
	function FinalFantasylization_NeutralTownZimTorga()
		FinalFantasylization_PlayMusic( S .. ZimTorgaSong);
		FinalFantasylization_debugMsg("ZimTorgaSong Dragon's Crown Canaan Temple")
	end
	function FinalFantasylization_NeutralTownDarrowshire()
		FinalFantasylization_PlayMusic( S .. DarrowshireSong);
		FinalFantasylization_debugMsg("DarrowshireSong Rogue Galaxy The Lost Gene")
	end
	function FinalFantasylization_NeutralTownTheHarborage()
		FinalFantasylization_PlayMusic( S .. TheHarborageSong);
		FinalFantasylization_debugMsg("TheHarborageSong The Last Remnant Breakers on the Shore")
	end
	function FinalFantasylization_NeutralTownMirageRaceway()
		FinalFantasylization_PlayMusic( S .. MirageRacewaySong);
		FinalFantasylization_debugMsg("MirageRacewaySong The Last Remnant Swirlings Sands")
	end
	function FinalFantasylization_NeutralTownSteamwheedlePort()
		FinalFantasylization_PlayMusic( S .. SteamwheedlePortSong);
		FinalFantasylization_debugMsg("SteamwheedlePortSong The Last Remnant Gateway to the West")
	end
	function FinalFantasylization_NeutralTownTimbermawHold()
		FinalFantasylization_PlayMusic( S .. TimbermawHoldSong);
		FinalFantasylization_debugMsg("TimbermawHoldSong The Last Remnant Into the Depths")
	end
	function FinalFantasylization_NeutralTownValorsRest()
		FinalFantasylization_PlayMusic( S .. ValorsRestSong);
		FinalFantasylization_debugMsg("ValorsRestSong The Last Remnant A Friendly Ear")
	end
	function FinalFantasylization_NeutralTownAerisLanding()
		FinalFantasylization_PlayMusic( S .. AerisLandingSong);
		FinalFantasylization_debugMsg("AerisLandingSong Legaia 2 Duel Saga Lost Forest")
	end
	function FinalFantasylization_NeutralTownKirinVarVillage()
		FinalFantasylization_PlayMusic( S .. KirinVarVillageSong);
		FinalFantasylization_debugMsg("KirinVarVillageSong Final Fantasy 9 Youre not Alone")
	end
	function FinalFantasylization_NeutralTownMidrealmPost()
		FinalFantasylization_PlayMusic( S .. MidrealmPostSong);
		FinalFantasylization_debugMsg("MidrealmPostSong Dissidia Final Fantasy Main theme FF2")
	end
	function FinalFantasylization_NeutralTownOgrila()
		FinalFantasylization_PlayMusic( S .. OgrilaSong);
		FinalFantasylization_debugMsg("OgrilaSong Final Fantasy 7 Holding my thoughts in my Heart")
	end
	function FinalFantasylization_NeutralTownProtectorateWatchPost()
		FinalFantasylization_PlayMusic( S .. ProtectorateWatchPostSong);
		FinalFantasylization_debugMsg("ProtectorateWatchPostSong Dissidia Final Fantasy Main theme FF4")
	end
	function FinalFantasylization_NeutralTownBlackwatch()
		FinalFantasylization_PlayMusic( S .. BlackwatchSong);
		FinalFantasylization_debugMsg("BlackwatchSong Final Fantasy 7 Off the Edge of Despair")
	end
	function FinalFantasylization_NeutralTownDawnsReach()
		FinalFantasylization_PlayMusic( S .. DawnsReachSong);
		FinalFantasylization_debugMsg("DawnsReachSong Derek Fiechter Knights of the Round Table")
	end
	function FinalFantasylization_NeutralTownDoriansOutpost()
		FinalFantasylization_PlayMusic( S .. DoriansOutpostSong);
		FinalFantasylization_debugMsg("DoriansOutpostSong Legend of Dragoon Jeek theme")
	end
	function FinalFantasylization_NeutralTownDubraJin()
		FinalFantasylization_PlayMusic( S .. DubraJinSong);
		FinalFantasylization_debugMsg("DubraJinSong Legaia 2 Duel Saga Karavaia")
	end
	function FinalFantasylization_NeutralTownGraniteSprings()
		FinalFantasylization_PlayMusic( S .. GraniteSpringsSong);
		FinalFantasylization_debugMsg("GraniteSpringsSong Final Fantasy 7 If You Open your Heart")
	end
	function FinalFantasylization_NeutralTownKartaksHold()
		FinalFantasylization_PlayMusic( S .. KartaksHoldSong);
		FinalFantasylization_debugMsg("KartaksHoldSong Final Fantasy 7 Infiltrating Shinra Building")
	end
	function FinalFantasylization_NeutralTownLakesideLanding()
		FinalFantasylization_PlayMusic( S .. LakesideLandingSong);
		FinalFantasylization_debugMsg("LakesideLandingSong Legaia 2 Duel Saga Status Change")
	end
	function FinalFantasylization_NeutralTownLightsTrust()
		FinalFantasylization_PlayMusic( S .. LightsTrustSong);
		FinalFantasylization_debugMsg("LightsTrustSong Final Fantasy 7 The Flow of Life")
	end
	function FinalFantasylization_NeutralTownMistwhisperRefuge()
		FinalFantasylization_PlayMusic( S .. MistwhisperRefugeSong);
		FinalFantasylization_debugMsg("MistwhisperRefugeSong Legend of Zelda Ocarina of Time Windmill Hut")
	end
	function FinalFantasylization_NeutralTownScalawagPoint()
		FinalFantasylization_PlayMusic( S .. ScalawagPointSong);
		FinalFantasylization_debugMsg("ScalawagPointSong Legend of Legaia Earth of Joy")
	end
	function FinalFantasylization_NeutralTownSparktouchedHaven()
		FinalFantasylization_PlayMusic( S .. SparktouchedHavenSong);
		FinalFantasylization_debugMsg("SparktouchedHavenSong Final Fantasy Best Collection 1987 1994 Aeria the Prophet of Water from Final Fantasy 3 Legend of Eternal Wind")
	end
	function FinalFantasylization_NeutralTownSpearbornEncampment()
		FinalFantasylization_PlayMusic( S .. KartaksHoldSong);
		FinalFantasylization_debugMsg("KartaksHoldSong Final Fantasy 7 Infiltrating Shinra Building")
	end
	function FinalFantasylization_NeutralTownVentureBay()
		FinalFantasylization_PlayMusic( S .. VentureBaySong);
		FinalFantasylization_debugMsg("VentureBaySong Final Fantasy 14 Saltswept")
	end

	--########################
	-- ##   STARTER AREA ZONES
	--########################
	function FinalFantasylization_StarterAreaColdridgeValley()
		FinalFantasylization_PlayMusic( S .. ColdridgeValleySong);
		FinalFantasylization_debugMsg("ColdridgeValleySong Final Fantasy 8 Salt Flats")
	end
	function FinalFantasylization_StarterAreaDeathknell()
		FinalFantasylization_PlayMusic( S .. DeathknellSong);
		FinalFantasylization_debugMsg("DeathknellSong Legend of Zelda A Link to the Past Sanctuary Dungeon")
	end
	function FinalFantasylization_StarterAreaNorthshireValley()
		FinalFantasylization_PlayMusic( S .. NorthshireValleySong);
		FinalFantasylization_debugMsg("NorthshireValleySong Elders Scroll 4 Oblivion Watchmans Ease")
	end
	function FinalFantasylization_StarterAreaSunstriderIsle()
		FinalFantasylization_PlayMusic( S .. SunstriderIsleSong);
		FinalFantasylization_debugMsg("SunstriderIsleSong Final Fantasy 12 Forgotten Capital")
	end
	function FinalFantasylization_StarterAreaAmmenVale()
		FinalFantasylization_PlayMusic( S .. AmmenValeSong);
		FinalFantasylization_debugMsg("AmmenValeSong Breath of Fire 4 Destruction")
	end
	function FinalFantasylization_StarterAreaCampNarache()
		FinalFantasylization_PlayMusic( S .. CampNaracheSong);
		FinalFantasylization_debugMsg("CampNaracheSong Final Fantasy 9 Crossing those Hills")
	end
	function FinalFantasylization_StarterAreaShadowglen()
		FinalFantasylization_PlayMusic( S .. ShadowglenSong);
		FinalFantasylization_debugMsg("ShadowglenSong Breath of Fire 4 Landscape")
	end
	function FinalFantasylization_StarterAreaValleyOfTrials()
		FinalFantasylization_PlayMusic( S .. ValleyOfTrialsSong);
		FinalFantasylization_debugMsg("ValleyOfTrialsSong Legaia 2 Duel Saga Training Cave")
	end
	function FinalFantasylization_StarterAreaScarletEnclave()
		FinalFantasylization_BattleGround()
	end

	--########################
	-- ##   EASTERN KINGDOMS ZONES
	--########################
	function FinalFantasylization_EasternKingdomsAlteracMountains()
		FinalFantasylization_PlayMusic( S .. AlteracMountainsSong);
		FinalFantasylization_debugMsg("AlteracMountainsSong Vlad Kuryluk Barbarian Campaign 10")
	end
	function FinalFantasylization_EasternKingdomsArathiHighlands()		
		FinalFantasylization_PlayMusic( S .. ArathiHighlandsSong);
		FinalFantasylization_debugMsg("ArathiHighlandsSong Legaia 2 Duel Saga Wind Tree and Water")
	end
	function FinalFantasylization_EasternKingdomsBadlands()
		FinalFantasylization_PlayMusic( S .. BadlandsSong);
		FinalFantasylization_debugMsg("BadlandsSong Legaia 2 Duel Saga Forgotten Inheritance")
	end
	function FinalFantasylization_EasternKingdomsBlackrockMountain()
		FinalFantasylization_PlayMusic( S .. BlackrockMountainSong);
		FinalFantasylization_debugMsg("BlackrockMountainSong Legaia 2 Duel Saga Evil Desires")
	end
	function FinalFantasylization_EasternKingdomsBurningSteppes()
		FinalFantasylization_PlayMusic( S .. BurningSteppesSong);
		FinalFantasylization_debugMsg("BurningSteppesSong Chrono Cross Ghost Island")
	end
	function FinalFantasylization_EasternKingdomsDeadwindPass()
		FinalFantasylization_PlayMusic( S .. DeadwindPassSong);
		FinalFantasylization_debugMsg("DeadwindPassSong Final Fantasy 8 Find your Way")
	end
	function FinalFantasylization_EasternKingdomsDunMorogh()
		FinalFantasylization_PlayMusic( S .. DunMoroghSong);
		FinalFantasylization_debugMsg("DunMoroghSong Legend of Dragoon Silver Land")	
	end
	function FinalFantasylization_EasternKingdomsDuskwood()
		FinalFantasylization_PlayMusic( S .. DuskwoodSong);
		FinalFantasylization_debugMsg("DuskwoodSong Legend of Legaia Quiet Destruction")
	end
	function FinalFantasylization_EasternKingdomsEasternPlaguelands()
		FinalFantasylization_PlayMusic( S .. EasternPlaguelandsSong);
		FinalFantasylization_debugMsg("EasternPlaguelandsSong Legend of Zelda A Link to the Past Dark World")
	end
	function FinalFantasylization_EasternKingdomsElwynnForest()
		FinalFantasylization_PlayMusic( S .. ElwynnForestSong);
		FinalFantasylization_debugMsg("ElwynnForestSong Legend of Zelda Ocarina of Time Kokiri Forest")
	end
	function FinalFantasylization_EasternKingdomsEversongWoods()
		FinalFantasylization_PlayMusic( S .. EversongWoodsSong);
		FinalFantasylization_debugMsg("EversongWoodsSong Final Fantasy 7 You can Hear the Cry of the Planet")
	end
	function FinalFantasylization_EasternKingdomsGhostlands()
		FinalFantasylization_PlayMusic( S .. GhostlandsSong);
		FinalFantasylization_debugMsg("GhostlandsSong Breath of Fire 4 Freefall")
	end
	function FinalFantasylization_EasternKingdomsHillsbradFoothills()
		FinalFantasylization_PlayMusic( S .. HillsbradFoothillsSong);
		FinalFantasylization_debugMsg("HillsbradFoothillsSong Dragon Quest VIII Strange World")
	end
	function FinalFantasylization_EasternKingdomsIsleofQuelDanas()
		FinalFantasylization_PlayMusic( S .. IsleofQuelDanasSong);
		FinalFantasylization_debugMsg("IsleofQuelDanasSong Final Fantasy 9 Crystal World")
	end
	function FinalFantasylization_EasternKingdomsLochModan()
		FinalFantasylization_PlayMusic( S .. LochModanSong);
		FinalFantasylization_debugMsg("LochModanSong Guild Wars 2 Call of the Raven")
	end
	function FinalFantasylization_EasternKingdomsRedridgeMountains()
		FinalFantasylization_PlayMusic( S .. RedridgeMountainsSong);
		FinalFantasylization_debugMsg("RedridgeMountainsSong Chrono Cross Drowning Valley")
	end
	function FinalFantasylization_EasternKingdomsSearingGorge()
		FinalFantasylization_PlayMusic( S .. SearingGorgeSong);
		FinalFantasylization_debugMsg("SearingGorgeSong Final Fantasy 7 Trail of Blood")
	end
	function FinalFantasylization_EasternKingdomsSilverpineForest()
		FinalFantasylization_PlayMusic( S .. SilverpineForestSong);
		FinalFantasylization_debugMsg("SilverpineForestSong Legend of Legaia Young Nobleman of the Mist")
	end
	function FinalFantasylization_EasternKingdomsStranglethornVale()
		FinalFantasylization_PlayMusic( S .. StranglethornValeSong);
		FinalFantasylization_debugMsg("StranglethornValeSong Breath of Fire 4 Echo")
	end
	function FinalFantasylization_EasternKingdomsSwampOfSorrows()
		FinalFantasylization_PlayMusic( S .. SwampOfSorrowsSong);
		FinalFantasylization_debugMsg("SwampOfSorrowsSong Jeff Van Dyck Tension1")
	end
	function FinalFantasylization_EasternKingdomsBlastedLands()
		FinalFantasylization_PlayMusic( S .. BlastedLandsSong);
		FinalFantasylization_debugMsg("BlastedLandsSong Final Fantasy 12 The Sandsea")
	end
	function FinalFantasylization_EasternKingdomsTheHinterlands()
		FinalFantasylization_PlayMusic( S .. TheHinterlandsSong);
		FinalFantasylization_debugMsg("TheHinterlandsSong Final Fantasy 7 Forested Temple")
	end
	function FinalFantasylization_EasternKingdomsTirisfalGlades()
		FinalFantasylization_PlayMusic( S .. TirisfalGladesSong);
		FinalFantasylization_debugMsg("TirisfalGladesSong Final Fantasy XI Anxiety")
	end
	function FinalFantasylization_EasternKingdomsWesternPlaguelands()
		FinalFantasylization_PlayMusic( S .. WesternPlaguelandsSong);
		FinalFantasylization_debugMsg("WesternPlaguelandsSong Legaia 2 Duel Saga End of the World")
	end
	function FinalFantasylization_EasternKingdomsWestfall()
		FinalFantasylization_PlayMusic( S .. WestfallSong);
		FinalFantasylization_debugMsg("WestfallSong Breath of Fire 3 Casually")
	end
	function FinalFantasylization_EasternKingdomsWetlands()
		FinalFantasylization_PlayMusic( S .. WetlandsSong);
		FinalFantasylization_debugMsg("WetlandsSong Diablo 2 Wild")
	end

	--########################
	-- ##   KALIMDOR ZONES
	--########################
	function FinalFantasylization_KalimdorAshenvale()
		FinalFantasylization_PlayMusic( S .. AshenvaleSong);
		FinalFantasylization_debugMsg("AshenvaleSong Final Fantasy 9 Awakened Forest")
	end
	function FinalFantasylization_KalimdorAzshara()
		FinalFantasylization_PlayMusic( S .. AzsharaSong);
		FinalFantasylization_debugMsg("AzsharaSong Legend of Dragoon World Map 4")
	end
	function FinalFantasylization_KalimdorAzuremystIsle()
		FinalFantasylization_PlayMusic( S .. AzuremystIsleSong);
		FinalFantasylization_debugMsg("AzuremystIsleSong Legend of Legaia Night Requiem")
	end
	function FinalFantasylization_KalimdorBloodmystIsle()
		FinalFantasylization_PlayMusic( S .. BloodmystIsleSong);
		FinalFantasylization_debugMsg("BloodmystIsleSong Legaia 2 Duel Saga God of the Evil Ones")
	end
	function FinalFantasylization_KalimdorDarkshore()
		FinalFantasylization_PlayMusic( S .. DarkshoreSong);
		FinalFantasylization_debugMsg("DarkshoreSong Final Fantasy 7 The Nightmare Beginning")
	end
	function FinalFantasylization_KalimdorDesolace()
		FinalFantasylization_PlayMusic( S .. DesolaceSong);
		FinalFantasylization_debugMsg("DesolaceSong Final Fantasy XI Hopelessness")
	end
	function FinalFantasylization_KalimdorDurotar()
		FinalFantasylization_PlayMusic( S .. DurotarSong);
		FinalFantasylization_debugMsg("DurotarSong Final Fantasy 7 Desert Wasteland")
	end
	function FinalFantasylization_KalimdorDustwallowMarsh()
		FinalFantasylization_PlayMusic( S .. DustwallowMarshSong);
		FinalFantasylization_debugMsg("DustwallowMarshSong Final Fantasy 12 The Feywood")
	end
	function FinalFantasylization_KalimdorFelwood()
		FinalFantasylization_PlayMusic( S .. FelwoodSong);
		FinalFantasylization_debugMsg("FelwoodSong Chrono Cross Shadow's End Forest")
	end
	function FinalFantasylization_KalimdorFeralas()
		FinalFantasylization_PlayMusic( S .. FeralasSong);
		FinalFantasylization_debugMsg("FeralasSong Final Fantasy 7 In Search of the Man in Black")
	end
	function FinalFantasylization_KalimdorMoonglade()
		FinalFantasylization_PlayMusic( S .. MoongladeSong);
		FinalFantasylization_debugMsg("MoongladeSong Legaia 2 Duel Saga Advancing to Far Away Places")
	end
	function FinalFantasylization_KalimdorMulgore()
		FinalFantasylization_PlayMusic( S .. MulgoreSong);
		FinalFantasylization_debugMsg("MulgoreSong Legend of Legaia Barren fields of Mist")
	end
	function FinalFantasylization_KalimdorSilithus()
		FinalFantasylization_PlayMusic( S .. SilithusSong);
		FinalFantasylization_debugMsg("SilithusSong Chrono Cross Earth Dragon Island")
	end
	function FinalFantasylization_KalimdorStonetalonMountains()
		FinalFantasylization_PlayMusic( S .. StonetalonMountainsSong);
		FinalFantasylization_debugMsg("StonetalonMountainsSong Final Fantasy 14 Whisper of the Land")
	end
	function FinalFantasylization_KalimdorTanaris()
		FinalFantasylization_PlayMusic( S .. TanarisSong);
		FinalFantasylization_debugMsg("TanarisSong Diablo 2 Harem")
	end
	function FinalFantasylization_KalimdorTeldrassil()
		FinalFantasylization_PlayMusic( S .. TeldrassilSong);
		FinalFantasylization_debugMsg("TeldrassilSong Baldur's Gate 2 The Druid's Grove")
	end
	function FinalFantasylization_KalimdorTheBarrens()
		FinalFantasylization_PlayMusic( S .. TheBarrensSong);
		FinalFantasylization_debugMsg("TheBarrensSong Legend of Zelda Ocarina of Time Hyrule Field Main theme")
	end
	function FinalFantasylization_KalimdorThousandNeedles()
		FinalFantasylization_PlayMusic( S .. ThousandNeedlesSong);
		FinalFantasylization_debugMsg("ThousandNeedlesSong Final Fantasy 7 Main theme world map")
	end
	function FinalFantasylization_KalimdorUngoroCrater()
		FinalFantasylization_PlayMusic( S .. UngoroCraterSong);
		FinalFantasylization_debugMsg("UngoroCraterSong Vlad Kuryluk Campaign 5")
	end
	function FinalFantasylization_KalimdorWinterspring()
		FinalFantasylization_PlayMusic( S .. WinterspringSong);
		FinalFantasylization_debugMsg("WinterspringSong Chrono Cross Garden of the Gods")
	end

	--########################
	-- ##   OUTLAND ZONES
	--########################
	function FinalFantasylization_OutlandBladesEdgeMountains()
		FinalFantasylization_PlayMusic( S .. BladesEdgeMountainsSong);
		FinalFantasylization_debugMsg("BladesEdgeMountainsSong Breath of Fire 3 Donden")
	end
	function FinalFantasylization_OutlandHellfirePeninsula()
		FinalFantasylization_PlayMusic( S .. HellfirePeninsulaSong);
		FinalFantasylization_debugMsg("HellfirePeninsulaSong Dragon Age Origins Rise of the Darkspawn")
	end
	function FinalFantasylization_OutlandNagrand()
		FinalFantasylization_PlayMusic( S .. NagrandSong);
		FinalFantasylization_debugMsg("NagrandSong Derek Fiechter Lost World")
	end
	function FinalFantasylization_OutlandNetherstorm()
		FinalFantasylization_PlayMusic( S .. NetherstormSong);
		FinalFantasylization_debugMsg("NetherstormSong Tales of Zestiria Spiritcrest of the Roaring Dragon")
	end
	function FinalFantasylization_OutlandShadowmoonValley()
		FinalFantasylization_PlayMusic( S .. ShadowmoonValleySong);
		FinalFantasylization_debugMsg("ShadowmoonValleySong Derek Fiechter Wings of Pegasus")
	end
	function FinalFantasylization_OutlandTerokkarForest()
		FinalFantasylization_PlayMusic( S .. TerokkarForestSong);
		FinalFantasylization_debugMsg("TerokkarForestSong Guild Wars 2 Gendarran Fieldss")
	end
	function FinalFantasylization_OutlandZangarmarsh()
		FinalFantasylization_PlayMusic( S .. ZangarmarshSong);
		FinalFantasylization_debugMsg("ZangarmarshSong Star Ocean 4 The Last Hope Shattered Dreams")
	end

	--########################
	-- ##   NORTHREND ZONES
	--########################
	function FinalFantasylization_NorthrendBoreanTundra()
		FinalFantasylization_PlayMusic( S .. BoreanTundraSong);
		FinalFantasylization_debugMsg("BoreanTundraSong Final Fantasy 4 Celtic Moon Welcome to Our Town")
	end
	function FinalFantasylization_NorthrendColdarra()
		FinalFantasylization_PlayMusic( S .. ColdarraSong);
		FinalFantasylization_debugMsg("ColdarraSong Final Fantasy 7 Great Northen Cave")
	end
	function FinalFantasylization_NorthrendCrystalsongForest()
		FinalFantasylization_PlayMusic( S .. CrystalsongForestSong);
		FinalFantasylization_debugMsg("CrystalsongForestSong Fantome Deconnecte Espace sans casque")
	end
	function FinalFantasylization_NorthrendDragonblight()
		FinalFantasylization_PlayMusic( S .. DragonblightSong);
		FinalFantasylization_debugMsg("DragonblightSong Final Fantasy 7 Buried in the Snow")
	end
	function FinalFantasylization_NorthrendGrizzlyHills()
		FinalFantasylization_PlayMusic( S .. GrizzlyHillsSong);
		FinalFantasylization_debugMsg("GrizzlyHillsSong Final Fantasy 4 Celtic Moon Rydia theme")
	end
	function FinalFantasylization_NorthrendHowlingFjord()
		FinalFantasylization_PlayMusic( S .. HowlingFjordSong);
		FinalFantasylization_debugMsg("HowlingFjordSong Final Fantasy 4 Celtic Moon Troian Beauty")
	end
	function FinalFantasylization_NorthrendIcecrown()
		FinalFantasylization_PlayMusic( S .. IcecrownSong);
		FinalFantasylization_debugMsg("IcecrownSong Final Fantasy 10 The Deceased Laugh")
	end
	function FinalFantasylization_NorthrendSholazarBasin()
		FinalFantasylization_PlayMusic( S .. SholazarBasinSong);
		FinalFantasylization_debugMsg("SholazarBasinSong Final Fantasy Tactics Character Creation")
	end
	function FinalFantasylization_NorthrendStormPeaks()
		FinalFantasylization_PlayMusic( S .. StormPeaksSong);
		FinalFantasylization_debugMsg("StormPeaksSong Dragon Age Inquisition Adamant Fortress")
	end
	function FinalFantasylization_NorthrendWintergrasp()
		FinalFantasylization_BattleGround()
	end
	function FinalFantasylization_NorthrendZulDrak()
		FinalFantasylization_PlayMusic( S .. ZulDrakSong);
		FinalFantasylization_debugMsg("ZulDrakSong Chrono Cross Lizard Dance")
	end

	--########################
	-- ##   MISCELANEOUS ZONES
	--########################
	function FinalFantasylization_MiscAreaGnomeregan()
		FinalFantasylization_PlayMusic( S .. ScarletMonasterySong);
		FinalFantasylization_debugMsg("ScarletMonasterySong Final Fantasy XI Repression Memoro de la Stono")
	end
	function FinalFantasylization_MiscAreaScarletMonastery()
		FinalFantasylization_PlayMusic( S .. ScarletMonasterySong);
		FinalFantasylization_debugMsg("ScarletMonasterySong Final Fantasy XI Repression Memoro de la Stono")
	end
	function FinalFantasylization_MiscAreaRazorfenKraul()
		FinalFantasylization_PlayMusic( S .. RazorfenSong);
		FinalFantasylization_debugMsg("RazorfenSong Final Fantasy 12 Abyss")
	end
	function FinalFantasylization_MiscAreaRazorfenDowns()
		FinalFantasylization_PlayMusic( S .. RazorfenSong);
		FinalFantasylization_debugMsg("RazorfenSong Final Fantasy 12 Abyss")
	end
	function FinalFantasylization_MiscAreaWailingCaverns()
		FinalFantasylization_PlayMusic( S .. WailingCavernsSong);
		FinalFantasylization_debugMsg("WailingCavernsSong Final Fantasy 12 Dark Night imperial version")
	end
	function FinalFantasylization_MiscAreaTheDeadmines()
		FinalFantasylization_PlayMusic( S .. TheDeadminesSong);
		FinalFantasylization_debugMsg("TheDeadminesSong Final Fantasy XI Castle Zvahl")
	end
	function FinalFantasylization_MiscAreaDeeprunTram()
		FinalFantasylization_PlayMusic( S .. DeeprunTramSong);
		FinalFantasylization_debugMsg("DeeprunTramSong Resident Evil Main Theme")
	end
	function FinalFantasylization_MiscAreaCavernsOfTime()
		FinalFantasylization_PlayMusic( S .. CavernsOfTimeSong);
		FinalFantasylization_debugMsg("CavernsOfTimeSong The Last Remnant Dark Secrets")
	end
	
	--################
	--## DUNGEON SONGS
	--################
		-- Vanilla WoW Dungeons
	function FinalFantasylization_Dungeon_RagefireChasmSong()
		FinalFantasylization_PlayMusic( S .. RagefireChasmSong);
		FinalFantasylization_debugMsg("RagefireChasmSong Dragon Age 2 Blightlands")
	end
	function FinalFantasylization_Dungeon_WailingCavernsSong()
		FinalFantasylization_PlayMusic( S .. WailingCavernsDungeonSong);
		FinalFantasylization_debugMsg("WailingCavernsDungeonSong Rogue Galaxy Insectron Strategy")
	end
	function FinalFantasylization_Dungeon_DeadminesSong()
		FinalFantasylization_PlayMusic( S .. DeadminesSong);
		FinalFantasylization_debugMsg("DeadminesSong Dragons Crown Bilbaron Subterranean Fortress")
	end
	function FinalFantasylization_Dungeon_ShadowfangKeepSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_BlackfathomDeepsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_StormwindStockadeSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_GnomereganSong()
		FinalFantasylization_PlayMusic( S .. GnomereganSong);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 7 Mako Reactor")
	end
	function FinalFantasylization_Dungeon_RazorfenKraulSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_ScarletMonasterySong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_RazorfenDownsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_UldamanSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_ZulFarrakSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_MaraudonSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_TempleofAtalHakkarSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_BlackrockDepthsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_LowerBlackrockSpireSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_UpperBlackrockSpireSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_DireMaulSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_StratholmeSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_ScholomanceSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
		-- Burning Crusade Dungeons
	function FinalFantasylization_Dungeon_HellfireRampartsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_BloodFurnaceSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_SlavePensSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_UnderbogSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_ManaTombsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_AuchenaiCryptsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_SethekkHallsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_SteamvaultSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_ShatteredHallsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_ShadowLabyrinthSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_EscapefromDurnholdeKeepSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_OpeningtheDarkPortalSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_BotanicaSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_ArcatrazSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_OpeningtheDarkPortalSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_MagistersTerraceSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
		-- Wrath of the Lich King Dungeons	
	function FinalFantasylization_Dungeon_UtgardeKeepSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_TheNexusSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_AzjolNerubSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_AhnkahetTheOldKingdomSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_DrakTharonKeepSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_VioletHoldSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_GundrakSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_HallsofStoneSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_TheOculusSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_HallsofLightningSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_UtgardePinnacleSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_TheCullingofStratholmeSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_TrialoftheChampionSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_ForgeofSoulsSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_PitofSaronSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	function FinalFantasylization_Dungeon_HallsofReflectionSong()
		FinalFantasylization_PlayMusic( S .. HordeFP1Song);
		FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
	end
	
	--#############
	--## RAID SONGS
	--#############
	function FinalFantasylization_RaidSong()
		local x = math.random(1, 8);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. RaidSong);
				FinalFantasylization_debugMsg("RaidSong Final Fantasy 7 Bombing Mission")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Raid2Song);
				FinalFantasylization_debugMsg("Raid2Song Final Fantasy Type0 War Recapture")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Raid3Song);
				FinalFantasylization_debugMsg("Raid3Song White Knight Chronicles An Opponent Draws Near")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Raid4Song);
				FinalFantasylization_debugMsg("Raid4Song Final Fantasy 9 Ambush Attack")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Raid5Song);
				FinalFantasylization_debugMsg("Raid5Song King of Dragons The Orc Village")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Raid6Song);
				FinalFantasylization_debugMsg("Raid6Song Tales of Xillia Life or Death")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Raid7Song);
				FinalFantasylization_debugMsg("Raid7Song Kingdom Hearts Shrouding Dark Cloud")
			else
				FinalFantasylization_PlayMusic( S .. Raid8Song);
				FinalFantasylization_debugMsg("Raid8Song Dissidia Final Fantasy Dungeon FF1")
			end
	end

	--##########################
	-- ## FANFARE / LEVEL UP
	--##########################
	function FinalFantasylization_Fanfare()
		local x = math.random(1, 2);
			if x == 1 then
				FinalFantasylization_PlayFile( S .. Fanfare);
				FinalFantasylization_debugMsg("Fanfare Dissidia Final Fantasy Victory Fanfare Chaos")
			else
				FinalFantasylization_PlayFile( S .. Fanfare2);
				FinalFantasylization_debugMsg("Fanfare2 Dissidia Final Fantasy Victory Fanfare Cosmos")
			end
	end
	function FinalFantasylization_LevelUpSong()
 		local x = math.random(1, 4);
			if x == 1 then
				FinalFantasylization_PlayFile( S .. LevelUpSong);
 				FinalFantasylization_debugMsg("LevelUpSong Final Fantasy 12 Level UP Sound")
			elseif x == 2 then
				FinalFantasylization_PlayFile( S .. LevelUp2Song);
 				FinalFantasylization_debugMsg("LevelUp2Song Shining Force 2 Attack")
			elseif x == 3 then
				FinalFantasylization_PlayFile( S .. LevelUp3Song);
 				FinalFantasylization_debugMsg("LevelUp3Song Legend of Zelda Ocarina of Time Item Catch")
			else
				FinalFantasylization_PlayFile( S .. LevelUp4Song);
 				FinalFantasylization_debugMsg("LevelUp4Song Chrono Cross Victory")
			end
	end
	
	--################
	-- ## FIGHTING SONGS
	--################
	function FinalFantasylization_WorldBoss()
		local x = math.random(1, 12);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. BossSong);
				FinalFantasylization_debugMsg("BossSong LRFF13 Chaos")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Boss2Song);
				FinalFantasylization_debugMsg("Boss2Song Final Fantasy 7 Jenova Absolute")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Boss3Song);
				FinalFantasylization_debugMsg("Boss3Song White Knight Chronicles A Worthy Opponent Draws Near")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Boss4Song);
				FinalFantasylization_debugMsg("Boss4Song Guild Wars 2 The Charr Triumphant")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Boss5Song);
				FinalFantasylization_debugMsg("Boss5Song Final Fantasy 7 Boss")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Boss6Song);
				FinalFantasylization_debugMsg("Boss6Song Final Fantasy 8 Boss")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Boss7Song);
				FinalFantasylization_debugMsg("Boss7Song Final Fantasy 9 Battle 2")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. Boss8Song);
				FinalFantasylization_debugMsg("Boss8Song Dissidia Final Fantasy Battle FF1")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. Boss9Song);
				FinalFantasylization_debugMsg("Boss9Song King of Dragons To the Castle")
			elseif x == 10 then
				FinalFantasylization_PlayMusic( S .. Boss10Song);
				FinalFantasylization_debugMsg("Boss10Song Arcania Gothic 4 Combat 1")
			elseif x == 11 then
				FinalFantasylization_PlayMusic( S .. Boss11Song);
				FinalFantasylization_debugMsg("Boss11Song Final Fantasy 6 The Decisive Battle")
			else
				FinalFantasylization_PlayMusic( S .. Boss12Song);
				FinalFantasylization_debugMsg("Boss12Song Chrono Trigger Boss Battle 1")
			end
	end
	function FinalFantasylization_DungeonBoss()
		local x = math.random(1, 12);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. BossSong);
				FinalFantasylization_debugMsg("BossSong LRFF13 Chaos")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Boss2Song);
				FinalFantasylization_debugMsg("Boss2Song Final Fantasy 7 Jenova Absolute")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Boss3Song);
				FinalFantasylization_debugMsg("Boss3Song White Knight Chronicles A Worthy Opponent Draws Near")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Boss4Song);
				FinalFantasylization_debugMsg("Boss4Song Guild Wars 2 The Charr Triumphant")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Boss5Song);
				FinalFantasylization_debugMsg("Boss5Song Final Fantasy 7 Boss")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Boss6Song);
				FinalFantasylization_debugMsg("Boss6Song Final Fantasy 8 Boss")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Boss7Song);
				FinalFantasylization_debugMsg("Boss7Song Final Fantasy 9 Battle 2")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. Boss8Song);
				FinalFantasylization_debugMsg("Boss8Song Dissidia Final Fantasy Battle FF1")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. Boss9Song);
				FinalFantasylization_debugMsg("Boss9Song King of Dragons To the Castle")
			elseif x == 10 then
				FinalFantasylization_PlayMusic( S .. Boss10Song);
				FinalFantasylization_debugMsg("Boss10Song Arcania Gothic 4 Combat 1")
			elseif x == 11 then
				FinalFantasylization_PlayMusic( S .. Boss11Song);
				FinalFantasylization_debugMsg("Boss11Song Final Fantasy 6 The Decisive Battle")
			else
				FinalFantasylization_PlayMusic( S .. Boss12Song);
				FinalFantasylization_debugMsg("Boss12Song Chrono Trigger Boss Battle 1")
			end
	end
	function FinalFantasylization_WorldElite()
		local x = math.random(1, 12);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. BossSong);
				FinalFantasylization_debugMsg("BossSong LRFF13 Chaos")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Boss2Song);
				FinalFantasylization_debugMsg("Boss2Song Final Fantasy 7 Jenova Absolute")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Boss3Song);
				FinalFantasylization_debugMsg("Boss3Song White Knight Chronicles A Worthy Opponent Draws Near")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Boss4Song);
				FinalFantasylization_debugMsg("Boss4Song Guild Wars 2 The Charr Triumphant")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Boss5Song);
				FinalFantasylization_debugMsg("Boss5Song Final Fantasy 7 Boss")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Boss6Song);
				FinalFantasylization_debugMsg("Boss6Song Final Fantasy 8 Boss")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Boss7Song);
				FinalFantasylization_debugMsg("Boss7Song Final Fantasy 9 Battle 2")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. Boss8Song);
				FinalFantasylization_debugMsg("Boss8Song Dissidia Final Fantasy Battle FF1")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. Boss9Song);
				FinalFantasylization_debugMsg("Boss9Song King of Dragons To the Castle")
			elseif x == 10 then
				FinalFantasylization_PlayMusic( S .. Boss10Song);
				FinalFantasylization_debugMsg("Boss10Song Arcania Gothic 4 Combat 1")
			elseif x == 11 then
				FinalFantasylization_PlayMusic( S .. Boss11Song);
				FinalFantasylization_debugMsg("Boss11Song Final Fantasy 6 The Decisive Battle")
			else
				FinalFantasylization_PlayMusic( S .. Boss12Song);
				FinalFantasylization_debugMsg("Boss12Song Chrono Trigger Boss Battle 1")
			end
	end
	function FinalFantasylization_BattlegroundBoss()
		local x = math.random(1, 12);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. BossSong);
				FinalFantasylization_debugMsg("BossSong LRFF13 Chaos")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Boss2Song);
				FinalFantasylization_debugMsg("Boss2Song Final Fantasy 7 Jenova Absolute")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Boss3Song);
				FinalFantasylization_debugMsg("Boss3Song White Knight Chronicles A Worthy Opponent Draws Near")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Boss4Song);
				FinalFantasylization_debugMsg("Boss4Song Guild Wars 2 The Charr Triumphant")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Boss5Song);
				FinalFantasylization_debugMsg("Boss5Song Final Fantasy 7 Boss")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Boss6Song);
				FinalFantasylization_debugMsg("Boss6Song Final Fantasy 8 Boss")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Boss7Song);
				FinalFantasylization_debugMsg("Boss7Song Final Fantasy 9 Battle 2")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. Boss8Song);
				FinalFantasylization_debugMsg("Boss8Song Dissidia Final Fantasy Battle FF1")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. Boss9Song);
				FinalFantasylization_debugMsg("Boss9Song King of Dragons To the Castle")
			elseif x == 10 then
				FinalFantasylization_PlayMusic( S .. Boss10Song);
				FinalFantasylization_debugMsg("Boss10Song Arcania Gothic 4 Combat 1")
			elseif x == 11 then
				FinalFantasylization_PlayMusic( S .. Boss11Song);
				FinalFantasylization_debugMsg("Boss11Song Final Fantasy 6 The Decisive Battle")
			else
				FinalFantasylization_PlayMusic( S .. Boss12Song);
				FinalFantasylization_debugMsg("Boss12Song Chrono Trigger Boss Battle 1")
			end
	end
	function FinalFantasylization_BattlegroundPVP()
		local x = math.random(1, 10);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. BattleGround1);
				FinalFantasylization_debugMsg("BattleGround1 Dragon Age Origins The Circle Tower")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. BattleGround2);
				FinalFantasylization_debugMsg("BattleGround2 Sword Coast Legends Avenge the Fallen")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. BattleGround3);
				FinalFantasylization_debugMsg("BattleGround3 Final Fantasy 7 Advent Children Cloud vs Bahamut")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. BattleGround4);
				FinalFantasylization_debugMsg("BattleGround4 Kingsglaive Final Fantasy XV Apocalypsis Noctis")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. BattleGround5);
				FinalFantasylization_debugMsg("BattleGround5 Final Fantasy Type0 War Warrior Worth a Thousand")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. BattleGround6);
				FinalFantasylization_debugMsg("BattleGround6 Final Fantasy Brave Exvius Sacred Ground")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. BattleGround7);
				FinalFantasylization_debugMsg("BattleGround7 Sword Coast Legends Forged in War")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. BattleGround8);
				FinalFantasylization_debugMsg("BattleGround8 Final Fantasy 13 2 The Ruler of Time and Space")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. BattleGround9);
				FinalFantasylization_debugMsg("BattleGround9 Elders Scroll 5 Skyrim Watch the Skies")
			else
				FinalFantasylization_PlayMusic( S .. BattleGround10);
				FinalFantasylization_debugMsg("BattleGround10 Final Fantasy 7 JENOVA")
			end
	end
	function FinalFantasylization_WorldPVP()
		local x = math.random(1, 19);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. Fighting1Song);
				FinalFantasylization_debugMsg("Fighting1Song Legend of Legaia Brand of the Holy Knuckles")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Fighting2Song);
				FinalFantasylization_debugMsg("Fighting2Song Legend of Zelda Ocarina of Time Middle Boss Battle")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Fighting3Song);
				FinalFantasylization_debugMsg("Fighting3Song Final Fantasy 15 Battle Theme Night and Cave")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Fighting4Song);
				FinalFantasylization_debugMsg("Fighting4Song King of Dragons Battle on a Mountain Peak")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Fighting5Song);
				FinalFantasylization_debugMsg("Fighting5Song Breath of Fire 3 Fight")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Fighting6Song);
				FinalFantasylization_debugMsg("Fighting6Song Final Fantasy 13 Blinded by Light")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Fighting7Song);
				FinalFantasylization_debugMsg("Fighting7Song Chrono Cross The Brink of Death")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. Fighting8Song);
				FinalFantasylization_debugMsg("Fighting8Song Final Fantasy 7 Crisis Core On the Verge of Assault")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. Fighting9Song);
				FinalFantasylization_debugMsg("Fighting9Song Final Fantasy 8 Battle")
			elseif x == 10 then
				FinalFantasylization_PlayMusic( S .. Fighting10Song);
				FinalFantasylization_debugMsg("Fighting10Song Rogue Galaxy Brave Heart")
			elseif x == 11 then
				FinalFantasylization_PlayMusic( S .. Fighting11Song);
				FinalFantasylization_debugMsg("Fighting11Song Final Fantasy 9 Battle")
			elseif x == 12 then
				FinalFantasylization_PlayMusic( S .. Fighting12Song);
				FinalFantasylization_debugMsg("Fighting12Song Final Fantasy 10 Fight")
			elseif x == 13 then
				FinalFantasylization_PlayMusic( S .. Fighting13Song);
				FinalFantasylization_debugMsg("Fighting13Song Lunar 2 Footsteps of Decisive Battle")
			elseif x == 14 then
				FinalFantasylization_PlayMusic( S .. Fighting14Song);
				FinalFantasylization_debugMsg("Fighting14Song Dissidia Final Fantasy Preparations for Battle")
			elseif x == 15 then
				FinalFantasylization_PlayMusic( S .. Fighting15Song);
				FinalFantasylization_debugMsg("Fighting15Song White Knight Chronicles Prelude to Battle")
			elseif x == 16 then
				FinalFantasylization_PlayMusic( S .. Fighting16Song);
				FinalFantasylization_debugMsg("Fighting16Song Final Fantasy 13 2 Knight of the Goddess")
			elseif x == 17 then
				FinalFantasylization_PlayMusic( S .. Fighting17Song);
				FinalFantasylization_debugMsg("Fighting17Song Final Fantasy 6 Battle Theme")
			elseif x == 18 then
				FinalFantasylization_PlayMusic( S .. Fighting18Song);
				FinalFantasylization_debugMsg("Fighting18Song Baldurs Gate Attacked By Assassins")
			else
				FinalFantasylization_PlayMusic( S .. Fighting19Song);
				FinalFantasylization_debugMsg("Fighting19Song Chrono Trigger Battle 1")
			end
	end
	function FinalFantasylization_WorldNormalPVE()
		local x = math.random(1, 19);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. Fighting1Song);
				FinalFantasylization_debugMsg("Fighting1Song Legend of Legaia Brand of the Holy Knuckles")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Fighting2Song);
				FinalFantasylization_debugMsg("Fighting2Song Legend of Zelda Ocarina of Time Middle Boss Battle")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Fighting3Song);
				FinalFantasylization_debugMsg("Fighting3Song Final Fantasy 15 Battle Theme Night and Cave")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Fighting4Song);
				FinalFantasylization_debugMsg("Fighting4Song King of Dragons Battle on a Mountain Peak")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Fighting5Song);
				FinalFantasylization_debugMsg("Fighting5Song Breath of Fire 3 Fight")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Fighting6Song);
				FinalFantasylization_debugMsg("Fighting6Song Final Fantasy 13 Blinded by Light")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Fighting7Song);
				FinalFantasylization_debugMsg("Fighting7Song Chrono Cross The Brink of Death")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. Fighting8Song);
				FinalFantasylization_debugMsg("Fighting8Song Final Fantasy 7 Crisis Core On the Verge of Assault")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. Fighting9Song);
				FinalFantasylization_debugMsg("Fighting9Song Final Fantasy 8 Battle")
			elseif x == 10 then
				FinalFantasylization_PlayMusic( S .. Fighting10Song);
				FinalFantasylization_debugMsg("Fighting10Song Rogue Galaxy Brave Heart")
			elseif x == 11 then
				FinalFantasylization_PlayMusic( S .. Fighting11Song);
				FinalFantasylization_debugMsg("Fighting11Song Final Fantasy 9 Battle")
			elseif x == 12 then
				FinalFantasylization_PlayMusic( S .. Fighting12Song);
				FinalFantasylization_debugMsg("Fighting12Song Final Fantasy 10 Fight")
			elseif x == 13 then
				FinalFantasylization_PlayMusic( S .. Fighting13Song);
				FinalFantasylization_debugMsg("Fighting13Song Lunar 2 Footsteps of Decisive Battle")
			elseif x == 14 then
				FinalFantasylization_PlayMusic( S .. Fighting14Song);
				FinalFantasylization_debugMsg("Fighting14Song Dissidia Final Fantasy Preparations for Battle")
			elseif x == 15 then
				FinalFantasylization_PlayMusic( S .. Fighting15Song);
				FinalFantasylization_debugMsg("Fighting15Song White Knight Chronicles Prelude to Battle")
			elseif x == 16 then
				FinalFantasylization_PlayMusic( S .. Fighting16Song);
				FinalFantasylization_debugMsg("Fighting16Song Final Fantasy 13 2 Knight of the Goddess")
			elseif x == 17 then
				FinalFantasylization_PlayMusic( S .. Fighting17Song);
				FinalFantasylization_debugMsg("Fighting17Song Final Fantasy 6 Battle Theme")
			elseif x == 18 then
				FinalFantasylization_PlayMusic( S .. Fighting18Song);
				FinalFantasylization_debugMsg("Fighting18Song Baldurs Gate Attacked By Assassins")
			else
				FinalFantasylization_PlayMusic( S .. Fighting19Song);
				FinalFantasylization_debugMsg("Fighting19Song Chrono Trigger Battle 1")
			end
	end

	--###############
	-- ## PvP Events
	--###############	
	function FinalFantasylization_HostileTowns()
		FinalFantasylization_PlayMusic( S .. HostileSong);
		FinalFantasylization_debugMsg("HostileSong Legend of Dragoon Boss Battle 3")
	end

	--###############
	-- ## BATTLEGROUNDS
	--###############
	function FinalFantasylization_BattleGround()
		local x = math.random(1, 10);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. BattleGround1);
				FinalFantasylization_debugMsg("BattleGround1 Dragon Age Origins The Circle Tower")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. BattleGround2);
				FinalFantasylization_debugMsg("BattleGround2 Sword Coast Legends Avenge the Fallen")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. BattleGround3);
				FinalFantasylization_debugMsg("BattleGround3 Final Fantasy 7 Advent Children Cloud vs Bahamut")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. BattleGround4);
				FinalFantasylization_debugMsg("BattleGround4 Kingsglaive Final Fantasy XV Apocalypsis Noctis")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. BattleGround5);
				FinalFantasylization_debugMsg("BattleGround5 Final Fantasy Type0 War Warrior Worth a Thousand")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. BattleGround6);
				FinalFantasylization_debugMsg("BattleGround6 Final Fantasy Brave Exvius Sacred Ground")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. BattleGround7);
				FinalFantasylization_debugMsg("BattleGround7 Sword Coast Legends Forged in War")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. BattleGround8);
				FinalFantasylization_debugMsg("BattleGround8 Final Fantasy 13 2 The Ruler of Time and Space")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. BattleGround9);
				FinalFantasylization_debugMsg("BattleGround9 Elders Scroll 5 Skyrim Watch the Skies")
			else
				FinalFantasylization_PlayMusic( S .. BattleGround10);
				FinalFantasylization_debugMsg("BattleGround10 Final Fantasy 7 JENOVA")
			end
	end

	--#############
	-- ## DIE/DEAD
	--#############
	function FinalFantasylization_PlayerDie()
		local x = math.random(1, 8);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. DieSong);
				FinalFantasylization_debugMsg("DieSong Legend of Zelda Ocarina of Time Title theme")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Die2Song);
				FinalFantasylization_debugMsg("Die2Song Legend of Zelda Ocarina of Time Deku Tree")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Die3Song);
				FinalFantasylization_debugMsg("Die3Song Final Fantasy 7 Great Warrior")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Die4Song);
				FinalFantasylization_debugMsg("Die4Song Legend of Zelda Ocarina of Time Zelda theme")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Die5Song);
				FinalFantasylization_debugMsg("Die5Song Legend of Zelda Ocarina of Time Shiek theme")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Die6Song);
				FinalFantasylization_debugMsg("Die6Song Legend of Zelda Ocarina of Time Nocturne of Shadow")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Die7Song);
				FinalFantasylization_debugMsg("Die7Song Legend of Zelda Ocarina of Time Requiem of Spirit")
			else
				FinalFantasylization_PlayMusic( S .. Die8Song);
				FinalFantasylization_debugMsg("Die8Song Shining Force 2 Shrine")
			end
	end
	function FinalFantasylization_PlayerGhost()
		local x = math.random(1, 8);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. Dead1Song);
				FinalFantasylization_debugMsg("Dead1Song Legend of Zelda Ocarina of Time Temple of Time")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Dead2Song);
				FinalFantasylization_debugMsg("Dead2Song Breath of Fire 4 Prayer")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Dead3Song);
				FinalFantasylization_debugMsg("Dead3Song Chrono Cross Death Sea")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Dead4Song);
				FinalFantasylization_debugMsg("Dead4Song Final Fantasy 7 Who am I")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Dead5Song);
				FinalFantasylization_debugMsg("Dead5Song Tomb Raider 2 Incident Glory of Nature")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Dead6Song);
				FinalFantasylization_debugMsg("Dead6Song Shining Force 2 Sad Theme")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Dead7Song);
				FinalFantasylization_debugMsg("Dead7Song Shining Force 2 Sad Theme 2")
			else
				FinalFantasylization_PlayMusic( S .. Dead8Song);
				FinalFantasylization_debugMsg("Dead8Song Chrono Trigger Manoria Cathedral")
			end
	end

	--#############
	-- ## SLEEPING
	--#############
	function FinalFantasylization_Sleeping()
		local x = math.random(1, 13);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. SleepSong);
				FinalFantasylization_debugMsg("SleepSong Arcania Gothic 4 - Tavern")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Sleep2Song);
				FinalFantasylization_debugMsg("Sleep2Song Derek Fiechter The Captains Inn")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Sleep3Song);
				FinalFantasylization_debugMsg("Sleep3Song Final Fantasy XI Mog House")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Sleep4Song);
				FinalFantasylization_debugMsg("Sleep4Song Justice Monsters Five A Heros Day Off")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Sleep5Song);
				FinalFantasylization_debugMsg("Sleep5Song Final Fantasy 14 On Windy Meadows")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Sleep6Song);
				FinalFantasylization_debugMsg("Sleep6Song Radiata Stories Artisan")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Sleep7Song);
				FinalFantasylization_debugMsg("Sleep7Song Dragons Crown Memories To Be Told")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. Sleep8Song);
				FinalFantasylization_debugMsg("Sleep8Song Dragons Dogma Witch Selene")
			elseif x == 9 then
				FinalFantasylization_PlayMusic( S .. Sleep9Song);
				FinalFantasylization_debugMsg("Sleep9Song Lunar 2 Village Town")
			elseif x == 10 then
				FinalFantasylization_PlayMusic( S .. Sleep10Song);
				FinalFantasylization_debugMsg("Sleep10Song Final Fantasy 15 Camping Theme")
			elseif x == 11 then
				FinalFantasylization_PlayMusic( S .. Sleep11Song);
				FinalFantasylization_debugMsg("Sleep11Song Elders Scroll 5 Skyrim Around the Fire")
			elseif x == 12 then
				FinalFantasylization_PlayMusic( S .. Sleep12Song);
				FinalFantasylization_debugMsg("Sleep12Song The Witcher 3 The VagaBond")
			else
				FinalFantasylization_PlayMusic( S .. Sleep13Song);
				FinalFantasylization_debugMsg("Sleep13Song Rogue Galaxy Swinging")
			end
	end

	--#############
	-- ## SWIMMING
	--#############
	function FinalFantasylization_Swimming(Zone)
		if Zone == 1 then
			FinalFantasylization_PlayMusic(S .. DarkSwimSong);  -- alt Swim song
			FinalFantasylization_debugMsg("DarkSwimSong FF7 Who are you")-- alt Swim song
			return
		else
			local x = math.random(1, 3);
				if x == 1 then
					FinalFantasylization_PlayMusic(S .. SwimSong);  -- Normal Swim song
					FinalFantasylization_debugMsg("SwimSong FF7 A Secret Sleeping in the Deep Sea") -- Normal Swim song
				elseif x == 2 then 
					FinalFantasylization_PlayMusic(S .. Swim2Song); -- Normal Swim song
					FinalFantasylization_debugMsg("Swim2Song Shining Force 2 Mithril Diggers") -- Normal Swim song
				else 
					FinalFantasylization_PlayMusic(S .. Swim3Song); -- Normal Swim song
					FinalFantasylization_debugMsg("Swim3Song Kingdom Hearts Under the Sea") -- Normal Swim song
				end
		end
	end

	--#############
	-- ## TAXI
	--#############
	function FinalFantasylization_HordeTaxi()
		local x = math.random(1, 5);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. HordeFP1Song);
				FinalFantasylization_debugMsg("HordeFP1Song Final Fantasy 6 Wild West")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. HordeFP2Song);
				FinalFantasylization_debugMsg("HordeFP2Song Final Fantasy 9 Kuja Theme")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. HordeFP3Song);
				FinalFantasylization_debugMsg("HordeFP3Song Assassin Creed 4 Black Flag Pyrates Beware")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. HordeFP4Song);
				FinalFantasylization_debugMsg("HordeFP4Song The Witcher 3 Hunt or Be Hunted")
			else
				FinalFantasylization_PlayMusic( S .. HordeFP5Song);
				FinalFantasylization_debugMsg("HordeFP5Song Dragons Crown Mages Tower")
			end
	end
	function FinalFantasylization_AllianceTaxi()
		local x = math.random(1, 6);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. FP1Song);
				FinalFantasylization_debugMsg("FP1Song Final Fantasy 7 Steal the Tiny Bronco")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. FP2Song);
				FinalFantasylization_debugMsg("FP2Song Chrono Cross Time of the Dreamwatch")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. FP3Song);
				FinalFantasylization_debugMsg("FP3Song Kingdom Hearts Blast Away Gummi Ship I")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. FP4Song);
				FinalFantasylization_debugMsg("FP4Song Final Fantasy 8 Ride On")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. FP5Song);
				FinalFantasylization_debugMsg("FP5Song Final Fantasy 9 Hilda Garde")
			else
				FinalFantasylization_PlayMusic( S .. FP6Song);
				FinalFantasylization_debugMsg("FP6Song Final Fantasy 6 The Serpent Trench")
			end
	end
	
	--#############
	-- ## FLYING
	--#############
	function FinalFantasylization_HordeFlying()
		local x = math.random(1, 4);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. FlyingMountSong);
				FinalFantasylization_debugMsg("FlyingMountSong Final Fantasy 7 Highwind Takes to the Sky")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. FlyingMount2Song);
				FinalFantasylization_debugMsg("FlyingMount2Song Shining Force 2 Battle 2")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. FlyingMount3Song);
				FinalFantasylization_debugMsg("FlyingMount3Song Final Fantasy Type0 Soar")
			else
				FinalFantasylization_PlayMusic( S .. FlyingMount4Song);
				FinalFantasylization_debugMsg("FlyingMount4Song Final Fantasy 6 Terra")
			end
	end
	function FinalFantasylization_AllianceFlying()
		local x = math.random(1, 4);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. FlyingMountSong);
				FinalFantasylization_debugMsg("FlyingMountSong Final Fantasy 7 Highwind Takes to the Sky")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. FlyingMount2Song);
				FinalFantasylization_debugMsg("FlyingMount2Song Shining Force 2 Battle 2")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. FlyingMount3Song);
				FinalFantasylization_debugMsg("FlyingMount3Song Final Fantasy Type0 Soar")
			else
				FinalFantasylization_PlayMusic( S .. FlyingMount4Song);
				FinalFantasylization_debugMsg("FlyingMount4Song Final Fantasy 6 Terra")
			end
	end

	--#############
	-- ## MOUNTED
	--#############
	function FinalFantasylization_Mounted()					
		local x = math.random(1, 7);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. Mounted1Song);
				FinalFantasylization_debugMsg("Mounted1Song Legend of Zelda Ocarina of Time Horse Race")
			elseif x == 2 then 
				FinalFantasylization_PlayMusic( S .. Mounted2Song);
				FinalFantasylization_debugMsg("Mounted2Song Radiata Stories Scarlet Wind")
			elseif x == 3 then 
				FinalFantasylization_PlayMusic( S .. Mounted3Song);
				FinalFantasylization_debugMsg("Mounted3Song Rogue Galaxy Factory In production")
			elseif x == 4 then 
				FinalFantasylization_PlayMusic( S .. Mounted4Song);
				FinalFantasylization_debugMsg("Mounted4Song Final Fantasy 7 Chocobo")
			elseif x == 5 then 
				FinalFantasylization_PlayMusic( S .. Mounted5Song);
				FinalFantasylization_debugMsg("Mounted5Song Derek Fiechter Jungle Festival")
			elseif x == 6 then 
				FinalFantasylization_PlayMusic( S .. Mounted6Song);
				FinalFantasylization_debugMsg("Mounted6Song Final Fantasy 8 Chocobo")
			else 
				FinalFantasylization_PlayMusic( S .. Mounted7Song);
				FinalFantasylization_debugMsg("Mounted7Song Final Fantasy 13 Chocobos of Pulse")
			end
	end
	function FinalFantasylization_MountedEscape()		
		local x = math.random(1, 9);
			if x == 1 then
				FinalFantasylization_PlayMusic( S .. Escape1Song);
				FinalFantasylization_debugMsg("Escape1Song Final Fantasy 9 RUN")
			elseif x == 2 then
				FinalFantasylization_PlayMusic( S .. Escape2Song);
				FinalFantasylization_debugMsg("Escape2Song Final Fantasy XI Rise of the Zilart Belief")
			elseif x == 3 then
				FinalFantasylization_PlayMusic( S .. Escape3Song);
				FinalFantasylization_debugMsg("Escape3Song Final Fantasy 8 Retaliation")
			elseif x == 4 then
				FinalFantasylization_PlayMusic( S .. Escape4Song);
				FinalFantasylization_debugMsg("Escape4Song Final Fantasy 10 Enemy Attack")
			elseif x == 5 then
				FinalFantasylization_PlayMusic( S .. Escape5Song);
				FinalFantasylization_debugMsg("Escape5Song Tomb Raider 2 Incident Behind you")
			elseif x == 6 then
				FinalFantasylization_PlayMusic( S .. Escape6Song);
				FinalFantasylization_debugMsg("Escape6Song Shining Force 2 Boss Attack")
			elseif x == 7 then
				FinalFantasylization_PlayMusic( S .. Escape7Song);
				FinalFantasylization_debugMsg("Escape7Song Dragons Crown A Decision Has To Be Made")
			elseif x == 8 then
				FinalFantasylization_PlayMusic( S .. Escape8Song);
				FinalFantasylization_debugMsg("Escape8Song Dragons Dogma Tense Combat")
			else
				FinalFantasylization_PlayMusic( S .. Escape9Song);
				FinalFantasylization_debugMsg("Escape9Song Chrono Trigger A Shot of Crisis")
			end
	end

	--###############
	-- ## DANCE MUSIC
	--###############
	function FinalFantasylization_BloodElfFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. BloodElfFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_BloodElfMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. BloodElfMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_DraeneiFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. DraeneiFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_DraeneiMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. DraeneiMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_DwarfFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. DwarfFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_DwarfMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. DwarfMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_GnomeFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. GnomeFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_GnomeMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. GnomeMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_HumanFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. HumanFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_HumanMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. HumanMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_NightElfFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. NightElfFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_NightElfMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. NightElfMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_OrcFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. OrcFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_OrcMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. OrcMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_TaurenFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. TaurenFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_TaurenMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. TaurenMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_TrollFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. TrollFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_TrollMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. TrollMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_UndeadFemaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. UndeadFemaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_UndeadMaleDanceSong()
		FinalFantasylization_PlayMusic( SS .. UndeadMaleDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_DruidBearDanceSong()
		FinalFantasylization_PlayMusic( SS .. DruidBearDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_DruidCatDanceSong()
		FinalFantasylization_PlayMusic( SS .. DruidCatDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_DruidOwlBearDanceSong()
		FinalFantasylization_PlayMusic( SS .. DruidOwlBearDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_DruidTreeFormDanceSong()
		FinalFantasylization_PlayMusic( SS .. DruidTreeFormDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
	end
	function FinalFantasylization_WolfDanceSong()
		FinalFantasylization_PlayMusic( SS .. WolfDanceSong);
		FinalFantasylization_debugMsg("Look Ma I'm Dancin!  ")
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