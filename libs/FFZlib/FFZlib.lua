-- FFZlib  by Darken5
-- 
-- Version 1.0.0: Conversion to RGB from hex and vice-versa
local FFZlibThisVersion = 1.00;
-- 
--
------------------------------------------------------------

local InitializeOrUpgrade = not (FFZlib and FFZlib.Version and FFZlib.Version >= FFZlibThisVersion);

-- If the currently loaded version of FFZlib isn't as good as this one, load the new one.
if InitializeOrUpgrade then

FFZlib = {}
FFZlib.Version = FFZlibThisVersion

-- Common colors
FFZlib.Color = {}

FFZlib.Color.Reset = "|r"

FFZlib.Color.Blue = "|cff0000ff"
FFZlib.Color.BlueR = 0 / 255
FFZlib.Color.BlueG = 0 / 255
FFZlib.Color.BlueB = 255 / 255

FFZlib.Color.LightBlue = "|cff8ec3e6"
FFZlib.Color.LightBlueR = 142 / 255
FFZlib.Color.LightBlueG = 195 / 255
FFZlib.Color.LightBlueB = 230 / 255

FFZlib.Color.Navy = "|cff000080"
FFZlib.Color.NavyR = 0 / 255
FFZlib.Color.NavyG = 0 / 255
FFZlib.Color.NavyB = 128 / 255

FFZlib.Color.Teal = "|cff008080"
FFZlib.Color.TealR = 0 / 255
FFZlib.Color.TealG = 128 / 255
FFZlib.Color.TealB = 128 / 255

FFZlib.Color.Aqua = "|cff00ffff"
FFZlib.Color.AquaR = 0 / 255
FFZlib.Color.AquaG = 255 / 255
FFZlib.Color.AquaB = 255 / 255

FFZlib.Color.DarkBlue = "|cff6a92ac"
FFZlib.Color.DarkBlueR = 106 / 255
FFZlib.Color.DarkBlueG = 146 / 255
FFZlib.Color.DarkBlueB = 172 / 255

FFZlib.Color.LightGreen = "|cffb4fe2c"
FFZlib.Color.LightGreenR = 180 / 255
FFZlib.Color.LightGreenG = 255 / 255
FFZlib.Color.LightGreenB = 44 / 255

FFZlib.Color.Green = "|cff008000"
FFZlib.Color.GreenR = 0 / 255
FFZlib.Color.GreenG = 128 / 255
FFZlib.Color.GreenB = 0 / 255

FFZlib.Color.Lime = "|cff00ff00"
FFZlib.Color.LimeR = 0 / 255
FFZlib.Color.LimeG = 255 / 255
FFZlib.Color.LimeB = 0 / 255

FFZlib.Color.Olive = "|cff808000"
FFZlib.Color.OliveR = 128 / 255
FFZlib.Color.OliveG = 128 / 255
FFZlib.Color.OliveB = 0 / 255

FFZlib.Color.Orange = "|cfffecf38"
FFZlib.Color.OrangeR = 254 / 255
FFZlib.Color.OrangeG = 207 / 255
FFZlib.Color.OrangeB = 56 / 255

FFZlib.Color.Red = "|cffff0000"
FFZlib.Color.RedR = 255 / 255
FFZlib.Color.RedG = 0 / 255
FFZlib.Color.RedB = 0 / 255

FFZlib.Color.Maroon = "|cff800000"
FFZlib.Color.MaroonR = 128 / 255
FFZlib.Color.MaroonG = 0 / 255
FFZlib.Color.MaroonB = 0 / 255

FFZlib.Color.Crimson = "|cffdc143c"
FFZlib.Color.CrimsonR = 220 / 255
FFZlib.Color.CrimsonG = 20 / 255
FFZlib.Color.CrimsonB = 60 / 255

FFZlib.Color.Yellow = "|cffffff00"
FFZlib.Color.YellowR = 255 / 255
FFZlib.Color.YellowG = 255 / 255
FFZlib.Color.YellowB = 0 / 255

FFZlib.Color.Lemon = "|cfffffdd0"
FFZlib.Color.LemonR = 255 / 255
FFZlib.Color.LemonG = 253 / 255
FFZlib.Color.LemonB = 208 / 255

FFZlib.Color.Salmon = "|cfffe8460"
FFZlib.Color.SalmonR = 255 / 255
FFZlib.Color.SalmonG = 132 / 255
FFZlib.Color.SalmonB = 96 / 255

FFZlib.Color.Beige = "|cffe0dec8"
FFZlib.Color.BeigeR = 224 / 255
FFZlib.Color.BeigeG = 222 / 255
FFZlib.Color.BeigeB = 200 / 255

FFZlib.Color.Purple = "|cff800080"
FFZlib.Color.PurpleR = 128 / 255
FFZlib.Color.PurpleG = 0 / 255
FFZlib.Color.PurpleB = 128 / 255

FFZlib.Color.Fuchsia = "|cffff00ff"
FFZlib.Color.FuchsiaR = 255 / 255
FFZlib.Color.FuchsiaG = 0 / 255
FFZlib.Color.FuchsiaB = 255 / 255

FFZlib.Color.White = "|cffffffff"
FFZlib.Color.WhiteR = 255 / 255
FFZlib.Color.WhiteG = 255 / 255
FFZlib.Color.WhiteB = 255 / 255

FFZlib.Color.Grey = "|cff909090"
FFZlib.Color.GreyR = 144 / 255
FFZlib.Color.GreyG = 144 / 255
FFZlib.Color.GreyB = 144 / 255

FFZlib.Color.Silver = "|cffc0c0c0"
FFZlib.Color.SilverR = 192 / 255
FFZlib.Color.SilverG = 192 / 255
FFZlib.Color.SilverB = 192 / 255

FFZlib.Color.Black= "|cff000000"
FFZlib.Color.BlackR = 0 / 255
FFZlib.Color.BlackG = 0 / 255
FFZlib.Color.BlackB = 0 / 255

FFZlib.MoneyColor = {}
FFZlib.MoneyColor.Gold = "|cffecda90"
FFZlib.MoneyColor.Silver = "|cffd7d5d8"
FFZlib.MoneyColor.Copper = "|cffe2ad8e"

-- Common sounds
FFZlib.Sound = {}
FFZlib.Sound.Bell = "Sound\\Interface\\RaidWarning.wav"
FFZlib.Sound.Fanfare = "Sound\\Spells\\NetherwindFocusImpact.wav"


-- Displays a standard FFZlib message.
function FFZlib.Message(Text)
	if DEFAULT_CHAT_FRAME then
		DEFAULT_CHAT_FRAME:AddMessage(FFZlib.Color.Orange .. tostring(Text))
	else
		message(FFZlib.Color.Orange .. tostring(Text))
	end
end

-- Displays a bunch of messages from one string, separated by newlines.
-- Notes:
-- 	* Colors specified at the beginning of Text will not propagate to subsequent lines of Text.
-- 	Use the optional Color parameter instead.
-- 	* Empty lines will be skipped.  Add a space to the line if you want it to be printed.
function FFZlib.MultilineMessage(Text, Color)
	local Line
	local ColorString = Color
	if not ColorString then ColorString = "" end
	for Line in string.gmatch(Text, "[^\r\n]+") do
		FFZlib.Message(ColorString .. Line)
	end
end

-- Displays a large FFZlib message.
function FFZlib.BigMessage(Text)
	if UIErrorsFrame then
		UIErrorsFrame:AddMessage(tostring(Text), FFZlib.Color.GreenR, FFZlib.Color.GreenG, FFZlib.Color.GreenB, 1.0, 4.0)
	end
	if DEFAULT_CHAT_FRAME then
		DEFAULT_CHAT_FRAME:AddMessage(FFZlib.Color.Green .. tostring(Text))
	end
end

-- Displays a FFZlib error message if the condition is false.
function FFZlib.Assert(Condition, Message)
	if not Condition then FFZlib.Fail(Message) end
end

-- Displays a FFZlib error message.
function FFZlib.Fail(Message)
	FFZlib.Message(FFZlib.Color.Salmon .. "ERROR:  " .. FFZlib.Color.White .. tostring(Message))
end

-- Hooks an insecure function.  Similar to the base WoW API's hooksecurefunc.  The hook function will be run
-- after the original function to be hooked.
-- Valid usage:
-- FFZlib.HookInsecureFunction(Object, FunctionName, Hook)
-- FFZlib.HookInsecureFunction(FunctionName, Hook)
function FFZlib.HookInsecureFunction(arg1, arg2, arg3)
	local TypeOfObject = type(arg1)
	local OldFunction
	if TypeOfObject == "table" then -- Object, FunctionName, Hook
		OldFunction = arg1[arg2]
		if OldFunction then
			arg1[arg2] = FFZlib.CreateHookFunction(OldFunction, arg3)
		else
			FFZlib.Fail("FFZlib.HookInsecureFunction: could not find member function '" .. arg2 .. "'.")
		end
	elseif TypeOfObject == "string" then -- FunctionName, Hook
		OldFunction = getglobal(arg1)
		if OldFunction then
			_G = getfenv()
			_G[arg1] = FFZlib.CreateHookFunction(OldFunction, arg2)
		else
			FFZlib.Fail("FFZlib.HookInsecureFunction: could not find function '" .. arg1 .. "'.")
		end
	else
		FFZlib.Fail("FFZlib.HookInsecureFunction argument 1 must be table or string, not " .. TypeOfObject .. ".")
	end
end

-- Hooks an insecure script handler.  Works just like HookInsecureFunction(Object, FunctionName, Hook), except that
-- instead of a function name, a script name is passed.
function FFZlib.HookInsecureScript(Object, ScriptName, Hook)
	local OldFunction = Object:GetScript(ScriptName)
	if OldFunction then
		Object:SetScript(ScriptName, FFZlib.CreateHookFunction(OldFunction, Hook))
	else
		Object:SetScript(ScriptName, Hook)
	end
end

-- Internal function used by HookInsecureFunction.
function FFZlib.CreateHookFunction(OldFunction, Hook)
	return function(...)
		local ReturnValue = OldFunction(...)
		Hook(...)
		return ReturnValue
	end
end

-- Executes a chat command just as if it were typed in the chat window.
-- Returns true if successful, or false if not (primarily if the command is a secure function, such as /cast).
function FFZlib.ExecuteChatCommand(Command)
	if not ChatFrame1EditBox then return false end
	
	-- First, make sure that this command is okay.
	local _, _, SlashCommand = string.find(Command, "^(/%w+) ")
	if SlashCommand then
		if IsSecureCmd(SlashCommand) then
			FFZlib.Fail(SlashCommand .. " is a secure command and cannot be run automatically.")
			return false
		end
	end

	-- Now, execute the chat command.
	local PreviousText = ChatFrame1EditBox:GetText()
	ChatFrame1EditBox:SetText(Command)
	ChatEdit_SendText(ChatFrame1EditBox)
	ChatFrame1EditBox:SetText(PreviousText)
	return true
end

-- Runs a macro.
-- Returns true if successful, or false if not.
function FFZlib.RunMacro(MacroName)
	-- First, get the text of the macro.
	local _, _, Script, _ = GetMacroInfo(MacroName)
	if not Script then return false end

	-- Then, execute each line individually.  Ignore comments marked with # or -.
	local Line
	for Line in string.gmatch(Script, "[^\n]+") do
		local FirstChar = string.sub(Line, 1, 1)
		if FirstChar ~= "#" and FirstChar ~= "-" then
			FFZlib.ExecuteChatCommand(Line)
		end
	end
	return true
end

-- Returns true if the user is in a Battleground, or false if not.
function FFZlib.IsInBattleground()
	for Battleground = 1, MAX_BATTLEFIELD_QUEUES do
		local Status, _, _ = GetBattlefieldStatus(Battleground)
		if Status == "active" then return true end
	end
	return false
end

-- Comparer function for use in table.sort that sorts strings alphabetically, ignoring case.
function FFZlib.CaseInsensitiveComparer(a, b)
	return string.lower(a) < string.lower(b)
end

-- Returns a six-digit hex string for three RGB values 0-1.
function FFZlib.RGBToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r * 255, g * 255, b * 255)
end

-- Returns RGB values 0-1 for a six-digit hex string, or nil if unsuccessful.
function FFZlib.HexToRGB(hex)
	if not hex or string.len(hex) ~= 6 then return end
	local r, g, b = string.sub(hex, 1, 2), string.sub(hex, 3, 4), string.sub(hex, 5, 6)
	r, g, b = r or 0, g or 0, b or 0
	return tonumber(r, 16) / 255, tonumber(g, 16) / 255, tonumber(b, 16) / 255
end

end -- if InitializeOrUpgrade
