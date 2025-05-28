# Simplify Setup - Make only OpenWebUI external
Write-Host "Simplifying setup - making only OpenWebUI external..." -ForegroundColor Cyan
Write-Host ""

# Stop Caddy
Write-Host "Stopping Caddy..." -ForegroundColor Yellow
docker compose stop caddy

Write-Host ""
Write-Host "Updating environment variables..." -ForegroundColor Yellow

# Read the .env file
$envPath = ".\.env"
$content = Get-Content $envPath

# Comment out all hostnames except WEBUI_HOSTNAME
$content = $content -replace '^(N8N_HOSTNAME=)', '# $1'
$content = $content -replace '^(FLOWISE_HOSTNAME=)', '# $1'
$content = $content -replace '^(SUPABASE_HOSTNAME=)', '# $1'
$content = $content -replace '^(LANGFUSE_HOSTNAME=)', '# $1'
$content = $content -replace '^(OLLAMA_HOSTNAME=)', '# $1'
$content = $content -replace '^(NEO4J_HOSTNAME=)', '# $1'
$content = $content -replace '^(SEARXNG_HOSTNAME=)', '# $1'

# Save the updated content
$content | Set-Content $envPath

Write-Host ""
Write-Host "Restarting Caddy..." -ForegroundColor Yellow
docker compose up -d caddy

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Setup Simplified!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "LOCAL ACCESS (Working now):" -ForegroundColor Cyan
Write-Host "- Open WebUI: http://localhost:3000" -ForegroundColor White
Write-Host "- n8n: http://localhost:5678" -ForegroundColor White
Write-Host "- Flowise: http://localhost:3001" -ForegroundColor White
Write-Host "- Ollama: http://localhost:11434" -ForegroundColor White
Write-Host "- Neo4j: http://localhost:7474" -ForegroundColor White
Write-Host "- Qdrant: http://localhost:6333" -ForegroundColor White
Write-Host "- LangFuse: http://localhost:3002" -ForegroundColor White
Write-Host "- SearXNG: http://localhost:8080" -ForegroundColor White
Write-Host "- Supabase: http://localhost:8000" -ForegroundColor White
Write-Host ""
Write-Host "EXTERNAL ACCESS (via port 443):" -ForegroundColor Cyan
Write-Host "- Open WebUI: https://dmann.ddns.net (once Caddy gets SSL cert)" -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
