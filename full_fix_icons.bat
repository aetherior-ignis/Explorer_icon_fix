@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Run this file as an administrator.
    pause
    exit /b 1
)

echo Press any key to continue...
pause >nul

echo In the folder that opens now, delete the file with the icon that replaced the standard explorer.exe icon in the Task Manager.
timeout /t 3 /nobreak >nul
explorer "%userprofile%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"

echo.
echo Press any key to continue...
pause >nul
cls
echo Restarting explorer...

taskkill /F /IM explorer.exe
del /A /Q "%localappdata%\IconCache.db"
del /A /F /Q "%localappdata%\Microsoft\Windows\Explorer\iconcache*"
regsvr32 /i shell32.dll
start explorer.exe

echo.
echo The process is complete. Press any key to exit.
pause >nul
