@echo off
echo ====================================================
echo             Deactivating Tauri Kiosk Mode
echo ====================================================

set "ps_file=%temp%\disable_kiosk.ps1"

(
echo $userSid = (Get-CimInstance -ClassName Win32_UserAccount -Filter "Name='$env:USERNAME'").SID
echo $userShellPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\PerUserProfiles\$userSid"
echo if (Test-Path $userShellPath) { Remove-Item -Path $userShellPath -Recurse -Force }
echo Restart-Computer
) > "%ps_file%"

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', '%ps_file%'"
exit