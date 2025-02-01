@echo off
:: Batch script to remove ALL "Run" and "Run as Admin" context menu entries for .py files

:: Delete modern Windows 11 entries (main context menu)
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.py\Shell\Run" /f 2>nul
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.py\Shell\Run As Admin" /f 2>nul

echo All "Run" and "Run as Admin" context menu entries have been removed, Restart File Explorer or your PC if not removed.
pause