@echo off
echo Installing pgvector extension in PostgreSQL...
docker exec -it supabase-db psql -U postgres -c "CREATE EXTENSION IF NOT EXISTS vector;"
echo Done!
pause
