@echo off
echo Fixing both issues...
echo.
echo 1. Installing pgvector extension (again):
docker exec -it supabase-db psql -U postgres -d postgres -c "CREATE EXTENSION IF NOT EXISTS vector;"
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT extname, extversion FROM pg_extension WHERE extname = 'vector';"
echo.
echo 2. Checking available Ollama models:
docker exec -it ollama ollama list
echo.
echo 3. Pulling the exact model name the workflow expects:
docker exec -it ollama ollama pull qwen2.5:14b-instruct-q4_K_M
echo.
echo After this completes, you may need to update the workflow to use 'qwen2.5:14b-instruct-q4_K_M' instead of 'qwen2.5:14b-8k'
pause
