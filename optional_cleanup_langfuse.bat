@echo off
echo Optional: Cleaning up tables from Langfuse PostgreSQL...
docker exec -it localai-postgres-1 psql -U postgres -d postgres -c "DROP TABLE IF EXISTS document_metadata CASCADE;"
docker exec -it localai-postgres-1 psql -U postgres -d postgres -c "DROP TABLE IF EXISTS document_rows CASCADE;"
echo Cleanup complete!
pause
