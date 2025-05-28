@echo off
echo Fixing Caddy configuration...
echo.

REM Stop Caddy temporarily
docker compose stop caddy

echo.
echo Updating .env to use subdomains...
echo.

REM Create a temporary PowerShell script to update the .env file
powershell -Command ^
"$content = Get-Content .env; ^
$content = $content -replace 'N8N_HOSTNAME=dmann.ddns.net', 'N8N_HOSTNAME=n8n.dmann.ddns.net'; ^
$content = $content -replace 'WEBUI_HOSTNAME=dmann.ddns.net', 'WEBUI_HOSTNAME=dmann.ddns.net'; ^
$content | Set-Content .env"

echo.
echo Starting Caddy with fixed configuration...
docker compose up -d caddy

echo.
echo ========================================
echo Configuration updated!
echo ========================================
echo.
echo For now, you can access services locally:
echo - Open WebUI: http://localhost:3000
echo - n8n: http://localhost:5678
echo - All other services work on their respective ports
echo.
echo External access will work once you set up subdomains
echo or we can disable Caddy's external features.
echo ========================================
pause
