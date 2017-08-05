------------------------------------------------------------
-- FinalFantasylization by Hellfox and Darken5
-- See Readme.htm for more information.

------------------------------------------------------------

local FinalFantasylizationUICancelOptions = { }

------------------------------------------------------------
-- Interface Options
------------------------------------------------------------

function FinalFantasylizationUI_OnLoad()
	-- Register the Interface Main page.
	FinalFantasylizationUIFrame.name = "FinalFantasylization"
	FinalFantasylizationUIFrame.default = FinalFantasylizationUI_OnDefaults
	FinalFantasylizationUIFrame.cancel = FinalFantasylizationUI_OnCancel
	InterfaceOptions_AddCategory(FinalFantasylizationUIFrame)
	-- Update the version display.
	local Version = GetAddOnMetadata("FinalFantasylization", "Version")
	if Version then 
		FinalFantasylizationUIFrame_AboutVersionLabel:SetText(string.format(FinalFantasylizationUIFrame_AboutVersionLabel_Text, Version))
	end
	-- Register the Interface Soundpack  page.
	FinalFantasylizationUISPA.name = "Soundpacks"; 
	FinalFantasylizationUISPA.parent = "FinalFantasylization"; 
	InterfaceOptions_AddCategory(FinalFantasylizationUISPA); 
	-- Register the Interface Debug page.
	FinalFantasylizationUIDebug.name = "Debug Menu"; 
	FinalFantasylizationUIDebug.parent = "FinalFantasylization"; 
	InterfaceOptions_AddCategory(FinalFantasylizationUIDebug); 

end

function FinalFantasylizationUI_Show()
	InterfaceOptionsFrame_OpenToCategory(FinalFantasylizationUIFrame)
end

function FinalFantasylizationUISP_Show()
	InterfaceOptionsFrame_OpenToCategory(FinalFantasylizationUISPA)
end

function FinalFantasylizationUIDebug_Show()
	InterfaceOptionsFrame_OpenToCategory(FinalFantasylizationUIDebug)
end

function FinalFantasylizationMiniMapButton_OnClick(arg1)
	if (arg1 == "RightButton") then
        FinalFantasylizationUISP_Show();
    elseif (arg1 == "LeftButton") then 
        FinalFantasylizationUI_Show();
    end

end

function FinalFantasylizationUI_OnShow()
	-- When the FinalFantasylization Interface Options window is shown, update the state of controls based on current FinalFantasylization options.
	FinalFantasylizationUIFrame_EnableCheck:SetChecked(FinalFantasylizationOptions.Enabled)
	FinalFantasylizationUIFrame_MusicCheck:SetChecked(FinalFantasylizationOptions.Music)
	FinalFantasylizationUIFrame_CombatCheck:SetChecked(FinalFantasylizationOptions.Combat)
	FinalFantasylizationUIFrame_MountCheck:SetChecked(FinalFantasylizationOptions.Mount)
	FinalFantasylizationUIFrame_DungeonCheck:SetChecked(FinalFantasylizationOptions.Dungeon)
	FinalFantasylizationUIFrame_RaidCheck:SetChecked(FinalFantasylizationOptions.Raid)
	FinalFantasylizationUIFrame_BattlegroundCheck:SetChecked(FinalFantasylizationOptions.Battleground)
	FinalFantasylizationUIFrame_DanceCheck:SetChecked(FinalFantasylizationOptions.Dance)
	FinalFantasylizationUIFrame_SleepCheck:SetChecked(FinalFantasylizationOptions.Sleep)
	FinalFantasylizationUIFrame_SwimCheck:SetChecked(FinalFantasylizationOptions.Swim)
	FinalFantasylizationUIFrame_DeadCheck:SetChecked(FinalFantasylizationOptions.Dead)
	FinalFantasylizationUIFrame_FlightCheck:SetChecked(FinalFantasylizationOptions.Flight)
	FinalFantasylizationUIFrame_CapitalCheck:SetChecked(FinalFantasylizationOptions.Capital)
	FinalFantasylizationUIFrame_SoundCheck:SetChecked(FinalFantasylizationOptions.Sound)
	FinalFantasylizationUIFrame_FanfareCheck:SetChecked(FinalFantasylizationOptions.Fanfare)
	FinalFantasylizationUIFrame_ChocoboKwehCheck:SetChecked(FinalFantasylizationOptions.ChocoboKweh)
	FinalFantasylizationUIFrame_LevelUpCheck:SetChecked(FinalFantasylizationOptions.LevelUp)
	FinalFantasylizationUIFrame_DebugCheck:SetChecked(FinalFantasylizationOptions.Debug)
	-- Also, save a copy of their current options so that they can be reset if the user clicks Cancel.
	FinalFantasylizationUICancelOptions.Enabled = FinalFantasylizationOptions.Enabled
	FinalFantasylizationUICancelOptions.Music = FinalFantasylizationOptions.Music
	FinalFantasylizationUICancelOptions.Combat = FinalFantasylizationOptions.Combat
	FinalFantasylizationUICancelOptions.Mount = FinalFantasylizationOptions.Mount
	FinalFantasylizationUICancelOptions.Dungeon = FinalFantasylizationOptions.Dungeon
	FinalFantasylizationUICancelOptions.Raid = FinalFantasylizationOptions.Raid
	FinalFantasylizationUICancelOptions.Battleground = FinalFantasylizationOptions.Battleground
	FinalFantasylizationUICancelOptions.Dance = FinalFantasylizationOptions.Dance
	FinalFantasylizationUICancelOptions.Sleep = FinalFantasylizationOptions.Sleep
	FinalFantasylizationUICancelOptions.Swim = FinalFantasylizationOptions.Swim
	FinalFantasylizationUICancelOptions.Dead = FinalFantasylizationOptions.Dead
	FinalFantasylizationUICancelOptions.Flight = FinalFantasylizationOptions.Flight
	FinalFantasylizationUICancelOptions.Capital = FinalFantasylizationOptions.Capital
	FinalFantasylizationUICancelOptions.Sound = FinalFantasylizationOptions.Sound
	FinalFantasylizationUICancelOptions.Fanfare = FinalFantasylizationOptions.Fanfare
	FinalFantasylizationUICancelOptions.ChocoboKweh = FinalFantasylizationOptions.ChocoboKweh
	FinalFantasylizationUICancelOptions.LevelUp = FinalFantasylizationOptions.LevelUp
	FinalFantasylizationUICancelOptions.Debug = FinalFantasylizationOptions.Debug
end

function FinalFantasylizationUI_OnCancel()
	-- Reset all FinalFantasylization options to the state they were in when the UI was first launched.
	FinalFantasylizationOptions.Enabled = FinalFantasylizationUICancelOptions.Enabled
	FinalFantasylizationOptions.Music = FinalFantasylizationUICancelOptions.Music
	FinalFantasylizationOptions.Combat = FinalFantasylizationUICancelOptions.Combat
	FinalFantasylizationOptions.Mount = FinalFantasylizationUICancelOptions.Mount
	FinalFantasylizationOptions.Dungeon = FinalFantasylizationUICancelOptions.Dungeon
	FinalFantasylizationOptions.Raid = FinalFantasylizationUICancelOptions.Raid
	FinalFantasylizationOptions.Battleground = FinalFantasylizationUICancelOptions.Battleground
	FinalFantasylizationOptions.Dance = FinalFantasylizationUICancelOptions.Dance
	FinalFantasylizationOptions.Sleep = FinalFantasylizationUICancelOptions.Sleep
	FinalFantasylizationOptions.Swim = FinalFantasylizationUICancelOptions.Swim
	FinalFantasylizationOptions.Dead = FinalFantasylizationUICancelOptions.Dead
	FinalFantasylizationOptions.Flight = FinalFantasylizationUICancelOptions.Flight
	FinalFantasylizationOptions.Capital = FinalFantasylizationUICancelOptions.Capital
	FinalFantasylizationOptions.Sound = FinalFantasylizationUICancelOptions.Sound
	FinalFantasylizationOptions.Fanfare = FinalFantasylizationUICancelOptions.Fanfare
	FinalFantasylizationOptions.ChocoboKweh = FinalFantasylizationUICancelOptions.ChocoboKweh
	FinalFantasylizationOptions.LevelUp = FinalFantasylizationUICancelOptions.LevelUp
	FinalFantasylizationOptions.Debug = FinalFantasylizationUICancelOptions.Debug
end

function FinalFantasylizationUI_OnDefaults()
	-- Reset all FinalFantasylization options to their defaults.
	FinalFantasylizationResetOptions()
	FinalFantasylizationUI_OnShow()
end

function FinalFantasylizationUIFrame_EnableCheck_OnClick()
	FinalFantasylizationEnable(FinalFantasylizationUIFrame_EnableCheck:GetChecked() ~= nil)
	if FinalFantasylizationOptions.Enabled then
		FinalFantasylizationUIFrame_DisabledWarningLabel:Hide()
		FinalFantasylization_ClearMusicState();
		FinalFantasylization_GetMusic()
	else
		FinalFantasylizationUIFrame_DisabledWarningLabel:Show()
		StopMusic()
		FinalFantasylization_ClearMusicState();
	end
end

function FinalFantasylizationUIFrame_EnableOn_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. EnabledCommand)
	FinalFantasylizationUIFrame_DisabledWarningLabel:Hide()
	FinalFantasylization_ClearMusicState();
	FinalFantasylization_GetMusic()
end

function FinalFantasylizationUIFrame_EnableOff_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. DisabledCommand)
	FinalFantasylizationUIFrame_DisabledWarningLabel:Show()
	StopMusic()
	FinalFantasylization_ClearMusicState();
end

function FinalFantasylizationUIFrame_MusicCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. MusicCommand)
end
function FinalFantasylizationUIFrame_CombatCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. CombatCommand)
end
function FinalFantasylizationUIFrame_MountCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. MountCommand)
end
function FinalFantasylizationUIFrame_DungeonCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. DungeonCommand)
end
function FinalFantasylizationUIFrame_RaidCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. RaidCommand)
end
function FinalFantasylizationUIFrame_BattlegroundCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. BattlegroundCommand)
end
function FinalFantasylizationUIFrame_SleepCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. SleepCommand)
end
function FinalFantasylizationUIFrame_DanceCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. DanceCommand)
end
function FinalFantasylizationUIFrame_SwimCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. SwimCommand)
end
function FinalFantasylizationUIFrame_DeadCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. DeadCommand)
end
function FinalFantasylizationUIFrame_FlightCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. FlightCommand)
end
function FinalFantasylizationUIFrame_CapitalCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. CapitalCommand)
end
function FinalFantasylizationUIFrame_SoundCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. SoundCommand)
end
function FinalFantasylizationUIFrame_FanfareCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. FanfareCommand)
end
function FinalFantasylizationUIFrame_ChocoboKwehCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. ChocoboKwehCommand)
end
function FinalFantasylizationUIFrame_LevelUpCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. LevelUpCommand)
end
function FinalFantasylizationUIFrame_DebugCheck_OnClick()
	FFZlib.ExecuteChatCommand("/ffs " .. DebugCommand)
end

function FinalFantasylizationUIFrame_EnableAll_Button_OnClick()
	FinalFantasylizationUIFrame_EnableCheck:SetChecked(true);
	FinalFantasylizationUIFrame_MusicCheck:SetChecked(true);
	FinalFantasylizationUIFrame_CombatCheck:SetChecked(true);
	FinalFantasylizationUIFrame_MountCheck:SetChecked(true);
	FinalFantasylizationUIFrame_DungeonCheck:SetChecked(true);
	FinalFantasylizationUIFrame_RaidCheck:SetChecked(true);
	FinalFantasylizationUIFrame_BattlegroundCheck:SetChecked(true);
	FinalFantasylizationUIFrame_SleepCheck:SetChecked(true);
	FinalFantasylizationUIFrame_DanceCheck:SetChecked(true);
	FinalFantasylizationUIFrame_SwimCheck:SetChecked(true);
	FinalFantasylizationUIFrame_DeadCheck:SetChecked(true);
	FinalFantasylizationUIFrame_FlightCheck:SetChecked(true);
	FinalFantasylizationUIFrame_CapitalCheck:SetChecked(true);
	FinalFantasylizationUIFrame_SoundCheck:SetChecked(true);
	FinalFantasylizationUIFrame_FanfareCheck:SetChecked(true);
	FinalFantasylizationUIFrame_ChocoboKwehCheck:SetChecked(true);
	FinalFantasylizationUIFrame_LevelUpCheck:SetChecked(true);
	FinalFantasylization_ClearMusicState();
	FinalFantasylization_GetMusic();
end
function FinalFantasylizationUIFrame_DisableAll_Button_OnClick()
	FinalFantasylizationUIFrame_EnableCheck:SetChecked(false);
	FinalFantasylizationUIFrame_MusicCheck:SetChecked(false);
	FinalFantasylizationUIFrame_CombatCheck:SetChecked(false);
	FinalFantasylizationUIFrame_MountCheck:SetChecked(false);
	FinalFantasylizationUIFrame_DungeonCheck:SetChecked(false);
	FinalFantasylizationUIFrame_RaidCheck:SetChecked(false);
	FinalFantasylizationUIFrame_BattlegroundCheck:SetChecked(false);
	FinalFantasylizationUIFrame_SleepCheck:SetChecked(false);
	FinalFantasylizationUIFrame_DanceCheck:SetChecked(false);
	FinalFantasylizationUIFrame_SwimCheck:SetChecked(false);
	FinalFantasylizationUIFrame_DeadCheck:SetChecked(false);
	FinalFantasylizationUIFrame_FlightCheck:SetChecked(false);
	FinalFantasylizationUIFrame_CapitalCheck:SetChecked(false);
	FinalFantasylizationUIFrame_SoundCheck:SetChecked(false);
	FinalFantasylizationUIFrame_FanfareCheck:SetChecked(false);
	FinalFantasylizationUIFrame_ChocoboKwehCheck:SetChecked(false);
	FinalFantasylizationUIFrame_LevelUpCheck:SetChecked(false);
	StopMusic();
	FinalFantasylization_ClearMusicState();
end

--------------------------------------------
-- SOUNDPACK MENU BUTTONS
--------------------------------------------

-- Soundpacks
function FinalFantasylizationUISP_FF7_Button_OnClick()
	FFZlib.ExecuteChatCommand("/ffsp ff7")
end
function FinalFantasylizationUISP_FF7Universe_Button_OnClick()
	FFZlib.ExecuteChatCommand("/ffsp ff7universe")
end
function FinalFantasylizationUISP_Steven2016_Button_OnClick()
	FFZlib.ExecuteChatCommand("/ffsp steven2016")
end
function FinalFantasylizationUISP_LegendofZelda_Button_OnClick()
	FFZlib.ExecuteChatCommand("/ffsp zelda")
end

--------------------------------------------
-- DEBUG MENU BUTTONS
--------------------------------------------

-- Test Button
function FinalFantasylizationUIDebug_Test_Button_OnClick()
	FFZlib.ExecuteChatCommand("/ffs test")
end

--------------------------------------------
-- Drop down menu
--------------------------------------------

local FinalFantasylizationDropDownMenu = CreateFrame("Frame", "FinalFantasylizationDropDownMenu")
FinalFantasylizationDropDownMenu.displayMode = "MENU"
FinalFantasylizationDropDownMenu.initialize = function(self, level) end
FinalFantasylizationDropDownMenu.info = {}
FinalFantasylizationDropDownMenu.UncheckHack = function(dropdownbutton)
    _G[dropdownbutton:GetName().."Check"]:Hide()
end
FinalFantasylizationDropDownMenu.HideMenu = function()
    if UIDROPDOWNMENU_OPEN_MENU == FinalFantasylizationDropDownMenu then
        CloseDropDownMenus()
    end
end

	-- Dropdown Menu Setup
FinalFantasylizationDropDownMenu.initialize = function(self, level)
    if not level then return end -- Dropdown Menu Tier 1
    local info = self.info
    wipe(info)
    if level == 1 then
		
			-- Title
		info.isTitle = 1
        info.text = "FinalFantasylization"
        info.notCheckable = 1
        UIDropDownMenu_AddButton(info, level)

		wipe(info)
			-- Options Menu
		info.keepShownOnClick = 1
		info.text = "Options"
		info.hasArrow = 1
		info.notCheckable = 1
		info.value = "submenu_options"
		UIDropDownMenu_AddButton(info, level)

		wipe(info)
			-- Enable All Button
		info.keepShownOnClick = 1
		info.text = "Enable All"
        info.func = function() FinalFantasylizationUIFrame_EnableAll_Button_OnClick() end
		info.notCheckable = 1
        UIDropDownMenu_AddButton(info, level)
			-- Disable All Button
		info.keepShownOnClick = 1
		info.text = "Disable All"
        info.func = function() FinalFantasylizationUIFrame_DisableAll_Button_OnClick() end
		info.notCheckable = 1
        UIDropDownMenu_AddButton(info, level)
		
			-- Add a blank separator
        wipe(info)
        info.disabled = 1
        UIDropDownMenu_AddButton(info, level)
			-- Title 2
        info.isTitle = 1
		info.text = "Soundpacks"
		info.notCheckable = 1
        UIDropDownMenu_AddButton(info, level)
		
			-- Add a blank separator
        wipe(info)
        info.disabled = 1
        UIDropDownMenu_AddButton(info, level)
		
		info.keepShownOnClick = 1
        info.disabled = nil
        info.isTitle = nil
        info.notCheckable = 1
			-- Final Fantasy Menu
		info.text = "Final Fantasy"
		info.hasArrow = 1
		info.notCheckable = 1
		info.value = "submenu1_1"
        UIDropDownMenu_AddButton(info, level)
			-- Chrono Trigger/Cross Menu
        info.text = "Chrono Trigger/Cross"
		info.hasArrow = 1
		info.value = "submenu1_2"
        UIDropDownMenu_AddButton(info, level)
			-- Star Ocean Menu
        info.text = "Star Ocean"
		info.hasArrow = 1
		info.value = "submenu1_3"
        UIDropDownMenu_AddButton(info, level)
			-- Anime Menu
        info.text = "Anime"
		info.hasArrow = 1
		info.value = "submenu1_4"
        UIDropDownMenu_AddButton(info, level)
			-- Compilations Menu
		info.text = "Compilations"
		info.hasArrow = 1
		info.value = "submenu1_5"
        UIDropDownMenu_AddButton(info, level)
			-- Misc Menu
		info.text = "Misc"
		info.hasArrow = 1
		info.value = "submenu1_6"
        UIDropDownMenu_AddButton(info, level)
		
		-- Close menu item
        info.hasArrow     = nil
        info.value        = nil
        info.notCheckable = 1
        info.text         = CLOSE
        info.func         = self.HideMenu
        UIDropDownMenu_AddButton(info, level)
		
	elseif level == 2 then -- Dropdown Menu Tier 2
		if UIDROPDOWNMENU_MENU_VALUE == "submenu_options" then
				-- Enable Menu
			info.text = "Enable:"
			info.hasArrow = 1
			info.notCheckable = nil
			info.checked = FinalFantasylizationUIFrame_EnableCheck:GetChecked()
			info.value = "submenu_options_enable"
            UIDropDownMenu_AddButton(info, level)
				-- Play Music Menu
			info.text = "Play Music:"
			info.hasArrow = 1
			info.func = function() FinalFantasylizationUIFrame_MusicCheck_OnClick() end
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Music
			info.value = "submenu_options_music"
            UIDropDownMenu_AddButton(info, level)
				-- Play Sounds Menu
			info.text = "Play Sounds:"
			info.hasArrow = 1
			info.func = function() FinalFantasylizationUIFrame_SoundCheck_OnClick() end
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Sound
			info.value = "submenu_options_sound"
            UIDropDownMenu_AddButton(info, level)
				-- Debug Button
			info.text = "Debug"
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUIFrame_DebugCheck_OnClick() end
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Debug
			UIDropDownMenu_AddButton(info, level)
				
		elseif UIDROPDOWNMENU_MENU_VALUE == "submenu1_1" then
				-- Final Fantasy 6
			info.text = FinalFantasylizationUISP_FF6_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_FF6_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Final Fantasy 7
			info.text = FinalFantasylizationUISP_FF7_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_FF7_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Final Fantasy 7 Universe
			info.text = FinalFantasylizationUISP_FF7Universe_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_FF7Universe_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Final Fantasy 8
			info.text = FinalFantasylizationUISP_FF8_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_FF8_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Final Fantasy 9
			info.text = FinalFantasylizationUISP_FF9_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_FF9_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Final Fantasy 10
			info.text = FinalFantasylizationUISP_FF10_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_FF10_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Tribute to the Fantasy
			info.text = FinalFantasylizationUISP_FFTribute_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_FFTribute_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Sephiroth's Rebirth
			info.text = FinalFantasylizationUISP_SRebirth_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_SRebirth_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
		
		elseif UIDROPDOWNMENU_MENU_VALUE == "submenu1_2" then
				-- Chrono Trigger
			info.text =  FinalFantasylizationUISP_CT_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_CT_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Chrono Cross
			info.text = FinalFantasylizationUISP_CC_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_CC_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
			
		elseif UIDROPDOWNMENU_MENU_VALUE == "submenu1_3" then
				-- Star Ocean 2
			info.text = FinalFantasylizationUISP_SO2_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_SO2_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Star Ocean 3
			info.text = FinalFantasylizationUISP_SO3_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_SO3_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
			
		elseif UIDROPDOWNMENU_MENU_VALUE == "submenu1_4" then
				-- Bleach
			info.text = FinalFantasylizationUISP_Bleach_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_Bleach_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
			
		elseif UIDROPDOWNMENU_MENU_VALUE == "submenu1_5" then
				-- Aero's Gaming Mix
			info.text = FinalFantasylizationUISP_Aero_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_Aero_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Ambient Alternative
			info.text = FinalFantasylizationUISP_AmbAlt_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_AmbAlt_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Bleukreuz's
			info.text = FinalFantasylizationUISP_Bleukreuz_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_Bleukreuz_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Heartless Angel
			info.text = FinalFantasylizationUISP_Heartless_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_Heartless_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Movie and TV Deluxe
			info.text = FinalFantasylizationUISP_MovTvDlx_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_MovTvDlx_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- StevenRemastered
			info.text = FinalFantasylizationUISP_StevenR_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_StevenR_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- StevenComplete
			info.text = FinalFantasylizationUISP_StevenC_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_StevenC_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
		
		elseif UIDROPDOWNMENU_MENU_VALUE == "submenu1_6" then
				-- Code Geass: Lelouch of the Rebellion
			info.text = FinalFantasylizationUISP_CodeGeass_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_CodeGeass_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Dragon Quest Tribute
			info.text = FinalFantasylizationUISP_DragonQuest_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_DragonQuest_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Diablo
			info.text = FinalFantasylizationUISP_Diablo_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_Diablo_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Gears of War
			info.text = FinalFantasylizationUISP_GearsofWar_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_GearsofWar_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Goldeneye
			info.text = FinalFantasylizationUISP_Goldeneye_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_Goldeneye_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Golden Sun
			info.text = FinalFantasylizationUISP_GoldenSun_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_GoldenSun_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Kingdom Hearts
			info.text = FinalFantasylizationUISP_KingdomHearts_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_KingdomHearts_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Last Remnant, The
			info.text = FinalFantasylizationUISP_LastRemnant_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_LastRemnant_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Legend of Zelda
			info.text = FinalFantasylizationUISP_LegendofZelda_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_LegendofZelda_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Medal of Honor
			info.text = FinalFantasylizationUISP_MedalofHonor_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_MedalofHonor_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Metal Gear Solid
			info.text = FinalFantasylizationUISP_MetalGearSolid_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_MetalGearSolid_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Metroid Prime
			info.text = FinalFantasylizationUISP_MetroidPrime_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_MetroidPrime_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Parasite Eve
			info.text = FinalFantasylizationUISP_ParasiteEve_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_ParasiteEve_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Resident Evil T
			info.text = FinalFantasylizationUISP_ResidentEvilT_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_ResidentEvilT_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Silent Hill Mix
			info.text = FinalFantasylizationUISP_SilentHillMix_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_SilentHillMix_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Skies of Arcadia
			info.text = FinalFantasylizationUISP_SkiesofArcadia_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_SkiesofArcadia_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Tales of Vesperia
			info.text = FinalFantasylizationUISP_TalesofVesperia_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_TalesofVesperia_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Unreal Tournament
			info.text = FinalFantasylizationUISP_UnrealTournament_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_UnrealTournament_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Wild Arms
			info.text = FinalFantasylizationUISP_WildArms_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_WildArms_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Xenogears
			info.text = FinalFantasylizationUISP_Xenogears_Button_Text
			info.hasArrow = nil
			info.func = function() FinalFantasylizationUISP_Xenogears_Button_OnClick() end
            UIDropDownMenu_AddButton(info, level)
			
        end
		
	elseif level == 3 then -- Dropdown Menu Tier 3
		if UIDROPDOWNMENU_MENU_VALUE == "submenu_options_enable" then
				-- On Button
			info.text = EnabledCommand
			info.hasArrow = nil
			info.notCheckable = 1
			info.func = function() FinalFantasylizationUIFrame_EnableOn_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Off Button
			info.text = DisabledCommand
			info.hasArrow = nil
			info.notCheckable = 1
			info.func = function() FinalFantasylizationUIFrame_EnableOff_OnClick() end
            UIDropDownMenu_AddButton(info, level)
			
		elseif UIDROPDOWNMENU_MENU_VALUE == "submenu_options_music" then
				-- Combat Toggle
			info.text = FinalFantasylizationUIFrame_CombatCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Combat
			info.func = function() FinalFantasylizationUIFrame_CombatCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Mount Toggle
			info.text = FinalFantasylizationUIFrame_MountCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Mount
			info.func = function() FinalFantasylizationUIFrame_MountCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Dungeon Toggle
			info.text = FinalFantasylizationUIFrame_DungeonCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Dungeon
			info.func = function() FinalFantasylizationUIFrame_DungeonCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Sleep Toggle
			info.text = FinalFantasylizationUIFrame_SleepCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Sleep
			info.func = function() FinalFantasylizationUIFrame_SleepCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Swim Toggle
			info.text = FinalFantasylizationUIFrame_SwimCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Swim
			info.func = function() FinalFantasylizationUIFrame_SwimCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Dead Toggle
			info.text = FinalFantasylizationUIFrame_DeadCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Dead
			info.func = function() FinalFantasylizationUIFrame_DeadCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Flight Toggle
			info.text = FinalFantasylizationUIFrame_FlightCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Flight
			info.func = function() FinalFantasylizationUIFrame_FlightCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Capital Toggle
			info.text = FinalFantasylizationUIFrame_CapitalCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Capital
			info.func = function() FinalFantasylizationUIFrame_CapitalCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
			
		elseif UIDROPDOWNMENU_MENU_VALUE == "submenu_options_sound" then
				-- Fanfare Toggle
			info.text = FinalFantasylizationUIFrame_FanfareCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.Fanfare
			info.func = function() FinalFantasylizationUIFrame_FanfareCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				-- Level Up Toggle
			info.text = FinalFantasylizationUIFrame_LevelUpCheck_Text
			info.hasArrow = nil
			info.notCheckable = nil
			info.checked = FinalFantasylizationOptions.LevelUp
			info.func = function() FinalFantasylizationUIFrame_LevelUpCheck_OnClick() end
            UIDropDownMenu_AddButton(info, level)
				
		end
    end
end


------------------------------------------------------------
-- Other FinalFantasylization UI methods
------------------------------------------------------------

-- Shows a tooltip for a given control if available.
-- The tooltip used will be the string with the name of the control plus "_Tooltip" on the end.
-- The title of the tooltip will be the text on a control with the same name plus "_Label" on the
-- end if available, or otherwise the actual text on the control if there is any.  If the tooltip text
-- OR title is missing, no tooltip is displayed.
function FinalFantasylizationUI_TooltipOn(self)
	local TooltipText = getglobal(self:GetName() .. "_Tooltip")
	if TooltipText then
		local Label
		local FontString = getglobal(self:GetName() .. "_Label")
		if FontString then
			Label = FontString:GetText()
		elseif self.GetText and self:GetText() then
			Label = self:GetText()
		end
		if Label then
			GameTooltip:ClearLines()
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
			GameTooltip:AddLine(Label, 1, 1, 1, 1)
			GameTooltip:AddLine(TooltipText, nil, nil, nil, 1, 1)
			GameTooltip:Show()
		end
	end
end

-- Hides the game tooltip.
function FinalFantasylizationUI_TooltipOff()
	GameTooltip:Hide()
end
