@ECHO OFF
::
:: Syntax:		DeployQt.bat <exe-file>
:: Description:	deploys the given Qt application (by copying necessary files)
:: Usage:		simply drag'n'drop the Qt application executable to this batch file. Optionally can define an output dir as second parameter. If parameter is missing implicit location of app is used as output dir.
:: Author:		Markus Fleschutz / Florian Gross / Alexander Weiss
:: License:		beerware ;-)

:: Get product version:
set "QTAPP_EXE=%1"

setlocal enableDelayedExpansion

set "QTAPP_DIR=%QTAPP_EXE%\.."
set "LIB_DIR=%QTAPP_DIR%"
set "DIR=%QTAPP_DIR%\Qt %QTAPP_EXE%"

set "DEPLOY_ARGS=-force -libdir %LIB_DIR% -dir %DIR%"

if "%~2"=="" (
	echo DeployQt.bat launched with IMPLICITLY given output directory...
) else (
	echo DeployQt.bat launched with EXPLICITLY given output directory...
	set LIB_DIR=%2
	set DIR="%~2"\Qt %QTAPP_EXE%
	set DEPLOY_ARGS=-release -force -libdir !LIB_DIR! -dir !DIR!
)

:: Check which Qt version to deploy by looking for this GUID (set in ATTowerVersionInfo.rc)
findstr /M /C:"A9130C01-C9E7-4C54-8481-691A86134D1D" %QTAPP_EXE% >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
	goto Qt5_15_2
) else (
	goto Qt5_5_1
)

:Qt5_5_1
set "TARGET=Qt 5.5.1 (32-bit)"
set "QTDIR=%QTDIR_VC141_551%"
set DRYRUN=%QTDIR%\bin\windeployqt.exe --dry-run --no-libraries --no-plugins --no-quick-import --no-translations --no-system-d3d-compiler --no-compiler-runtime --no-webkit2 --no-angle %DEPLOY_ARGS%
:: Execute dry-run and query first line of stdout to check for 64-bit
for /F "tokens=*" %%a IN ('%DRYRUN% ^| findstr /C:"64 bit,"') DO (
	set "TARGET=Qt 5.5.1 (64-bit)"
	set "QTDIR=%QTDIR_VC141_X64_551%"
)
goto deploy

:Qt5_15_2
set "TARGET=Qt 5.15.2 (32-bit)"
set "QTDIR=%QTDIR_VC141_5152%"
set DRYRUN=%QTDIR%\bin\windeployqt.exe --dry-run --no-libraries --no-plugins --no-quick-import --no-translations --no-system-d3d-compiler --no-compiler-runtime --no-webkit2 --no-angle %DEPLOY_ARGS%
:: Execute dry-run and query first line of stdout to check for 64-bit
for /F "tokens=*" %%a IN ('%DRYRUN% ^| findstr /C:"64 bit,"') DO (
	set "TARGET=Qt 5.15.2 (64-bit)"
	set "QTDIR=%QTDIR_VC141_X64_5152%"
)

:: deploy qt.conf
echo [Paths] > %LIB_DIR%\qt.conf
echo Prefix = ./Qt >> %LIB_DIR%\qt.conf
echo LibraryExecutables = . >> %LIB_DIR%\qt.conf

:: deploy Qt/qt.conf
echo [Paths] > %LIB_DIR%\Qt\qt.conf
echo Prefix = . >> %LIB_DIR%\Qt\qt.conf

goto deploy

:deploy
:: echo %QTDIR%\bin\windeployqt.exe %DEPLOY_ARGS%
%QTDIR%\bin\windeployqt.exe %DEPLOY_ARGS% 2>&1

echo OK - %QTAPP_EXE% deployed to %TARGET%.
echo.
pause