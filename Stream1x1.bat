@echo off

mode con:cols=52 lines=15
title Stream Manager

echo ====================================================
echo             Activating FFmpeg Stream
echo ====================================================
:loop
echo Starting Stream for %COMPUTERNAME% in 1x1 format 720p
:: Place your exact FFmpeg command right below this line:
ffmpeg -loglevel error -f gdigrab -framerate 24 -i desktop -vf "scale=800:450:flags=fast_bilinear" -c:v libx264 -preset ultrafast -profile:v baseline -pix_fmt yuv420p -an -g 48 -keyint_min 48 -sc_threshold 0 -b:v 1000k -maxrate 1000k -bufsize 2000k -f mpegts "srt://10.10.0.5:8890?streamid=publish:%COMPUTERNAME%"
echo FFmpeg crashed or stopped! Restarting in 2 seconds...
timeout /t 2
goto loop
