@echo off
setlocal EnableDelayedExpansion

SET MAKE=gnumake.exe
SET ABS_PREFIX=%CYGWIN_PREFIX:~9%

REM Yes, there is a tar file inside the tar file.
REM tar xvf m4-%PKG_VERSION%.tar.xz
REM %PYTHON% -c "import tarfile; tarfile.open('m4-%PKG_VERSION%.tar.xz').extractall()"
REM if errorlevel 1 exit 1

REM cd m4-%PKG_VERSION%
REM if errorlevel 1 exit 1

bash configure --prefix %ABS_PREFIX%
if errorlevel 1 exit 1

gnumake
if errorlevel 1 exit 1

gnumake check
if errorlevel 1 exit 1

gnumake install
if errorlevel 1 exit 1