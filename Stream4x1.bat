```bat
@echo off
setlocal EnableExtensions

mode con:cols=60 lines=15
title Stream Manager

echo ====================================================
echo             Activating FFmpeg Stream
echo ====================================================

:loop
REM Detect current primary desktop resolution
for /f "tokens=1,2 delims=," %%A in ('powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; $s=[System.Windows.Forms.Screen]::PrimaryScreen.Bounds; Write-Output ($s.Width.ToString()+','+$s.Height.ToString())"') do (
    set "SCREEN_W=%%A"
    set "SCREEN_H=%%B"
)

if not defined SCREEN_W (
    echo Could not detect screen resolution. Retrying...
    timeout /t 2 /nobreak >nul
    goto loop
)

REM Divide the desktop height into two equal halves
REM Ensure crop dimensions are even for H.264 compatibility
set /a CROP_W=(SCREEN_W/2)*2
set /a HALF_H=(SCREEN_H/4)*2
set /a BOTTOM_Y=HALF_H

if %CROP_W% LSS 2 goto loop
if %HALF_H% LSS 2 goto loop

echo.
echo Starting Wide Stream for %COMPUTERNAME%
echo Desktop: %SCREEN_W%x%SCREEN_H%
echo Each half: %CROP_W%x%HALF_H%
echo.

ffmpeg -hide_banner -loglevel error ^
    -f gdigrab -framerate 24 -i desktop ^
    -filter_complex "[0:v]crop=%CROP_W%:%HALF_H%:0:0,scale=682:200:flags=fast_bilinear[top];[0:v]crop=%CROP_W%:%HALF_H%:0:%BOTTOM_Y%,scale=682:200:flags=fast_bilinear[bottom];[top][bottom]hstack=inputs=2[out]" ^
    -map "[out]" ^
    -c:v libx264 -preset ultrafast -profile:v main ^
    -pix_fmt yuv420p -an ^
    -g 96 -keyint_min 96 -sc_threshold 0 ^
    -b:v 2500k -maxrate 3500k -bufsize 7000k ^
    -f mpegts "srt://mds.mrocket.com.br:8890?streamid=publish:%COMPUTERNAME%:MogPlayer:PLAYER100"

echo FFmpeg stopped! Restarting in 2 seconds...
set "SCREEN_W="
set "SCREEN_H="
timeout /t 2 /nobreak
goto loop
```