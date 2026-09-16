@echo off
echo ====================================================
echo             Activating Tauri Kiosk Mode
echo ====================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', 'C:\Scripts\Ps\enable_kiosk.ps1'"
exit
