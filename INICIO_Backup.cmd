@ECHO OFF
TITLE Menu BACKUP Mensual de carpetas del servidor SRSHARES01
COLOR 0A


@ECHO ==========================================
@ECHO BACKUP Unidades de red
@ECHO (c) Previlabor 2017
@ECHO Author: Angel Pescador Portas
@ECHO email: apescador@previlabor.com
@ECHO email: tic@previlabor.com
@ECHO scripts name: INICIO_Backup.cmd
@ECHO Location: C:\scripts\BackupCarpetasMENSUAL
@ECHO Version 4.1
@ECHO Date: 25/10/2017
@ECHO ==========================================
@ECHO.



:inicio

TITLE Menu BACKUP Mensual de carpetas del servidor SRSHARES01
COLOR 0A
CD C:\scripts\BackupCarpetasMENSUAL
PING 127.0.0.1 >NULL



CLS

@ECHO Menu BACKUP Mensual de carpetas servidor del SRSHARES01
@ECHO =======================================================
@ECHO Origen: \\192.168.110.68\ (Unidades E$ F$ G$)
@ECHO Destino \\192.168.110.55\backup\SRSHARES01
@ECHO =======================================================
@ECHO.

@ECHO.
@ECHO [1]  Enero
@ECHO [2]  Febrero
@ECHO [3]  Marzo
@ECHO [4]  Abril
@ECHO [5]  Mayo
@ECHO [6]  Junio
@ECHO [7]  Julio
@ECHO [8]  Agosto
@ECHO [9]  Septiembre
@ECHO [10] Octubre
@ECHO [11] Noviembre
@ECHO [12] Diciembre
@ECHO.
@ECHO [13] Salir al DOS
@ECHO [14] Apagar este servidor de BACKUP
@ECHO.
set /p answer=Elige el Backup a ejecutar: 




if "%answer%"=="1" goto op1
if "%answer%"=="2" goto op2
if "%answer%"=="3" goto op3
if "%answer%"=="4" goto op4
if "%answer%"=="5" goto op5
if "%answer%"=="6" goto op6
if "%answer%"=="7" goto op7
if "%answer%"=="8" goto op8
if "%answer%"=="9" goto op9
if "%answer%"=="10" goto op10
if "%answer%"=="11" goto op11
if "%answer%"=="12" goto op12
if "%answer%"=="13" goto op13
if "%answer%"=="14" goto op14
if "%answer%"=="0" goto op0


CLS
@ECHO.
::Mensaje de error, validación cuando se selecciona una opción fuera de rango
@ECHO ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR
@ECHO.
@ECHO ========================================================================
@ECHO La opcion "%answer%" no es una opcion valida, por favor intente de nuevo.
@ECHO ========================================================================
@ECHO.
@ECHO ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR
@ECHO.
PING 127.0.0.1 >NULL
@ECHO.
goto:inicio




:op1
SET MES=ENERO
goto:backup

:op2
SET MES=FEBRERO
goto:backup

:op3
SET MES=MARZO
goto:backup

:op4
SET MES=ABRIL
goto:backup

:op5
SET MES=MAYO
goto:backup

:op6
SET MES=JUNIO
goto:backup

:op7
SET MES=JULIO
goto:backup

:op8
SET MES=AGOSTO
goto:backup

:op9
SET MES=SEPTIEMBRE
goto:backup

:op10
SET MES=OCTUBRE
goto:backup

:op11
SET MES=NOVIEMBRE
goto:backup

:op12
SET MES=DICIEMBRE
goto:backup




:backup

CLS
@ECHO Backup servidor SRSHARES01
@ECHO ======================================================
@ECHO %MES% %MES% %MES% %MES% %MES% %MES% %MES% %MES%
@ECHO ======================================================
@ECHO Origen: \\192.168.110.68\ (Unidades E$ F$ G$)
@ECHO Destino \\192.168.110.55\backup\SRSHARES01\%MES%
@ECHO ======================================================
@ECHO.
SET INICIO= %date%-%time%

PROMPT $G
TITLE -=BACKUP %MES% =-
COLOR 0A
SET COPYCMD=Y

SET _my_datetime=%date%_%time%
SET _my_datetime=%_my_datetime: =_%
SET _my_datetime=%_my_datetime::=%
SET _my_datetime=%_my_datetime:/=_%
SET _my_datetime=%_my_datetime:.=_%

@ECHO.
PING 127.0.0.1 >NULL

@ECHO.
@ECHO UNIDADES PERSONALES (U) 
@ECHO =======================
@ECHO.

@ECHO S|NET USE Y: /DELETE /Y >NULL
NET USE Y: \\192.168.110.68\E$\UnidadesU >NULL
PING 127.0.0.1 >NULL

@ECHO S|NET USE Z: /DELETE /Y >NULL
NET USE Z: \\192.168.110.55\backup\SRSHARES01\%MES%\UnidadesU >NULL
PING 127.0.0.1 >NULL


Y:
for /d %%X in (*) do (
 	MKDIR Z:\%%X
 	ECHO S|DEL Z:\%%X\*.* /Q /S
	TITLE -=HACIENDO BACKUP UNIDADES PERSONALES %%X MES %MES%=-
	C:\scripts\BackupCarpetasMENSUAL\7za.exe a Z:\%%X\%%X.7z Y:\%%X\*.* -r -V1G -bt -y -mx=9 -ms=on -t7z -xr@C:\scripts\BackupCarpetasMENSUAL\exclude.txt -pTxindoki1346 -mhe
)

C:
CD C:\scripts\BackupCarpetasMENSUAL

@ECHO.
@ECHO UNIDADES COMUNES DISCO F
@ECHO ========================
@ECHO.

ECHO S|NET USE Y: /DELETE /Y >NULL
NET USE Y: \\192.168.110.68\F$\UnidadesComunes >NULL
PING 127.0.0.1 >NULL

ECHO S|NET USE Z: /DELETE /Y >NULL
NET USE Z: \\192.168.110.55\BACKUP\SRSHARES01\%MES%\UnidadesComunes >NULL
PING 127.0.0.1 >NULL

Y:
for /d %%X in (*) do ( 
	MKDIR Z:\%%X
	ECHO S|DEL Z:\%%X\*.*
	TITLE -=HACIENDO BACKUP UNIDAD COMUN %%X MES %MES%=-
	C:\scripts\BackupCarpetasMENSUAL\7za.exe a Z:\%%X\%%X.7z Y:\%%X\*.* -r -V1G -bt -y -mx=9 -ms=on -t7z -xr@C:\scripts\BackupCarpetasMENSUAL\exclude.txt -pTxindoki1346 -mhe
)

C:
CD C:\scripts\BackupCarpetasMENSUAL

@ECHO.
@ECHO UNIDADES COMUNES DISCO G
@ECHO ========================
@ECHO.

ECHO S|NET USE Y: /DELETE /Y >NULL
NET USE Y: \\192.168.110.68\G$\UnidadesComunes >NULL
PING 127.0.0.1 >NULL

Y:
for /d %%X in (*) do ( 
	MKDIR Z:\%%X
	ECHO S|DEL Z:\%%X\*.*
	TITLE -=HACIENDO BACKUP UNIDAD COMUN %%X MES %MES%=-
	C:\scripts\BackupCarpetasMENSUAL\7za.exe a Z:\%%X\%%X.7z Y:\%%X\*.* -r -V1G -bt -y -mx=9 -ms=on -t7z -xr@C:\scripts\BackupCarpetasMENSUAL\exclude.txt -pTxindoki1346 -mhe
)

C:
CD C:\scripts\BackupCarpetasMENSUAL

SET FIN= %date%-%time%
TITLE fin del BACKUP Mensual
@ECHO.
@ECHO ===============================
@ECHO FIN DEL SCRIPT
@ECHO ===============================
@ECHO INICIO: %INICIO%
@ECHO FIN:    %FIN%
@ECHO ===============================
@ECHO.

DEL bodymail.txt
@ECHO Realizado el Backup completo de %MES% del servidor SRSHARES01 >>bodymail.txt
@ECHO en la ruta \\192.168.110.55\BACKUP\SRSHARES01\%MES%\ >>bodymail.txt
@ECHO. >>bodymail.txt
@ECHO Para recuperar, usar 7za >>bodymail.txt
@ECHO. >>bodymail.txt
@ECHO Este correo esta automatizado, no responda a la direccion de origen. >>bodymail.txt
@ECHO. >>bodymail.txt
@ECHO. >>bodymail.txt
@ECHO. >>bodymail.txt
@ECHO. >>bodymail.txt
@ECHO IT Team >>bodymail.txt
@ECHO. >>bodymail.txt

BLAT -INSTALL previlabor-com.mail.protection.outlook.com Backup_%MES%_SRSHARES01@previlabor.com 10
BLAT bodymail.txt -subject "Fin del Backup de las unidades compartidas del servidor SRSHARES01 - %MES%" -tf EmailsAddress.txt


PING 127.0.0.1 >NULL
PING 127.0.0.1 >NULL
SHUTDOWN /s /t 30




goto:inicio




:op13
CLS

@ECHO [13] Saliendo al DOS, para volver a ir al menu, ejecuta EXIT
@ECHO ============================================================
TITLE Saliendo al DOS
PING 127.0.0.1 >NULL
CMD
goto:inicio






:op14
CLS

TITLE Apagando el servidor de BACKUP
@ECHO [14] Apagando este servidor de BACKUP
SHUTDOWN /s /t 30
PING 127.0.0.1 >NULL
PING 127.0.0.1 >NULL







EXIT
EXIT