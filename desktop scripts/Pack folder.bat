@echo off
chcp 65001 >NUL
title PACK FOLDER 1.3

set "FOLDER=%1"
set "ZIP_FILE=%1.ZIP"
set "ESET_FILE=%1.ESET_REPORT.txt"
set "CHECKSUM_FILE=%1.CHECKSUMS.txt"

IF "%FOLDER%"=="" GOTO fail

echo.
echo *** FOLDER GIVEN: %FOLDER% ***
echo.
echo.
echo.
echo.
echo ⏳ STEP 1: Checking folder for malware... (please wait)
echo --------------------------------------------------------
echo (using ESET Security, takes ~60s per GB, ignore the warning below)
"C:\Program Files\ESET\ESET Security\ecls.exe" %FOLDER% > %ESET_FILE%
IF %ERRORLEVEL% NEQ 0 GOTO fail
echo OK, no malware found and ESET report has been written.
echo.
echo.
echo ⏳ STEP 2: Writing the .ZIP file... (please wait)
echo --------------------------------------------------
DEL /f %ZIP_FILE% >NUL 2>&1
"C:\Program Files\7-Zip\7z.exe" a -y -tzip %ZIP_FILE% %FOLDER%
IF %ERRORLEVEL% NEQ 0 GOTO fail
echo.
echo.
echo ⏳ STEP 3: Writing the .CHECKSUMS.txt file... (please wait)
echo ------------------------------------------------------------
"%WINDIR%\system32\certutil.exe" -hashfile %ZIP_FILE% SHA256 > %CHECKSUM_FILE%
IF %ERRORLEVEL% NEQ 0 GOTO fail
echo. >> %CHECKSUM_FILE%
"%WINDIR%\system32\certutil.exe" -hashfile %ZIP_FILE% MD5 >> %CHECKSUM_FILE%
IF %ERRORLEVEL% NEQ 0 GOTO fail
echo.

echo.
echo ✅ Finished writing the files .ZIP, .ESET_REPORT.txt, and .CHECKSUMS.txt. Thank you!
echo.
pause
exit /b 0



:fail
echo.
echo.
echo ⚠️ ERROR: The script execution has FAILED. 
echo.
echo.
echo Please check the following:
echo (1) Drag and drop a folder onto this batch script (the folder gets checked, zipped, and checksummed).
echo (2) Make sure ESET Endpoint Antivirus is installed.
echo (3) Make sure 7-Zip (64-bit) is installed.
echo.
echo.
echo.
echo.
echo.
echo.
echo Version:   PACK FOLDER 1.3
echo Author:    Markus Fleschutz
echo Copyright: 2026 ATCSim GmbH. All rights reserved.
echo NOTE:      Report immediately to the IT team if malware has been found!
echo.
pause
exit /b 1