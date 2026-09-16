@echo off
echo ====================================================
echo             Changing Windows Hostname
echo ====================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', 'C:\Scripts\Ps\change_host.ps1'"
exit

