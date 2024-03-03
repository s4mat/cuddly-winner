@echo off

if exist "C:\Program Files (x86)\cloudflared\cloudflared.exe" (
    echo Cloudflared already installed.
) else (
    echo Cloudflared is not installed. Downloading...
    echo Download Cloudflared
    powershell -command "& { Invoke-WebRequest 'http://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.msi' -OutFile '%localappdata%\cloudflaredins.msi' }"

    echo Run Installer
    start %localappdata%\cloudflaredins.msi

    pause
)

set /p hostname="URL: "
set /p port="Port on which TCP will be: "

cloudflared access tcp --hostname %hostname% --url localhost:%port%
