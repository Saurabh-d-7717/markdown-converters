@echo off
setlocal enabledelayedexpansion

:: Create a temporary folder
set "tempDir=%TEMP%\clipboard_md"
if not exist "%tempDir%" mkdir "%tempDir%"

:: Generate a unique filename with timestamp
set "timestamp=%date:/=-%_%time::=-%"
set "timestamp=!timestamp: =0!"
set "tempMD=%tempDir%\clipboard_!timestamp!.md"
:: Change output path if needed
set "outputDOCX=%~dp0converted_!timestamp!.docx"

:: Use PowerShell to save clipboard text to a temporary .md file
powershell -Command "$clipText = Get-Clipboard -Raw; if ($clipText) { $clipText | Out-File -FilePath '%tempMD%' -Encoding utf8 } else { Write-Host 'Error: Clipboard is empty or does not contain text.'; exit 1 }"

:: Check if the temporary .md file was created
if not exist "%tempMD%" (
    echo Error: Failed to save clipboard text.
    pause
    exit /b 1
)

:: Convert the temporary .md file to .docx using Pandoc
pandoc "%tempMD%" -o "%outputDOCX%"

:: Check if the conversion succeeded
if exist "%outputDOCX%" (
    echo Success: "%outputDOCX%" created!
    :: Optional: Open the DOCX file automatically
    start "" "%outputDOCX%"
) else (
    echo Error: Pandoc conversion failed.
)

:: Clean up the temporary .md file
del "%tempMD%"

pause