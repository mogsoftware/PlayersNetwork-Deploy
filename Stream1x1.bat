@echo off
echo ====================================================
echo             Activating FFmpeg Stream
echo ====================================================
:loop
echo Starting Stream for %COMPUTERNAME% in 1x1 format 720p
:: Place your exact FFmpeg command right below this line:
ffmpeg -loglevel error -f gdigrab -framerate 24 -i desktop -c:v libx264 -preset ultrafast -profile:v high -pix_fmt yuv420p -an -g 48 -keyint_min 48 -sc_threshold 0 -b:v 1500k -maxrate 1500k -bufsize 3000k -s 1280x720 -tune zerolatency -f mpegts "srt://10.10.0.5:8890?streamid=publish:%COMPUTERNAME%"
echo FFmpeg crashed or stopped! Restarting in 2 seconds...
timeout /t 2
goto loop
