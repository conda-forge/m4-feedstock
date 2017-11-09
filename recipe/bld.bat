@echo off
setlocal EnableDelayedExpansion

bash configure --prefix %LIBRARY_PREFIX%
if errorlevel exit 1

make 
if errorlevel exit 1



REM robocopy . %LIBRARY_PREFIX% /s /e 
REM call :REPORT_ERRORLEVEL
goto :EOF

:REPORT_ERRORLEVEL
echo.
if ERRORLEVEL 16 echo ***FATAL ERROR*** & exit 1
if ERRORLEVEL 8 echo **FAILED COPIES** & exit 1
if ERRORLEVEL 4 echo *Copy contained mismatches* & goto :EOF
if ERRORLEVEL 2 echo Copied extra files & goto :EOF
if ERRORLEVEL 1 echo Copy successful & goto :EOF
if ERRORLEVEL 0 echo No copies made & goto :EOF
