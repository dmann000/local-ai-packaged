@echo off
echo Checking if qwen2.5:14b exists...
docker exec ollama ollama list | findstr qwen
echo.
echo If no model shown above, pulling qwen2.5:14b...
docker exec ollama ollama pull qwen2.5:14b
echo.
echo Checking again...
docker exec ollama ollama list
pause
