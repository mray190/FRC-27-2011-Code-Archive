@echo off
echo Choose:
echo [A] Set 10.0.27.6 as IP
echo [B] Set IP Automatically
echo.
:choice
SET /P C=[A,B]?
for %%? in (A) do if /I "%C%"=="%%?" goto A
for %%? in (B) do if /I "%C%"=="%%?" goto B
goto choice
:A
@echo off
echo Setting IP to 10.0.27.6 and Subnet Mask to 255.0.0.0
netsh interface ip set address "Wireless Network Connection" static 10.0.27.6 255.0.0.0
netsh int ip show config
pause
goto end

:B
@ECHO OFF
ECHO Resetting IP Address and Subnet Mask For DHCP
netsh int ip set address name = "Wireless Network Connection" source = dhcp
ipconfig /renew
ECHO Here are the new settings for %computername%:
netsh int ip show config

pause
goto end
:end