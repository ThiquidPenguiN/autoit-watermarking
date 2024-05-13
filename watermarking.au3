#include <FontConstants.au3>
#include <String.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Color.au3>
#include <WinAPISysWin.au3>

global $splashUserText, $J[11], $m = "", $I

$J[1] = " "
$J[2] = "  "
$J[3] = "   "
$J[4] = "    "
$J[5] = "     "
$J[6] = "      "
$J[7] = "       "
$J[8] = "        "
$J[9] = "         "
$J[10] = "          "

Local $userData = string(@UserName) & $J[Random(1,10,1)]
Local $computerData = string(@ComputerName) & $J[Random(1,10,1)]
Local $dateData = @YEAR & @MON & @MDAY & $J[Random(1,10,1)]
Local $companyData = string("Property of [Company Name]") & $J[Random(1,10,1)]
Local $confidentialData = string("CONFIDENTIAL") & _StringRepeat($J[10], 5)

Local $stringToRepeat = $userData & $J[Random(1,10,1)] & $computerData & $J[Random(1,10,1)] & $dateData & $J[Random(1,10,1)] & $companyData & $J[Random(1,10,1)] & $confidentialData & $J[Random(1,10,1)]

$splashUserText = _StringRepeat ( $stringToRepeat, 250 )

splashtext()


Func splashtext()
        ; Font type to be used for setting the font of the controls.
        Local Const $sFont = "Ariel"

        ; Create a GUI with various controls.
        Local $hGUI = GUICreate("Example", @DeskTopWidth + 5, @DeskTopHeight + 5, -1, -1, -1, $WS_EX_TRANSPARENT)

        ; Create label controls.
        GUICtrlCreateLabel($splashUserText, -1, -1,@DeskTopWidth + 500, @DeskTopHeight + 500, $SS_CENTER)
        GUICtrlSetFont(-1, 30, $FW_NORMAL, $GUI_FONTNORMAL, $sFont) ; Set the font of the previous control.
	GUICtrlSetColor(-1,0xFFFFFF)
	GUISetBkColor(0x000000)
	_WinAPI_SetLayeredWindowAttributes($hGUI, 0x000000)

	WinSetTrans($hGUI, "",  30)

	GUISetState(@SW_SHOW, $hGUI)
	WinSetOnTop($hGUI, "", $WINDOWS_ONTOP)
	$hwnd= WinGetHandle("[active]")




	While 1
		Local $state = WinGetState($hwnd)
		;MsgBox($MB_SYSTEMMODAL, "", "WinActive" & @CRLF & $state)
		If $state  >= 16   Then
			WinActivate($hwnd, "")
		EndIf
			sleep(500)
	WEnd
	GUIDelete()


EndFunc
