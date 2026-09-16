mode con:cols=52 lines=10
title Stream Manager

@echo off
echo ====================================================
echo             Activating FFmpeg Stream
echo ====================================================
:loop
echo Starting Wide Stream for %COMPUTERNAME% in 4x1 format 720p
ffmpeg -loglevel error -f gdigrab -framerate 24 -i desktop -filter_complex "[0:v]crop=1920:540:0:0,scale=1280:360[top]; [0:v]crop=1920:540:0:540,scale=1280:360[bottom]; [top][bottom]hstack=inputs=2" -c:v libx264 -preset ultrafast -profile:v high -pix_fmt yuv420p -an -g 48 -keyint_min 48 -sc_threshold 0 -b:v 1500k -maxrate 1500k -bufsize 3000k -tune zerolatency -f mpegts "srt://10.10.0.5:8890?streamid=publish:%COMPUTERNAME%"
echo FFmpeg crashed or stopped! Restarting in 2 seconds...
timeout /t 2
goto loop
