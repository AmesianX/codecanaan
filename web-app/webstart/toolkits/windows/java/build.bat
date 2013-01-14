@echo off

cd %CC_CLIENT_CWD%

javac -encoding utf-8 %CC_CLIENT_FILE%

if not %ERRORLEVEL%==0 goto End

..\execdump.exe .stdout "java %CC_CLIENT_FILEBASE%"

:End

pause

type nul > .complete

exit

