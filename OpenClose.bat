@echo off
title Safe Tracker
setlocal enabledelayedexpansion

::Idea and Modification by Dameen Rashmika
::Code available at https://github.com/DameenPerera/Open-Close-Tracker
set "start_time=%date% %time%"

:menu
cls
echo --------------------------------------
echo        SAFE OPEN/CLOSE LOG
echo --------------------------------------
echo.
echo 1. Record SAFE OPENED (!start_time!)
echo 2. Record SAFE CLOSED (!start_time!)
echo 3. View Log
echo 4. Delete Log File
echo 5. Exit
echo.
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" (
    echo !start_time! - SAFE OPENED >> "%USERPROFILE%\Safe_Log.txt"
    echo Safe OPENING recorded at !start_time!
    timeout /t 3 >nul
    exit
)

if "%choice%"=="2" (
    echo !start_time! - SAFE CLOSED >> "%USERPROFILE%\Safe_Log.txt"
    echo Safe CLOSING recorded at !start_time!
    timeout /t 3 >nul
    exit
)

if "%choice%"=="3" (
    if not exist "%USERPROFILE%\Safe_Log.txt" (
        echo No log file found!
    ) else (
        notepad "%USERPROFILE%\Safe_Log.txt"
    )
    timeout /t 3 >nul
    goto menu
)

if "%choice%"=="4" (
    if exist "%USERPROFILE%\Safe_Log.txt" (
        del "%USERPROFILE%\Safe_Log.txt"
        echo Log file deleted successfully!
    ) else (
        echo No log file found to delete!
    )
    timeout /t 3 >nul
    exit
)

if "%choice%"=="5" exit

echo Invalid choice! Please try again.
timeout /t 2 >nul
goto menu