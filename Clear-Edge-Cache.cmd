@ECHO OFF
TITLE Edge Cache & Cookie Cleaner
SETLOCAL

:: --- 1. FORCE CLOSE EDGE ---
:: This ensures the database files are unlocked so they can be deleted.
taskkill /F /IM msedge.exe /T >nul 2>&1

:: Wait 2 seconds for Windows to release the file locks
timeout /t 2 /nobreak >nul

:: --- 2. DEFINE THE TARGET PATH ---
:: Edge stores profile data in LocalAppData. "Default" is the standard profile.
SET "EDGE_PROFILE=%LOCALAPPDATA%\Microsoft\Edge\User Data\Default"

:: --- 3. THE CLEANING PROCESS ---
IF EXIST "%EDGE_PROFILE%" (
    echo Cleaning Edge Cache...
    :: Deletes images and scripts from websites
    ERASE "%EDGE_PROFILE%\Cache\*.*" /F /S /Q >nul 2>&1
    ERASE "%EDGE_PROFILE%\Code Cache\*.*" /F /S /Q >nul 2>&1
    
    echo Cleaning Edge Cookies...
    :: Deletes the files that keep you logged into websites
    DEL /F /Q "%EDGE_PROFILE%\Cookies" >nul 2>&1
    DEL /F /Q "%EDGE_PROFILE%\Network\Cookies" >nul 2>&1
    
    echo Cleaning Web Data...
    :: Optional: Clears some internal browser databases
    DEL /F /Q "%EDGE_PROFILE%\Web Data" >nul 2>&1
) ELSE (
    echo Edge Profile not found in the default location.
)

:: --- 4. RELAUNCH ---
echo Refresh complete. Reopening Microsoft Edge...
start msedge.exe

ENDLOCAL
EXIT /B 0