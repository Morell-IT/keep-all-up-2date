@echo off
:: Get the date and time
set "currentDate=%date:/=-%"
set "currentTime=%time::=-%"

:: Remove spaces from the time
set "currentTime=%currentTime: =0%"

:: Set the log file path (with valid date and time in the filename)
set LOGFILE=%~dp0winget_update_log_%currentDate%_%currentTime%.txt

:: Start logging
echo Running winget upgrade at %date% %time% >> "%LOGFILE%"
winget upgrade --all --include-unknown --force >> "%LOGFILE%" 2>&1
echo Completed winget upgrade at %date% %time% >> "%LOGFILE%"
