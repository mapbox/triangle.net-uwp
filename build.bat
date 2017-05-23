@ECHO OFF
SETLOCAL
SET EL=0
echo ~~~~~~~~~~~~~~~~~~~ %~f0 ~~~~~~~~~~~~~~~~~~~

CALL "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
IF %ERRORLEVEL% NEQ 0 GOTO ERROR

msbuild Triangle.NET\Triangle.sln /t:Triangle:Rebuild
IF %ERRORLEVEL% NEQ 0 GOTO ERROR

msbuild Triangle.NET\Triangle.sln /t:TriangleNetStandard:Rebuild
IF %ERRORLEVEL% NEQ 0 GOTO ERROR

msbuild Triangle.NET\Triangle.sln /t:TriangleUWP:Rebuild
IF %ERRORLEVEL% NEQ 0 GOTO ERROR

GOTO DONE

:ERROR
SET EL=%ERRORLEVEL%
ECHO ~~~~~~~~~~~~~~~~~~~ ERROR %~f0 ~~~~~~~~~~~~~~~~~~~
ECHO ERRORLEVEL^: %EL%

:DONE
ECHO ~~~~~~~~~~~~~~~~~~~ DONE %~f0 ~~~~~~~~~~~~~~~~~~~

EXIT /b %EL%