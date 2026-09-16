@echo off
echo ====================================================
echo             Changing Windows Hostname
echo ====================================================

set "ps_file=%temp%\change_host.ps1"

:: Write a clean PowerShell script without any messy escaping bugs
(
echo $id = Read-Host "Enter ID (e.g. Bt01)"
echo if ^($id^) {
echo     Rename-Computer -NewName "MogPlayer$id" -Force
echo     Start-Process -FilePath "C:\Scripts\EnableKiosk.bat" -Verb RunAs
echo }
) > "%ps_file%"

:: Run the script securely as Administrator
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', '%ps_file%'"
exit
