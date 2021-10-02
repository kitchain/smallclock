#SingleInstance, force
#Persistent
#NoEnv

;~ =================================================
;~ Drag the Gui
;~ =================================================
OnMessage(0x201, "WM_LBUTTONDOWN")
hCurs:=DllCall("LoadCursor","UInt",NULL,"Int",32649,"UInt") ;IDC_HAND
WM_LBUTTONDOWN()
{
PostMessage, 0xA1, 2
}
;~ =================================================

Gui, Color, 000000 ; black
Gui, +LastFound  +ToolWindow +AlwaysOnTop +Caption
Gui, Font, s10 cwhite bold, segoe ui
Gui, Add, Text,   +center x1 y1 w115 h17 vTTime, ;
Gui, Add, Text,   +center x1 y17 w115 h17 vTDate, ;
Gui, Show,  h35 w115, KitchApp - Clock ; This will open at the center of the screen 
SetTimer, Loop, 1000 ; 1000 = 1 second
return


Loop: ; will rotate every 1 second
MouseGetPos, , , id, control
WinGetTitle, title, ahk_id %id%
WinGetClass, class, ahk_id %id%
FormatTime, OutputVar, , h:mm:ss tt
GuiControl,,TTime,%OutputVar%
GuiControl,,TDate,%A_DDD% %A_MM%/%A_DD%/%A_Year%

if title = KitchApp - Clock
{
Gui, +LastFound  +ToolWindow +AlwaysOnTop +Caption
Gui, Show, NoActivate   h35 w115, KitchApp - Clock 
}
else
{
Gui, +LastFound  +ToolWindow +AlwaysOnTop  -Caption
Gui, Show, NoActivate   h35 w115, KitchApp - Clock
}
return

GuiClose:
ExitApp
