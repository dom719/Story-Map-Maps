@echo off
setlocal

:: Path to VIPS
set VIPS_PATH=C:\Users\domip\Documents\vips-dev-8.16\bin\vips.exe

:: Get current script directory (where Source.jpg should be)
set SCRIPT_DIR=%~dp0
set IMAGE_PATH=%SCRIPT_DIR%Source.jpg

:: Check if Source.jpg exists
if not exist "%IMAGE_PATH%" (
    echo ❌ Source.jpg not found in %SCRIPT_DIR%
    pause
    exit /b
)

:: Prompt user for output folder name
set /p FOLDER_NAME=Enter a name for the output folder: 

:: Build full output path
set OUTPUT_PATH=%SCRIPT_DIR%%FOLDER_NAME%

:: Create output folder if it doesn't exist
if not exist "%OUTPUT_PATH%" (
    mkdir "%OUTPUT_PATH%"
)

:: Run VIPS command
"%VIPS_PATH%" dzsave "%IMAGE_PATH%" "%OUTPUT_PATH%" --layout zoomify

echo.
echo ✅ Done! Zoomify tiles saved to: %OUTPUT_PATH%
pause
