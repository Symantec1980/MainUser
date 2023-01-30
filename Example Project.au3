#include <GUIConstantsEx.au3>
#include <Constants.au3>
#include <Array.au3>
#include <WinAPIFiles.au3>
#include <GUIStatusBar.au3>
#include <ProgressConstants.au3>
#include <WindowsConstants.au3>

GUICreate("Security Service")

$iButton1 = GUICtrlCreateButton("EnumFiles & Check (*.exe)", 20, 20, 130, 25)

$iButton2 = GUICtrlCreateButton("EnumFiles & Check (*.dll)", 20, 60, 130, 25)

GUISetState(@SW_SHOW)

Local $iMsg = 0

While 1
    $iMsg = GUIGetMsg()

    Switch $iMsg
        Case $GUI_EVENT_CLOSE
            ExitLoop
        Case $iButton1
			ProgressOn("System Scan", "Checking Files", "Rapair System")
 
 For $i = 0 To 100
 	ProgressSet($i)
 	Sleep(5)
 Next
            Local $aData = _WinAPI_EnumFiles(@SystemDir, 1, '*.exe')

	_ArrayDisplay($aData, '_WinAPI_EnumFiles')
	 ProgressSet(100, "Done!")
 Sleep(750)
 ProgressOff()

Case $iButton2
			ProgressOn("System Scan", "Checking Files", "Rapair System")
 
 For $i = 0 To 100
 	ProgressSet($i)
 	Sleep(5)
 Next
            Local $aData = _WinAPI_EnumFiles(@SystemDir, 1, '*.dll')

	_ArrayDisplay($aData, '_WinAPI_EnumFiles')
	 ProgressSet(100, "Done!")
 Sleep(750)
 ProgressOff()

    EndSwitch
WEnd