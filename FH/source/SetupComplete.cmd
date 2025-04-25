@echo off
REM – Location:  C:\Windows\Setup\Scripts\SetupComplete.cmd
REM – Runs as the system user account
REM – Runs after setup completes but before any synchronous or asynchronous commands are executed in the unattend.xml file
REM – Requires use of a full path for the location to .exe or .msi files 

REM Habilito Usuario Administrador
net user administrador /active:yes
net user administrador abc123.

REM Cambiamos o grupo de Usuario
net localgroup Usuarios usuario /add
net localgroup Administradores usuario /del

REM Deshabilitamos o Servicio Telemetría y experiencias del usuario conectado
sc config "DiagTrack" start= disabled
sc stop "DiagTrack"

REM Eliminamos animación do primeiro inicio
cmd /c reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableFirstLogonAnimation /d 0 /t REG_DWORD /f

