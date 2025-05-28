@echo off
echo Checking Caddy status...
echo.
docker logs --tail 20 caddy
echo.
echo If Caddy is having issues, it's likely because the domains are set in .env
echo but we don't need them for local-only access.
echo.
echo To fix, you can:
echo 1. Comment out the domain lines in .env
echo 2. Or just ignore it - all services work locally anyway
echo.
pause
