@echo off

mode con:cols=52 lines=10
title Kiosk Manager

echo ====================================================
echo            Deactivating Tauri Kiosk Mode
echo ====================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', 'C:\Scripts\Ps\disable_kiosk.ps1'"
exit
