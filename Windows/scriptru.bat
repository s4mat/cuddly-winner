@echo off

if exist "C:\Program Files (x86)\cloudflared\cloudflared.exe" (
    echo Cloudflared уже установлен.
) else (
    echo Cloudflared не установлен. Загрузка...
    echo Download Cloudflared
    powershell -command "& { Invoke-WebRequest 'http://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.msi' -OutFile '%localappdata%\cloudflaredins.msi' }"

    echo Run Installer
    start %localappdata%\cloudflaredins.msi

    pause
)

set /p hostname="URL адрес: "
set /p port="Порт на котором будет открыт доступ: "

cloudflared access tcp --hostname %hostname% --url localhost:%port%
