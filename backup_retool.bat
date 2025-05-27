@echo off
:: Retool + MySQL backup script with safety checks and Git push

:: Set paths
set "repoPath=C:\Users\mrsja\resale"
set "sourceFolder=C:\Users\mrsja\retool_backups"
set "mysqldumpPath=C:\Tools\MySQL\bin\mysql-8.0.41-winx64\bin\mysqldump.exe"
set "databaseName=resale_inventory"
set "mysqlUser=root"

:: Go to the Git repo
cd /d "%repoPath%"

:: Get today's date (YYYY-MM-DD)
for /f %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "today=%%a"

:: Create the dated backup folder
mkdir backups\%today% >nul 2>&1

:: Find the most recently modified JSON file
set "latestFile="
for /f "delims=" %%F in ('powershell -NoProfile -Command ^
  "Get-ChildItem -Path '%sourceFolder%' -Filter *.json | Sort-Object LastWriteTime -Descending | Select-Object -First 1 | ForEach-Object { $_.FullName }"') do set "latestFile=%%F"

:: If no file was found, bail out
if "%latestFile%"=="" (
    echo ❌ No recent JSON file found in %sourceFolder%.
    pause
    exit /b
)

:: Show the most recent file and ask for confirmation
echo Most recent file found:
echo File found: "%latestFile%"
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

:: Copy to backup folder
copy "%filePath%" "backups\%today%\%fileName%"

:: Export MySQL schema to the same folder
echo.
echo 🧠 Exporting MySQL schema...
"%mysqldumpPath%" -u %mysqlUser% -p --no-data %databaseName% > "backups\%today%\schema-%today%.sql"

:: Git operations
git add .
git commit -m "Retool + schema backup for %today%"

:: Attempt to pull before pushing (avoids rejection)
git pull origin main --rebase
git push origin main

:: Open GitHub repo in browser
start https://github.com/darnitjanet/resale

echo.
echo ✅ Backup complete and pushed to GitHub!
pause
