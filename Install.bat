@echo off
:: Batch script for Windows 11 to add "Run" and "Run As Admin" to the main context menu

:: Automatically detect Python path
set "python_path="
for %%d in (
    "%LocalAppData%\Programs\Python\Python*",
    "%ProgramFiles%\Python*",
    "%SystemDrive%\Python*"
) do (
    if exist "%%d\python.exe" (
        set "python_path=%%d\python.exe"
        goto python_found
    )
)
for /f "tokens=*" %%p in ('where python.exe 2^>nul') do (
    set "python_path=%%p"
    goto python_found
)
echo Error: Python not found.
pause
exit /b 1

:python_found
echo Found Python at: %python_path%

reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.py\Shell\Run" /ve /d "Run Python Script" /f
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.py\Shell\Run\command" /ve /d "\"%python_path%\" \"%%1\"" /f

reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.py\Shell\Run As Admin" /ve /d "Run As Admin" /f
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.py\Shell\Run As Admin" /v "HasLUAShield" /t REG_SZ /d "" /f
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.py\Shell\Run As Admin\command" /ve /d "powershell -Command \"Start-Process '%python_path%' -ArgumentList '%%1' -Verb RunAs\"" /f

:: Force Explorer to reload the context menu
taskkill /f /im explorer.exe >nul
start explorer.exe
echo Success! Restart File Explorer or your PC if options don't appear.
pause