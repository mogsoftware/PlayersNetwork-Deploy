@echo off
set "status_file=C:\Scripts\Ps\kiosk_status.txt"
set "kiosk_state=Inactive"

:: Read the first line of the file and save it to the kiosk_state variable
if exist "%status_file%" (
    set /p kiosk_state=<"%status_file%"
)

:: Trim any accidental whitespace
set "kiosk_state=%kiosk_state: =%"

if "%kiosk_state%"=="Active" (
    :: KIOSK IS ACTIVE: Run your Tauri App natively as the main Windows shell
    "C:\Users\MogPlayer\AppData\Local\Communique 7 Player\mogplayer.exe"
    
    :: Fallback: If the Tauri app is closed, it drops into a CMD line instead of a black screen
    cmd.exe
) else (
    :: KIOSK IS INACTIVE: Boot straight into standard Windows Explorer desktop layout
    start explorer.exe
)
