@echo off
echo Pulling qwen2.5:14b model...
docker exec -it ollama ollama pull qwen2.5:14b
echo Done!
pause
