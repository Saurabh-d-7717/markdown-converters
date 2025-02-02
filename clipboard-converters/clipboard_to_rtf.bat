@echo off
setlocal enabledelayedexpansion

:: Temporary folder for Markdown content
set "tempDir=%TEMP%\clipboard_md"
if not exist "%tempDir%" mkdir "%tempDir%"

:: Generate unique filenames
set "timestamp=%date:/=-%_%time::=-%"
set "timestamp=!timestamp: =0!"
set "tempMD=%tempDir%\clipboard_!timestamp!.md"
:: Change output path if needed
set "outputRTF=%~dp0converted_!timestamp!.rtf"

:: Save clipboard to .md file
powershell -Command "$clipText = Get-Clipboard -Raw; if ($clipText) { $clipText | Out-File -FilePath '%tempMD%' -Encoding utf8 } else { Write-Host 'Error: Clipboard empty.'; exit 1 }"

:: Check if .md file exists
if not exist "%tempMD%" (
    echo Error: Failed to save clipboard text.
    pause
    exit /b 1
)

:: Convert to RTF
pandoc "%tempMD%" -s -o "%outputRTF%"

:: Verify and cleanup
if exist "%outputRTF%" (
    echo Success: "%outputRTF%" created!
    start "" "%outputRTF%"  :: Optional: Auto-open the RTF
) else (
    echo Error: Pandoc conversion failed.
)

del "%tempMD%"
pause