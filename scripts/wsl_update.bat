@echo off
:: Get the date and time
set "currentDate=%date:/=-%"
set "currentTime=%time::=-%"

:: Remove spaces from the time
set "currentTime=%currentTime: =0%"

:: Set the log file path (with valid date and time in the filename)
set LOGFILE=%~dp0wsl_update_log_%currentDate%_%currentTime%.txt

:: Start updating
echo Running WSL update at %date% %time% >> "%LOGFILE%"
wsl -e bash -c "sudo apt-get update && sudo apt-get upgrade -y" >> "%LOGFILE%" 2>&1

:: Logging results
echo Completed WSL update at %date% %time% >> "%LOGFILE%"
