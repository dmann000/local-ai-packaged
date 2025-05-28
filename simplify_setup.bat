@echo off
echo Simplifying setup - making only OpenWebUI external...
echo.

REM Stop Caddy
docker compose stop caddy

echo Updating environment variables...

REM Update .env to comment out n8n hostname
powershell -Command ^
"$content = Get-Content .env; ^
$content = $content -replace '^N8N_HOSTNAME=', '# N8N_HOSTNAME='; ^
$content = $content -replace '^FLOWISE_HOSTNAME=', '# FLOWISE_HOSTNAME='; ^
$content = $content -replace '^SUPABASE_HOSTNAME=', '# SUPABASE_HOSTNAME='; ^
$content = $content -replace '^LANGFUSE_HOSTNAME=', '# LANGFUSE_HOSTNAME='; ^
$content = $content -replace '^OLLAMA_HOSTNAME=', '# OLLAMA_HOSTNAME='; ^
$content = $content -replace '^NEO4J_HOSTNAME=', '# NEO4J_HOSTNAME='; ^
$content = $content -replace '^SEARXNG_HOSTNAME=', '# SEARXNG_HOSTNAME='; ^
$content | Set-Content .env"

echo.
echo Restarting Caddy...
docker compose up -d caddy

echo.
echo ========================================
echo Setup Simplified!
echo ========================================
echo.
echo LOCAL ACCESS (Working now):
echo - Open WebUI: http://localhost:3000
echo - n8n: http://localhost:5678
echo - Flowise: http://localhost:3001
echo - Ollama: http://localhost:11434
echo - Neo4j: http://localhost:7474
echo - Qdrant: http://localhost:6333
echo - LangFuse: http://localhost:3002
echo - SearXNG: http://localhost:8080
echo - Supabase: http://localhost:8000
echo.
echo EXTERNAL ACCESS (via port 443):
echo - Open WebUI: https://dmann.ddns.net (once Caddy gets SSL cert)
echo.
echo ========================================
pause
