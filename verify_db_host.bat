@echo off
echo Checking which container 'db' resolves to...
echo.
echo 1. Checking Supabase DB container:
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT version();"
echo.
echo 2. Checking what 'db' hostname resolves to from n8n container:
docker exec -it n8n sh -c "ping -c 1 db 2>&1 | head -n 1"
echo.
echo 3. Checking network aliases:
docker inspect supabase-db | findstr /C:"Aliases"
echo.
echo 4. Checking if pgvector is in Supabase DB:
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT * FROM pg_available_extensions WHERE name = 'vector';"
echo.
echo 5. Checking environment variables:
docker exec -it n8n sh -c "echo DB_HOST=$DB_POSTGRESDB_HOST"
echo.
pause
