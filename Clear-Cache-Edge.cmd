@echo off
echo Closing Microsoft Edge...
taskkill /IM msedge.exe /F >nul 2>&1

echo Clearing full Edge cache and cookies...

set EDGE="%LOCALAPPDATA%\Microsoft\Edge\User Data\Default"

:: Delete ALL storage folders that hold cookies + cache
rd /s /q %EDGE%\Cache
rd /s /q %EDGE%\Code Cache
rd /s /q %EDGE%\GPUCache
rd /s /q %EDGE%\Local Storage
rd /s /q %EDGE%\IndexedDB
rd /s /q %EDGE%\Service Worker
rd /s /q %EDGE%\Session Storage
rd /s /q %EDGE%\Network
rd /s /q %EDGE%\Blob Storage
rd /s /q %EDGE%\File System
rd /s /q %EDGE%\Storage

:: Delete cookies database files
del /f /q %EDGE%\Cookies
del /f /q %EDGE%\Cookies-journal

echo.
echo Done! ALL cache and cookies have been fully cleared.
echo.
echo BR,
echo IT-Team
pause