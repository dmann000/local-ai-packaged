@echo off
echo Checking pgvector and available extensions...
echo.
echo 1. Checking if vector extension exists:
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT * FROM pg_available_extensions WHERE name = 'vector';"
echo.
echo 2. Checking if vector extension is installed:
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT * FROM pg_extension WHERE extname = 'vector';"
echo.
echo 3. Listing all installed extensions:
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT extname, extversion FROM pg_extension;"
echo.
echo 4. Checking if documents_pg table exists:
docker exec -it supabase-db psql -U postgres -d postgres -c "\dt documents_pg"
echo.
pause
