@echo off
setlocal ENABLEDELAYEDEXPANSION

REM Create temporary file list
set tempList=tempFileList.txt
dir C:\*.txt /A:-D /O:D > !tempList!

REM Archive older files to Drive Z:
set archiveDir=C:\ArchivedFiles
if not exist !archiveDir! dir !archiveDir!

for /f "tokens=* delims=" %%F in ('type !tempList!') do (
    set "file=%%F"
    if "!file!" neq "" (
        echo Moving !file! to !archiveDir!
        move "C:\!file!" "!archiveDir!"
    )
)

REM Sort archived files by size
set sortedList=sortedFileList.txt
dir !archiveDir!\*.txt /A:-D /O:-S > !sortedList!

REM Prompt user for permission to delete old, large files
echo The following files are old and large:
type !sortedList!
set /p confirm=Do you want to delete these files? (y/n):
if /i "!confirm!"=="y" (
    for /f "tokens=* delims=" %%F in ('type !sortedList!') do (
        del "!archiveDir!\%%F"
    )
    echo Files deleted.
) else (
    echo Files not deleted.
)

REM Clean up
del !tempList!
del !sortedList!

:end
pause