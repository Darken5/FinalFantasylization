-- FinalFantasylization by Darken5
-- Version 4.0.0
------------------------------------------------------------

function FinalFantasylization_OnLoad()
	FinalFantasylizationFrame:RegisterEvent("UNIT_COMBO_POINTS") -- Fired when there has baan a change in Combo Points
	FinalFantasylizationFrame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Fired when the player enters the world, enters/leaves an instance, or respawns at a graveyard. Also fires any other time the player sees a loading screen.
	FinalFantasylizationFrame:RegisterEvent("ADDON_LOADED") -- This event fires whenever an AddOn has finished loading and the SavedVariables for that AddOn have been loaded from their file.
	FinalFantasylizationFrame:RegisterEvent("VARIABLES_LOADED") -- This event fires whenever an AddOn is loaded (fires once for each AddOn loaded if multiple AddOns are being loaded), whether that is during the inital Loading Phase or when an AddOn is loaded using the LoadAddOn("addonname") or UIParentLoadAddon("addonname") function. This event always fires after SavedVariables of the AddOn have been loaded from disk and its OnLoad function has been executed.
	FinalFantasylizationFrame:RegisterEvent("SPELLS_CHANGED") -- This event fires shortly before the PLAYER_LOGIN event and signals that information on the user's spells has been loaded and is available to the UI.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_LOGIN") -- This event fires immediately before PLAYER_ENTERING_WORLD.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_ENTERING_WORLD") -- This event fires immediately after PLAYER_LOGIN
	FinalFantasylizationFrame:RegisterEvent("PLAYER_LEAVING_WORLD") -- Fires when the player logs out or exits a world area.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_ALIVE") -- This event fires after PLAYER_ENTERING_WORLD
	FinalFantasylizationFrame:RegisterEvent("WORLD_MAP_UPDATE") -- Fired when the world map should be updated. When entering a battleground, this event won't fire until the zone is changed (i.e. in WSG when you walk outside of Warsong Lumber Mill or Silverwing Hold)
	FinalFantasylizationFrame:RegisterEvent("ZONE_CHANGED") -- Fired when the player enters a new zone. Zones are the smallest named subdivions of the game world and are contained within areas (also called regions). Whenever the text over the minimap changes, this event is fired. 
	FinalFantasylizationFrame:RegisterEvent("ZONE_CHANGED_INDOORS") -- Fired when a player enters a new zone within a city. 
	FinalFantasylizationFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA") -- Fired when the user enters a new zone and a new area. e.g. moving from Duskwood to Stranglethorn Vale.
	FinalFantasylizationFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	FinalFantasylizationFrame:RegisterEvent("PLAYER_ENTER_COMBAT") -- This event fires when the player initiates melee auto-attack.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_LEAVE_COMBAT") -- This event fires when the player stops melee auto-attack.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Fired whenever you enter combat, as normal regen rates are disabled during combat.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_REGEN_ENABLED") -- Fired after ending combat, as regen rates return to normal. Useful for determining when a player has left combat. 
	FinalFantasylizationFrame:RegisterEvent("PLAYER_XP_UPDATE") --Fired when the player's XP is updated (due quest completion or killing). 
	FinalFantasylizationFrame:RegisterEvent("PLAYER_PVP_KILLS_CHANGED") -- Fired when you slay another player.
	FinalFantasylizationFrame:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE") -- Fires when player's faction changes. ie: "Your reputation with Timbermaw Hold has very slightly increased."
	FinalFantasylizationFrame:RegisterEvent("PLAYER_UPDATE_RESTING") -- Fired when the player starts or stops resting, i.e. when entering/leaving inns/major towns. 
	FinalFantasylizationFrame:RegisterEvent("PLAYER_CAMPING") -- Fired when the player is camping 
	FinalFantasylizationFrame:RegisterEvent("UNIT_AURA") -- Fires when a unit loses or gains a buff or debuff.
	FinalFantasylizationFrame:RegisterEvent("UNIT_MANA") -- Fired whenever a unit's mana changes either by usage or by regeneration. The event is also called when a unit is clicked on.
	FinalFantasylizationFrame:RegisterEvent("UNIT_HEALTH") -- Fired whenever a units health is affected.
	FinalFantasylizationFrame:RegisterEvent("UNIT_ENERGY") -- Fired whenever a units energy is affected.
	FinalFantasylizationFrame:RegisterEvent("UNIT_MODEL_CHANGED") -- Fired when the unit's 3d model changes. (Shapeshift, Polymorph, etc...)
	FinalFantasylizationFrame:RegisterEvent("UNIT_SPELLCAST_SENT") -- Fires when a request to cast a spell (on behalf of the player or a unit controlled by the player) is sent to the server
	FinalFantasylizationFrame:RegisterEvent("PLAYER_DEAD") -- Fired when the player has died. 
	FinalFantasylizationFrame:RegisterEvent("PLAYER_ALIVE") -- Fired when the player: Releases from death to a graveyard. Accepts a resurrect before releasing their spirit.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_UNGHOST") -- Fired when the player is alive after being a ghost. Called after one of: Performing a successful corpse run and the player accepts the 'Resurrect Now' box. Accepting a resurrect from another player after releasing from a death. Zoning into an instance where the player is dead. When the player accept a resurrect from a Spirit Healer.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_CONTROL_GAINED") -- Fires after the PLAYER_CONTROL_LOST event, when control has been restored to the player. (Recover from Mindcontrol, Taxi, etc...)
	FinalFantasylizationFrame:RegisterEvent("PLAYER_CONTROL_LOST") -- Fires whenever the player is unable to control the character. Examples are when afflicted by fear or when using a taxi. (Mindcontrol, Taxi, etc...)
	FinalFantasylizationFrame:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL") -- Fired for non faction specific events in the battlegrounds such as the battle start announcement. 
	FinalFantasylizationFrame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS") -- Fired whenever joining a queue, leaving a queue, battlefield to join is changed, when you can join a battlefield, or if somebody wins the battleground. 
	FinalFantasylizationFrame:RegisterEvent("UPDATE_WORLD_STATES") -- Fired within Battlefields when certain things occur such as a flag being captured. 
	FinalFantasylizationFrame:RegisterEvent("UPDATE_CHAT_WINDOWS") -- Fired when there's a reason to update the chat windows. 
	FinalFantasylizationFrame:RegisterEvent("CHAT_MSG_CHANNEL") -- Fired when the client receives a channel message. 
	FinalFantasylizationFrame:RegisterEvent("CHAT_MSG_BATTLEGROUND") -- Fired when a message is received through the battleground group channel.
	FinalFantasylizationFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT") -- Fires whenever you mouse over any NPC or PC
	FinalFantasylizationFrame:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE") -- Fires when you gain or are affected by a instant or ongoing spell or effect.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_LEVEL_UP") -- Fires when player levels up
	FinalFantasylizationFrame:RegisterEvent("CHAT_MSG_TEXT_EMOTE") -- Fires when a chat emote is used (aka /dance)	
	FinalFantasylizationFrame:RegisterEvent("PLAYER_GAINS_VEHICLE_DATA") -- Fires when the player gains vehicle-related attributes without necessarily entering a vehicle.
	FinalFantasylizationFrame:RegisterEvent("PLAYER_LOSES_VEHICLE_DATA"); -- Fires when the player loses vehicle-related attributes without necessarily having been in a vehicle.
	
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

	-- Slash Commands
	SlashCmdList["FinalFantasylization"] = FinalFantasylization_SlashCommands
	SLASH_PVPSound1 = "/ffz"
	SLASH_PVPSound2 = "/finalfantasylization"
	
	-- Addon loaded message
	print("|cFF50C0FFFinalFantasylization |cFFFFA500"..GetAddOnMetadata("FinalFantasylization", "Version").."|cFF50C0FF loaded.")
end


function FinalFantasylization_OnEvent(self, event, ...)

end