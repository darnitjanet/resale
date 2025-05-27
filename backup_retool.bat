@echo off
:: Get today’s date in YYYY-MM-DD format
for /f %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "today=%%a"

:: Create the dated backup folder
mkdir backups\%today%

:: Prompt for the file path
echo Enter full path to your Retool JSON file:
set /p filePath=

:: Extract just the filename (e.g., myapp.json)
for %%F in ("%filePath%") do set "fileName=%%~nxF"

:: Move the file to the backups folder
copy "%filePath%" "backups\%today%\%fileName%"

:: Git add, commit, and push
git add .
git commit -m "Retool backup for %today%"
git push origin main

echo Backup complete!
pause
