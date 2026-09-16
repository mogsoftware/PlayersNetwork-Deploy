@echo off

mode con:cols=52 lines=10
title Kiosk Manager

echo ====================================================
echo             Changing Windows Hostname
echo ====================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', 'C:\Scripts\Ps\change_host.ps1'"
exit

