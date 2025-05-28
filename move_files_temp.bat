@echo off
echo Moving files temporarily...
mkdir shared_temp 2>nul
move shared\*.pdf shared_temp\
move shared\*.png shared_temp\
echo Files moved to shared_temp folder
echo.
echo Now copy just 1-2 files back to test:
echo copy shared_temp\[filename] shared\
pause
