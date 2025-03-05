@echo off
chcp 65001 >nul
:input
cls
curl -s https://pastebin.com/raw/Q9EwedUq -o banner.json && type banner.json && del banner.json
title PKitty Port Scanner - By elk.
set /p ip="[90mEnter the IP Address to scan -->[0m "
if "%ip%"=="" (echo [31mEnter a valid IP[0m & timeout 1 /nobreak >nul & goto input)
echo [90mChecking if IP Is online:[0m
PING -n 1 %ip% | FIND "TTL=" >nul
IF ERRORLEVEL 1 (echo [1;31mIP Offline, Choose a different IP to scan.[0m & timeout 1 /nobreak >nul & goto input)
echo [90mLoading common ports...
PortCheck %ip% 20,21,22,23,25,53,67,69,80,110,143,161,162,443,3389,3306,5432,587,465,995,139,873,1723,1194,8080,8443,8444,8445,8446,8447,8448,8449,8450,137,138,500,10000,5900,2200,6000,33060,54320,27017,9042
echo.
IF %ERRORLEVEL%==1 echo - Ports open!
echo Port Scan Complete!
echo.
pause
goto input
