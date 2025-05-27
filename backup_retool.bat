@echo off
:: Cosmo's Retool + MySQL backup script with smart copy + GitHub automation

:: === CONFIGURATION ===
set "repoPath=C:\Users\mrsja\resale"
set "sourceFolder=C:\Users\mrsja\resale\backups"
set "mysqldumpPath=C:\Tools\MySQL\bin\mysql-8.0.41-winx64\bin\mysqldump.exe"
set "databaseName=resale_inventory"
set "mysqlUser=root"
set "tempFile=%temp%\latest_json_path.txt"

:: === SETUP ===
cd /d "%repoPath%"

:: Get today's date (YYYY-MM-DD)
for /f %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "today=%%a"

:: Create the dated backup folder
mkdir backups\%today% >nul 2>&1

:: === FIND LATEST JSON FILE ===
powershell -NoProfile -Command ^
  "$f = Get-ChildItem -Path '%sourceFolder%' -Recurse -Filter *.json | Sort-Object LastWriteTime -Descending | Select-Object -First 1; if ($f) { $f.FullName }" > "%tempFile%"

set /p latestFile=<"%tempFile%"
del "%tempFile%"

if "%latestFile%"=="" (
    echo ❌ Could not find a recent JSON file in %sourceFolder% or subfolders.
    pause
    exit /b
)

:: === CONFIRM FILE ===
echo Most recent file found:
echo "%latestFile%"
echo.
choice /m "Use this file?"
if errorlevel 2 goto customPath

:: Use the latest file
set "filePath=%latestFile%"
if "%filePath%"=="" (
    echo ❌ File path is empty. Something went wrong.
    pause
    exit /b
)
goto copyFile

:customPath
echo Enter full path to your Retool JSON file:
set /p filePath=
if "%filePath%"=="" (
    echo ❌ File path is empty.
    pause
    exit /b
)

:copyFile
:: Extract just the filename
for %%F in ("%filePath%") do set "fileName=%%~nxF"

:: Check if file already in today's folder
echo.
echo 🔎 Checking if file is already in the backup folder...
if /i "%filePath%"=="%repoPath%\backups\%today%\%fileName%" (
    echo 🔄 File is already in place. Skipping copy.
) else (
    echo 📄 Copying file to backups\%today%...
    copy "%filePath%" "backups\%today%\%fileName%"
)

:: === EXPORT MYSQL SCHEMA ===
echo.
echo 🧠 Exporting MySQL schema...
"%mysqldumpPath%" -u %mysqlUser% -p --no-data %databaseName% > "backups\%today%\schema-%today%.sql"

:: === GIT MAGIC ===
git add .
git commit -m "Retool + schema backup for %today%"
git pull origin main --rebase
git push origin main

:: === ALL DONE ===
start https://github.com/darnitjanet/resale

echo.
echo ✅ Backup complete and pushed to GitHub!
pause
