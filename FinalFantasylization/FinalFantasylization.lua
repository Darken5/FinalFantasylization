-- FinalFantasylization by Hellfox and Darken5
-- Version 3.3.3
------------------------------------------------------------

-- FinalFantasylization requires this version of FFZlib:
local FinalFantasylizationFFZlibVersionRequired = 1.00
local block = 0
-- How often the OnUpdate code will run (in seconds)
local FinalFantasylization_UpdateInterval = 1.5 

-- LibBabble Zone and SubZone code --
local BZ = LibStub("LibBabble-Zone-3.0")
local BSZ = LibStub("LibBabble-SubZone-3.0")
local BF = LibStub("LibBabble-Faction-3.0")
local Z = BZ:GetLookupTable()
local ZR = BZ:GetReverseLookupTable()
local SZ = BSZ:GetLookupTable()
local SZR = BSZ:GetReverseLookupTable()
local F = BF:GetLookupTable()
local FR = BF:GetReverseLookupTable()
-------------------------------------
local FinalFantasylization_RightClick = false;
local FinalFantasylization_LeftClick = false;
local FinalFantasylization_RightTurn = false;
local FinalFantasylization_LeftTurn = false;

local FinalFantasylization_IsPlaying = false

NUM_SOUND_PACKS = 0
for i = 1, GetNumAddOns() do
	local name = GetAddOnInfo(i)
	if strmatch(name, "SoundPack%d*") then
		print (GetAddOnInfo(i))
		NUM_SOUND_PACKS = NUM_SOUND_PACKS + 1
	end
end

LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("FinalFantasylization", {
	type = "launcher",
	icon = "Interface\\AddOns\\FinalFantasylization\\Textures\\icon.tga",
	OnClick = function(clickedframe, button)
		ToggleDropDownMenu(1, nil, FinalFantasylizationDropDownMenu, clickedframe, 0, 0)
	end,
})

------------------------------------------------------------
-- FinalFantasylization events
------------------------------------------------------------
-- Called when an event that FinalFantasylization cares about is fired.
local startingFunc
local startFinalfantasylization = false
function FinalFantasylization_OnEvent()
	if event == "PLAYER_ENTERING_WORLD" then
		CoreSavedVariable = (CoreSavedVariable or "Final Fantasy 7")
		startingFunc = _G["SoundPack" .. CoreSavedVariable .. "_SetEnabled"]
		if startingFunc then
			startingFunc(true)
			FinalFantasylization_Msg("Loaded sound pack " .. CoreSavedVariable .. ".")
			startFinalfantasylization = true
		else
			FinalFantasylization_Msg("Can't find sound pack " .. CoreSavedVariable .. ".")
		end
	elseif event =="COMBAT_LOG_EVENT_UNFILTERED" and arg2 == "PARTY_KILL" and arg3 == UnitGUID("player") and FinalFantasylizationOptions.Enabled == true then
		if FinalFantasylization_PlayerIsCombat == true and FinalFantasylizationOptions.Enabled == true then
			FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. TargetKilled)
			FinalFantasylization_KillSound()
			FinalFantasylization_RegenGain = true
		end
	elseif event == "ADDON_LOADED" then
	elseif event == "VARIABLES_LOADED" then
	elseif event == "SPELLS_CHANGED" then
	elseif event == "PLAYER_LOGIN" then
	elseif event == "PLAYER_ALIVE" then
	elseif event == "WORLD_MAP_UPDATE" then
	elseif event == "PLAYER_REGEN_DISABLED" then
		FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. EnterCombat)
		if FinalFantasylizationOptions.Enabled == true then
			FinalFantasylization_CombatSound()
			FinalFantasylization_PlayerIsCombat = true
		end
	elseif event == "PLAYER_REGEN_ENABLED" then
		FinalFantasylization_PlayerIsCombat = false
		FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. LeaveCombat)
	elseif event == "UNIT_AURA" then
	elseif event == "ZONE_CHANGED" then
	elseif event == "ZONE_CHANGED_INDOORS" then
	elseif event == "ZONE_CHANGED_NEW_AREA" then
	elseif event == "PLAYER_UPDATE_RESTING" then
	elseif event == "PLAYER_CAMPING" then
		FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. PlayerCamping)
		if (DanceSongPlaying) then
			FinalFantasylization_StopDanceSong() 
		end
	elseif event == "CHAT_MSG_COMBAT_FACTION_CHANGE" then
		if FinalFantasylization_PlayerIsCombat == true then
			FinalFantasylization_RegenGain = true
		end
	elseif event == "PLAYER_XP_UPDATE" then
		if FinalFantasylization_PlayerIsCombat == true then
			FinalFantasylization_RegenGain = true
		end
	elseif event == "PLAYER_PVP_KILLS_CHANGED" then
		if FinalFantasylization_PlayerIsCombat == true then
			FinalFantasylization_RegenGain = true
		end
	elseif event == "PLAYER_DEAD" then
	elseif event == "CHAT_MSG_TEXT_EMOTE" then
	elseif event == "PLAYER_LEVEL_UP" then
		if ( FinalFantasylization_RegenGain == true or FinalFantasylization_RegenGain == false ) and FinalFantasylizationOptions.LevelUp == true then
			FinalFantasylization_RegenGain = false
			FinalFantasylization_LevelUpSong()
		end
	end
	if block == 0 then
		FinalFantasylization_OnLoad()
		block = 1
	end
	onUpdate()
--	FinalFantasylization_debugMsg(FFZlib.Color.Red .. "Event...")
--	FinalFantasylization_GetMusic()
end

function FinalFantasylization_OnLoad()
	playermodel = CreateFrame("PlayerModel")
	-- Check the current version of FFZlib.
	if (not FFZlib) or (not FFZlib.Version) or (FFZlib.Version < FinalFantasylizationFFZlibVersionRequired) then
		if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage("|cfffe8460" .. NeedNewerFFZlibMessage) end
		message(NeedNewerFFZlibMessage)
		return
	end

	SLASH_FinalFantasylizationCMD1 = "/ffsound"
	SLASH_FinalFantasylizationCMD2 = "/ffs"
	SlashCmdList["FinalFantasylizationCMD"] = FinalFantasylization_Command
	
	SLASH_Soundpack1 = "/ffsoundpack"
	SLASH_Soundpack2 = "/ffsp"
	SlashCmdList["Soundpack"] = FinalFantasylization_SPCommand
	
	FinalFantasylizationMapIcon:Show()
	
	-- If they don't have any options set yet (no saved variable), reset them. If they upgraded
	-- from a previous version and are missing one or more options, fill them in with defaults.
	FinalFantasylizationFillMissingOptions()
	
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylization_ClearMusicState()
	-- PvP Type --
	FinalFantasylization_InContestedArea = false
	FinalFantasylization_InHostileArea = false
	FinalFantasylization_InFriendlyArea = false
	-- Starter Areas --
	FinalFantasylization_InStarterAreaSunstriderIsle = false -- Blood Elf Starting Area
	FinalFantasylization_InStarterAreaDeathknell = false -- Undead Starting Area
	FinalFantasylization_InStarterAreaValleyOfTrials = false -- Orc and Troll Starting Area
	FinalFantasylization_InStarterAreaCampNarache = false -- Tauren Starting Area
	FinalFantasylization_InStarterAreaColdridgeValley = false -- Dwarf and Gnome Starting Area
	FinalFantasylization_InStarterAreaNorthshireValley = false -- Human Starting Area
	FinalFantasylization_InStarterAreaAmmenVale = false -- Draenei Starting Area
	FinalFantasylization_InStarterAreaShadowglen = false -- Night Elf Starting Area
	FinalFantasylization_InStarterAreaScarletEnclave = false -- Death Knight Starting Area
	-- Capital Cities --
	FinalFantasylization_InCityOrgrimmar = false
	FinalFantasylization_InCitySilvermoonCity = false
	FinalFantasylization_InCityThunderBluff = false
	FinalFantasylization_InCityUndercity = false
	FinalFantasylization_InCityDarnassus = false
	FinalFantasylization_InCityExodar = false
	FinalFantasylization_InCityIronforge = false
	FinalFantasylization_InCityStormwind = false
	FinalFantasylization_InCityShattrathCity = false --' Sanctuary Territory
	FinalFantasylization_InCityArea52 = false
	FinalFantasylization_InCityBootyBay = false
	FinalFantasylization_InCityEbonHold = false
	FinalFantasylization_InCityEverlook = false
	FinalFantasylization_InCityGadgetzan = false
	FinalFantasylization_InCityRatchet = false 
	FinalFantasylization_InCityDalaran = false
	-- Horde Towns --
	FinalFantasylization_InHordeTownAgmarsHammer = false
	FinalFantasylization_InHordeTownApothecaryCamp = false	
	FinalFantasylization_InHordeTownBloodhoofVillage = false
	FinalFantasylization_InHordeTownBloodvenomPost = false
	FinalFantasylization_InHordeTownBrackenwallVillage = false
	FinalFantasylization_InHordeTownBrill = false
	FinalFantasylization_InHordeTownBorgorokOutpost = false	
	FinalFantasylization_InHordeTownCampMojache = false
	FinalFantasylization_InHordeTownCampOneqwah = false
	FinalFantasylization_InHordeTownCampTaurajo = false
	FinalFantasylization_InHordeTownCampTunkalo = false
	FinalFantasylization_InHordeTownCampWinterhoof = false
	FinalFantasylization_InHordeTownConquestHold = false
	FinalFantasylization_InHordeTownCrossroads = false
	FinalFantasylization_InHordeTownFairbreezeVillage = false
	FinalFantasylization_InHordeTownFalconWatch = false
	FinalFantasylization_InHordeTownFalconwingSquare = false
	FinalFantasylization_InHordeTownFlameCrest = false
	FinalFantasylization_InHordeTownFreewindPost = false
	FinalFantasylization_InHordeTownGaradar = false
	FinalFantasylization_InHordeTownGromarshCrashSite = false
	FinalFantasylization_InHordeTownGromgolBaseCamp = false
	FinalFantasylization_InHordeTownHammerfall = false
	FinalFantasylization_InHordeTownKargath = false
	FinalFantasylization_InHordeTownKorkronVanguard = false
	FinalFantasylization_InHordeTownMokNathalVillage = false
	FinalFantasylization_InHordeTownNewAgamand = false
	FinalFantasylization_InHordeTownRazorHill = false
	FinalFantasylization_InHordeTownRevantuskVillage = false
	FinalFantasylization_InHordeTownSenjinVillage = false
	FinalFantasylization_InHordeTownSepulcher = false
	FinalFantasylization_InHordeTownShadowmoonVillage = false
	FinalFantasylization_InHordeTownShadowpreyVillage = false
	FinalFantasylization_InHordeTownSplintertreePost = false
	FinalFantasylization_InHordeTownStonard = false
	FinalFantasylization_InHordeTownStonebreakerHold = false
	FinalFantasylization_InHordeTownSunreaversCommand = false
	FinalFantasylization_InHordeTownSunRockRetreat = false
	FinalFantasylization_InHordeTownSwampratPost = false
	FinalFantasylization_InHordeTownTarrenMill = false
	FinalFantasylization_InHordeTownTaunkaleVillage = false
	FinalFantasylization_InHordeTownThrallmar = false
	FinalFantasylization_InHordeTownThunderlordStronghold = false
	FinalFantasylization_InHordeTownTranquillien = false
	FinalFantasylization_InHordeTownValormok = false
	FinalFantasylization_InHordeTownVengeanceLanding = false
	FinalFantasylization_InHordeTownVenomspite = false
	FinalFantasylization_InHordeTownWarsongHold = false
	FinalFantasylization_InHordeTownZabrajin = false
	FinalFantasylization_InHordeTownZoramgarOutpost = false
	FinalFantasylization_InHordeTownGhostWalkerPost = false
	-- Alliance Towns --
	FinalFantasylization_InAllianceTownAeriePeak = false
	FinalFantasylization_InAllianceTownAllerianStronghold = false
	FinalFantasylization_InAllianceTownAmberpineLodge = false
	FinalFantasylization_InAllianceTownAstranaar = false
	FinalFantasylization_InAllianceTownAuberdine = false
	FinalFantasylization_InAllianceTownAzureWatch = false
	FinalFantasylization_InAllianceTownBloodWatch = false
	FinalFantasylization_InAllianceTownBrackwellPumpkinPatch = false
	FinalFantasylization_InAllianceTownChillwindCamp = false
	FinalFantasylization_InAllianceTownDarkshire = false
	FinalFantasylization_InAllianceTownDolanaar = false
	FinalFantasylization_InAllianceTownExplorersLeagueOutpost = false
	FinalFantasylization_InAllianceTownFeathermoonStronghold = false
	FinalFantasylization_InAllianceTownFizzcrankAirstrip = false
	FinalFantasylization_InAllianceTownFordragonHold = false
	FinalFantasylization_InAllianceTownForestSong = false
	FinalFantasylization_InAllianceTownFortWildervar = false
	FinalFantasylization_InAllianceTownFrosthold = false
	FinalFantasylization_InAllianceTownGoldshire = false
	FinalFantasylization_InAllianceTownHonorHold = false
	FinalFantasylization_InAllianceTownKharanos = false
	FinalFantasylization_InAllianceTownLakeshire = false
	FinalFantasylization_InAllianceTownMenethilHarbor = false
	FinalFantasylization_InAllianceTownMorgansVigil = false
	FinalFantasylization_InAllianceTownNethergardeKeep = false
	FinalFantasylization_InAllianceTownNijelsPoint = false
	FinalFantasylization_InAllianceTownOreborHarborage = false
	FinalFantasylization_InAllianceTownRebelCamp = false
	FinalFantasylization_InAllianceTownRefugePointe = false
	FinalFantasylization_InAllianceTownSentinelHill = false
	FinalFantasylization_InAllianceTownSouthshore = false
	FinalFantasylization_InAllianceTownStarsRest = false
	FinalFantasylization_InAllianceTownSteelgrillsDepot = false
	FinalFantasylization_InAllianceTownStonefieldFarm = false
	FinalFantasylization_InAllianceTownStonetalonPeak = false
	FinalFantasylization_InAllianceTownSylvanaar = false
	FinalFantasylization_InAllianceTownTalonbranchGlade = false
	FinalFantasylization_InAllianceTownTalrendisPoint = false
	FinalFantasylization_InAllianceTownTelaar = false
	FinalFantasylization_InAllianceTownTelredor = false
	FinalFantasylization_InAllianceTownTempleOfTelhamat = false
	FinalFantasylization_InAllianceTownThalanaar = false
	FinalFantasylization_InAllianceTownThelsamar = false
	FinalFantasylization_InAllianceTownTheramoreIsle = false
	FinalFantasylization_InAllianceTownToshleysStation = false
	FinalFantasylization_InAllianceTownValianceKeep = false
	FinalFantasylization_InAllianceTownValgarde = false
	FinalFantasylization_InAllianceTownWestfallBrigadeEncampment = false
	FinalFantasylization_InAllianceTownWestguardKeep = false
	FinalFantasylization_InAllianceTownWildhammerStronghold = false
	FinalFantasylization_InAllianceTownWindrunnersOverlook = false
	FinalFantasylization_InAllianceTownWintergardeKeep = false
	FinalFantasylization_InAllianceTownBrewnallVillage = false
	FinalFantasylization_InAllianceTownEastvaleLoggingCamp = false
	FinalFantasylization_InAllianceTownPyrewoodVillage = false
	FinalFantasylization_InAllianceTownRuttheranVillage = false
	FinalFantasylization_InAllianceTownBaelModan = false
	FinalFantasylization_InAllianceTownStarfallVillage = false
	FinalFantasylization_InAllianceTownMaclureVineyards = false
	FinalFantasylization_InAllianceTownHillsbradFields = false
	-- Neutral Towns --
	FinalFantasylization_InNeutralTownAltarOfShatar = false
	FinalFantasylization_InNeutralTownAmberLedge = false
	FinalFantasylization_InNeutralTownArgentTournamentGrounds = false
	FinalFantasylization_InNeutralTownArgentVanguard = false
	FinalFantasylization_InNeutralTownBouldercragsRefuge = false
	FinalFantasylization_InNeutralTownCenarionHold = false
	FinalFantasylization_InNeutralTownCenarionRefuge = false
	FinalFantasylization_InNeutralTownCosmowrench = false
	FinalFantasylization_InNeutralTownCrusadersPinnacle = false
	FinalFantasylization_InNeutralTownDeathsRise = false
	FinalFantasylization_InNeutralTownDunNiffelem = false
	FinalFantasylization_InNeutralTownEbonWatch = false
	FinalFantasylization_InNeutralTownEmeraldSanctuary = false
	FinalFantasylization_InNeutralTownEvergrove = false
	FinalFantasylization_InNeutralTownFrenzyheartHill = false	--at odds with the Oracles in Rainspeaker Canopy
	FinalFantasylization_InNeutralTownHalaa = false
	FinalFantasylization_InNeutralTownK3 = false
	FinalFantasylization_InNeutralTownKamagua = false
	FinalFantasylization_InNeutralTownLightsBreach = false
	FinalFantasylization_InNeutralTownLightsHopeChapel = false
	FinalFantasylization_InNeutralTownMarshalsRefuge = false
	FinalFantasylization_InNeutralTownMoakiHarbor = false
	FinalFantasylization_InNeutralTownMudsprocket = false
	FinalFantasylization_InNeutralTownNesingwaryBaseCamp = false
	FinalFantasylization_InNeutralTownNesingwaryExpedition = false
	FinalFantasylization_InNeutralTownNighthaven = false
	FinalFantasylization_InNeutralTownRainspeakerCanopy = false	-- at odds with the Frenzyheart Tribe in Frenzyheart Hill
	FinalFantasylization_InNeutralTownRiversHeart = false
	FinalFantasylization_InNeutralTownSanctumOfTheStars = false
	FinalFantasylization_InNeutralTownShadowVault = false
	FinalFantasylization_InNeutralTownSporeggar = false
	FinalFantasylization_InNeutralTownStormspire = false
	FinalFantasylization_InNeutralTownSunsReach = false
	FinalFantasylization_InNeutralTownTheArgentStand = false
	FinalFantasylization_InNeutralTownThoriumPoint = false
	FinalFantasylization_InNeutralTownTransitusShield = false
	FinalFantasylization_InNeutralTownUnupe = false
	FinalFantasylization_InNeutralTownWyrmrestTemple = false
	FinalFantasylization_InNeutralTownZimTorga = false
	FinalFantasylization_InNeutralTownTheHarborage = false
	FinalFantasylization_InNeutralTownValorsRest = false
	FinalFantasylization_InNeutralTownSteamwheedlePort = false
	FinalFantasylization_InNeutralTownMirageRaceway = false
	FinalFantasylization_InNeutralTownAerisLanding = false
	FinalFantasylization_InNeutralTownMidrealmPost = false
	FinalFantasylization_InNeutralTownProtectorateWatchPost = false
	FinalFantasylization_InNeutralTownDawnsReach = false
	FinalFantasylization_InNeutralTownLightsTrust = false
	FinalFantasylization_InNeutralTownGraniteSprings = false
	FinalFantasylization_InNeutralTownVentureBay = false
	FinalFantasylization_InNeutralTownScalawagPoint = false
	FinalFantasylization_InNeutralTownBlackwatch = false
	FinalFantasylization_InNeutralTownDoriansOutpost = false
	FinalFantasylization_InNeutralTownKartaksHold = false
	FinalFantasylization_InNeutralTownLakesideLanding = false
	FinalFantasylization_InNeutralTownMistwhisperRefuge = false
	FinalFantasylization_InNeutralTownSparktouchedHaven = false
	FinalFantasylization_InNeutralTownSpearbornEncampment = false
	FinalFantasylization_InNeutralTownDubraJin = false
	FinalFantasylization_InNeutralTownOgrila = false
	FinalFantasylization_InNeutralTownTimbermawHold = false
	FinalFantasylization_InNeutralTownDarrowshire = false
	FinalFantasylization_InNeutralTownKirinVarVillage = false
	-- Eastern Kingdoms Zones --
	FinalFantasylization_InEasternKingdomsAlteracMountains = false
	FinalFantasylization_InEasternKingdomsArathiHighlands = false
	FinalFantasylization_InEasternKingdomsBadlands = false
	FinalFantasylization_InEasternKingdomsBlackrockMountain = false
	FinalFantasylization_InEasternKingdomsBurningSteppes = false
	FinalFantasylization_InEasternKingdomsDeadwindPass = false
	FinalFantasylization_InEasternKingdomsDunMorogh = false --' Alliance Territory
	FinalFantasylization_InEasternKingdomsDuskwood = false
	FinalFantasylization_InEasternKingdomsEasternPlaguelands = false
	FinalFantasylization_InEasternKingdomsElwynnForest = false --' Alliance Territory
	FinalFantasylization_InEasternKingdomsEversongWoods = false --' Horde Territory
	FinalFantasylization_InEasternKingdomsGhostlands = false --' Horde Territory
	FinalFantasylization_InEasternKingdomsHillsbradFoothills = false
	FinalFantasylization_InEasternKingdomsIsleofQuelDanas = false
	FinalFantasylization_InEasternKingdomsLochModan = false --' Alliance Territory
	FinalFantasylization_InEasternKingdomsRedridgeMountains = false
	FinalFantasylization_InEasternKingdomsSearingGorge = false
	FinalFantasylization_InEasternKingdomsSilverpineForest = false --' Horde Territory
	FinalFantasylization_InEasternKingdomsStranglethornVale = false
	FinalFantasylization_InEasternKingdomsSwampOfSorrows = false
	FinalFantasylization_InEasternKingdomsTheBlastedLands = false
	FinalFantasylization_InEasternKingdomsTheHinterlands = false
	FinalFantasylization_InEasternKingdomsTirisfalGlades = false --' Horde Territory
	FinalFantasylization_InEasternKingdomsWesternPlaguelands = false
	FinalFantasylization_InEasternKingdomsWestfall = false --' Alliance Territory
	FinalFantasylization_InEasternKingdomsWetlands = false
	-- Kalimdor Zones --
	FinalFantasylization_InKalimdorAshenvale = false
	FinalFantasylization_InKalimdorAzshara = false
	FinalFantasylization_InKalimdorAzuremystIsle = false --' Alliance Territory
	FinalFantasylization_InKalimdorBloodmystIsle = false --' Alliance Territory
	FinalFantasylization_InKalimdorDarkshore = false --' Alliance Territory
	FinalFantasylization_InKalimdorDesolace = false
	FinalFantasylization_InKalimdorDurotar = false --' Horde Territory
	FinalFantasylization_InKalimdorDustwallowMarsh = false
	FinalFantasylization_InKalimdorFelwood = false
	FinalFantasylization_InKalimdorFeralas = false
	FinalFantasylization_InKalimdorMoonglade = false
	FinalFantasylization_InKalimdorMulgore = false --' Horde Territory
	FinalFantasylization_InKalimdorSilithus = false
	FinalFantasylization_InKalimdorStonetalonMountains = false
	FinalFantasylization_InKalimdorTanaris = false
	FinalFantasylization_InKalimdorTeldrassil = false --' Alliance Territory
	FinalFantasylization_InKalimdorTheBarrens = false --' Horde Territory
	FinalFantasylization_InKalimdorThousandNeedles = false
	FinalFantasylization_InKalimdorUngoroCrater = false
	FinalFantasylization_InKalimdorWinterspring = false
	-- Outland Zones --
	FinalFantasylization_InOutlandBladesEdgeMountains = false	
	FinalFantasylization_InOutlandHellfirePeninsula = false
	FinalFantasylization_InOutlandNagrand = false	
	FinalFantasylization_InOutlandNetherstorm = false
	FinalFantasylization_InOutlandShadowmoonValley = false	
	FinalFantasylization_InOutlandTerokkarForest = false	
	FinalFantasylization_InOutlandZangarmarsh = false	
	-- Northrend Zones --
	FinalFantasylization_InNorthrendBoreanTundra = false
	FinalFantasylization_InNorthrendColdarra = false
	FinalFantasylization_InNorthrendCrystalsongForest = false
	FinalFantasylization_InNorthrendDragonblight = false
	FinalFantasylization_InNorthrendGrizzlyHills = false
	FinalFantasylization_InNorthrendHowlingFjord = false
	FinalFantasylization_InNorthrendIcecrown = false
	FinalFantasylization_InNorthrendSholazarBasin = false
	FinalFantasylization_InNorthrendStormPeaks = false
	FinalFantasylization_InNorthrendWintergrasp = false
	FinalFantasylization_InNorthrendZulDrak = false
	-- Miscelaneous Zones --
	FinalFantasylization_InMiscAreaScarletMonastery = false	-- the building in Tirisfal Glades, not the instance itself.
	FinalFantasylization_InMiscAreaRazorfenKraul = false	-- area directly before Razorfen Kraul instance.
	FinalFantasylization_InMiscAreaRazorfenDowns = false	-- area before the instance
	FinalFantasylization_InMiscAreaWailingCaverns = false	-- cave before instance
	FinalFantasylization_InMiscAreaTheDeadmines = false		-- cave before instance
	FinalFantasylization_InMiscAreaGnomeregan = false		-- area before the instance
	FinalFantasylization_InMiscAreaDeeprunTram = false
	FinalFantasylization_InMiscEbonHold = false
	FinalFantasylization_InMiscAreaCavernsOfTime = false
	-- General Events --
	FinalFantasylization_PlayerIsSwimming = false
	FinalFantasylization_PlayerIsWorlding = false
	FinalFantasylization_PlayerIsResting = false
	FinalFantasylization_PlayerIsSleeping = false
	FinalFantasylization_PlayerIsCombat = false
	FinalFantasylization_PlayerIsFlying = false
	FinalFantasylization_PlayerIsMounted = false
	FinalFantasylization_PlayerIsEscape = false
	FinalFantasylization_PlayerIsBattling = false
	FinalFantasylization_PlayerIsMounting = false
	FinalFantasylization_PlayerIsGhosting = false
	FinalFantasylization_PlayerIsTaxi = false
	FinalFantasylization_PlayerIsDead = false
	FinalFantasylization_PlayerIsHostileMounting = false
	FinalFantasylization_Dies = false
	FinalFantasylization_EventLoad = false
	FinalFantasylization_RegenGain = false
	-- Dungeons Events --
	FinalFantasylization_InInstance = false
end

function FinalFantasylization_Msg(msg)
	if( DEFAULT_CHAT_FRAME ) then
		FFZlib.Message(FFZlib.Color.White .. (msg))
	end
end

function FinalFantasylization_debugMsg(msg)
	if( DEFAULT_CHAT_FRAME ) and FinalFantasylizationOptions.Debug == true then
		FFZlib.Message(FFZlib.Color.Teal .. (msg))
	end
end

-- Processes a FinalFantasylization slash command.
function FinalFantasylization_Command(Command)
	local Lower = strlower(Command)
	if Lower == "" or Lower == nil then
		FinalFantasylizationUI_Show()
	elseif Lower == EnabledCommand then
		FinalFantasylizationEnable(true)
		FinalFantasylization_ClearMusicState()
		FFZlib.Message(FFZlib.Color.Yellow .. EnabledMessage)
	elseif Lower == DisabledCommand then
		FinalFantasylizationEnable(false)
		FFZlib.Message(FFZlib.Color.Yellow .. DisabledMessage)
	elseif Lower == DebugCommand then
		if FinalFantasylizationOptions.Debug == false then
			FinalFantasylizationEnableDebug(true)
			FFZlib.Message(FFZlib.Color.Yellow .. DebugOnMessage)
		else
			FinalFantasylizationEnableDebug(false)
			FFZlib.Message(FFZlib.Color.Yellow .. DebugOffMessage)
		end
	elseif Lower == MusicCommand then
		if FinalFantasylizationOptions.Music == true then
			FinalFantasylizationEnableMusic(false)
			FinalFantasylization_ClearMusicState()
			StopMusic();
			FFZlib.Message(FFZlib.Color.Yellow .. MusicOffMessage)
		else
			FinalFantasylizationEnableMusic(true)
			FinalFantasylization_debugMsg(FFZlib.Color.Red .. "Enable Music...")
			FinalFantasylization_GetMusic()
			FFZlib.Message(FFZlib.Color.Yellow .. MusicOnMessage)
		end
	elseif Lower == SoundCommand then
		if FinalFantasylizationOptions.Sound == true then
			FinalFantasylizationEnableSound(false)
			FFZlib.Message(FFZlib.Color.Yellow .. SoundOffMessage)
		else
			FinalFantasylizationEnableSound(true)
			FFZlib.Message(FFZlib.Color.Yellow .. SoundOnMessage)
		end
	elseif Lower == DungeonCommand then
		if FinalFantasylizationOptions.Dungeon == true then
			FinalFantasylizationEnableDungeon(false)
			FFZlib.Message(FFZlib.Color.Yellow .. DungeonOffMessage)
		else
			FinalFantasylizationEnableDungeon(true)
			FFZlib.Message(FFZlib.Color.Yellow .. DungeonOnMessage)
		end
	elseif Lower == MountCommand then
		if FinalFantasylizationOptions.Mount == true then
			FinalFantasylizationEnableMount(false)
			FFZlib.Message(FFZlib.Color.Yellow .. MountOffMessage)
		else
			FinalFantasylizationEnableMount(true)
			FFZlib.Message(FFZlib.Color.Yellow .. MountOnMessage)
		end
	elseif Lower == SleepCommand then
		if FinalFantasylizationOptions.Sleep == true then
			FinalFantasylizationEnableSleep(false)
			FFZlib.Message(FFZlib.Color.Yellow .. SleepOffMessage)
		else
			FinalFantasylizationEnableSleep(true)
			FFZlib.Message(FFZlib.Color.Yellow .. SleepOnMessage)
		end
	elseif Lower == SwimCommand then
		if FinalFantasylizationOptions.Swim == true then
			FinalFantasylizationEnableSwim(false)
			FFZlib.Message(FFZlib.Color.Yellow .. SwimOffMessage)
		else
			FinalFantasylizationEnableSwim(true)
			FFZlib.Message(FFZlib.Color.Yellow .. SwimOnMessage)
		end
	elseif Lower == DeadCommand then
		if FinalFantasylizationOptions.Dead == true then
			FinalFantasylizationEnableDead(false)
			FFZlib.Message(FFZlib.Color.Yellow .. DeadOffMessage)
		else
			FinalFantasylizationEnableDead(true)
			FFZlib.Message(FFZlib.Color.Yellow .. DeadOnMessage)
		end
	elseif Lower == FlightCommand then
		if FinalFantasylizationOptions.Flight == true then
			FinalFantasylizationEnableFlight(false)
			FFZlib.Message(FFZlib.Color.Yellow .. FlightOffMessage)
		else
			FinalFantasylizationEnableFlight(true)
			FFZlib.Message(FFZlib.Color.Yellow .. FlightOnMessage)
		end
	elseif Lower == CapitalCommand then
		if FinalFantasylizationOptions.Capital == true then
			FinalFantasylizationEnableCapital(false)
			FFZlib.Message(FFZlib.Color.Yellow .. CapitalOffMessage)
		else
			FinalFantasylizationEnableCapital(true)
			FFZlib.Message(FFZlib.Color.Yellow .. CapitalOnMessage)
		end
	elseif Lower == CombatCommand then
		if FinalFantasylizationOptions.Combat == true then
			FinalFantasylizationEnableCombat(false)
			FFZlib.Message(FFZlib.Color.Yellow .. CombatOffMessage)
		else
			FinalFantasylizationEnableCombat(true)
			FFZlib.Message(FFZlib.Color.Yellow .. CombatOnMessage)
		end
	elseif Lower == FanfareCommand then
		if FinalFantasylizationOptions.Fanfare == true then
			FinalFantasylizationEnableFanfare(false)
			FFZlib.Message(FFZlib.Color.Yellow .. FanfareOffMessage)
		else
			FinalFantasylizationEnableFanfare(true)
			FFZlib.Message(FFZlib.Color.Yellow .. FanfareOnMessage)
		end
	elseif Lower == LevelUpCommand then
		if FinalFantasylizationOptions.LevelUp == true then
			FinalFantasylizationEnableLevelUp(false)
			FFZlib.Message(FFZlib.Color.Yellow .. LevelUpOffMessage)
		else
			FinalFantasylizationEnableLevelUp(true)
			FFZlib.Message(FFZlib.Color.Yellow .. LevelUpOnMessage)
		end
		elseif Lower == RaidCommand then
		if FinalFantasylizationOptions.Raid == true then
			FinalFantasylizationEnableRaid(false)
			FFZlib.Message(FFZlib.Color.Yellow .. RaidOffMessage)
		else
			FinalFantasylizationEnableRaid(true)
			FFZlib.Message(FFZlib.Color.Yellow .. RaidOnMessage)
		end
	elseif Lower == DanceCommand then
		if FinalFantasylizationOptions.Dance == true then
			FinalFantasylizationEnableDance(false)
			FFZlib.Message(FFZlib.Color.Yellow .. DanceOffMessage)
		else
			FinalFantasylizationEnableDance(true)
			FFZlib.Message(FFZlib.Color.Yellow .. DanceOnMessage)
		end
	elseif Lower == ChocoboKwehCommand then
		if FinalFantasylizationOptions.ChocoboKweh == true then
			FinalFantasylizationEnableChocoboKweh(false)
			FFZlib.Message(FFZlib.Color.Yellow .. ChocoboKwehOffMessage)
		else
			FinalFantasylizationEnableChocoboKweh(true)
			FFZlib.Message(FFZlib.Color.Yellow .. ChocoboKwehOnMessage)
		end
	elseif Lower == BattlegroundCommand then
		if FinalFantasylizationOptions.Battleground == true then
			FinalFantasylizationEnableBattleground(false)
			FFZlib.Message(FFZlib.Color.Yellow .. BattlegroundOffMessage)
		else
			FinalFantasylizationEnableBattleground(true)
			FFZlib.Message(FFZlib.Color.Yellow .. BattlegroundOnMessage)
		end
	elseif Lower == TestCommand then
		ZoneName = GetRealZoneText();
		MinimapZoneName = GetMinimapZoneText()
		SubZoneName = GetSubZoneText()
		areaID = GetCurrentMapAreaID()
		local realm = GetRealmName();
		local factionEnglish, factionLocale = UnitFactionGroup("player"); --'Horde, Alliance
		local pvpType, isFFA, faction = GetZonePVPInfo(); --'("friendly";"contested";"hostile";"sanctuary") (1;nil) ("Alliance";"Horde")
		ZoneText = GetZoneText()
		local inInstance, instanceType = IsInInstance();
		local classification = UnitClassification("target"); --'classification: "worldboss", "rareelite", "elite", "rare", "normal" or "trivial"
			FFZlib.Message(FFZlib.Color.Grey..TestMessage1..FFZlib.Color.Crimson..realm)
			FFZlib.Message(FFZlib.Color.Grey..TestMessage2..FFZlib.Color.Crimson..factionEnglish)
			FFZlib.Message(FFZlib.Color.Grey..TestMessage3..FFZlib.Color.Crimson..ZoneName)
			FFZlib.Message(FFZlib.Color.Grey..TestMessage8..FFZlib.Color.Crimson..areaID)
			FFZlib.Message(FFZlib.Color.Grey..TestMessage4..FFZlib.Color.Crimson..instanceType)
			FFZlib.Message(FFZlib.Color.Grey..TestMessage5..FFZlib.Color.Crimson..SubZoneName)
			FFZlib.Message(FFZlib.Color.Grey..TestMessage6..FFZlib.Color.Crimson..MinimapZoneName)
			FFZlib.Message(FFZlib.Color.Grey..TestMessage7..FFZlib.Color.Crimson..classification)
	else
		FinalFantasylizationUsage()
	end
end

function FinalFantasylization_SPCommand(Command)
	local Lower = strlower(Command)
	if Lower == "" or Lower == nil then
		FinalFantasylizationUISP_Show()
	else
		SwitchTo(Lower)
	end
end

function SwitchTo(soundPackID)
	soundPackID = (soundPackID)
	local func = _G["SoundPack" .. soundPackID .. "_SetEnabled"]
	if func then
		func(true)
		startingFunc = func
		FinalFantasylization_ClearMusicState()
		StopMusic()
		FinalFantasylization_debugMsg(FFZlib.Color.Red .. "SwitchTo...")
		FinalFantasylization_GetMusic()
		print("Loaded sound pack " .. soundPackID .. ".")
	elseif startingFunc then
		startingFunc(true)
		print("Can't find sound pack " .. soundPackID .. ".")
		print(CoreSavedVariable .. " still loaded.")
	else
		print("Can't find sound pack " .. soundPackID .. ".")
	end
end

function FinalFantasylizationEnable(Enabled)
	FFZlib.Assert(Enabled == true or Enabled == false, "New value should be true or false.")
	FinalFantasylizationOptions.Enabled = Enabled
	if Enabled == true then
		FinalFantasylization_ClearMusicState()
		FinalFantasylization_debugMsg(FFZlib.Color.Red .. "FinalFantasylizationEnable...")
		onUpdate()
	elseif Enabled == false then
		StopMusic()
		FinalFantasylization_ClearMusicState()
	end
end

function FinalFantasylizationEnableMusic(Music)
	FFZlib.Assert(Music == true or Music == false, "New value should be true or false.")
	FinalFantasylizationOptions.Music = Music
	if Music == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableDance(Dance)
	FFZlib.Assert(Dance == true or Dance == false, "New value should be true or false.")
	FinalFantasylizationOptions.Dance = Dance
	FinalFantasylization_ClearMusicState()
end
	
function FinalFantasylizationEnableCombat(Combat)
	FFZlib.Assert(Combat == true or Combat == false, "New value should be true or false.")
	FinalFantasylizationOptions.Combat = Combat
	FinalFantasylization_ClearMusicState()
end
	
function FinalFantasylizationEnableMount(Mount)
	FFZlib.Assert(Mount == true or Mount == false, "New value should be true or false.")
	FinalFantasylizationOptions.Mount = Mount
	FinalFantasylization_ClearMusicState()
end
	
function FinalFantasylizationEnableDungeon(Dungeon)
	FFZlib.Assert(Dungeon == true or Dungeon == false, "New value should be true or false.")
	FinalFantasylizationOptions.Dungeon = Dungeon
	if Dungeon == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableRaid(Raid)
	FFZlib.Assert(Raid == true or Raid == false, "New value should be true or false.")
	FinalFantasylizationOptions.Raid = Raid
	if Raid == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableBattleground(Battleground)
	FFZlib.Assert(Battleground == true or Battleground == false, "New value should be true or false.")
	FinalFantasylizationOptions.Battleground = Battleground
	if Battleground == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableSleep(Sleep)
	FFZlib.Assert(Sleep == true or Sleep == false, "New value should be true or false.")
	FinalFantasylizationOptions.Sleep = Sleep
	if Sleep == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableSwim(Swim)
	FFZlib.Assert(Swim == true or Swim == false, "New value should be true or false.")
	FinalFantasylizationOptions.Swim = Swim
	if Swim == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableDead(Dead)
	FFZlib.Assert(Dead == true or Dead == false, "New value should be true or false.")
	FinalFantasylizationOptions.Dead = Dead
	if Dead == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableFlight(Flight)
	FFZlib.Assert(Flight == true or Flight == false, "New value should be true or false.")
	FinalFantasylizationOptions.Flight = Flight
	if Flight == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableCapital(Capital)
	FFZlib.Assert(Capital == true or Capital == false, "New value should be true or false.")
	FinalFantasylizationOptions.Capital = Capital
	if Capital == false then StopMusic() end
	FinalFantasylization_ClearMusicState()
end
	
function FinalFantasylizationEnableSound(Sound)
	FFZlib.Assert(Sound == true or Sound == false, "New value should be true or false.")
	FinalFantasylizationOptions.Sound = Sound
	FinalFantasylization_ClearMusicState()
end
	
function FinalFantasylizationEnableFanfare(Fanfare)
	FFZlib.Assert(Fanfare == true or Fanfare == false, "New value should be true or false.")
	FinalFantasylizationOptions.Fanfare = Fanfare
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableChocoboKweh(ChocoboKweh)
	FFZlib.Assert(ChocoboKweh == true or ChocoboKweh == false, "New value should be true or false.")
	FinalFantasylizationOptions.ChocoboKweh = ChocoboKweh
	FinalFantasylization_ClearMusicState()
end

function FinalFantasylizationEnableLevelUp(LevelUp)
	FFZlib.Assert(LevelUp == true or LevelUp == false, "New value should be true or false.")
	FinalFantasylizationOptions.LevelUp = LevelUp
	FinalFantasylization_ClearMusicState()
end
	
function FinalFantasylizationEnableDebug(Debug)
	FFZlib.Assert(Debug == true or Debug == false, "New value should be true or false.")
	FinalFantasylizationOptions.Debug = Debug
	FinalFantasylization_ClearMusicState()
end

-- Displays FinalFantasylization usage information.
function FinalFantasylizationUsage()
	FFZlib.Message(" ")
	FFZlib.MultilineMessage(Usage, FFZlib.Color.green)
	FFZlib.Message(" ")
end

function FinalFantasylizationSoundpackUsage()
	FFZlib.Message(" ")
	FFZlib.MultilineMessage(SoundpackUsage, FFZlib.Color.green)
	FFZlib.Message(" ")
end

function FinalFantasylization_PlayMusic( file )
	if( FinalFantasylizationOptions.Enabled == true ) and ( FinalFantasylizationOptions.Music == true ) then
		if( file ~= nil ) then
			PlaySound("GAMEHIGHLIGHTFRIENDLYUNIT")
			PlayMusic( file )
			PlaySound("GAMEHIGHLIGHTFRIENDLYUNIT")
		end
	end
end

function FinalFantasylization_PlayFile( file )
	if( FinalFantasylizationOptions.Enabled == true ) and ( FinalFantasylizationOptions.Sound == true ) then
		if( file ~= nil ) then
			PlaySound("GAMEHIGHLIGHTFRIENDLYUNIT")
			PlaySoundFile( file )
			PlaySound("GAMEHIGHLIGHTFRIENDLYUNIT")
		end
	end
end

function FinalFantasylization_GetMusic()

	if FinalFantasylizationOptions.Enabled == true and startFinalfantasylization == true then
		ZoneName = GetRealZoneText();
		MinimapZoneName = GetMinimapZoneText()
		SubZoneName = GetSubZoneText()
		local factionEnglish, factionLocale = UnitFactionGroup("player"); --'Horde, Alliance
		local classification = UnitClassification("target"); --'classification: "worldboss", "rareelite", "elite", "rare", "normal" or "trivial"
		local pvpType, isFFA, faction = GetZonePVPInfo(); --'("friendly";"contested";"hostile";"sanctuary") (1;nil) ("Alliance";"Horde")
		ZoneText = GetZoneText()

--'==========================================================================================
--'	Sounds
--'==========================================================================================
		if FinalFantasylization_PlayerIsCombat == false and FinalFantasylization_RegenGain == true and FinalFantasylizationOptions.Fanfare == true then
			FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. Victory)
			FinalFantasylization_Fanfare() -- Battle fanfare call
			FinalFantasylization_RegenGain = false
			if FinalFantasylization_PlayerIsCombat == true then
				StopMusic();
			end
		end
--'==========================================================================================		
--'	Music
--'==========================================================================================
		FinalFantasylization_IsPlaying = false
--###########################################################################################
--###########################################################################################
--##
--##			WORLD EVENTS
--##
--###########################################################################################
--###########################################################################################
		
--'==========================================================================================		
--'	World event: Player is Ghost
--'==========================================================================================
		if ( UnitIsGhost("player") ) and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Dead == true then
			if FinalFantasylization_PlayerIsGhosting == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. PlayerGhost)
				FinalFantasylization_PlayerGhost() -- Music call when youre a ghost.
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsGhosting = true
			FinalFantasylization_RegenGain = false
		else
			FinalFantasylization_PlayerIsGhosting = false
		end
--'==========================================================================================		
--'	World event: Player is Dead
--'==========================================================================================
		if ( UnitIsDead("player") ) and FinalFantasylizationOptions.Dead == true then
			if FinalFantasylization_PlayerIsDead == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. PlayerDie)
				FinalFantasylization_PlayerDie() -- music call for when you die.
			end
			FinalFantasylization_IsPlaying = true
			
			FinalFantasylization_PlayerIsDead = true
			FinalFantasylization_RegenGain = false
		else
			FinalFantasylization_PlayerIsDead = false
		end
--'==========================================================================================		
--'	World event: Player is On Taxi "Horde and Alliance Varyiant"
--'==========================================================================================
		if ( UnitOnTaxi("player") ) and ( factionEnglish == "Horde" ) and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Flight == true then
			if FinalFantasylization_PlayerIsTaxi == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. "Horde" .. " " .. Taxi)
				FinalFantasylization_HordeTaxi() -- music call for Taxi. ...
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsTaxi = true
		elseif ( UnitOnTaxi("player") ) and ( factionEnglish == "Alliance" ) and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Flight == true then
			if FinalFantasylization_PlayerIsTaxi == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. "Alliance" .. " " .. Taxi)
				FinalFantasylization_AllianceTaxi() -- music call for Taxi. ...
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsTaxi = true
		else
			FinalFantasylization_PlayerIsTaxi = false
		end
--'==========================================================================================		
--'	World event: Player in Combat, Mounted
--'==========================================================================================
		if IsMounted("player") and FinalFantasylization_PlayerIsCombat == true and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Mount == true then
			if FinalFantasylization_PlayerIsEscape == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. MountedEscape)
				FinalFantasylization_MountedEscape()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsEscape = true
		else
			FinalFantasylization_PlayerIsEscape = false
		end
--'==========================================================================================		
--'	World event: Player in Combat
--'==========================================================================================
		if FinalFantasylization_PlayerIsCombat == true and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Combat == true and UnitExists("target") then
			--FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombat)
			local inInstance, instanceType = IsInInstance();
			if FinalFantasylization_PlayerIsBattling == false then
				local GUID = UnitGUID("target")
				local name = UnitName("target")
				local mobID = tonumber(GUID:sub(9, 12), 16)
				if IsInInstance() then
					if instanceType == "party" then
						if LibStub("LibBossIDs-1.0").BossIDs[mobID] then
							FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatDungeonBoss .. name)
							FinalFantasylization_DungeonBoss()
						else
							FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatDungeonPVE)
							FinalFantasylization_WorldNormalPVE()
						end
					elseif instanceType == "raid" then
						if LibStub("LibBossIDs-1.0").BossIDs[mobID] then
							FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatRaidBoss .. name)
							FinalFantasylization_DungeonBoss()
						else
							FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatRaidPVE)
							FinalFantasylization_WorldNormalPVE()
						end
					elseif instanceType == "pvp" then
						if LibStub("LibBossIDs-1.0").BossIDs[mobID] then
							FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatBGBoss .. name)
							FinalFantasylization_BattlegroundBoss()
						elseif UnitIsPlayer("target") and UnitIsEnemy("player", "target") and UnitHealth("target") > 0 then
							FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatBGPVP)
							FinalFantasylization_BattlegroundPVP()
						end
					end
				elseif LibStub("LibBossIDs-1.0").BossIDs[mobID] then
					FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatWorldBoss .. name)
					FinalFantasylization_WorldBoss()
				elseif 	UnitIsPlayer("target") and UnitIsEnemy("player", "target") and UnitHealth("target") > 0 then
					FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatWorldPVP)
					FinalFantasylization_WorldPVP()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. InCombatWorldPVE)
					FinalFantasylization_WorldNormalPVE()
				end
			end

			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsBattling = true
		else
			FinalFantasylization_PlayerIsBattling = false
		end
--'==========================================================================================		
--'	World event: Player is Mounted in Hostile Zone
--'==========================================================================================
		if IsMounted("player") and ( pvpType == "hostile" ) and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Mount == true then
			if FinalFantasylization_PlayerIsHostileMounting == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. HostileEscape)
				FinalFantasylization_MountedEscape()
			end
			FinalFantasylization_IsPlaying = true 
			FinalFantasylization_PlayerIsHostileMounting = true
		else
			FinalFantasylization_PlayerIsHostileMounting = false
		end
--'==========================================================================================		
--'	World event: Player on Flying Mount "Horde and Alliance Varyiant"
--'==========================================================================================
		if IsFlying() and ( factionEnglish == "Horde" ) and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Flight == true then
			if FinalFantasylization_PlayerIsFlying == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. Flying .. "(" .. "Horde" .. ")")
				FinalFantasylization_HordeFlying()
			end
			FinalFantasylization_IsPlaying = true 
			FinalFantasylization_PlayerIsFlying = true 
		elseif IsFlying() and ( factionEnglish == "Alliance" ) and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Flight == true then
			if FinalFantasylization_PlayerIsFlying == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. Flying .. "(" .. "Alliance" .. ")")
				FinalFantasylization_AllianceFlying()
			end
			FinalFantasylization_IsPlaying = true 
			FinalFantasylization_PlayerIsFlying = true 
		else 
			FinalFantasylization_PlayerIsFlying = false 
		end
--'==========================================================================================		
--'	World event: Player is Mounted.. Chocobo!
--'==========================================================================================
		if IsMounted("player") and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Mount == true then
			if FinalFantasylization_PlayerIsMounting == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. Mounted)
				FinalFantasylization_ClearMusicState()
				FinalFantasylization_Mounted()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsMounting = true
		else			
			FinalFantasylization_PlayerIsMounting = false
		end
--'==========================================================================================		
--'	World event: Player is Swimming 
--'==========================================================================================
		if IsSwimming() ~= nil and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Swim == true then
			if FinalFantasylization_PlayerIsSwimming == false then
				if ( ZoneName == Z["Undercity"] ) or ( SubZoneName == SZ["The Sludge Fen"] ) or ( SubZoneName == SZ["Blackwolf River"] ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. Swimming2)
					FinalFantasylization_Swimming(1)
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. Swimming)
					FinalFantasylization_Swimming()
				end
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsSwimming = true
		else
			FinalFantasylization_PlayerIsSwimming = false
		end
--###########################################################################################
--###########################################################################################
--##
--##			STARTING AREAS
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Starting Areas: Sunstrider Isle, Eversong Woods ( Blood Elf Starting Area )
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Eversong Woods"] ) and ( ( MinimapZoneName == SZ["The Sunspire"] ) or ( SubZoneName == SZ["Sunstrider Isle"] ) or ( SubZoneName == SZ["Falthrien Academy"] ) or ( SubZoneName == SZ["Shrine of Dath'Remar"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaSunstriderIsle == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_StarterAreaSunstriderIsle()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InStarterAreaSunstriderIsle = true
			end
			return
		else
			FinalFantasylization_InStarterAreaSunstriderIsle = false
		end
--'==========================================================================================		
--' Starting Areas: Deathknell, Tirisfal Glades ( Undead Starting Area )
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Tirisfal Glades"] ) and ( ( SubZoneName == SZ["Deathknell"] ) or ( SubZoneName == SZ["Shadow Grave"] ) or ( SubZoneName == SZ["Night Web's Hollow"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaDeathknell == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_StarterAreaDeathknell()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InStarterAreaDeathknell = true
			end
			return
		else
			FinalFantasylization_InStarterAreaDeathknell = false
		end
--'==========================================================================================		
--' Starting Areas: Valley of Trials, Durotar ( Orc and Troll Starting Area )
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Durotar"] ) and ( ( SubZoneName == SZ["Valley of Trials"] ) or ( SubZoneName == SZ["The Den"] ) or ( SubZoneName == SZ["Burning Blade Coven"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaValleyOfTrials == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_StarterAreaValleyOfTrials()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InStarterAreaValleyOfTrials = true
			end
			return
		else
			FinalFantasylization_InStarterAreaValleyOfTrials = false
		end
--'==========================================================================================		
--' Starting Areas: Camp Narache, Mulgore ( Tauren Starting Area )
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Mulgore"] ) and ( ( SubZoneName == SZ["Camp Narache"] ) or ( SubZoneName == SZ["Red Cloud Mesa"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaCampNarache == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_StarterAreaCampNarache()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InStarterAreaCampNarache = true
			end
			return
		else
			FinalFantasylization_InStarterAreaCampNarache = false
		end
--'==========================================================================================		
--' Starting Areas: Coldridge Valley, Dun Morogh ( Dwarf and Gnome Starting Area )
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dun Morogh"] ) and ( ( SubZoneName == SZ["Coldridge Valley"] ) or ( MinimapZoneName == SZ["Anvilmar"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaColdridgeValley == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_StarterAreaColdridgeValley()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InStarterAreaColdridgeValley = true
			end
			return
		else
			FinalFantasylization_InStarterAreaColdridgeValley = false
		end
--'==========================================================================================		
--' Starting Areas: Northshire Valley, Elwynn Forest ( Human Starting Area )
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Elwynn Forest"] ) and ( ( SubZoneName == SZ["Northshire Valley"] ) or ( SubZoneName == SZ["Northshire Abbey"] ) or ( SubZoneName == SZ["Echo Ridge Mine"] ) or ( SubZoneName == SZ["Northshire Vineyards"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaNorthshireValley == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_StarterAreaNorthshireValley()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InStarterAreaNorthshireValley = true
			end
			return
		else
			FinalFantasylization_InStarterAreaNorthshireValley = false
		end
--'==========================================================================================		
--' Starting Areas: Ammen Vale, Azuremyst Isle ( Draenei Starting Area )
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Azuremyst Isle"] ) and ( ( SubZoneName == SZ["Ammen Vale"] ) or ( SubZoneName == SZ["Ammen Fields"] ) or ( SubZoneName == SZ["Crash Site"] ) or ( SubZoneName == SZ["Silverline Lake"] ) or ( SubZoneName == SZ["Nestlewood Hills"] ) or ( SubZoneName == SZ["Nestlewood Thicket"] ) or ( SubZoneName == SZ["Shadow Ridge"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaAmmenVale == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_StarterAreaAmmenVale()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InStarterAreaAmmenVale = true
			end
			return
		else
			FinalFantasylization_InStarterAreaAmmenVale = false
		end
--'==========================================================================================		
--' Starting Areas: Shadowglen, Teldrassil ( Night Elf Starting Area )
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Teldrassil"] ) and ( ( SubZoneName == SZ["Shadowglen"] ) or ( SubZoneName == SZ["Aldrassil"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaShadowglen == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_StarterAreaShadowglen()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InStarterAreaShadowglen = true
			end
			return
		else
			FinalFantasylization_InStarterAreaShadowglen = false
		end
--'==========================================================================================		
--' Starting Areas: Acherus: The Ebon Hold ( Death Knight Starting Area )
--'==========================================================================================
		if ( ZoneName == Z["Plaguelands: The Scarlet Enclave"] ) and ( ( SubZoneName == SZ["Acherus: The Ebon Hold"] ) or ( SubZoneName == SZ["The Heart of Acherus"] ) or ( SubZoneName == SZ["Hall of Command"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscEbonHold == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_EbonHoldSong()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscEbonHold = true
			return
		else
			FinalFantasylization_InMiscEbonHold = false
		end
--'==========================================================================================		
--' Starting Areas: Plaguelands: Scarlet Enclave ( Death Knight Starting Area )
--'==========================================================================================
		if ( ZoneName == Z["Plaguelands: The Scarlet Enclave"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InStarterAreaScarletEnclave == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_StarterAreaScarletEnclave()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InStarterAreaScarletEnclave = true
			return
		else
			FinalFantasylization_InStarterAreaScarletEnclave = false
		end
	
--###########################################################################################
--###########################################################################################
--##
--##			HORDE CAPITAL CITIES
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Horde Capital Cities: Orgrimmar
--'==========================================================================================
		if ( ZoneName == Z["Orgrimmar"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityOrgrimmar == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_OrgrimmarSong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InCityOrgrimmar = true
			end
			return
		else
			FinalFantasylization_InCityOrgrimmar = false
		end
--'==========================================================================================		
--' Horde Capital Cities: Silvermoon City
--'==========================================================================================
		if ( ( ZoneName == Z["Silvermoon City"] ) or ( SubZoneName == SZ["The Shepherd's Gate"] ) ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCitySilvermoonCity == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_SilvermoonCitySong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InCitySilvermoonCity = true
			end
			return
		else
			FinalFantasylization_InCitySilvermoonCity = false
		end
--'==========================================================================================		
--' Horde Capital Cities: Thunder Bluff
--'==========================================================================================
		if ( ZoneName == Z["Thunder Bluff"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityThunderBluff == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_ThunderBluffSong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InCityThunderBluff = true
			end
			return
		else
			FinalFantasylization_InCityThunderBluff = false
		end
--'==========================================================================================		
--' Horde Capital Cities: Undercity
--'==========================================================================================
		if ( ( ZoneName == Z["Undercity"] ) or ( SubZoneName == SZ["Ruins of Lordaeron"] ) ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityUndercity == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_UndercitySong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InCityUndercity = true
			end
			return
		else
			FinalFantasylization_InCityUndercity = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			ALLIANCE CAPITAL CITIES
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Alliance Capital Cities: Darnassus
--'==========================================================================================
		if ( ZoneName == Z["Darnassus"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityDarnassus == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_DarnassusSong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InCityDarnassus = true
			end
			return
		else
			FinalFantasylization_InCityDarnassus = false
		end
--'==========================================================================================		
--' Alliance Capital Cities: Ironforge
--'==========================================================================================
		if ( ( ZoneName == Z["Ironforge"] ) or ( SubZoneName == SZ["Gates of Ironforge"] ) ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityIronforge == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_IronforgeSong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InCityIronforge = true
			end
			return
		else
			FinalFantasylization_InCityIronforge = false
		end
--'==========================================================================================		
--' Alliance Capital Cities: Stormwind City
--'==========================================================================================
		if ( ZoneName == Z["Stormwind City"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityStormwind == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_StormwindCitySong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InCityStormwind = true
		
			end
			return
		else
			FinalFantasylization_InCityStormwind = false
		end
--'==========================================================================================		
--' Alliance Capital Cities: The Exodar
--'==========================================================================================
		if ( ZoneName == Z["The Exodar"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityExodar == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_ExodarSong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName.. PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InCityExodar = true
			end
			return
		else
			FinalFantasylization_InCityExodar = false
		end
--###########################################################################################
--###########################################################################################
--##
--##			NEUTRAL CAPITAL CITIES
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Neutral Capital Cities: Area 52, Netherstorm
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Netherstorm"] ) and ( SubZoneName ==Z["Area 52"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityArea52 == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName)
				FinalFantasylization_CityArea52()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InCityArea52 = true
			return
		else
			FinalFantasylization_InCityArea52 = false
		end
--'==========================================================================================		
--' Neutral Capital Cities: Booty Bay, Stranglethorn Vale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Stranglethorn Vale"] ) and ( SubZoneName == SZ["Booty Bay"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityBootyBay == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName)
				FinalFantasylization_CityBootyBay()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InCityBootyBay = true
			return
		else
			FinalFantasylization_InCityBootyBay = false
		end
--'==========================================================================================		
--' Neutral Capital Cities: Dalaran
--'==========================================================================================
		if ( ZoneName == Z["Dalaran"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityDalaran == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_DalaranSong()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InCityDalaran = true
			return
		else
			FinalFantasylization_InCityDalaran = false
		end
--'==========================================================================================		
--' Neutral Capital Cities: Acherus: The Ebon Hold, Eastern Plaguelands
--'==========================================================================================
		if ( ZoneName == Z["Eastern Plaguelands"] ) and ( SubZoneName == SZ["Acherus: The Ebon Hold"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityEbonHold == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName)
				FinalFantasylization_EbonHoldSong()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InCityEbonHold = true
			return
		else
			FinalFantasylization_InCityEbonHold = false
		end
--'==========================================================================================		
--' Neutral Capital Cities: Everlook, Winterspring
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Winterspring"] ) and ( SubZoneName == SZ["Everlook"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityEverlook == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName)
				FinalFantasylization_CityEverlook()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InCityEverlook = true
			return
		else
			FinalFantasylization_InCityEverlook = false
		end
--'==========================================================================================		
--' Neutral Capital Cities: Gadgetzan, Tanaris
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Tanaris"] ) and ( SubZoneName == SZ["Gadgetzan"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityGadgetzan == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName)
				FinalFantasylization_CityGadgetzan()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InCityGadgetzan = true
			return
		else
			FinalFantasylization_InCityGadgetzan = false
		end
--'==========================================================================================		
--' Neutral Capital Cities: Ratchet, The Barrens
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Barrens"] ) and ( SubZoneName == SZ["Ratchet"] ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityRatchet == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName)
				FinalFantasylization_CityRatchet()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InCityRatchet = true
			return
		else
			FinalFantasylization_InCityRatchet = false
		end
--'==========================================================================================		
--' Neutral Capital Cities: Shattrath City
--'==========================================================================================
		if ( ( ZoneName == Z["Shattrath City"] ) or ( SubZoneName == SZ["Lower City"] ) ) and FinalFantasylizationOptions.Capital == true and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InCityShattrathCity == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_ShattrathCitySong()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InCityShattrathCity = true
			return
		else
			FinalFantasylization_InCityShattrathCity = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			HORDE TOWNS
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Horde Towns: Agmar's Hammer, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and ( SubZoneName == SZ["Agmar's Hammer"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownAgmarsHammer == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownAgmarsHammer()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownAgmarsHammer = true
			end
			return
		else
			FinalFantasylization_InHordeTownAgmarsHammer = false
		end
--'==========================================================================================		
--' Horde Towns: Apothecary Camp, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["Apothecary Camp"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownApothecaryCamp == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownApothecaryCamp()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownApothecaryCamp = true
			end
			return
		else
			FinalFantasylization_InHordeTownApothecaryCamp = false
		end
--'==========================================================================================		
--' Horde Towns: Bloodhoof Village, Mulgore
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Mulgore"] ) and ( SubZoneName == SZ["Bloodhoof Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownBloodhoofVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownBloodhoofVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownBloodhoofVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownBloodhoofVillage = false
		end
--'==========================================================================================		
--' Horde Towns: Bloodvenom Post, Felwood
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Felwood"] ) and ( SubZoneName == SZ["Bloodvenom Post"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownBloodvenomPost == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownBloodvenomPost()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownBloodvenomPost = true
			end
			return
		else
			FinalFantasylization_InHordeTownBloodvenomPost = false
		end
--'==========================================================================================		
--' Horde Towns: Brackenwall Village, Dustwallow Marsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dustwallow Marsh"] ) and ( SubZoneName == SZ["Brackenwall Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownBrackenwallVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownBrackenwallVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownBrackenwallVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownBrackenwallVillage = false
		end
--'==========================================================================================		
--' Horde Towns: Brill, Tirisfal Glades
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Tirisfal Glades"] ) and ( ( SubZoneName == SZ["Brill"] ) or ( SubZoneName == SZ["Brill Town Hall"] ) )and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownBrill == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownBrill()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownBrill = true
			end
			return
		else
			FinalFantasylization_InHordeTownBrill = false
		end
--'==========================================================================================		
--' Horde Towns: Bor'gorok Outpost, Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and ( ( SubZoneName == SZ["Bor'Gorok Outpost"] ) or ( SubZoneName == SZ["Bor'gorok Outpost"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownBorgorokOutpost == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownBorgorokOutpost()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownBorgorokOutpost = true
			end
			return
		else
			FinalFantasylization_InHordeTownBorgorokOutpost = false
		end
--'==========================================================================================		
--' Horde Towns: Camp Mojache, Feralas
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Feralas"] ) and ( SubZoneName == SZ["Camp Mojache"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownCampMojache == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownCampMojache()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownCampMojache = true
			end
			return
		else
			FinalFantasylization_InHordeTownCampMojache = false
		end
--'==========================================================================================		
--' Horde Towns: Camp Oneqwah, Grizzly Hills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Grizzly Hills"] ) and ( ( SubZoneName == SZ["Camp Oneqwah"] ) or ( SubZoneName == SZ["Camp One'Qwah"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownCampOneqwah == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownCampOneqwah()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownCampOneqwah = true
			end
			return
		else
			FinalFantasylization_InHordeTownCampOneqwah = false
		end
--'==========================================================================================		
--' Horde Towns: Camp Taurajo, The Barrens
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Barrens"] ) and ( SubZoneName == SZ["Camp Taurajo"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownCampTaurajo == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownCampTaurajo()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownCampTaurajo = true
			end
			return
		else
			FinalFantasylization_InHordeTownCampTaurajo = false
		end
--'==========================================================================================		
--' Horde Towns: Camp Tunka'lo, The Storm Peaks
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Storm Peaks"] ) and ( SubZoneName == SZ["Camp Tunka'lo"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownCampTunkalo == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownCampTunkalo()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownCampTunkalo = true
			end
			return
		else
			FinalFantasylization_InHordeTownCampTunkalo = false
		end
--'==========================================================================================		
--' Horde Towns: Camp Winterhoof, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["Camp Winterhoof"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownCampWinterhoof == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownCampWinterhoof()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownCampWinterhoof = true
			end
			return
		else
			FinalFantasylization_InHordeTownCampWinterhoof = false
		end
--'==========================================================================================		
--' Horde Towns: Conquest Hold, Grizzly Hills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Grizzly Hills"] ) and ( SubZoneName == SZ["Conquest Hold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownConquestHold == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownConquestHold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownConquestHold = true
			end
			return
		else
			FinalFantasylization_InHordeTownConquestHold = false
		end
--'==========================================================================================		
--' Horde Towns: The Crossroads, The Barrens
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Barrens"] ) and ( SubZoneName == SZ["The Crossroads"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownCrossroads == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownCrossroads()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownCrossroads = true
			end
			return
		else
			FinalFantasylization_InHordeTownCrossroads = false
		end
--'==========================================================================================		
--' Horde Towns: Fairbreeze Village, Eversong Woods
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Eversong Woods"] ) and ( SubZoneName == SZ["Fairbreeze Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownFairbreezeVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownFairbreezeVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownFairbreezeVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownFairbreezeVillage = false
		end
--'==========================================================================================		
--' Horde Towns: Falcon Watch, Hellfire Peninsula
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hellfire Peninsula"] ) and ( SubZoneName == SZ["Falcon Watch"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownFalconWatch == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownFalconWatch()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownFalconWatch = true
			end
			return
		else
			FinalFantasylization_InHordeTownFalconWatch = false
		end
--'==========================================================================================		
--' Horde Towns: Falconwing Square, Eversong Woods
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Eversong Woods"] ) and ( SubZoneName == SZ["Falconwing Square"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownFalconwingSquare == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownFalconwingSquare()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownFalconwingSquare = true
			end
			return
		else
			FinalFantasylization_InHordeTownFalconwingSquare = false
		end
--'==========================================================================================		
--' Horde Towns: Flame Crest, Burning Steppes
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Burning Steppes"] ) and ( SubZoneName == SZ["Flame Crest"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownFlameCrest == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownFlameCrest()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownFlameCrest = true
			end
			return
		else
			FinalFantasylization_InHordeTownFlameCrest = false
		end
--'==========================================================================================		
--' Horde Towns: Freewind Post, Thousand Needles
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Thousand Needles"] ) and ( SubZoneName == SZ["Freewind Post"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownFreewindPost == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownFreewindPost()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownFreewindPost = true
			end
			return
		else
			FinalFantasylization_InHordeTownFreewindPost = false
		end
--'==========================================================================================		
--' Horde Towns: Garadar, Nagrand
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Nagrand"] ) and ( SubZoneName == SZ["Garadar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownGaradar == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownGaradar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownGaradar = true
			end
			return
		else
			FinalFantasylization_InHordeTownGaradar = false
		end
--'==========================================================================================		
--' Horde Towns: Ghost Walker Post, Desolace
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Desolace"] ) and ( SubZoneName == SZ["Ghost Walker Post"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownGhostWalkerPost == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownGhostWalkerPost()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownGhostWalkerPost = true
			end
			return
		else
			FinalFantasylization_InHordeTownGhostWalkerPost = false
		end
--'==========================================================================================		
--' Horde Towns: Grom'arsh Crash-Site, The Storm Peaks
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Storm Peaks"] ) and ( SubZoneName == SZ["Grom'arsh Crash-Site"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownGromarshCrashSite == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownGromarshCrashSite()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownGromarshCrashSite = true
			end
			return
		else
			FinalFantasylization_InHordeTownGromarshCrashSite = false
		end
--'==========================================================================================		
--' Horde Towns: Grom'gol Base Camp, Stranglethorn Vale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Stranglethorn Vale"] ) and ( ( SubZoneName == SZ["Grom'gol Base Camp"] ) or ( SubZoneName == SZ["Grom'Gol Base Camp"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownGromgolBaseCamp == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownGromgolBaseCamp()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownGromgolBaseCamp = true
			end
			return
		else
			FinalFantasylization_InHordeTownGromgolBaseCamp = false
		end
--'==========================================================================================		
--' Horde Towns: Hammerfall, Arathi Highlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Arathi Highlands"] ) and ( SubZoneName == SZ["Hammerfall"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownHammerfall == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownHammerfall()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownHammerfall = true
			end
			return
		else
			FinalFantasylization_InHordeTownHammerfall = false
		end
--'==========================================================================================		
--' Horde Towns: Kargath, Badlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Badlands"] ) and ( SubZoneName == SZ["Kargath"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownKargath == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownKargath()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownKargath = true
			end
			return
		else
			FinalFantasylization_InHordeTownKargath = false
		end
--'==========================================================================================		
--' Horde Towns: Kor'kron Vanguard, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and ( ( SubZoneName == SZ["Kor'kron Vanguard"] ) or ( SubZoneName == SZ["Kor'Kron Vanguard"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownKorkronVanguard == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownKorkronVanguard()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownKorkronVanguard = true
			end
			return
		else
			FinalFantasylization_InHordeTownKorkronVanguard = false
		end
--'==========================================================================================		
--' Horde Towns: Mok'Nathal Village, Blade's Edge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blade's Edge Mountains"] ) and ( SubZoneName == SZ["Mok'Nathal Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownMokNathalVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownMokNathalVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownMokNathalVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownMokNathalVillage = false
		end
--'==========================================================================================		
--' Horde Towns: New Agamand, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["New Agamand"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownNewAgamand == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownNewAgamand()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownNewAgamand = true
			end
			return
		else
			FinalFantasylization_InHordeTownNewAgamand = false
		end
--'==========================================================================================		
--' Horde Towns: Razor Hill, Durotar
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Durotar"] ) and ( SubZoneName == SZ["Razor Hill"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownRazorHill == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownRazorHill()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownRazorHill = true
			end
			return
		else
			FinalFantasylization_InHordeTownRazorHill = false
		end
--'==========================================================================================		
--' Horde Towns: Revantusk Village, The Hinterlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Hinterlands"] ) and ( SubZoneName == SZ["Revantusk Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownRevantuskVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownRevantuskVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownRevantuskVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownRevantuskVillage = false
		end
--'==========================================================================================		
--' Horde Towns: Sen'jin Village, Durotar
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Durotar"] ) and ( SubZoneName == SZ["Sen'jin Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownSenjinVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownSenjinVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownSenjinVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownSenjinVillage = false
		end
--'==========================================================================================		
--' Horde Towns: The Sepulcher, Silverpine Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Silverpine Forest"] ) and ( SubZoneName == SZ["The Sepulcher"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownSepulcher == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownSepulcher()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownSepulcher = true
			end
			return
		else
			FinalFantasylization_InHordeTownSepulcher = false
		end
--'==========================================================================================		
--' Horde Towns: Shadowmoon Village, Shadowmoon Valley
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Shadowmoon Valley"] ) and ( SubZoneName == SZ["Shadowmoon Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownShadowmoonVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownShadowmoonVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownShadowmoonVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownShadowmoonVillage = false
		end
--'==========================================================================================		
--' Horde Towns: Shadowprey Village, Desolace
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Desolace"] ) and ( SubZoneName == SZ["Shadowprey Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownShadowpreyVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownShadowpreyVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownShadowpreyVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownShadowpreyVillage = false
		end
--'==========================================================================================		
--' Horde Towns: Splintertree Post, Ashenvale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Ashenvale"] ) and ( SubZoneName == SZ["Splintertree Post"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownSplintertreePost == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownSplintertreePost()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownSplintertreePost = true
			end
			return
		else
			FinalFantasylization_InHordeTownSplintertreePost = false
		end
--'==========================================================================================		
--' Horde Towns: Stonard, Swamp of Sorrows
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Swamp of Sorrows"] ) and ( SubZoneName == SZ["Stonard"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownStonard == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownStonard()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownStonard = true
			end
			return
		else
			FinalFantasylization_InHordeTownStonard = false
		end
--'==========================================================================================		
--' Horde Towns: Stonebreaker Hold, Terokkar Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Terokkar Forest"] ) and ( SubZoneName == SZ["Stonebreaker Hold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownStonebreakerHold == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownStonebreakerHold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownStonebreakerHold = true
			end
			return
		else
			FinalFantasylization_InHordeTownStonebreakerHold = false
		end
--'==========================================================================================		
--' Horde Towns: Sunreaver's Command, Crystalsong Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Crystalsong Forest"] ) and ( SubZoneName == SZ["Sunreaver's Command"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownSunreaversCommand == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownSunreaversCommand()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownSunreaversCommand = true
			end
			return
		else
			FinalFantasylization_InHordeTownSunreaversCommand = false
		end
--'==========================================================================================		
--' Horde Towns: Sun Rock Retreat, Stonetalon Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Stonetalon Mountains"] ) and ( SubZoneName == SZ["Sun Rock Retreat"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownSunRockRetreat == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownSunRockRetreat()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownSunRockRetreat = true
			end
			return
		else
			FinalFantasylization_InHordeTownSunRockRetreat = false
		end
--'==========================================================================================		
--' Horde Towns: Swamprat Post, Zangarmarsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zangarmarsh"] ) and ( SubZoneName == SZ["Swamprat Post"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownSwampratPost == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownSwampratPost()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownSwampratPost = true
			end
			return
		else
			FinalFantasylization_InHordeTownSwampratPost = false
		end
--'==========================================================================================		
--' Horde Towns: Tarren Mill, Hillsbrad Foothills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hillsbrad Foothills"] ) and ( SubZoneName == SZ["Tarren Mill"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownTarrenMill == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownTarrenMill()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownTarrenMill = true
			end
			return
		else
			FinalFantasylization_InHordeTownTarrenMill = false
		end
--'==========================================================================================		
--' Horde Towns: Taunka'le Village, Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and ( SubZoneName == SZ["Taunka'le Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownTaunkaleVillage == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownTaunkaleVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownTaunkaleVillage = true
			end
			return
		else
			FinalFantasylization_InHordeTownTaunkaleVillage = false
		end
--'==========================================================================================		
--' Horde Towns: Thrallmar, Hellfire Peninsula
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hellfire Peninsula"] ) and ( SubZoneName == SZ["Thrallmar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownThrallmar == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownThrallmar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownThrallmar = true
			end
			return
		else
			FinalFantasylization_InHordeTownThrallmar = false
		end
--'==========================================================================================		
--' Horde Towns: Thunderlord Stronghold, Blade's Edge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blade's Edge Mountains"] ) and ( SubZoneName == SZ["Thunderlord Stronghold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownThunderlordStronghold == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownThunderlordStronghold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownThunderlordStronghold = true
			end
			return
		else
			FinalFantasylization_InHordeTownThunderlordStronghold = false
		end
--'==========================================================================================		
--' Horde Towns: Tranquillien, Ghostlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Ghostlands"] ) and ( SubZoneName == SZ["Tranquillien"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownTranquillien == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownTranquillien()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownTranquillien = true
			end
			return
		else
			FinalFantasylization_InHordeTownTranquillien = false
		end
--'==========================================================================================		
--' Horde Towns: Valormok, Azshara
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Azshara"] ) and ( SubZoneName == SZ["Valormok"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownValormok == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownValormok()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownValormok = true
			end
			return
		else
			FinalFantasylization_InHordeTownValormok = false
		end
--'==========================================================================================		
--' Horde Towns: Vengeance Landing, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["Vengeance Landing"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownVengeanceLanding == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownVengeanceLanding()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownVengeanceLanding = true
			end
			return
		else
			FinalFantasylization_InHordeTownVengeanceLanding = false
		end
--'==========================================================================================		
--' Horde Towns: Venomspite, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and ( SubZoneName == SZ["Venomspite"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownVenomspite == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownVenomspite()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownVenomspite = true
			end
			return
		else
			FinalFantasylization_InHordeTownVenomspite = false
		end
--'==========================================================================================		
--' Horde Towns: Warsong Hold, Borean Tundra
--'==========================================================================================
		if ( ZoneName == Z["Borean Tundra"] ) and ( SubZoneName == SZ["Warsong Hold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownWarsongHold == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownWarsongHold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownWarsongHold = true
			end
			return
		else
			FinalFantasylization_InHordeTownWarsongHold = false
		end
--'==========================================================================================		
--' Horde Towns: Zabra'jin, Zangarmarsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zangarmarsh"] ) and ( SubZoneName == SZ["Zabra'jin"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownZabrajin == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownZabrajin()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownZabrajin = true
			end
			return
		else
			FinalFantasylization_InHordeTownZabrajin = false
		end
--'==========================================================================================		
--' Horde Towns: Zoram'gar Outpost, Ashenvale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Ashenvale"] ) and ( SubZoneName == SZ["Zoram'gar Outpost"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InHordeTownZoramgarOutpost == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_HordeTownZoramgarOutpost()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InHordeTownZoramgarOutpost = true
			end
			return
		else
			FinalFantasylization_InHordeTownZoramgarOutpost = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			ALLIANCE TOWNS
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Alliance Towns: Aerie Peak, The Hinterlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Hinterlands"] ) and ( SubZoneName == SZ["Aerie Peak"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownAeriePeak == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownAeriePeak()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownAeriePeak = true
			end
			return
		else
			FinalFantasylization_InAllianceTownAeriePeak = false
		end
--'==========================================================================================		
--' Alliance Towns: Allerian Stronghold, Terokkar Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Terokkar Forest"] ) and ( SubZoneName == SZ["Allerian Stronghold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownAllerianStronghold == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownAllerianStronghold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownAllerianStronghold = true
			end
			return
		else
			FinalFantasylization_InAllianceTownAllerianStronghold = false
		end
--'==========================================================================================		
--' Alliance Towns: Amberpine Lodge, Grizzly Hills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Grizzly Hills"] ) and ( SubZoneName == SZ["Amberpine Lodge"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownAmberpineLodge == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownAmberpineLodge()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownAmberpineLodge = true
			end
			return
		else
			FinalFantasylization_InAllianceTownAmberpineLodge = false
		end
--'==========================================================================================		
--' Alliance Towns: Astranaar, Ashenvale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Ashenvale"] ) and ( SubZoneName == SZ["Astranaar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownAstranaar == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownAstranaar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownAstranaar = true
			end
			return
		else
			FinalFantasylization_InAllianceTownAstranaar = false
		end
--'==========================================================================================		
--' Alliance Towns: Auberdine, Darkshore
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Darkshore"] ) and ( SubZoneName == SZ["Auberdine"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownAuberdine == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownAuberdine()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownAuberdine = true
			end
			return
		else
			FinalFantasylization_InAllianceTownAuberdine = false
		end
--'==========================================================================================		
--' Alliance Towns: Azure Watch, Azuremyst Isle
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Azuremyst Isle"] ) and ( SubZoneName == SZ["Azure Watch"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownAzureWatch == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownAzureWatch()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownAzureWatch = true
			end
			return
		else
			FinalFantasylization_InAllianceTownAzureWatch = false
		end
--'==========================================================================================		
--' Alliance Towns: Bael Modan, The Barrens
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Barrens"] ) and ( SubZoneName == SZ["Bael Modan"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownBaelModan == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownBaelModan()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownBaelModan = true
			end
			return
		else
			FinalFantasylization_InAllianceTownBaelModan = false
		end
--'==========================================================================================		
--' Alliance Towns: Blood Watch, Bloodmyst Isle
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Bloodmyst Isle"] ) and ( SubZoneName == SZ["Blood Watch"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownBloodWatch == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownBloodWatch()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownBloodWatch = true
			end
			return
		else
			FinalFantasylization_InAllianceTownBloodWatch = false
		end
--'==========================================================================================		
--' Alliance Towns: Brackwell Pumpkin Patch, Elwynn Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Elwynn Forest"] ) and ( SubZoneName == SZ["Brackwell Pumpkin Patch"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownBrackwellPumpkinPatch == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownBrackwellPumpkinPatch()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownBrackwellPumpkinPatch = true
			end
			return
		else
			FinalFantasylization_InAllianceTownBrackwellPumpkinPatch = false
		end
--'==========================================================================================		
--' Alliance Towns: Brewnall Village, Dun Morogh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dun Morogh"] ) and ( SubZoneName == SZ["Brewnall Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownBrewnallVillage == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownBrewnallVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownBrewnallVillage = true
			end
			return
		else
			FinalFantasylization_InAllianceTownBrewnallVillage = false
		end
--'==========================================================================================		
--' Alliance Towns: Chillwind Camp, Western Plaguelands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Western Plaguelands"] ) and ( SubZoneName == SZ["Chillwind Camp"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownChillwindCamp == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownChillwindCamp()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownChillwindCamp = true
			end
			return
		else
			FinalFantasylization_InAllianceTownChillwindCamp = false
		end
--'==========================================================================================		
--' Alliance Towns: Darkshire, Duskwood
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Duskwood"] ) and ( SubZoneName == SZ["Darkshire"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownDarkshire == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownDarkshire()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownDarkshire = true
			end
			return
		else
			FinalFantasylization_InAllianceTownDarkshire = false
		end
--'==========================================================================================		
--' Alliance Towns: Dolanaar, Teldrassil
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Teldrassil"] ) and ( SubZoneName == SZ["Dolanaar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownDolanaar == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownDolanaar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownDolanaar = true
			end
			return
		else
			FinalFantasylization_InAllianceTownDolanaar = false
		end
--'==========================================================================================		
--' Alliance Towns: Eastvale Logging Camp, Elwynn Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Elwynn Forest"] ) and ( SubZoneName == SZ["Eastvale Logging Camp"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownEastvaleLoggingCamp == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownEastvaleLoggingCamp()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownEastvaleLoggingCamp = true
			end
			return
		else
			FinalFantasylization_InAllianceTownEastvaleLoggingCamp = false
		end
--'==========================================================================================		
--' Alliance Towns: Explorers' League Outpost, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["Explorers' League Outpost"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownExplorersLeagueOutpost == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownExplorersLeagueOutpost()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownExplorersLeagueOutpost = true
			end
			return
		else
			FinalFantasylization_InAllianceTownExplorersLeagueOutpost = false
		end
--'==========================================================================================		
--' Alliance Towns: Feathermoon Stronghold, Feralas
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Feralas"] ) and ( SubZoneName == SZ["Feathermoon Stronghold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownFeathermoonStronghold == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownFeathermoonStronghold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownFeathermoonStronghold = true
			end
			return
		else
			FinalFantasylization_InAllianceTownFeathermoonStronghold = false
		end
--'==========================================================================================		
--' Alliance Towns: Fizzcrank Airstrip, Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and ( SubZoneName == SZ["Fizzcrank Airstrip"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownFizzcrankAirstrip == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownFizzcrankAirstrip()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownFizzcrankAirstrip = true
			end
			return
		else
			FinalFantasylization_InAllianceTownFizzcrankAirstrip = false
		end
--'==========================================================================================		
--' Alliance Towns: Fordragon Hold, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and ( SubZoneName == SZ["Fordragon Hold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownFordragonHold == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownFordragonHold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownFordragonHold = true
			end
			return
		else
			FinalFantasylization_InAllianceTownFordragonHold = false
		end
--'==========================================================================================		
--' Alliance Towns: Forest Song, Ashenvale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Ashenvale"] ) and ( SubZoneName == SZ["Forest Song"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownForestSong == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownForestSong()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownForestSong = true
			end
			return
		else
			FinalFantasylization_InAllianceTownForestSong = false
		end
--'==========================================================================================		
--' Alliance Towns: Fort Wildervar, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( ( SubZoneName == SZ["Fort Wildervar"] ) or ( SubZoneName == SZ["Fort Wildevar"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownFortWildervar == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownFortWildervar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownFortWildervar = true
			end
			return
		else
			FinalFantasylization_InAllianceTownFortWildervar = false
		end
--'==========================================================================================		
--' Alliance Towns: Frosthold, The Storm Peaks
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Storm Peaks"] ) and ( SubZoneName == SZ["Frosthold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownFrosthold == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownFrosthold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownFrosthold = true
			end
			return
		else
			FinalFantasylization_InAllianceTownFrosthold = false
		end
--'==========================================================================================		
--' Alliance Towns: Goldshire, Elwynn Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Elwynn Forest"] ) and ( SubZoneName == SZ["Goldshire"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownGoldshire == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownGoldshire()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownGoldshire = true
			end
			return
		else
			FinalFantasylization_InAllianceTownGoldshire = false
		end
--'==========================================================================================		
--' Alliance Towns: Hillsbrad Fields, Hillsbrad Foothills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hillsbrad Foothills"] ) and ( SubZoneName == SZ["Hillsbrad Fields"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownHillsbradFields == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownHillsbradFields()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownHillsbradFields = true
			end
			return
		else
			FinalFantasylization_InAllianceTownHillsbradFields = false
		end
--'==========================================================================================		
--' Alliance Towns: Honor Hold, Hellfire Peninsula
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hellfire Peninsula"] ) and ( SubZoneName == SZ["Honor Hold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownHonorHold == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownHonorHold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownHonorHold = true
			end
			return
		else
			FinalFantasylization_InAllianceTownHonorHold = false
		end
--'==========================================================================================		
--' Alliance Towns: Kharanos, Dun Morogh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dun Morogh"] ) and ( SubZoneName == SZ["Kharanos"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownKharanos == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownKharanos()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownKharanos = true
			end
			return
		else
			FinalFantasylization_InAllianceTownKharanos = false
		end
--'==========================================================================================		
--' Alliance Towns: Lakeshire, Redridge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Redridge Mountains"] ) and ( SubZoneName == SZ["Lakeshire"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownLakeshire == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownLakeshire()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownLakeshire = true
			end
			return
		else
			FinalFantasylization_InAllianceTownLakeshire = false
		end
--'==========================================================================================		
--' Alliance Towns: The Maclure Vineyards, Elwynn Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Elwynn Forest"] ) and ( SubZoneName == SZ["The Maclure Vineyards"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownMaclureVineyards == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownMaclureVineyards()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownMaclureVineyards = true
			end
			return
		else
			FinalFantasylization_InAllianceTownMaclureVineyards = false
		end
--'==========================================================================================		
--' Alliance Towns: Menethil Harbor, Wetlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Wetlands"] ) and ( SubZoneName == SZ["Menethil Harbor"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownMenethilHarbor == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownMenethilHarbor()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownMenethilHarbor = true
			end
			return
		else
			FinalFantasylization_InAllianceTownMenethilHarbor = false
		end
--'==========================================================================================		
--' Alliance Towns: Morgan's Vigil, Burning Steppes
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Burning Steppes"] ) and ( SubZoneName == SZ["Morgan's Vigil"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownMorgansVigil == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownMorgansVigil()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownMorgansVigil = true
			end
			return
		else
			FinalFantasylization_InAllianceTownMorgansVigil = false
		end
--'==========================================================================================		
--' Alliance Towns: Nethergarde Keep, Blasted Lands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blasted Lands"] ) and ( SubZoneName == SZ["Nethergarde Keep"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownNethergardeKeep == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownNethergardeKeep()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownNethergardeKeep = true
			end
			return
		else
			FinalFantasylization_InAllianceTownNethergardeKeep = false
		end
--'==========================================================================================		
--' Alliance Towns: Nijel's Point, Desolace
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Desolace"] ) and ( SubZoneName == SZ["Nijel's Point"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownNijelsPoint == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownNijelsPoint()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownNijelsPoint = true
			end
			return
		else
			FinalFantasylization_InAllianceTownNijelsPoint = false
		end
--'==========================================================================================		
--' Alliance Towns: Orebor Harborage, Zangarmarsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zangarmarsh"] ) and ( SubZoneName == SZ["Orebor Harborage"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownOreborHarborage == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownOreborHarborage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownOreborHarborage = true
			end
			return
		else
			FinalFantasylization_InAllianceTownOreborHarborage = false
		end
--'==========================================================================================		
--' Alliance Towns: Pyrewood Village, Silverpine Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Silverpine Forest"] ) and ( SubZoneName == SZ["Pyrewood Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownPyrewoodVillage == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownPyrewoodVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownPyrewoodVillage = true
			end
			return
		else
			FinalFantasylization_InAllianceTownPyrewoodVillage = false
		end
--'==========================================================================================		
--' Alliance Towns: Rebel Camp, Stranglethorn Vale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Stranglethorn Vale"] ) and ( SubZoneName == SZ["Rebel Camp"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownRebelCamp == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownRebelCamp()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownRebelCamp = true
			end
			return
		else
			FinalFantasylization_InAllianceTownRebelCamp = false
		end
--'==========================================================================================		
--' Alliance Towns: Refuge Pointe, Arathi Highlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Arathi Highlands"] ) and ( SubZoneName == SZ["Refuge Pointe"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownRefugePointe == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownRefugePointe()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownRefugePointe = true
			end
			return
		else
			FinalFantasylization_InAllianceTownRefugePointe = false
		end
--'==========================================================================================		
--' Alliance Towns: Rut'theran Village, Teldrassil
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Teldrassil"] ) and ( ( SubZoneName == SZ["Rut'theran Village"] ) or ( SubZoneName == SZ["Rut'Theran Village"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownRuttheranVillage == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownRuttheranVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownRuttheranVillage = true
			end
			return
		else
			FinalFantasylization_InAllianceTownRuttheranVillage = false
		end
--'==========================================================================================		
--' Alliance Towns: Sentinel Hill, Westfall
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Westfall"] ) and ( SubZoneName == SZ["Sentinel Hill"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownSentinelHill == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownSentinelHill()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownSentinelHill = true
			end
			return
		else
			FinalFantasylization_InAllianceTownSentinelHill = false
		end
--'==========================================================================================		
--' Alliance Towns: Southshore, Hillsbrad Foothills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hillsbrad Foothills"] ) and ( SubZoneName == SZ["Southshore"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownSouthshore == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownSouthshore()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownSouthshore = true
			end
			return
		else
			FinalFantasylization_InAllianceTownSouthshore = false
		end
--'==========================================================================================		
--' Alliance Towns: Starfall Village, Winterspring
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Winterspring"] ) and ( SubZoneName == SZ["Starfall Village"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownStarfallVillage == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownStarfallVillage()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownStarfallVillage = true
			end
			return
		else
			FinalFantasylization_InAllianceTownStarfallVillage = false
		end
--'==========================================================================================		
--' Alliance Towns: Stars' Rest, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and ( ( SubZoneName == SZ["Star's Rest"] ) or ( SubZoneName == SZ["Stars' Rest"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownStarsRest == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownStarsRest()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownStarsRest = true
			end
			return
		else
			FinalFantasylization_InAllianceTownStarsRest = false
		end
--'==========================================================================================		
--' Alliance Towns: Steelgrill's Depot, Dun Morogh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dun Morogh"] ) and ( SubZoneName == SZ["Steelgrill's Depot"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownSteelgrillsDepot == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownSteelgrillsDepot()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownSteelgrillsDepot = true
			end
			return
		else
			FinalFantasylization_InAllianceTownSteelgrillsDepot = false
		end
--'==========================================================================================		
--' Alliance Towns: Stonefield Farm, Elwynn Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Elwynn Forest"] ) and ( SubZoneName == SZ["Stonefield Farm"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownStonefieldFarm == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownStonefieldFarm()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownStonefieldFarm = true
			end
			return
		else
			FinalFantasylization_InAllianceTownStonefieldFarm = false
		end
--'==========================================================================================		
--' Alliance Towns: Stonetalon Peak, Stonetalon Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Stonetalon Mountains"] ) and ( SubZoneName == SZ["Stonetalon Peak"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownStonetalonPeak == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownStonetalonPeak()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownStonetalonPeak = true
			end
			return
		else
			FinalFantasylization_InAllianceTownStonetalonPeak = false
		end
--'==========================================================================================		
--' Alliance Towns: Sylvanaar, Blade's Edge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blade's Edge Mountains"] ) and ( SubZoneName == SZ["Sylvanaar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownSylvanaar == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownSylvanaar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownSylvanaar = true
			end
			return
		else
			FinalFantasylization_InAllianceTownSylvanaar = false
		end
--'==========================================================================================		
--' Alliance Towns: Talonbranch Glade, Felwood
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Felwood"] ) and ( SubZoneName == SZ["Talonbranch Glade"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownTalonbranchGlade == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownTalonbranchGlade()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownTalonbranchGlade = true
			end
			return
		else
			FinalFantasylization_InAllianceTownTalonbranchGlade = false
		end
--'==========================================================================================		
--' Alliance Towns: Talrendis Point, Azshara
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Azshara"] ) and ( SubZoneName == SZ["Talrendis Point"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownTalrendisPoint == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownTalrendisPoint()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownTalrendisPoint = true
			end
			return
		else
			FinalFantasylization_InAllianceTownTalrendisPoint = false
		end
--'==========================================================================================		
--' Alliance Towns: Telaar, Nagrand
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Nagrand"] ) and ( SubZoneName == SZ["Telaar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownTelaar == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownTelaar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownTelaar = true
			end
			return
		else
			FinalFantasylization_InAllianceTownTelaar = false
		end
--'==========================================================================================		
--' Alliance Towns: Telredor, Zangarmarsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zangarmarsh"] ) and ( SubZoneName == SZ["Telredor"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownTelredor == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownTelredor()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownTelredor = true
			end
			return
		else
			FinalFantasylization_InAllianceTownTelredor = false
		end
--'==========================================================================================		
--' Alliance Towns: Temple of Telhamat, Hellfire Peninsula
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hellfire Peninsula"] ) and ( SubZoneName == SZ["Temple of Telhamat"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownTempleOfTelhamat == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownTempleOfTelhamat()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownTempleOfTelhamat = true
			end
			return
		else
			FinalFantasylization_InAllianceTownTempleOfTelhamat = false
		end
--'==========================================================================================		
--' Alliance Towns: Thalanaar, Feralas
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Feralas"] ) and ( SubZoneName == SZ["Thalanaar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownThalanaar == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownThalanaar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownThalanaar = true
			end
			return
		else
			FinalFantasylization_InAllianceTownThalanaar = false
		end
--'==========================================================================================		
--' Alliance Towns: Thelsamar, Loch Modan
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Loch Modan"] ) and ( SubZoneName == SZ["Thelsamar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownThelsamar == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownThelsamar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownThelsamar = true
			end
			return
		else
			FinalFantasylization_InAllianceTownThelsamar = false
		end
--'==========================================================================================		
--' Alliance Towns: Theramore Isle, Dustwallow Marsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dustwallow Marsh"] ) and ( SubZoneName == SZ["Theramore Isle"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownTheramoreIsle == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownTheramoreIsle()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownTheramoreIsle = true
			end
			return
		else
			FinalFantasylization_InAllianceTownTheramoreIsle = false
		end
--'==========================================================================================		
--' Alliance Towns: Toshley's Station, Blade's Edge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blade's Edge Mountains"] ) and ( SubZoneName == SZ["Toshley's Station"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownToshleysStation == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownToshleysStation()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownToshleysStation = true
			end
			return
		else
			FinalFantasylization_InAllianceTownToshleysStation = false
		end
--'==========================================================================================		
--' Alliance Towns: Valiance Keep, Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and ( ( SubZoneName == SZ["Valiance Keep"] ) or ( SubZoneName == SZ["The Stormbreaker"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownValianceKeep == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownValianceKeep()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownValianceKeep = true
			end
			return
		else
			FinalFantasylization_InAllianceTownValianceKeep = false
		end
--'==========================================================================================		
--' Alliance Towns: Valgarde, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["Valgarde"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownValgarde == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownValgarde()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownValgarde = true
			end
			return
		else
			FinalFantasylization_InAllianceTownValgarde = false
		end
--'==========================================================================================		
--' Alliance Towns: Westfall Brigade Encampment, Grizzly Hills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Grizzly Hills"] ) and ( SubZoneName == SZ["Westfall Brigade Encampment"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownWestfallBrigadeEncampment == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownWestfallBrigadeEncampment()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownWestfallBrigadeEncampment = true
			end
			return
		else
			FinalFantasylization_InAllianceTownWestfallBrigadeEncampment = false
		end
--'==========================================================================================		
--' Alliance Towns: Westguard Keep, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["Westguard Keep"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownWestguardKeep == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownWestguardKeep()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownWestguardKeep = true
			end
			return
		else
			FinalFantasylization_InAllianceTownWestguardKeep = false
		end
--'==========================================================================================		
--' Alliance Towns: Wildhammer Stronghold, Shadowmoon Valley
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Shadowmoon Valley"] ) and ( SubZoneName == SZ["Wildhammer Stronghold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownWildhammerStronghold == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownWildhammerStronghold()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownWildhammerStronghold = true
			end
			return
		else
			FinalFantasylization_InAllianceTownWildhammerStronghold = false
		end
--'==========================================================================================		
--' Alliance Towns: Windrunner's Overlook, Crystalsong Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Crystalsong Forest"] ) and ( SubZoneName == SZ["Windrunner's Overlook"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownWindrunnersOverlook == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownWindrunnersOverlook()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownWindrunnersOverlook = true
			end
			return
		else
			FinalFantasylization_InAllianceTownWindrunnersOverlook = false
		end
--'==========================================================================================		
--' Alliance Towns: Wintergarde Keep, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and ( ( SubZoneName == SZ["Wintergarde Keep"] ) or ( SubZoneName == SZ["The Carrion Fields"] ) or ( SubZoneName == SZ["Wintergarde Mausoleum"] ) or ( SubZoneName == SZ["Wintergarde Crypt"] ) or ( SubZoneName == SZ["Thorson's Post"] ) or ( SubZoneName == SZ["Wintergarde Mine"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InAllianceTownWintergardeKeep == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
					FinalFantasylization_AllianceTownWintergardeKeep()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InAllianceTownWintergardeKeep = true
			end
			return
		else
			FinalFantasylization_InAllianceTownWintergardeKeep = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			NEUTRAL TOWNS
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Neutral Towns: Aeris Landing, Nagrand
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Nagrand"] ) and ( SubZoneName == SZ["Aeris Landing"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownAerisLanding == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownAerisLanding()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownAerisLanding = true
			return
		else
			FinalFantasylization_InNeutralTownAerisLanding = false
		end
--'==========================================================================================		
--' Neutral Towns: Altar of Sha'tar, Shadowmoon Valley
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Shadowmoon Valley"] ) and ( SubZoneName == SZ["Altar of Sha'tar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownAltarOfShatar == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownAltarOfShatar()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownAltarOfShatar = true
			return
		else
			FinalFantasylization_InNeutralTownAltarOfShatar = false
		end
--'==========================================================================================		
--' Neutral Towns: Amber Ledge, Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and ( SubZoneName == SZ["Amber Ledge"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownAmberLedge == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownAmberLedge()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownAmberLedge = true
			return
		else
			FinalFantasylization_InNeutralTownAmberLedge = false
		end
--'==========================================================================================		
--' Neutral Towns: The Argent Stand, Zul'drak
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zul'Drak"] ) and ( SubZoneName == SZ["The Argent Stand"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownTheArgentStand == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownTheArgentStand()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownTheArgentStand = true
			return
		else
			FinalFantasylization_InNeutralTownTheArgentStand = false
		end
--'==========================================================================================		
--' Neutral Towns: Argent Tournament Grounds, Icecrown
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Icecrown"] ) and ( SubZoneName == SZ["Argent Tournament Grounds"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownArgentTournamentGrounds == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownArgentTournamentGrounds()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownArgentTournamentGrounds = true
			return
		else
			FinalFantasylization_InNeutralTownArgentTournamentGrounds = false
		end
--'==========================================================================================		
--' Neutral Towns: Argent Vanguard, Icecrown
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Icecrown"] ) and ( SubZoneName == SZ["Argent Vanguard"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownArgentVanguard == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownArgentVanguard()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownArgentVanguard = true
			return
		else
			FinalFantasylization_InNeutralTownArgentVanguard = false
		end
--'==========================================================================================		
--' Neutral Towns: Blackwatch, Icecrown
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Icecrown"] ) and ( SubZoneName == SZ["Blackwatch"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownBlackwatch == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownBlackwatch()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownBlackwatch = true
			return
		else
			FinalFantasylization_InNeutralTownBlackwatch = false
		end
--'==========================================================================================		
--' Neutral Towns: Bouldercrag's Refuge, The Storm Peaks
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Storm Peaks"] ) and ( SubZoneName == SZ["Bouldercrag's Refuge"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownBouldercragsRefuge == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownBouldercragsRefuge()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownBouldercragsRefuge = true
			return
		else
			FinalFantasylization_InNeutralTownBouldercragsRefuge = false
		end
--'==========================================================================================		
--' Neutral Towns: Cenarion Hold, Silithus
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Silithus"] ) and ( SubZoneName == SZ["Cenarion Hold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownCenarionHold == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownCenarionHold()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownCenarionHold = true
			return
		else
			FinalFantasylization_InNeutralTownCenarionHold = false
		end
--'==========================================================================================		
--' Neutral Towns: Cenarion Refuge, Zangarmarsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zangarmarsh"] ) and ( SubZoneName == SZ["Cenarion Refuge"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownCenarionRefuge == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownCenarionRefuge()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownCenarionRefuge = true
			return
		else
			FinalFantasylization_InNeutralTownCenarionRefuge = false
		end
--'==========================================================================================		
--' Neutral Towns: Cosmowrench, Netherstorm
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Netherstorm"] ) and ( SubZoneName == SZ["Cosmowrench"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownCosmowrench == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownCosmowrench()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownCosmowrench = true
			return
		else
			FinalFantasylization_InNeutralTownCosmowrench = false
		end
--'==========================================================================================		
--' Neutral Towns: Crusaders' Pinnacle, Icecrown
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Icecrown"] ) and ( SubZoneName == SZ["Crusaders' Pinnacle"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownCrusadersPinnacle == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownCrusadersPinnacle()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownCrusadersPinnacle = true
			return
		else
			FinalFantasylization_InNeutralTownCrusadersPinnacle = false
		end
--'==========================================================================================		
--' Neutral Towns: Darrowshire, Eastern Plaguelands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Eastern Plaguelands"] ) and ( SubZoneName == SZ["Darrowshire"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownDarrowshire == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownDarrowshire()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownDarrowshire = true
			return
		else
			FinalFantasylization_InNeutralTownDarrowshire = false
		end
--'==========================================================================================		
--' Neutral Towns: Dawn's Reach, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and ( SubZoneName == SZ["Dawn's Reach"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownDawnsReach == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownDawnsReach()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownDawnsReach = true
			return
		else
			FinalFantasylization_InNeutralTownDawnsReach = false
		end
--'==========================================================================================		
--' Neutral Towns: Death's Rise, Icecrown
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Icecrown"] ) and ( SubZoneName == SZ["Death's Rise"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownDeathsRise == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownDeathsRise()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownDeathsRise = true
			return
		else
			FinalFantasylization_InNeutralTownDeathsRise = false
		end
--'==========================================================================================		
--' Neutral Towns: Dorian's Outpost, Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Dorian's Outpost"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownDoriansOutpost == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownDoriansOutpost()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownDoriansOutpost = true
			return
		else
			FinalFantasylization_InNeutralTownDoriansOutpost = false
		end
--'==========================================================================================		
--' Neutral Towns: Dubra'Jin, Zul'Drak
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zul'Drak"] ) and ( SubZoneName == SZ["Dubra'Jin"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownDubraJin == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownDubraJin()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownDubraJin = true
			return
		else
			FinalFantasylization_InNeutralTownDubraJin = false
		end
--'==========================================================================================		
--' Neutral Towns: Dun Niffelem, The Storm Peaks
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Storm Peaks"] ) and ( SubZoneName == SZ["Dun Niffelem"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownDunNiffelem == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownDunNiffelem()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownDunNiffelem = true
			return
		else
			FinalFantasylization_InNeutralTownDunNiffelem = false
		end
--'==========================================================================================		
--' Neutral Towns: Ebon Watch, Zul'drak
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zul'Drak"] ) and ( SubZoneName == SZ["Ebon Watch"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownEbonWatch == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownEbonWatch()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownEbonWatch = true
			return
		else
			FinalFantasylization_InNeutralTownEbonWatch = false
		end
--'==========================================================================================		
--' Neutral Towns: Emerald Sanctuary, Felwood
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Felwood"] ) and ( SubZoneName == SZ["Emerald Sanctuary"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownEmeraldSanctuary == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownEmeraldSanctuary()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownEmeraldSanctuary = true
			return
		else
			FinalFantasylization_InNeutralTownEmeraldSanctuary = false
		end
--'==========================================================================================		
--' Neutral Towns: Evergrove, Blade's Edge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blade's Edge Mountains"] ) and ( SubZoneName == SZ["Evergrove"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownEvergrove == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownEvergrove()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownEvergrove = true
			return
		else
			FinalFantasylization_InNeutralTownEvergrove = false
		end
--'==========================================================================================		
--' Neutral Towns: Frenzyheart Hill, Sholazar Basin (at odds with the Oracles in Rainspeaker Canopy)
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Frenzyheart Hill"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownFrenzyheartHill == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownFrenzyheartHill()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownFrenzyheartHill = true
			return
		else
			FinalFantasylization_InNeutralTownFrenzyheartHill = false
		end
--'==========================================================================================		
--' Neutral Towns: Granite Springs, Grizzly Hills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Grizzly Hills"] ) and ( SubZoneName == SZ["Granite Springs"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownGraniteSprings == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownGraniteSprings()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownGraniteSprings = true
			return
		else
			FinalFantasylization_InNeutralTownGraniteSprings = false
		end
--'==========================================================================================		
--' Neutral Towns: Halaa, Nagrand
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Nagrand"] ) and ( SubZoneName == SZ["Halaa"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownHalaa == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownHalaa()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownHalaa = true
			return
		else
			FinalFantasylization_InNeutralTownHalaa = false
		end
--'==========================================================================================		
--' Neutral Towns: The Harborage, Swamp of Sorrows
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Swamp of Sorrows"] ) and ( SubZoneName == SZ["The Harborage"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownTheHarborage == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownTheHarborage()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownTheHarborage = true
			return
		else
			FinalFantasylization_InNeutralTownTheHarborage = false
		end
--'==========================================================================================		
--' Neutral Towns: K3, The Storm Peaks
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Storm Peaks"] ) and ( SubZoneName == SZ["K3"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownK3 == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownK3()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownK3 = true
			return
		else
			FinalFantasylization_InNeutralTownK3 = false
		end
--'==========================================================================================		
--' Neutral Towns: Kamagua, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["Kamagua"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownKamagua == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownKamagua()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownKamagua = true
			return
		else
			FinalFantasylization_InNeutralTownKamagua = false
		end
--'==========================================================================================		
--' Neutral Towns: Kartak's Hold, Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Kartak's Hold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownKartaksHold == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownKartaksHold()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownKartaksHold = true
			return
		else
			FinalFantasylization_InNeutralTownKartaksHold = false
		end
--'==========================================================================================		
--' Neutral Towns: Kirin'Var Village, Netherstorm
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Netherstorm"] ) and ( ( SubZoneName == SZ["Wizard Row"] ) or ( SubZoneName == SZ["Town Square"] ) or ( SubZoneName == SZ["Chapel Yard"] ) or ( SubZoneName == SZ["The Violet Tower"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownKirinVarVillage == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownKirinVarVillage()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownKirinVarVillage = true
			return
		else
			FinalFantasylization_InNeutralTownKirinVarVillage = false
		end
--'==========================================================================================		
--' Neutral Towns: Lakeside Landing, Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Lakeside Landing"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownLakesideLanding == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownLakesideLanding()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownLakesideLanding = true
			return
		else
			FinalFantasylization_InNeutralTownLakesideLanding = false
		end
--'==========================================================================================		
--' Neutral Towns: Light's Breach, Zul'drak
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zul'Drak"] ) and ( SubZoneName == SZ["Light's Breach"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownLightsBreach == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownLightsBreach()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownLightsBreach = true
			return
		else
			FinalFantasylization_InNeutralTownLightsBreach = false
		end
--'==========================================================================================		
--' Neutral Towns: Light's Hope Chapel, Eastern Plaguelands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Eastern Plaguelands"] ) and ( SubZoneName == SZ["Light's Hope Chapel"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownLightsHopeChapel == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownLightsHopeChapel()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownLightsHopeChapel = true
			return
		else
			FinalFantasylization_InNeutralTownLightsHopeChapel = false
		end
--'==========================================================================================		
--' Neutral Towns: Light's Trust, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and ( SubZoneName == SZ["Light's Trust"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownLightsTrust == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownLightsTrust()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownLightsTrust = true
			return
		else
			FinalFantasylization_InNeutralTownLightsTrust = false
		end
--'==========================================================================================		
--' Neutral Towns: Marshal's Refuge, Un'Goro Crater
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Un'Goro Crater"] ) and ( SubZoneName == SZ["Marshal's Refuge"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownMarshalsRefuge == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownMarshalsRefuge()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownMarshalsRefuge = true
			return
		else
			FinalFantasylization_InNeutralTownMarshalsRefuge = false
		end
--'==========================================================================================		
--' Neutral Towns: Midrealm Post, Netherstorm
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Netherstorm"] ) and ( ( SubZoneName == SZ["Midrealm Post"] ) or ( SubZoneName == SZ["Eco-Dome Midrealm"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownMidrealmPost == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownMidrealmPost()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownMidrealmPost = true
			return
		else
			FinalFantasylization_InNeutralTownMidrealmPost = false
		end
--'==========================================================================================		
--' Neutral Towns: Mirage Raceway, Thousand Needles
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Thousand Needles"] ) and ( ( SubZoneName == SZ["Mirage Raceway"] ) or ( SubZoneName == SZ["The Shimmering Flats"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownMirageRaceway == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownMirageRaceway()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownMirageRaceway = true
			return
		else
			FinalFantasylization_InNeutralTownMirageRaceway = false
		end
--'==========================================================================================		
--' Neutral Towns: Mistwhisper Refuge, Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Mistwhisper Refuge"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownMistwhisperRefuge == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownMistwhisperRefuge()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownMistwhisperRefuge = true
			return
		else
			FinalFantasylization_InNeutralTownMistwhisperRefuge = false
		end
--'==========================================================================================		
--' Neutral Towns: Moa'ki Harbor, Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dragonblight"] ) and ( SubZoneName == SZ["Moa'ki Harbor"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownMoakiHarbor == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownMoakiHarbor()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownMoakiHarbor = true
			return
		else
			FinalFantasylization_InNeutralTownMoakiHarbor = false
		end
--'==========================================================================================		
--' Neutral Towns: Mudsprocket, Dustwallow Marsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dustwallow Marsh"] ) and ( SubZoneName == SZ["Mudsprocket"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownMudsprocket == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownMudsprocket()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownMudsprocket = true
			return
		else
			FinalFantasylization_InNeutralTownMudsprocket = false
		end
--'==========================================================================================		
--' Neutral Towns: Nesingwary Base Camp, Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Nesingwary Base Camp"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownNesingwaryBaseCamp == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownNesingwaryBaseCamp()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownNesingwaryBaseCamp = true
			return
		else
			FinalFantasylization_InNeutralTownNesingwaryBaseCamp = false
		end
--'==========================================================================================		
--' Neutral Towns: Nesingwary's Expedition, Stranglethorn Vale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Stranglethorn Vale"] ) and ( SubZoneName == SZ["Nesingwary's Expedition"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownNesingwaryExpedition == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownNesingwaryExpedition()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownNesingwaryExpedition = true
			return
		else
			FinalFantasylization_InNeutralTownNesingwaryExpedition = false
		end
--'==========================================================================================		
--' Neutral Towns: Nighthaven, Moonglade
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Moonglade"] ) and ( SubZoneName == SZ["Nighthaven"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownNighthaven == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownNighthaven()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownNighthaven = true
			return
		else
			FinalFantasylization_InNeutralTownNighthaven = false
		end
--'==========================================================================================		
--' Neutral Towns: Ogri'la, Blade's Edge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blade's Edge Mountains"] ) and ( SubZoneName == SZ["Ogri'la"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownOgrila == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownOgrila()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownOgrila = true
			return
		else
			FinalFantasylization_InNeutralTownOgrila = false
		end
--'==========================================================================================		
--' Neutral Towns: Protectorate Watch Post, Netherstorm
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Netherstorm"] ) and ( SubZoneName == SZ["Protectorate Watch Post"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownProtectorateWatchPost == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownProtectorateWatchPost()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownProtectorateWatchPost = true
			return
		else
			FinalFantasylization_InNeutralTownProtectorateWatchPost = false
		end
--'==========================================================================================		
--' Neutral Towns: Rainspeaker Canopy, Sholazar Basin (at odds with the Frenzyheart Tribe in Frenzyheart Hill)
--'==========================================================================================

		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Rainspeaker Canopy"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownRainspeakerCanopy == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownRainspeakerCanopy()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownRainspeakerCanopy = true
			return
		else
			FinalFantasylization_InNeutralTownRainspeakerCanopy = false
		end
--'==========================================================================================		
--' Neutral Towns: River's Heart, Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["River's Heart"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownRiversHeart == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownRiversHeart()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownRiversHeart = true
			return
		else
			FinalFantasylization_InNeutralTownRiversHeart = false
		end
--'==========================================================================================		
--' Neutral Towns: Sanctum of the Stars, Shadowmoon Valley
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Shadowmoon Valley"] ) and ( SubZoneName == SZ["Sanctum of the Stars"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownSanctumOfTheStars == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownSanctumOfTheStars()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownSanctumOfTheStars = true
			return
		else
			FinalFantasylization_InNeutralTownSanctumOfTheStars = false
		end
--'==========================================================================================		
--' Neutral Towns: Scalawag Point, Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and ( SubZoneName == SZ["Scalawag Point"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownScalawagPoint == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownScalawagPoint()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownScalawagPoint = true
			return
		else
			FinalFantasylization_InNeutralTownScalawagPoint = false
		end
--'==========================================================================================		
--' Neutral Towns: The Shadow Vault, Icecrown
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Icecrown"] ) and ( SubZoneName == SZ["The Shadow Vault"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownShadowVault == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownShadowVault()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownShadowVault = true
			return
		else
			FinalFantasylization_InNeutralTownShadowVault = false
		end
--'==========================================================================================		
--' Neutral Towns: Sparktouched Haven, Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Sparktouched Haven"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownSparktouchedHaven == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownSparktouchedHaven()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownSparktouchedHaven = true
			return
		else
			FinalFantasylization_InNeutralTownSparktouchedHaven = false
		end
--'==========================================================================================		
--' Neutral Towns: Spearborn Encampment, Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and ( SubZoneName == SZ["Spearborn Encampment"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownSpearbornEncampment == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownSpearbornEncampment()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownSpearbornEncampment = true
			return
		else
			FinalFantasylization_InNeutralTownSpearbornEncampment = false
		end
--'==========================================================================================		
--' Neutral Towns: Sporeggar, Zangarmarsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zangarmarsh"] ) and ( SubZoneName == SZ["Sporeggar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownSporeggar == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownSporeggar()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownSporeggar = true
			return
		else
			FinalFantasylization_InNeutralTownSporeggar = false
		end
--'==========================================================================================		
--' Neutral Towns: Steamwheedle Port, Tanaris
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Tanaris"] ) and ( SubZoneName == SZ["Steamwheedle Port"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownSteamwheedlePort == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownSteamwheedlePort()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownSteamwheedlePort = true
			return
		else
			FinalFantasylization_InNeutralTownSteamwheedlePort = false
		end
--'==========================================================================================		
--' Neutral Towns: The Stormspire, Netherstorm
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Netherstorm"] ) and ( ( SubZoneName == SZ["The Stormspire"] ) or ( SubZoneName == SZ["Eco-Dome Sutheron"] ) or ( SubZoneName == SZ["Eco-Dome Skyperch"] ) )and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownStormspire == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownStormspire()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownStormspire = true
			return
		else
			FinalFantasylization_InNeutralTownStormspire = false
		end
--'==========================================================================================		
--' Neutral Towns: Sun's Reach, Isle of Quel'Danas
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Isle of Quel'Danas"] ) and ( ( SubZoneName == SZ["Sun's Reach Armory"] ) or ( SubZoneName == SZ["Sun's Reach Harbor"] ) or ( SubZoneName == SZ["Sun's Reach Sanctum"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownSunsReach == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownSunsReach()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownSunsReach = true
			return
		else
				FinalFantasylization_InNeutralTownSunsReach = false
 		end
--'==========================================================================================		
--' Neutral Towns: Timbermaw Hold, Azshara/Felwood/Moonglade/Winterspring
--'==========================================================================================
		if not ( IsResting() ) and ( ( ZoneName == Z["Azshara"] ) or ( ZoneName == Z["Felwood"] ) or ( ZoneName == Z["Moonglade"] ) or ( ZoneName == Z["Winterspring"] ) ) and ( SubZoneName == SZ["Timbermaw Hold"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownTimbermawHold == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownTimbermawHold()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownTimbermawHold = true
			return
		else
			FinalFantasylization_InNeutralTownTimbermawHold = false
		end
--'==========================================================================================		
--' Neutral Towns: Thorium Point, Searing Gorge
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Searing Gorge"] ) and ( SubZoneName == SZ["Thorium Point"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownThoriumPoint == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownThoriumPoint()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownThoriumPoint = true
			return
		else
			FinalFantasylization_InNeutralTownThoriumPoint = false
		end
--'==========================================================================================		
--' Neutral Towns: Transitus Shield, Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and ( SubZoneName == SZ["Transitus Shield"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownTransitusShield == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownTransitusShield()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownTransitusShield = true
			return
		else
			FinalFantasylization_InNeutralTownTransitusShield = false
		end
--'==========================================================================================		
--' Neutral Towns: Unu'pe, Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and ( SubZoneName == SZ["Unu'pe"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownUnupe == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownUnupe()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownUnupe = true
			return
		else
			FinalFantasylization_InNeutralTownUnupe = false
		end
--'==========================================================================================		
--' Neutral Towns: Valor's Rest, Silithus
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Silithus"] ) and ( SubZoneName == SZ["Valor's Rest"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownValorsRest == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownValorsRest()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownValorsRest = true
			return
		else
			FinalFantasylization_InNeutralTownValorsRest = false
		end
--'==========================================================================================		
--' Neutral Towns: Venture Bay, Grizzly Hills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Grizzly Hills"] ) and ( SubZoneName == SZ["Venture Bay"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownVentureBay == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownVentureBay()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownVentureBay = true
			return
		else
			FinalFantasylization_InNeutralTownVentureBay = false
		end
--'==========================================================================================		
--' Neutral Towns: Wyrmrest Temple, Dragonblight
--'==========================================================================================
		if ( ZoneName ==Z["Dragonblight"] ) and ( SubZoneName == SZ["Wyrmrest Temple"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownWyrmrestTemple == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownWyrmrestTemple()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownWyrmrestTemple = true
			return
		else
			FinalFantasylization_InNeutralTownWyrmrestTemple = false
		end
--'==========================================================================================		
--' Neutral Towns: Zim'Torga, Zul'drak
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zul'Drak"] ) and ( SubZoneName == SZ["Zim'Torga"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNeutralTownZimTorga == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NeutralTownZimTorga()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNeutralTownZimTorga = true
			return
		else
			FinalFantasylization_InNeutralTownZimTorga = false
		end
	
--###########################################################################################
--###########################################################################################
--##
--##			MISCELANEOUS ZONES
--##
--###########################################################################################
--###########################################################################################	

--'==========================================================================================		
--' Misc Areas: 
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Deeprun Tram"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscAreaDeeprunTram == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_MiscAreaDeeprunTram()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscAreaDeeprunTram = true
			return
		else
			FinalFantasylization_InMiscAreaDeeprunTram = false
		end
--'==========================================================================================		
--' Misc Areas: Scarlet Monastery, Tirisfal Glades (the building in Tirisfal Glades, not the instance itself.)
--'==========================================================================================
		if not ( IsInInstance() ) and ( ZoneName == Z["Scarlet Monastery"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscAreaScarletMonastery == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_MiscAreaScarletMonastery()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscAreaScarletMonastery = true
			return
		else
			FinalFantasylization_InMiscAreaScarletMonastery = false
		end
--'==========================================================================================		
--' Misc Areas: Razorfen Kraul, The Barrens (the area directly before Razorfen Kraul instance)
--'==========================================================================================
		if not ( IsInInstance() ) and ( ( ZoneName == Z["Razorfen Kraul"] ) or ( SubZoneName == SZ["Razorfen Kraul"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscAreaRazorfenKraul == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_MiscAreaRazorfenKraul()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscAreaRazorfenKraul = true
			return
		else
			FinalFantasylization_InMiscAreaRazorfenKraul = false
		end
--'==========================================================================================		
--' Misc Areas: Razorfen Downs, The Barrens (the area directly before Razorfen Kraul instance)
--'==========================================================================================
		if not ( IsInInstance() ) and ( ( ZoneName == Z["Razorfen Downs"] ) or ( SubZoneName == SZ["Razorfen Downs"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscAreaRazorfenDowns == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_MiscAreaRazorfenDowns()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscAreaRazorfenDowns = true
			return
		else
			FinalFantasylization_InMiscAreaRazorfenDowns = false
		end
--'==========================================================================================		
--' Misc Areas: Wailing Caverns, The Barrens (the Cave before Wailing Caverns instance)
--'==========================================================================================
		if not ( IsInInstance() ) and ( ZoneName == Z["Wailing Caverns"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscAreaWailingCaverns == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn .. " " .. ZoneName)
				FinalFantasylization_MiscAreaWailingCaverns()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscAreaWailingCaverns = true
			return
		else
			FinalFantasylization_InMiscAreaWailingCaverns = false
		end
--'==========================================================================================		
--' Misc Areas: The Deadmines, Westfall (the Cave before The Deadmines instance)
--'==========================================================================================
		if not ( IsInInstance() ) and ( ZoneName == Z["The Deadmines"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscAreaTheDeadmines == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_MiscAreaTheDeadmines()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscAreaTheDeadmines = true
			return
		else
			FinalFantasylization_InMiscAreaTheDeadmines = false
		end
--'==========================================================================================		
--' Misc Areas: Gnomeregan, Dun Morogh (the area before Gnomeregan instance)
--'==========================================================================================
		if not ( IsInInstance() ) and ( ZoneName == Z["Gnomeregan"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscAreaTheDeadmines == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_MiscAreaGnomeregan()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscAreaGnomeregan = true
			return
		else
			FinalFantasylization_InMiscAreaGnomeregan = false
		end
--'==========================================================================================		
--' Misc Areas: Caverns of Time, Tanaris
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Tanaris"] ) and ( SubZoneName == SZ["Caverns of Time"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InMiscAreaCavernsOfTime == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_MiscAreaCavernsOfTime()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InMiscAreaCavernsOfTime = true
			return
		else
			FinalFantasylization_InMiscAreaCavernsOfTime = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			EASTERN KINGDOMS ZONES
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Eastern Kingdoms Zones: Alterac Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Alterac Mountains"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsAlteracMountains == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsAlteracMountains()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsAlteracMountains = true
		else
			FinalFantasylization_InEasternKingdomsAlteracMountains = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Arathi Highlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Arathi Highlands"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsArathiHighlands == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsArathiHighlands()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsArathiHighlands = true
		else
			FinalFantasylization_InEasternKingdomsArathiHighlands = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Badlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Badlands"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsBadlands == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsBadlands()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsBadlands = true
		else
			FinalFantasylization_InEasternKingdomsBadlands = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Blackrock Mountain
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blackrock Mountain"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsBlackrockMountain == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsBlackrockMountain()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsBlackrockMountain = true
		else
			FinalFantasylization_InEasternKingdomsBlackrockMountain = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Blasted Lands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blasted Lands"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsTheBlastedLands == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsBlastedLands()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsTheBlastedLands = true
		else
			FinalFantasylization_InEasternKingdomsTheBlastedLands = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Burning Steppes
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Burning Steppes"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsBurningSteppes == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsBurningSteppes()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsBurningSteppes = true
		else
			FinalFantasylization_InEasternKingdomsBurningSteppes = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Deadwind Pass
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Deadwind Pass"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsDeadwindPass == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsDeadwindPass()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsDeadwindPass = true
		else
			FinalFantasylization_InEasternKingdomsDeadwindPass = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Dun Morogh : Alliance
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dun Morogh"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsDunMorogh == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_EasternKingdomsDunMorogh()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InEasternKingdomsDunMorogh = true
			end
		else
			FinalFantasylization_InEasternKingdomsDunMorogh = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Duskwood
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Duskwood"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsDuskwood == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsDuskwood()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsDuskwood = true
		else
			FinalFantasylization_InEasternKingdomsDuskwood = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Eastern Plaguelands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Eastern Plaguelands"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsEasternPlaguelands == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsEasternPlaguelands()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsEasternPlaguelands = true
		else
			FinalFantasylization_InEasternKingdomsEasternPlaguelands = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Elwynn Forest : Alliance
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Elwynn Forest"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsElwynnForest == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_EasternKingdomsElwynnForest()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InEasternKingdomsElwynnForest = true
			end
		else
			FinalFantasylization_InEasternKingdomsElwynnForest = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Eversong Woods : Horde
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Eversong Woods"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsEversongWoods == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_EasternKingdomsEversongWoods()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InEasternKingdomsEversongWoods = true
			end
		else
			FinalFantasylization_InEasternKingdomsEversongWoods = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Ghostlands : Horde
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Ghostlands"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsGhostlands == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_EasternKingdomsGhostlands()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InEasternKingdomsGhostlands = true
			end
		else
			FinalFantasylization_InEasternKingdomsGhostlands = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Hillsbrad Foothills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hillsbrad Foothills"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsHillsbradFoothills == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsHillsbradFoothills()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsHillsbradFoothills = true
		else
			FinalFantasylization_InEasternKingdomsHillsbradFoothills = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Isle of Quel'Danas
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Isle of Quel'Danas"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsIsleofQuelDanas == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsIsleofQuelDanas()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsIsleofQuelDanas = true
		else
			FinalFantasylization_InEasternKingdomsIsleofQuelDanas = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Loch Modan : Alliance
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Loch Modan"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsLochModan == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_EasternKingdomsLochModan()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InEasternKingdomsLochModan = true
			end
		else
			FinalFantasylization_InEasternKingdomsLochModan = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Redridge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Redridge Mountains"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsRedridgeMountains == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsRedridgeMountains()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsRedridgeMountains = true
		else
			FinalFantasylization_InEasternKingdomsRedridgeMountains = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Searing Gorge
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Searing Gorge"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsSearingGorge == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsSearingGorge()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsSearingGorge = true
		else
			FinalFantasylization_InEasternKingdomsSearingGorge = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Silverpine Forest : Horde
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Silverpine Forest"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsSilverpineForest == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_EasternKingdomsSilverpineForest()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InEasternKingdomsSilverpineForest = true
			end
		else
			FinalFantasylization_InEasternKingdomsSilverpineForest = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Stranglethorn Vale
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Stranglethorn Vale"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsStranglethornVale == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsStranglethornVale()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsStranglethornVale = true
		else
			FinalFantasylization_InEasternKingdomsStranglethornVale = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Swamp of Sorrows
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Swamp of Sorrows"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsSwampOfSorrows == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsSwampOfSorrows()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsSwampOfSorrows = true
		else
			FinalFantasylization_InEasternKingdomsSwampOfSorrows = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: The Hinterlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Hinterlands"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsTheHinterlands == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsTheHinterlands()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsTheHinterlands = true
		else
			FinalFantasylization_InEasternKingdomsTheHinterlands = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Tirisfal Glades : Horde
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Tirisfal Glades"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsTirisfalGlades == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_EasternKingdomsTirisfalGlades()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InEasternKingdomsTirisfalGlades = true
			end
		else
			FinalFantasylization_InEasternKingdomsTirisfalGlades = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Western Plaguelands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Western Plaguelands"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsWesternPlaguelands == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsWesternPlaguelands()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsWesternPlaguelands = true
		else
			FinalFantasylization_InEasternKingdomsWesternPlaguelands = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Westfall : Alliance
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Westfall"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsWestfall == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_EasternKingdomsWestfall()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InEasternKingdomsWestfall = true
			end
		else
			FinalFantasylization_InEasternKingdomsWestfall = false
		end
--'==========================================================================================		
--' Eastern Kingdoms Zones: Wetlands
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Wetlands"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InEasternKingdomsWetlands == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_EasternKingdomsWetlands()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InEasternKingdomsWetlands = true
		else
			FinalFantasylization_InEasternKingdomsWetlands = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			KALIMDOR ZONES
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Kalimdor Zones: Ashenvale 
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Ashenvale"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorAshenvale == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorAshenvale()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorAshenvale = true
		else
			FinalFantasylization_InKalimdorAshenvale = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Azshara
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Azshara"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorAzshara == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorAzshara()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorAzshara = true
		else
			FinalFantasylization_InKalimdorAzshara = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Azuremyst Isle : Alliance
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Azuremyst Isle"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorAzuremystIsle == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_KalimdorAzuremystIsle()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InKalimdorAzuremystIsle = true
			end
		else
			FinalFantasylization_InKalimdorAzuremystIsle = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Bloodmyst Isle : Alliance
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Bloodmyst Isle"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorBloodmystIsle == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_KalimdorBloodmystIsle()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InKalimdorBloodmystIsle = true
			end
		else
			FinalFantasylization_InKalimdorBloodmystIsle = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Darkshore : Alliance
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Darkshore"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorDarkshore == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_KalimdorDarkshore()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InKalimdorDarkshore = true
			end
		else
			FinalFantasylization_InKalimdorDarkshore = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Desolace
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Desolace"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorDesolace == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorDesolace()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorDesolace = true
		else
			FinalFantasylization_InKalimdorDesolace = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Durotar : Horde
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Durotar"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorDurotar == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_KalimdorDurotar()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InKalimdorDurotar = true
			end
		else
			FinalFantasylization_InKalimdorDurotar = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Dustwallow Marsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Dustwallow Marsh"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorDustwallowMarsh == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorDustwallowMarsh()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorDustwallowMarsh = true
		else
			FinalFantasylization_InKalimdorDustwallowMarsh = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Felwood
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Felwood"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorFelwood == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorFelwood()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorFelwood = true
		else
			FinalFantasylization_InKalimdorFelwood = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Feralas
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Feralas"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorFeralas == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorFeralas()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorFeralas = true
		else
			FinalFantasylization_InKalimdorFeralas = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Moonglade
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Moonglade"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorMoonglade == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorMoonglade()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorMoonglade = true
		else
			FinalFantasylization_InKalimdorMoonglade = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Mulgore : Horde
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Mulgore"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorMulgore == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_KalimdorMulgore()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InKalimdorMulgore = true
			end
		else
			FinalFantasylization_InKalimdorMulgore = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Silithus
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Silithus"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorSilithus == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorSilithus()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorSilithus = true
		else
			FinalFantasylization_InKalimdorSilithus = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Stonetalon Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Stonetalon Mountains"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorStonetalonMountains == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorStonetalonMountains()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorStonetalonMountains = true
		else
			FinalFantasylization_InKalimdorStonetalonMountains = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Tanaris 
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Tanaris"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorTanaris == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorTanaris()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorTanaris = true
		else
			FinalFantasylization_InKalimdorTanaris = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Teldrassil : Alliance
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Teldrassil"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorTeldrassil == false then
				if ( factionEnglish == "Alliance" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_KalimdorTeldrassil()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InKalimdorTeldrassil = true
			end
		else
			FinalFantasylization_InKalimdorTeldrassil = false
		end
--'==========================================================================================		
--' Kalimdor Zones: The Barrens : Horde
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Barrens"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorTheBarrens == false then
				if ( factionEnglish == "Horde" ) then
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
					FinalFantasylization_KalimdorTheBarrens()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Crimson .. PlayerInHostileTown .. SubZoneName..", "..ZoneName..PlayerInHostile)
					FinalFantasylization_HostileTowns() -- Music call for all towns you are hostile in.
				end
				FinalFantasylization_IsPlaying = true
				FinalFantasylization_InKalimdorTheBarrens = true
			end
		else
			FinalFantasylization_InKalimdorTheBarrens = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Thousand Needles
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Thousand Needles"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorThousandNeedles == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorThousandNeedles()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorThousandNeedles = true
		else
			FinalFantasylization_InKalimdorThousandNeedles = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Un'Goro Crater
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Un'Goro Crater"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorUngoroCrater == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorUngoroCrater()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorUngoroCrater = true
		else
			FinalFantasylization_InKalimdorUngoroCrater = false
		end
--'==========================================================================================		
--' Kalimdor Zones: Winterspring
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Winterspring"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InKalimdorWinterspring == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_KalimdorWinterspring()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InKalimdorWinterspring = true
		else
			FinalFantasylization_InKalimdorWinterspring = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			OUTLAND ZONES
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Outland Zones: Blade's Edge Mountains
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Blade's Edge Mountains"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InOutlandBladesEdgeMountains == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_OutlandBladesEdgeMountains()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InOutlandBladesEdgeMountains = true
		else
			FinalFantasylization_InOutlandBladesEdgeMountains = false
		end
--'==========================================================================================		
--' Outland Zones: Hellfire Peninsula
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Hellfire Peninsula"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InOutlandHellfirePeninsula == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_OutlandHellfirePeninsula()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InOutlandHellfirePeninsula = true
		else
			FinalFantasylization_InOutlandHellfirePeninsula = false
		end
--'==========================================================================================		
--' Outland Zones: Nagrand
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Nagrand"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InOutlandNagrand == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_OutlandNagrand()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InOutlandNagrand = true
		else
			FinalFantasylization_InOutlandNagrand = false
		end
--'==========================================================================================		
--' Outland Zones: Netherstorm
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Netherstorm"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InOutlandNetherstorm == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_OutlandNetherstorm()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InOutlandNetherstorm = true
		else
			FinalFantasylization_InOutlandNetherstorm = false
		end
--'==========================================================================================		
--' Outland Zones: Shadowmoon Valley
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Shadowmoon Valley"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InOutlandShadowmoonValley == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_OutlandShadowmoonValley()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InOutlandShadowmoonValley = true
		else
			FinalFantasylization_InOutlandShadowmoonValley = false
		end
--'==========================================================================================		
--' Outland Zones: Terokkar Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Terokkar Forest"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InOutlandTerokkarForest == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_OutlandTerokkarForest()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InOutlandTerokkarForest = true
		else
			FinalFantasylization_InOutlandTerokkarForest = false
		end
--'==========================================================================================		
--' Outland Zones: Zangarmarsh
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zangarmarsh"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InOutlandZangarmarsh == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_OutlandZangarmarsh()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InOutlandZangarmarsh = true
		else
			FinalFantasylization_InOutlandZangarmarsh = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			NORTHREND ZONES
--##
--###########################################################################################
--###########################################################################################

--'==========================================================================================		
--' Northrend Zones: Coldarra, Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and ( ( SubZoneName == SZ["Coldarra"] ) or ( SubZoneName == SZ["The Nexus"] ) ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendColdarra == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. SubZoneName..", "..ZoneName)
				FinalFantasylization_NorthrendColdarra()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendColdarra = true
		else
			FinalFantasylization_InNorthrendColdarra = false
		end
--'==========================================================================================		
--' Northrend Zones: Borean Tundra
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Borean Tundra"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendBoreanTundra == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendBoreanTundra()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendBoreanTundra = true
		else
			FinalFantasylization_InNorthrendBoreanTundra = false
		end
--'==========================================================================================		
--' Northrend Zones: Crystalsong Forest
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Crystalsong Forest"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendCrystalsongForest == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendCrystalsongForest()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendCrystalsongForest = true
		else
			FinalFantasylization_InNorthrendCrystalsongForest = false
		end
--'==========================================================================================		
--' Northrend Zones: Dragonblight
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName ==Z["Dragonblight"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendDragonblight == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendDragonblight()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendDragonblight = true
		else
			FinalFantasylization_InNorthrendDragonblight = false
		end
--'==========================================================================================		
--' Northrend Zones: Grizzly Hills
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Grizzly Hills"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendGrizzlyHills == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendGrizzlyHills()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendGrizzlyHills = true
		else
			FinalFantasylization_InNorthrendGrizzlyHills = false
		end
--'==========================================================================================		
--' Northrend Zones: Howling Fjord
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Howling Fjord"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendHowlingFjord == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendHowlingFjord()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendHowlingFjord = true
		else
			FinalFantasylization_InNorthrendHowlingFjord = false
		end
--'==========================================================================================		
--' Northrend Zones: Icecrown
--'==========================================================================================
			if not ( IsResting() ) and ( ZoneName == Z["Icecrown"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendIcecrown == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendIcecrown()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendIcecrown = true
		else
			FinalFantasylization_InNorthrendIcecrown = false
		end
--'==========================================================================================		
--' Northrend Zones: Sholazar Basin
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Sholazar Basin"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendSholazarBasin == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendSholazarBasin()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendSholazarBasin = true
		else
			FinalFantasylization_InNorthrendSholazarBasin = false
		end
--'==========================================================================================		
--' Northrend Zones: The Storm Peaks
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["The Storm Peaks"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendStormPeaks == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendStormPeaks()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendStormPeaks = true
		else
			FinalFantasylization_InNorthrendStormPeaks = false
		end
--'==========================================================================================		
--' Northrend Zones: Wintergrasp
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Wintergrasp"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendWintergrasp == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendWintergrasp()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendWintergrasp = true
		else
			FinalFantasylization_InNorthrendWintergrasp = false
		end
--'==========================================================================================		
--' Northrend Zones: Zul'Drak
--'==========================================================================================
		if not ( IsResting() ) and ( ZoneName == Z["Zul'Drak"] ) and FinalFantasylization_IsPlaying == false then
			if FinalFantasylization_InNorthrendZulDrak == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerIn.. ZoneName)
				FinalFantasylization_NorthrendZulDrak()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InNorthrendZulDrak = true
		else
			FinalFantasylization_InNorthrendZulDrak = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			DUNGEONS EVENTS
--##
--###########################################################################################
--###########################################################################################

			-- 5 Man Dungeons
		if IsInInstance() and FinalFantasylization_IsPlaying == false then
			local inInstance, instanceType = IsInInstance();
			
			if instanceType == "party" and FinalFantasylization_InInstance == false and FinalFantasylizationOptions.Dungeon == true then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerInDungeon.. ZoneName)
					-- Vanilla WoW Dungeons
				if ( ZoneName == SZ["Ragefire Chasm"] ) then				-- Ragefire Chasm Instance
					FinalFantasylization_Dungeon_RagefireChasmSong()
				elseif ( ZoneName == SZ["Wailing Caverns"] ) then			-- Wailing Caverns Instance
					FinalFantasylization_Dungeon_WailingCavernsSong()
				elseif ( ZoneName == SZ["The Deadmines"] ) then				-- The Deadmines Instance
					FinalFantasylization_Dungeon_DeadminesSong()
				elseif ( ZoneName == SZ["Shadowfang Keep"] ) then			-- Shadowfang Keep Instance
					FinalFantasylization_Dungeon_ShadowfangKeepSong()
				elseif ( ZoneName == SZ["Blackfathom Deeps"] ) then			-- Blackfathom Deeps Instance
					FinalFantasylization_Dungeon_BlackfathomDeepsSong()
				elseif ( ZoneName == SZ["The Stockade"] ) then				-- Stormwind Stockade Instance (TEST THIS!)
					FinalFantasylization_Dungeon_StormwindStockadeSong()
				elseif ( ZoneName == SZ["Gnomeregan"] ) then				-- Gnomeregan Instance
					FinalFantasylization_Dungeon_GnomereganSong()
				elseif ( ZoneName == SZ["Razorfen Kraul"] ) then			-- Razorfen Kraul Instance
					FinalFantasylization_Dungeon_RazorfenKraulSong()
				elseif ( ZoneName == SZ["Scarlet Monastery"] ) then			-- Scarlet Monastery Instance (TEST if works for all 4)
					FinalFantasylization_Dungeon_ScarletMonasterySong()
				elseif ( ZoneName == SZ["Razorfen Downs"] ) then			-- Razorfen Downs Instance
					FinalFantasylization_Dungeon_RazorfenDownsSong()
				elseif ( ZoneName == SZ["Uldaman"] ) then					-- Uldaman Instance
					FinalFantasylization_Dungeon_UldamanSong()
				elseif ( ZoneName == SZ["Zul'Farrak"] ) then				-- Zul'Farrak Instance
					FinalFantasylization_Dungeon_ZulFarrakSong()
				elseif ( ZoneName == SZ["Maraudon"] ) then					-- Maraudon Instance
					FinalFantasylization_Dungeon_MaraudonSong()
				elseif ( ZoneName == SZ["The Temple of Atal'Hakkar"] ) then	-- The Temple of Atal'Hakkar Instance
					FinalFantasylization_Dungeon_TempleofAtalHakkarSong()
				elseif ( ZoneName == SZ["Blackrock Depths"] ) then			-- Blackrock Depths Instance
					FinalFantasylization_Dungeon_BlackrockDepthsSong()
				elseif ( ZoneName == Z["Lower Blackrock Spire"] ) then		-- Lower Blackrock Spire Instance
					FinalFantasylization_Dungeon_LowerBlackrockSpireSong()
				elseif ( ZoneName == Z["Upper Blackrock Spire"] ) then		-- Upper Blackrock Spire Instance
					FinalFantasylization_Dungeon_UpperBlackrockSpireSong()
				elseif ( ZoneName == SZ["Dire Maul"] ) then					-- Dire Maul Instance
					FinalFantasylization_Dungeon_DireMaulSong()
				elseif ( ZoneName == SZ["Stratholme"] ) then				-- Stratholme Instance
					FinalFantasylization_Dungeon_StratholmeSong()
				elseif ( ZoneName == SZ["Scholomance"] ) then				-- Scholomance Instance
					FinalFantasylization_Dungeon_ScholomanceSong()

					-- Burning Crusade Dungeons
				elseif ( ZoneName == SZ["Hellfire Ramparts"] ) then			-- Hellfire Ramparts Instance
					FinalFantasylization_Dungeon_HellfireRampartsSong()
				elseif ( ZoneName == SZ["The Blood Furnace"] ) then			-- The Blood Furnace Instance
					FinalFantasylization_Dungeon_BloodFurnaceSong()
				elseif ( ZoneName == SZ["The Slave Pens"] ) then			-- The Slave Pens Instance
					FinalFantasylization_Dungeon_SlavePensSong()
				elseif ( ZoneName == SZ["The Underbog"] ) then				-- The Underbog Instance
					FinalFantasylization_Dungeon_UnderbogSong()
				elseif ( ZoneName == SZ["Mana-Tombs"] ) then				-- Mana-Tombs Instance
					FinalFantasylization_Dungeon_ManaTombsSong()
				elseif ( ZoneName == SZ["Auchenai Crypts"] ) then			-- Auchenai Crypts Instance
					FinalFantasylization_Dungeon_AuchenaiCryptsSong()
				elseif ( ZoneName == SZ["Sethekk Halls"] ) then				-- Sethekk Halls Instance
					FinalFantasylization_Dungeon_SethekkHallsSong()
				elseif ( ZoneName == SZ["The Steamvault"] ) then			-- The Steamvault Instance
					FinalFantasylization_Dungeon_SteamvaultSong()
				elseif ( ZoneName == SZ["The Shattered Halls"] ) then		-- The Shattered Halls Instance
					FinalFantasylization_Dungeon_ShatteredHallsSong()
				elseif ( ZoneName == SZ["Shadow Labyrinth"] ) then			-- Shadow Labyrinth Instance
					FinalFantasylization_Dungeon_ShadowLabyrinthSong()
				elseif ( ZoneName == SZ["Old Hillsbrad Foothills"] ) then	-- The Escape from Durnholde Keep Instance
					FinalFantasylization_Dungeon_EscapefromDurnholdeKeepSong()
				elseif ( ZoneName == SZ["The Mechanar"] ) then				-- The Mechanar Instance
					FinalFantasylization_Dungeon_MechanarSong()
				elseif ( ZoneName == SZ["The Botanica"] ) then				-- The Botanica Instance
					FinalFantasylization_Dungeon_BotanicaSong()
				elseif ( ZoneName == SZ["The Arcatraz"] ) then				-- The Arcatraz Instance
					FinalFantasylization_Dungeon_ArcatrazSong()
				elseif ( ZoneName == SZ["The Black Morass"] ) then			-- Opening the Dark Portal Instance
					FinalFantasylization_Dungeon_OpeningtheDarkPortalSong()
				elseif ( ZoneName == SZ["Magisters' Terrace"] ) then		-- Magisters' Terrace Instance
					FinalFantasylization_Dungeon_MagistersTerraceSong()
				
					-- Wrath of the Lich King Dungeons
				elseif ( ZoneName == SZ["Utgarde Keep"] ) then				-- Utgarde Keep Instance
					FinalFantasylization_Dungeon_UtgardeKeepSong()
				elseif ( ZoneName == SZ["The Nexus"] ) then					-- The Nexus Instance
					FinalFantasylization_Dungeon_TheNexusSong()
				elseif ( ZoneName == SZ["Azjol-Nerub"] ) then				-- Azjol-Nerub Instance
					FinalFantasylization_Dungeon_AzjolNerubSong()
				elseif ( ZoneName == SZ["Ahn'kahet: The Old Kingdom"] ) then	-- Ahn'kahet: The Old Kingdom Instance
					FinalFantasylization_Dungeon_AhnkahetTheOldKingdomSong()
				elseif ( ZoneName == SZ["Drak'Tharon Keep"] ) then			-- Drak'Tharon Keep Instance
					FinalFantasylization_Dungeon_DrakTharonKeepSong()
				elseif ( ZoneName == SZ["The Violet Hold"] ) then			-- The Violet Hold Instance
					FinalFantasylization_Dungeon_VioletHoldSong()
				elseif ( ZoneName == SZ["Gundrak"] ) then					-- Gundrak Instance
					FinalFantasylization_Dungeon_GundrakSong()
				elseif ( ZoneName == SZ["Halls of Stone"] ) then			-- Ulduar: Halls of Stone Instance
					FinalFantasylization_Dungeon_HallsofStoneSong()
				elseif ( ZoneName == SZ["Ulduar: Halls of Stone"] ) then	-- The Oculus Instance
					FinalFantasylization_Dungeon_TheOculusSong()
				elseif ( ZoneName == SZ["Halls of Lightning"] ) then		-- Ulduar: Halls of Lightning Instance
					FinalFantasylization_Dungeon_HallsofLightningSong()
				elseif ( ZoneName == SZ["Utgarde Pinnacle"] ) then			-- Utgarde Pinnacle Instance
					FinalFantasylization_Dungeon_UtgardePinnacleSong()
				elseif ( ZoneName == SZ["The Culling of Stratholme"] ) then	-- The Culling of Stratholme Instance
					FinalFantasylization_Dungeon_TheCullingofStratholmeSong()
				elseif ( ZoneName == SZ["Trial of the Champion"] ) then		-- Trial of the Champion Instance
					FinalFantasylization_Dungeon_TrialoftheChampionSong()
				elseif ( ZoneName == SZ["The Forge of Souls"] ) then		-- The Forge of Souls Instance
					FinalFantasylization_Dungeon_ForgeofSoulsSong()
				elseif ( ZoneName == SZ["Pit of Saron"] ) then				-- Pit of Saron Instance
					FinalFantasylization_Dungeon_PitofSaronSong()
				elseif ( ZoneName == SZ["Halls of Reflection"] ) then		-- Halls of Reflection Instance
					FinalFantasylization_Dungeon_HallsofReflectionSong()
-- More Instances go here					
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. "Instance not in FinalFantasylization")
				end

--###########################################################################################
--###########################################################################################
--##
--##			RAID EVENTS
--##
--###########################################################################################
--###########################################################################################

			elseif instanceType == "raid" and FinalFantasylization_InInstance == false and FinalFantasylizationOptions.Raid == true then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerInRaid.. ZoneName)
				FinalFantasylization_RaidSong()

--###########################################################################################
--###########################################################################################
--##
--##			BATTLEGROUNDS
--##
--###########################################################################################
--###########################################################################################			

			elseif instanceType == "pvp" and FinalFantasylization_InInstance == false and FinalFantasylizationOptions.Battleground == true then
				FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. PlayerInBattleground.. ZoneName)
				if ( ZoneName == Z["Alterac Valley"] ) then				-- Alterac Valley Battleground
					FinalFantasylization_AlteracValleyBG()
				elseif ( ZoneName == Z["Arathi Basin"] ) then			-- Arathi Basin Battleground
					FinalFantasylization_ArathiBasinBG()
				elseif ( ZoneName == Z["Eye of the Storm"] ) then		-- Eye of the Storm Battleground
					FinalFantasylization_EyeoftheStormBG()
				elseif ( ZoneName == Z["Strand of the Ancients"] ) then	-- Strand of the Ancients Battleground
					FinalFantasylization_StrandsoftheAncientsBG()
				elseif ( ZoneName == Z["Warsong Gulch"] ) then			-- Warsong Gulch Battleground
					FinalFantasylization_WarsongGulchBG()
				elseif ( ZoneName == Z["Isle of Conquest"] ) then		-- Isle of Conquest Battleground
					FinalFantasylization_IsleOfConquestBG()
				else
					FinalFantasylization_debugMsg(FFZlib.Color.Aqua .. "Battleground not in FinalFantasylization")
				end
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_InInstance = true
		else
			FinalFantasylization_InInstance = false
		end

--###########################################################################################
--###########################################################################################
--##
--##			OTHER EVENTS
--##
--###########################################################################################
--###########################################################################################
	
--'==========================================================================================		
--'	World event: Player is Resting
--'==========================================================================================		
		if ( IsResting() ) and ( factionEnglish == "Alliance" ) and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Sleep == true and ( pvpType == "friendly" or pvpType == "hostile" or pvpType == "sanctuary" or pvpType == "contested" or pvpType == nil or pvpType == "") then
			if FinalFantasylization_PlayerIsResting == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. AllianceRest)
				FinalFantasylization_Sleeping()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsResting = true
		elseif ( IsResting() ) and ( factionEnglish == "Horde" ) and FinalFantasylization_IsPlaying == false and FinalFantasylizationOptions.Sleep == true and ( pvpType == "friendly" or pvpType == "hostile" or pvpType == "sanctuary" or pvpType == "contested" or pvpType == nil or pvpType == "") then
			if FinalFantasylization_PlayerIsResting == false then
				FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. HordeRest)
				FinalFantasylization_Sleeping()
			end
			FinalFantasylization_IsPlaying = true
			FinalFantasylization_PlayerIsResting = true
		else
			FinalFantasylization_PlayerIsResting = false
		end
		
	else
		StopMusic();
	end
end
--'==========================================================================================		
--'	World event: /DANCE
--'==========================================================================================
function FinalFantasylization_DoEmote(emote, msg)
	FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. 'FinalFantasylization_DoEmote: '..emote);

	--emote is DANCE when "/dance" is used.
	
	if (emote=="DANCE" and UnitIsDeadOrGhost("player")==nil ) and FinalFantasylizationOptions.Dance == true then
		DanceSongPlaying = true
		FinalFantasylization_IsPlaying = true
		DanceOnMount = false;
		playermodel:SetUnit("player");
		modelname = playermodel:GetModel();
		savedname = modelname;
		race = UnitRace("player");

		revmodel = strrev(modelname);
		namestart = strlen(modelname) - strfind(revmodel,'\\') +2;
		songname = strsub(modelname,namestart);

		songname = gsub(songname,'scourgefemale','undeadfemale');
		songname = gsub(songname,'scourgemale','undeadmale');
	
		if (strmatch(songname,'druidbear') ~= nil) then
			songname = 'druidbear';
		elseif (strmatch(songname,'druidcat') ~= nil or strmatch(songname,'tiger') ~= nil) then
			songname = 'druidcat';
		elseif (strmatch(songname,'druidowlbear') ~= nil) then
			songname = 'druidowlbear';
		end

		FinalFantasylization_DanceSong = gsub(songname,'.m2','');
	
		FinalFantasylization_debugMsg(FinalFantasylization_DanceSong);

		if FinalFantasylization_DanceSong == "bloodelffemale" then FinalFantasylization_BloodElfFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "bloodelfmale" then FinalFantasylization_BloodElfMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "draeneifemale" then FinalFantasylization_DraeneiFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "draeneimale" then FinalFantasylization_DraeneiMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "dwarffemale" then FinalFantasylization_DwarfFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "dwarfmale" then FinalFantasylization_DwarfMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "gnomefemale" then FinalFantasylization_GnomeFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "gnomemale" then FinalFantasylization_GnomeMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "humanfemale" then FinalFantasylization_HumanFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "humanmale" then FinalFantasylization_HumanMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "nightelffemale" then FinalFantasylization_NightElfFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "nightelfmale" then FinalFantasylization_NightElfMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "orcfemale" then FinalFantasylization_OrcFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "orcmale" then FinalFantasylization_OrcMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "taurenfemale" then FinalFantasylization_TaurenFemaleDanceSong()
		elseif FinalFantasylization_DanceSong == "taurenmale" then FinalFantasylization_TaurenMaleDanceSong()
		elseif FinalFantasylization_DanceSong == "trollfemale" then FinalFantasylization_TrollFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "trollmale" then FinalFantasylization_TrollMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "undeadfemale" then FinalFantasylization_UndeadFemaleDanceSong();
		elseif FinalFantasylization_DanceSong == "undeadmale" then FinalFantasylization_UndeadMaleDanceSong();
		elseif FinalFantasylization_DanceSong == "druidbear" then FinalFantasylization_DruidBearDanceSong();
		elseif FinalFantasylization_DanceSong == "druidcat" then FinalFantasylization_DruidCatDanceSong();
		elseif FinalFantasylization_DanceSong == "druidowlbear" then FinalFantasylization_DruidOwlBearDanceSong();
		elseif FinalFantasylization_DanceSong == "druidtreeform" then FinalFantasylization_DruidTreeFormDanceSong()
		elseif FinalFantasylization_DanceSong == "wolf" then FinalFantasylization_WolfDanceSong();
		else FinalFantasylization_debugMsg("Dance Music error");
		end
	end
end

function FinalFantasylization_PlayerMove()
	if (DanceSongPlaying) then
		DanceOnMount = false
		DanceSongLastMove = GetTime();
		FinalFantasylization_StopDanceSong();
	end
end

function FinalFantasylization_TurnOrActionStart()
	FinalFantasylization_RightClick = true;
	FinalFantasylization_MouseMove();
end

function FinalFantasylization_TurnOrActionStop()
	FinalFantasylization_RightClick = false;
	FinalFantasylization_MouseMove();
end

function FinalFantasylization_CameraOrSelectOrMoveStart()
	FinalFantasylization_LeftClick = true;
	FinalFantasylization_MouseMove();
end

function FinalFantasylization_CameraOrSelectOrMoveStop()
	FinalFantasylization_LeftClick = false;
	FinalFantasylization_MouseMove();
end

function FinalFantasylization_TurnLeftStart()
	FinalFantasylization_LeftTurn = true;
	FinalFantasylization_MouseMove();
end

function FinalFantasylization_TurnLeftStop()
	FinalFantasylization_LeftTurn = false;
	FinalFantasylization_MouseMove();
end

function FinalFantasylization_TurnRightStart()
	FinalFantasylization_RightTurn = true;
	FinalFantasylization_MouseMove();
end

function FinalFantasylization_TurnRightStop()
	FinalFantasylization_RightTurn = false;
	FinalFantasylization_MouseMove();
end

function FinalFantasylization_MouseMove()
	if (DanceSongPlaying) then
		if (FinalFantasylization_LeftClick and FinalFantasylization_RightClick) then
			FinalFantasylization_StopDanceSong();
		elseif (FinalFantasylization_RightClick and FinalFantasylization_RightTurn) then
			FinalFantasylization_StopDanceSong();
		elseif (FinalFantasylization_RightClick and FinalFantasylization_LeftTurn) then
			FinalFantasylization_StopDanceSong();
		elseif (FinalFantasylization_RightTurn) then
			FinalFantasylization_StopDanceSong();
		elseif (FinalFantasylization_LeftTurn) then
			FinalFantasylization_StopDanceSong();
		end
	end
end

function FinalFantasylization_JumpOrAscendStart()
	if (DanceSongPlaying) then
		DanceOnMount = false
		DanceSongLastMove = GetTime();
		FinalFantasylization_StopDanceSong();
	end
--'==========================================================================================		
--'	World event: Chocobo Kweh!!
--'==========================================================================================	
	if IsMounted("player") and FinalFantasylizationOptions.ChocoboKweh == true then
		local mountcount = GetNumCompanions("MOUNT")
		local mountName = nil
		i = 1
		repeat 
			local creatureID, creatureName, spellID, icon, active, mountFlags = GetCompanionInfo("MOUNT", i)
			i = i + 1
			mountName = strlower(creatureName)
		until ( active ~= nil ) 
		if string.match(mountName,'strider') then
			FinalFantasylization_ChocoboKweh();
		end
	end
end

-- Stop the music
function FinalFantasylization_StopDanceSong()
	--FinalFantasylization_Debug('Stop song when playing');

	-- Only stop the music when DanceSong was playing
	if (DanceSongPlaying) then
		StopMusic();
		DanceSongPlaying = false;
		FinalFantasylization_debugMsg(FFZlib.Color.Yellow .. 'Dance music is stopped');
		FinalFantasylization_ClearMusicState()
		FinalFantasylization_debugMsg(FFZlib.Color.Red .. "StopDanceSong...")
		FinalFantasylization_GetMusic()
	end
end

--'==========================================================================================
--'		END OF EVENTS
--'==========================================================================================

-- Initializes FinalFantasylization after all saved variables have been loaded.

-- Handles timer updates. Called once per video frame.
function onUpdate(self, elapsed)
	TimeSinceLastUpdate = (TimeSinceLastUpdate or 0) + (elapsed or 0); 	

	if (TimeSinceLastUpdate > FinalFantasylization_UpdateInterval) then
		FinalFantasylization_GetMusic()

		TimeSinceLastUpdate = 0;
	end
end

------------------------------------------------------------
-- FinalFantasylization methods
------------------------------------------------------------
-- Resets all FinalFantasylization options. Used to set the saved variable to a default state.
function FinalFantasylizationResetOptions()
	FinalFantasylizationOptions = {}
	FinalFantasylizationFillMissingOptions()
end

-- Adds default values for any FinalFantasylization options that are missing. This can happen after an upgrade.
function FinalFantasylizationFillMissingOptions()
	if not FinalFantasylizationOptions then FinalFantasylizationOptions = {} end
	
	if FinalFantasylizationOptions.Enabled == nil then FinalFantasylizationOptions.Enabled = true end
	if FinalFantasylizationOptions.Music == nil then FinalFantasylizationOptions.Music = true end
	if FinalFantasylizationOptions.Combat == nil then FinalFantasylizationOptions.Combat = true end
	if FinalFantasylizationOptions.Mount == nil then FinalFantasylizationOptions.Mount = true end
	if FinalFantasylizationOptions.Dungeon == nil then FinalFantasylizationOptions.Dungeon = true end
	if FinalFantasylizationOptions.Raid == nil then FinalFantasylizationOptions.Raid = true end
	if FinalFantasylizationOptions.Battleground == nil then FinalFantasylizationOptions.Battleground = true end
	if FinalFantasylizationOptions.Sleep == nil then FinalFantasylizationOptions.Sleep = true end
	if FinalFantasylizationOptions.Swim == nil then FinalFantasylizationOptions.Swim = true end
	if FinalFantasylizationOptions.Dance == nil then FinalFantasylizationOptions.Dance = true end
	if FinalFantasylizationOptions.Dead == nil then FinalFantasylizationOptions.Dead = true end
	if FinalFantasylizationOptions.Flight == nil then FinalFantasylizationOptions.Flight = true end
	if FinalFantasylizationOptions.Capital == nil then FinalFantasylizationOptions.Capital = true end
	if FinalFantasylizationOptions.Sound == nil then FinalFantasylizationOptions.Sound = true end
	if FinalFantasylizationOptions.Fanfare == nil then FinalFantasylizationOptions.Fanfare = true end
	if FinalFantasylizationOptions.ChocoboKweh == nil then FinalFantasylizationOptions.ChocoboKweh = true end
	if FinalFantasylizationOptions.LevelUp == nil then FinalFantasylizationOptions.LevelUp = true end
	if FinalFantasylizationOptions.Debug == nil then FinalFantasylizationOptions.Debug = false end
end

-- Core frame setup
if not FinalFantasylizationCoreFrame then
	FinalFantasylizationCoreFrame = CreateFrame("Frame", "FinalFantasylizationCoreFrame")
end

FinalFantasylizationCoreFrame:SetScript("OnUpdate", onUpdate)
FinalFantasylizationCoreFrame:SetScript("OnEvent", function() FinalFantasylization_OnEvent(event, arg1, arg2, arg3) end)

	FinalFantasylizationCoreFrame:RegisterEvent("UNIT_COMBO_POINTS") -- Fired when there has baan a change in Combo Points
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Fired when the player enters the world, enters/leaves an instance, or respawns at a graveyard. Also fires any other time the player sees a loading screen.
	FinalFantasylizationCoreFrame:RegisterEvent("ADDON_LOADED") -- This event fires whenever an AddOn has finished loading and the SavedVariables for that AddOn have been loaded from their file.
	FinalFantasylizationCoreFrame:RegisterEvent("VARIABLES_LOADED") -- This event fires whenever an AddOn is loaded (fires once for each AddOn loaded if multiple AddOns are being loaded), whether that is during the inital Loading Phase or when an AddOn is loaded using the LoadAddOn("addonname") or UIParentLoadAddon("addonname") function. This event always fires after SavedVariables of the AddOn have been loaded from disk and its OnLoad function has been executed.
	FinalFantasylizationCoreFrame:RegisterEvent("SPELLS_CHANGED") -- This event fires shortly before the PLAYER_LOGIN event and signals that information on the user's spells has been loaded and is available to the UI.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_LOGIN") -- This event fires immediately before PLAYER_ENTERING_WORLD.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_ENTERING_WORLD") -- This event fires immediately after PLAYER_LOGIN
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_LEAVING_WORLD") -- Fires when the player logs out or exits a world area.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_ALIVE") -- This event fires after PLAYER_ENTERING_WORLD
	FinalFantasylizationCoreFrame:RegisterEvent("WORLD_MAP_UPDATE") -- Fired when the world map should be updated. When entering a battleground, this event won't fire until the zone is changed (i.e. in WSG when you walk outside of Warsong Lumber Mill or Silverwing Hold)
	FinalFantasylizationCoreFrame:RegisterEvent("ZONE_CHANGED") -- Fired when the player enters a new zone. Zones are the smallest named subdivions of the game world and are contained within areas (also called regions). Whenever the text over the minimap changes, this event is fired. 
	FinalFantasylizationCoreFrame:RegisterEvent("ZONE_CHANGED_INDOORS") -- Fired when a player enters a new zone within a city. 
	FinalFantasylizationCoreFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA") -- Fired when the user enters a new zone and a new area. e.g. moving from Duskwood to Stranglethorn Vale.
	FinalFantasylizationCoreFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_ENTER_COMBAT") -- This event fires when the player initiates melee auto-attack.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_LEAVE_COMBAT") -- This event fires when the player stops melee auto-attack.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Fired whenever you enter combat, as normal regen rates are disabled during combat.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_REGEN_ENABLED") -- Fired after ending combat, as regen rates return to normal. Useful for determining when a player has left combat. 
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_XP_UPDATE") --Fired when the player's XP is updated (due quest completion or killing). 
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_PVP_KILLS_CHANGED") -- Fired when you slay another player.
	FinalFantasylizationCoreFrame:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE") -- Fires when player's faction changes. ie: "Your reputation with Timbermaw Hold has very slightly increased."
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_UPDATE_RESTING") -- Fired when the player starts or stops resting, i.e. when entering/leaving inns/major towns. 
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_CAMPING") -- Fired when the player is camping 
	FinalFantasylizationCoreFrame:RegisterEvent("UNIT_AURA") -- Fires when a unit loses or gains a buff or debuff.
	FinalFantasylizationCoreFrame:RegisterEvent("UNIT_MANA") -- Fired whenever a unit's mana changes either by usage or by regeneration. The event is also called when a unit is clicked on.
	FinalFantasylizationCoreFrame:RegisterEvent("UNIT_HEALTH") -- Fired whenever a units health is affected.
	FinalFantasylizationCoreFrame:RegisterEvent("UNIT_ENERGY") -- Fired whenever a units energy is affected.
	FinalFantasylizationCoreFrame:RegisterEvent("UNIT_MODEL_CHANGED") -- Fired when the unit's 3d model changes. (Shapeshift, Polymorph, etc...)
	FinalFantasylizationCoreFrame:RegisterEvent("UNIT_SPELLCAST_SENT") -- Fires when a request to cast a spell (on behalf of the player or a unit controlled by the player) is sent to the server
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_DEAD") -- Fired when the player has died. 
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_ALIVE") -- Fired when the player: Releases from death to a graveyard. Accepts a resurrect before releasing their spirit.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_UNGHOST") -- Fired when the player is alive after being a ghost. Called after one of: Performing a successful corpse run and the player accepts the 'Resurrect Now' box. Accepting a resurrect from another player after releasing from a death. Zoning into an instance where the player is dead. When the player accept a resurrect from a Spirit Healer.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_CONTROL_GAINED") -- Fires after the PLAYER_CONTROL_LOST event, when control has been restored to the player. (Recover from Mindcontrol, Taxi, etc...)
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_CONTROL_LOST") -- Fires whenever the player is unable to control the character. Examples are when afflicted by fear or when using a taxi. (Mindcontrol, Taxi, etc...)
	FinalFantasylizationCoreFrame:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL") -- Fired for non faction specific events in the battlegrounds such as the battle start announcement. 
	FinalFantasylizationCoreFrame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS") -- Fired whenever joining a queue, leaving a queue, battlefield to join is changed, when you can join a battlefield, or if somebody wins the battleground. 
	FinalFantasylizationCoreFrame:RegisterEvent("UPDATE_WORLD_STATES") -- Fired within Battlefields when certain things occur such as a flag being captured. 
	FinalFantasylizationCoreFrame:RegisterEvent("UPDATE_CHAT_WINDOWS") -- Fired when there's a reason to update the chat windows. 
	FinalFantasylizationCoreFrame:RegisterEvent("CHAT_MSG_CHANNEL") -- Fired when the client receives a channel message. 
	FinalFantasylizationCoreFrame:RegisterEvent("CHAT_MSG_BATTLEGROUND") -- Fired when a message is received through the battleground group channel.
	FinalFantasylizationCoreFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT") -- Fires whenever you mouse over any NPC or PC
	FinalFantasylizationCoreFrame:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE") -- Fires when you gain or are affected by a instant or ongoing spell or effect.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_LEVEL_UP") -- Fires when player levels up
	FinalFantasylizationCoreFrame:RegisterEvent("CHAT_MSG_TEXT_EMOTE") -- Fires when a chat emote is used (aka /dance)	
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_GAINS_VEHICLE_DATA") -- Fires when the player gains vehicle-related attributes without necessarily entering a vehicle.
	FinalFantasylizationCoreFrame:RegisterEvent("PLAYER_LOSES_VEHICLE_DATA"); -- Fires when the player loses vehicle-related attributes without necessarily having been in a vehicle.
	
	hooksecurefunc("DoEmote", FinalFantasylization_DoEmote);	
	hooksecurefunc("MoveForwardStart"	, FinalFantasylization_PlayerMove);
	hooksecurefunc("MoveBackwardStart"	, FinalFantasylization_PlayerMove);
	hooksecurefunc("StrafeLeftStart"	, FinalFantasylization_PlayerMove);
	hooksecurefunc("StrafeRightStart"	, FinalFantasylization_PlayerMove);
	hooksecurefunc("JumpOrAscendStart"	, FinalFantasylization_JumpOrAscendStart);
	hooksecurefunc("ToggleAutoRun"		, FinalFantasylization_PlayerMove);	
	hooksecurefunc("TurnOrActionStart"			, FinalFantasylization_TurnOrActionStart);
	hooksecurefunc("TurnOrActionStop"			, FinalFantasylization_TurnOrActionStop);
	hooksecurefunc("CameraOrSelectOrMoveStart"	, FinalFantasylization_CameraOrSelectOrMoveStart);
	hooksecurefunc("CameraOrSelectOrMoveStop"	, FinalFantasylization_CameraOrSelectOrMoveStop);
	hooksecurefunc("TurnLeftStart"				, FinalFantasylization_TurnLeftStart);
	hooksecurefunc("TurnLeftStop"				, FinalFantasylization_TurnLeftStop);
	hooksecurefunc("TurnRightStart"				, FinalFantasylization_TurnRightStart);
	hooksecurefunc("TurnRightStop"				, FinalFantasylization_TurnRightStop);	