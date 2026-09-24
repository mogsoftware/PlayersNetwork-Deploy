@echo off
setlocal enabledelayedexpansion

:: Target the exact numeric state code inside the Winlogon system registry
set "REG_KEY=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
set "KIOSK_STATE=0"

for /f "tokens=3" %%a in ('reg query "%REG_KEY%" /v KioskMode 2^>nul') do (
    set "KIOSK_STATE=%%a"
)

:: Hexadecimal 0x1 matches digital integer 1 
if "!KIOSK_STATE!"=="0x1" (
    :: SYSTEM ACTIVE: Initialize custom application payload
    "C:\Users\MogPlayer\AppData\Local\Communique 7 Player\mogplayer.exe"
) else (
    :: MAINTENANCE RECOVERY: Restore global shell parameters instantly 
    reg add "%REG_KEY%" /v Shell /t REG_SZ /d "explorer.exe" /f >nul
    start explorer.exe
)
