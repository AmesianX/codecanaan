@echo off

title CodeCanaan

cd %CC_CLIENT_CWD%

gcc -o %CC_CLIENT_FILEBASE%.exe %CC_CLIENT_FILE%

if not %ERRORLEVEL%==0 goto End

..\execdump.exe .stdout "%CC_CLIENT_FILEBASE%.exe"

:End

pause

type nul > .complete

exit

