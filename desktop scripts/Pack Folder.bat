@echo off
title PACK FOLDER v1.2
::
::     USAGE: Drag'n'drop a delivery folder onto this batch file. The folder then gets checked, zipped, and checksummed.
::  REQUIRES: ESET Security and 7-Zip (64-bit) must be installed.
:: COPYRIGHT: (c) 2025 ATCSim GmbH
::
set "FOLDER=%1"
set "ZIP_FILE=%1.ZIP"
set "ESET_FILE=%1.ESET_REPORT.txt"
set "CHECKSUM_FILE=%1.CHECKSUMS.txt"

echo.
echo *** FOLDER GIVEN: %FOLDER% ***
echo.
echo.
echo.
echo.
echo STEP 1: Checking folder for malware, please wait...
echo ---------------------------------------------------
echo (using ESET Security, takes ~60s per GB, ignore the warning below)
"C:\Program Files\ESET\ESET Security\ecls.exe" %FOLDER% > %ESET_FILE%
IF %ERRORLEVEL% NEQ 0 GOTO fail
echo OK, no malware found and ESET report has been written.
echo.
echo.
echo STEP 2: Writing the .ZIP file, please wait...
echo ---------------------------------------------
DEL /f %ZIP_FILE% >NUL 2>&1
"C:\Program Files\7-Zip\7z.exe" a -y -tzip %ZIP_FILE% %FOLDER%
IF %ERRORLEVEL% NEQ 0 GOTO fail
echo.
echo.
echo STEP 3: Writing the .CHECKSUMS.txt file, please wait...
echo -------------------------------------------------------
"%WINDIR%\system32\certutil.exe" -hashfile %ZIP_FILE% SHA256 > %CHECKSUM_FILE%
IF %ERRORLEVEL% NEQ 0 GOTO fail
echo. >> %CHECKSUM_FILE%
"%WINDIR%\system32\certutil.exe" -hashfile %ZIP_FILE% MD5 >> %CHECKSUM_FILE%
IF %ERRORLEVEL% NEQ 0 GOTO fail
echo.

chcp 65001 >NUL
echo.
echo ✅ Finished writing the files .ZIP, .ESET_REPORT.txt, and .CHECKSUMS.txt. Thank you!
echo.
pause
exit /b 0



:fail
echo.
echo Sorry, the script has FAILED. Check the following:
echo (1) Report immediately if malware has been found!
echo (2) Make sure ESET Security is installed.
echo (3) Make sure 7-Zip (64-bit) is installed.
pause
exit /b 1