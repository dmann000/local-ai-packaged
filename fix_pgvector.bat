@echo off
echo Checking and installing pgvector extension...
docker exec -it supabase-db psql -U postgres -d postgres -c "CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;"
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT * FROM pg_extension WHERE extname = 'vector';"
echo Done!
pause
