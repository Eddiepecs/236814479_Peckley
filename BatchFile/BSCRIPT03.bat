@echo off
:menu
cls
echo Select a utility:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
echo 9. Exit
echo.
set /p choice= "Enter your choice (1-9):"
if %choice%==1 goto ipconfig
if %choice%==2 goto tasklist
if %choice%==3 goto taskkill
if %choice%==4 goto chkdsk
if %choice%==5 goto format
if %choice%==6 goto defrag
if %choice%==7 goto find
if %choice%==8 goto attrib
if %choice%==9 goto exit

:ipconfig
echo ---------------------------------------------------------------
ipconfig
echo ---------------------------------------------------------------
pause
goto menu

:tasklist
tasklist
pause
goto menu

:taskkill
echo ---------------------------------------------------------------
set /p pid= "Enter process ID to kill:"
echo ---------------------------------------------------------------
taskkill /PID %pid%
pause

goto menu

:chkdsk
echo ---------------------------------------------------------------
set /p drive= "Enter Drive Letter to check (ex: "C: "/" D:"): "
echo ---------------------------------------------------------------
if not exist %drive%\ (
echo Failed to check disk
)
Echo Checking disk on Drive %drive%
chkdsk %drive%:
echo Disk check completed successfully

pause
goto menu

:format
echo ---------------------------------------------------------------
echo WARNING! This will intantly delete the files
echo ---------------------------------------------------------------
set /p drive= "Enter Drive Letter to format (ex: "C: "/" D:"): "
echo ---------------------------------------------------------------
if not exist %drive%\ (
    echo Drive %drive% does not exist.
    echo Formatting canceled
    goto format
)
echo Deleting all files in Drive %drive%
format %drive%
echo Disk formatted successfully

pause
goto menu

:defrag
echo ---------------------------------------------------------------
set /p drive= "Enter Drive to defrag (ex: "C: "/" D:"): "
echo ---------------------------------------------------------------
if not exist %drive%\ (
    echo Error Drive %drive% does not exist
    goto defrag
) 
echo defragmentation on %drive%
defrag %drive%: 
echo Disk defragmented successfully


pause
goto menu

:find
echo ---------------------------------------------------------------
set /p file= "Enter file name to search for:"
echo ---------------------------------------------------------------
find %file%
if not exist %drive%\ (
    echo File not found
)
find %drive% 
echo File found

pause
goto menu

:attrib
echo ---------------------------------------------------------------
set /p file=Enter file name to change attributes:
echo ---------------------------------------------------------------
set /p attributes=Enter attributes (+R, -R, +A, -A, +S, -S, +H, -H):
echo ---------------------------------------------------------------
attrib %attributes% %file%
if not exist %drive%\ (
    echo Failed to change attributes
    goto menu
)
echo Attributes changed successfully

pause
goto menu

:exit
echo ---------------------------------------------------------------
echo Exiting...
echo ---------------------------------------------------------------
echo Goodbye...
echo ---------------------------------------------------------------
exit