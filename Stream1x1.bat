@echo off

mode con:cols=52 lines=15
title Stream Manager

echo ====================================================
echo             Activating FFmpeg Stream
echo ====================================================
:loop
echo Starting Stream for %COMPUTERNAME% in 1x1 format 720p
:: Place your exact FFmpeg command right below this line:
ffmpeg -loglevel error -f gdigrab -framerate 24 -i desktop -c:v libx264 -preset ultrafast -profile:v main -pix_fmt yuv420p -an -g 48 -keyint_min 48 -sc_threshold 0 -b:v 2500k -maxrate 3500k -bufsize 7000k -f mpegts "srt://10.10.0.5:8890?streamid=publish:%COMPUTERNAME%"
echo FFmpeg crashed or stopped! Restarting in 2 seconds...
timeout /t 2
goto loop
