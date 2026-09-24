@echo off

mode con:cols=52 lines=15
title Stream Manager

echo ====================================================
echo             Activating FFmpeg Stream
echo ====================================================
:loop
echo Starting Wide Stream for %COMPUTERNAME% in 4x1 format 720p
ffmpeg -loglevel error -f gdigrab -framerate 24 -i desktop -filter_complex "[0:v]crop=1024:300:0:0,scale=682:200:flags=fast_bilinear[top]; [0:v]crop=1024:300:0:300,scale=682:200:flags=fast_bilinear[bottom]; [top][bottom]hstack=inputs=2" -c:v libx264 -preset ultrafast -profile:v main -pix_fmt yuv420p -an -g 96 -keyint_min 96 -sc_threshold 0 -b:v 2500k -maxrate 3500k -bufsize 7000k -f mpegts "srt://10.10.0.5:8890?streamid=publish:%COMPUTERNAME%"
echo FFmpeg crashed or stopped! Restarting in 2 seconds...
timeout /t 2
goto loop
