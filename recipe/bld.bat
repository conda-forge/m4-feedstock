@echo off
setlocal EnableDelayedExpansion

REM SET MAKE=gnumake.exe
REM SET ABS_PREFIX=%CYGWIN_PREFIX:~9%

REM Yes, there is a tar file inside the tar file.
REM tar xvf m4-%PKG_VERSION%.tar.xz
REM %PYTHON% -c "import tarfile; tarfile.open('m4-%PKG_VERSION%.tar.xz').extractall()"
REM if errorlevel 1 exit 1

REM cd m4-%PKG_VERSION%
REM if errorlevel 1 exit 1

REM bash configure --prefix %ABS_PREFIX%
REM if errorlevel 1 exit 1

REM gnumake
REM if errorlevel 1 exit 1

REM gnumake check
REM if errorlevel 1 exit 1

REM gnumake install
REM if errorlevel 1 exit 1

robocopy bin %LIBRARY_BIN% /s /e 
call :REPORT_ERRORLEVEL
goto :EOF

:REPORT_ERRORLEVEL
echo.
if ERRORLEVEL 16 echo ***FATAL ERROR*** & exit 1
if ERRORLEVEL 8 echo **FAILED COPIES** & exit 1
if ERRORLEVEL 4 echo *Copy contained mismatches* & goto :EOF
if ERRORLEVEL 2 echo Copied extra files & goto :EOF
if ERRORLEVEL 1 echo Copy successful & goto :EOF
if ERRORLEVEL 0 echo No copies made & goto :EOF