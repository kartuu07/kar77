@echo off
title kartxxx Profile Server
echo ==================================================
echo   Starting local web server for Google Sign-In...
echo ==================================================
echo.

:: Check for Python
where python >nul 2>1
if %errorlevel% equ 0 (
    echo Python found. Launching Python http.server on port 8080...
    start "Profile Python Server" cmd /c "python -m http.server 8080"
    goto launch
)

:: Check for Node/npx
where npx >nul 2>1
if %errorlevel% equ 0 (
    echo Node.js found. Launching http-server on port 8080...
    start "Profile Node Server" cmd /c "npx -y http-server -p 8080"
    goto launch
)

echo.
echo [WARNING] Neither Python nor Node.js/npx was found on your system Path.
echo To sign in with Google, you must run this profile through a local server.
echo Please install Python or Node.js, or upload this index.html to a hosting site like GitHub Pages.
echo.
pause
exit

:launch
echo Waiting for server to initialize...
timeout /t 2 /nobreak >nul
echo Opening http://localhost:8080 in default browser...
start http://localhost:8080
exit
