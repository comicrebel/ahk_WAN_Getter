# ahk_WAN_Getter
# SCRIPT NAME: wan_ip_address_getter_v6.ahk
# Author: Timothy Richardson 10/1/2016

This is an AHK script that records the DHCP WAN IP address on my office public gateway. I needed a way to see my WAN IP address available when I travel, so I can remote into my server in my office and I don't want a static IP address. The solution is here. When the IP address is copied to the txt file, it is saved to my Dropbox account, so I  can get it remotely. Below are main comments in the script.

;==========================================================================
; Script runs every hour, gets dynamic WAN IP of the gateway
; Opens http://www.icanhazip.com/, copies to txt file
; WAN IP Address Getter and Notifier, Initialize script every 120 minutes
; WAN IP Address Getter and Notifier, Initialize script every 30 minutes
; Author: Timothy Richardson 10/1/2016
;==========================================================================

; Run Chrome and set PID to ChromePID
; Sound beep to warn users logged in
; Load www.icanhazip.com
; Select and copy IP to clipbboard
; Close Chrome
; Open and append WAN_IP.txt with address from icanhazip
; Clear clipboard buffer
; Close WAN IP
; End

BUGS/ISSUES: 
1. The script runs fine, ECXCEPT when the system logs the user off. There is a solution to this. Keep logoff.bat file in the same directory as the WAN_IP.txt file, and use it to log out of the system when you are done. This will keep the user session active, and not lock the machine, and the script will continue to run.
2. A windows machine needs to reboot frequently, so use the reboot.ahk script for this purpose. You can also place wan_ip_address_getter_v6.ahk in the startup directory of the server
