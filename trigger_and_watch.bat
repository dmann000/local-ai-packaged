@echo off
echo Triggering a file change to test the workflow...
echo.
echo Creating a test file in shared folder...
echo This is a test document > shared\test_document.txt
echo.
echo File created. Now watching logs for new activity...
echo Press Ctrl+C to stop watching logs
echo.
timeout /t 2 >nul
docker logs -f --tail 0 --timestamps n8n
