#include <MsgBoxConstants.au3>

 ; [ xpos , ypos , x.pos+pixel to RechtenRand ,y.pos+pixel to unterenRand ]

Local $linksOben[] = [-8, 0, 1455, 853]
Local $linksMitte[] = [-8, 845, 1455, 828]
Local $linksUnten[] = [-8, 1665, 1455, 820]


Local $rechtsVollbild[] = [1432,1003,1936,1056]
Local $rechtsLinks[] = [1440,1011,960,1040]
Local $rechtsRechts[] = [2395,1011,970,1045]


Positioniere("Atom", $linksMitte)
Positioniere("WSL-Ubuntu", $linksUnten)
Positioniere("Google Chrome", $linksOben)

Positioniere("Outlook",$rechtsLinks)
Positioniere("Thunderbird",$rechtsRechts)

;ShowPosition("Thunderbird")

Func Positioniere($name,$aPos)
    Local $win = WinWait ( "[REGEXPTITLE:.*" & $name & "]" ,"",1)
    If $win > 0 Then
      WinActivate ( $win )
      WinWaitActive ( $win )
      if WinGetState ("[REGEXPTITLE:.*" & $name & "]") > 16 Then ; if maximized
        WinSetState($win, "", @SW_RESTORE)
      endif
      WinMove($win, "", $aPos[0] , $aPos[1] , $aPos[2] , $aPos[3])
    Elses
      MsgBox($MB_SYSTEMMODAL, "AutoIt","Achtung: Das Fenster " & $name & " konnte nicht aktiviert werden!")
    EndIf
EndFunc   ;==>Positioniere

Func ShowPosition($name)
  Local $win = WinWait ( "[REGEXPTITLE:.*" & $name & "]" ,"",1)
  If $win > 0 Then
    WinActivate ( $win )
    WinWaitActive ( $win )
    Local $aPos = WinGetPos($win)
    MsgBox($MB_SYSTEMMODAL, "AutoIt", "Das Fenster der Anwendung " & $name & " hat aktuell folgende Position und Größe: " & @CRLF & "x.pos : " & $aPos[0] & @CRLF & "y.pos : " & $aPos[1] & @CRLF & "x.offset : " & $aPos[2] & @CRLF & "y.offset : " & $aPos[3])
  Else
    MsgBox($MB_SYSTEMMODAL, "AutoIt","Achtung: Das Fenster " & $name & " konnte nicht aktiviert werden!")
  EndIf
EndFunc ;==> ShowPosition
