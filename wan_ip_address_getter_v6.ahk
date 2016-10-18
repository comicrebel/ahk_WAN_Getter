;==========================================================================
; WAN IP Address Getter and Notifier, Initialize script every 120 minutes
;  WAN IP Address Getter and Notifier, Initialize script every 30 minutes
;  Author: Timothy Richardson 10/1/2016
;  Author: Logoff.bat ZK7 at AHK site
;==========================================================================
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir C:\Users\URICHT4\Dropbox\PERSONAL\NETWORK\LOCAL\WAN_IP_ADDRESS\	
;SetWorkingDir %A_WorkingDir%
DetectHiddenWindows, on

min = 60 ;Number of minutes to wait
loop 
{
    sleep, % min*60*1000
	{ 
;==========================================================================
; Run Chrome and set PID to ChromePID
;==========================================================================
SoundBeep, 4500, 250 ;Warn script run with a high pitch beep for half a second.
	Sleep 4000
Run, chrome.exe
		{
Process, priority, %ChromePID%, High
Process, wait, chrome.exe, 3
ChromePID = %ErrorLevel%  ; Save the value immediately since ErrorLevel is often changed.
;==========================================================================
; Load www.icanhazip.com
;==========================================================================
	Clipboard :=
	ControlSend,,{Ctrl Down}d{Ctrl Up}
	Sleep 500
	Send,http://www.icanhazip.com
	Sleep 500
    Send,{enter}
	Sleep 2000
;==========================================================================
;Copy WAN IP address from browser
;==========================================================================
	Send, ^a
	Sleep 500
	Send, ^c
	Clipwait
	Sleep 500
	WAN_IP := clipboard 
;==========================================================================
;Close Chrome
;==========================================================================
WinClose www.icanhazip.com
Process, WaitClose, %ChromePID%, 1
	Sleep 1000
		}
			{
MsgBox,,,WAN IP = %WAN_IP%, 30
Gui, Destroy
	Sleep 1000
	Clipboard :=
			}
			{
	FileAppend, Sourcetxt, %SourceFolder%
	FormatTime, Time,, MM/dd/yyyy h:mm tt
	FileAppend,  `nWAN IP address as of %Time%: %WAN_IP%`n--------------------------------------------------------, WAN_Log.txt

	;FileAppend, DestAcct, %DestFolder%
	;FormatTime, Time,, MM/dd/yyyy h:mm tt
	;FileAppend,  `nWAN IP address as of %Time%: %WAN_IP%`n-------------------------------------------------------, WAN_Log.txt
		
			}
	}

}

return