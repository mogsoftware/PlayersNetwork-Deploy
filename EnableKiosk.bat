@echo off
echo ====================================================
echo             Activating Tauri Kiosk Mode
echo ====================================================

set "ps_file=%temp%\enable_kiosk.ps1"

(
echo $appPath = "C:\Users\MogPlayer\AppData\Local\Communique 7 Player\mogplayer.exe"
echo.
echo # Create the Custom Shell Launcher for this user
echo $userSid = ^(Get-CimInstance -ClassName Win32_UserAccount -Filter "Name='$env:USERNAME'"^).SID
echo $userShellPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\PerUserProfiles\$userSid"
echo if ^(!(Test-Path $userShellPath)^) { New-Item -Path $userShellPath -Force ^| Out-Null }
echo Set-ItemProperty -Path $userShellPath -Name "Shell" -Value $appPath
echo.
echo # Force System Restart
echo Restart-Computer
) > "%ps_file%"

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', '%ps_file%'"
exit