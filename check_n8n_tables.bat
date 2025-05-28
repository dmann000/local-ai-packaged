@echo off
echo Checking which database n8n is actually using...
echo.
echo Checking tables in Supabase DB:
docker exec -it supabase-db psql -U postgres -d postgres -c "\dt"
echo.
echo Checking if the tables created by setup nodes exist:
docker exec -it supabase-db psql -U postgres -d postgres -c "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND (table_name = 'document_metadata' OR table_name = 'document_rows');"
echo.
pause
