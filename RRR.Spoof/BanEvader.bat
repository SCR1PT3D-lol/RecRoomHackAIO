@echo off

NET SESSION >NUL 2>NUL
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -command "Start-Process -Verb RunAs -FilePath '%%0' -ArgumentList '%%*'"
    Cls 
    echo Run this script as admin for it to work Made by Pokem0nchanter
    timeout /nobreak /t 10
    exit /b 1
)

setlocal EnableDelayedExpansion

rmdir /s /q "C:\Users\%USERNAME%\AppData\LocalLow\Against Gravity"
rmdir /s /q "C:\Users\%USERNAME%\AppData\Local\Temp\RecRoom"
rmdir /s /q "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent\RecRoom.lnk"
rmdir /s /q "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Steam\Rec Room.url"
rmdir /s /q "C:\Windows\Prefetch\RECROOM.EXE-BEC42EED.pf"
rmdir /s /q "C:\Windows\Prefetch\RECROOM_RELEASE.EXE-35556F3D.pf"
rmdir /s /q "C:\Users\%USERNAME%\AppData\LocalLow\Against Gravity"
rmdir /s /q "C:\Users\%USERNAME%\AppData\Local\Temp\RecRoom"
rmdir /s /q "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent\RecRoom.lnk"
rmdir /s /q "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Steam\Rec Room.url"
rmdir /s /q "C:\Windows\Prefetch\RECROOM.EXE-BEC42EED.pf"
rmdir /s /q "C:\Windows\Prefetch\RECROOM_RELEASE.EXE-35556F3D.pf"
rmdir /s /q "%USERNAME%\AppData\Local\Temp\Against Gravity"
rmdir /s /q "%USERNAME%\AppData\LocalLow\Against Gravity"
rmdir /s /q "%USERNAME%\AppData\Roaming\recroom-launcher"
rmdir /s /q "%USERNAME%\AppData\Local\Temp\RecRoom"

reg delete "HKEY_CURRENT_USER\SOFTWARE\Against Gravity" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\recroom" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\Apps\471710" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 471710" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\Apps\471710" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f

for /f %%a in ('powershell -command "[guid]::NewGuid().ToString()"') do set "newGuid=%%a"
>RandomGUIDUpdate.reg echo Windows Registry Editor Version 5.00
>>RandomGUIDUpdate.reg echo.
>>RandomGUIDUpdate.reg echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography]
>>RandomGUIDUpdate.reg echo "MachineGuid"="%newGuid%"
regedit /s RandomGUIDUpdate.reg
del RandomGUIDUpdate.reg

for /f %%a in ('powershell -command "[guid]::NewGuid().ToString()"') do set "newUUID=%%a"
>RandomGUIDUpdate.reg echo Windows Registry Editor Version 5.00
>>RandomGUIDUpdate.reg echo.
>>RandomGUIDUpdate.reg echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\IDConfigDB\Hardware Profiles\0001]
>>RandomGUIDUpdate.reg echo "HwProfileGuid"="%newUUID%"
regedit /s RandomGUIDUpdate.reg
del RandomGUIDUpdate.reg

cd /d "%~dp0\Things"
start /B "" mapper.exe EAC.sys

cd /d "%~dp0\Things"
start EACSpoof.exe

cd /d "%~dp0\Things"
start DMIEDIT.EXE

goto :eof