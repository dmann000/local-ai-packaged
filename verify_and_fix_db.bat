@echo off
echo Verifying database setup...
echo.
echo 1. Testing connection from n8n to 'db':
docker exec -it n8n sh -c "nc -zv db 5432"
echo.
echo 2. Checking pgvector in Supabase DB:
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT * FROM pg_extension WHERE extname = 'vector';"
echo.
echo 3. Checking if setup tables exist in Supabase DB:
docker exec -it supabase-db psql -U postgres -d postgres -c "\dt document_*"
echo.
echo 4. If pgvector not installed, installing it:
docker exec -it supabase-db psql -U postgres -d postgres -c "CREATE EXTENSION IF NOT EXISTS vector;"
echo.
pause
