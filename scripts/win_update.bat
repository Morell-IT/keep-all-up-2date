@echo off
:: Get the date and time
set "currentDate=%date:/=-%"
set "currentTime=%time::=-%"

:: Remove spaces from the time
set "currentTime=%currentTime: =0%"

:: Set the log file path (with valid date and time in the filename)
set LOGFILE=%~dp0win_update_log_%currentDate%_%currentTime%.txt

:: Check for Windows updates and install them
echo Checking for Windows updates...
PowerShell -Command "Start-Process PowerShell -ArgumentList '-NoProfile -Command & {Install-Module PSWindowsUpdate -Force -SkipPublisherCheck; Get-WindowsUpdate -AcceptAll -Install}' -Verb RunAs"

:: Logging results
echo Completed Windows update at %date% %time% >> "%LOGFILE%"
