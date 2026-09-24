@echo off

git pull
call "%~dp0ps\Laucher.bat"
exit /b %errorlevel%