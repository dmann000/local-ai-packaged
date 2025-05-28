@echo off
echo Checking PostgreSQL connection and extensions...
echo.
echo From n8n container to db:
docker exec -it n8n sh -c "PGPASSWORD=SdoxMw2EtePgPZZRgpGGqRLp psql -h db -U postgres -d postgres -c 'SELECT version();'"
echo.
echo Checking vector extension directly:
docker exec -it supabase-db psql -U postgres -d postgres -c "CREATE EXTENSION IF NOT EXISTS vector;"
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT * FROM pg_extension WHERE extname = 'vector';"
pause
