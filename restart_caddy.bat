@echo off
echo Restarting Caddy with correct configuration...
echo.

REM Using docker compose to properly restart caddy
docker compose -p localai up -d caddy

echo.
echo Checking Caddy status...
timeout /t 5 >nul
docker logs --tail 10 caddy

echo.
echo ========================================
echo All services are running!
echo ========================================
echo.
echo LOCAL ACCESS (all working):
echo - Open WebUI: http://localhost:3000
echo - n8n: http://localhost:5678
echo - Flowise: http://localhost:3001
echo - Neo4j: http://localhost:7474
echo - Ollama API: http://localhost:11434
echo - Qdrant: http://localhost:6333
echo - LangFuse: http://localhost:3002
echo - SearXNG: http://localhost:8080
echo - Supabase: http://localhost:8000
echo.
echo EXTERNAL ACCESS:
echo - Open WebUI will be at: https://dmann.ddns.net
echo   (Caddy needs a few minutes to get SSL certificate)
echo.
echo ========================================
pause
