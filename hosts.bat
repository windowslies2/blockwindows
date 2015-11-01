@echo off
openfiles.exe 1>nul 2>&1
if not %errorlevel% equ 0 (
    Echo Requires Administrator Privileges! You are not administrator! Right Click file select run as admin
    pause
    EXIT 1
)
REM This blocks MS telemetry IP's from hosts file. Appends to current hosts file, only run once.
REM Windows 10 bypasses this, if running WIN10 add the entries in the file 'hosts' to your router or firewall blocklist.
REM Leave this batch file and the hosts file in the same folder. Right click and run this file as administrator.

if exist %~dp0\hosts (
	type %~dp0\hosts >> %windir%\system32\Drivers\etc\hosts
	echo Completed
) else (
	echo Could not find new hosts file. Is it in the same folder?
)
pause
