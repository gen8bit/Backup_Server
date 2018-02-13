CLS
@ECHO OFF
TITLE Menu BACKUP Mensual de carpetas del servidor SRSHARES01
COLOR 0A



@ECHO ===========================================
@ECHO BACKUP Unidades de red
@ECHO (c) Previlabor 2017
@ECHO Author: Angel Pescador Portas
@ECHO email: apescador@previlabor.com
@ECHO email: tic@previlabor.com
@ECHO scripts name: %~nx0%
@ECHO Location: %~d0%~p0
@ECHO Version 4.4
@ECHO Date:   08/09/2017
@ECHO Update: 09/02/2018
@ECHO ===========================================
@ECHO.
PING 127.0.0.1 >NUL


SET WorkDIR=%~d0%~p0



:inicio



TITLE Menu BACKUP Mensual de carpetas del servidor SRSHARES01
COLOR 0A


CD %WorkDIR%

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
@ECHO ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR
@ECHO.
@ECHO ========================================================================
@ECHO La opcion "%answer%" no es una opcion valida, por favor intente de nuevo.
@ECHO ========================================================================
@ECHO.
@ECHO ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR
@ECHO.
PING 127.0.0.1 >NUL




@ECHO.
goto:inicio



:op0
CLS
@ECHO.
@ECHO.
@ECHO -=-=-=-=-=-=-=-=-=  \ll/  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
@ECHO  ,     * `       '  l  @___oo  +   .
@ECHO     *     /\  /\   / (__,,,,l    ,    No, 0 no es ninguna opcion valida!
@ECHO  + .  *  ) /^\) ^\/ _)    .
@ECHO          )   /^\/   _)        *   `    Eligue otra opcion
@ECHO  ,  `    )   _ /  / _)   *      .      o el dragon volvera!
@ECHO      /\  )/\/ ll  l )_)     +  ,        
@ECHO  *   /\       l(,,) )__)  `      *
@ECHO ,    ll   *  /    \)___)\     *   +    
@ECHO      l \____(      )___) )___   '
@ECHO -=-  \______(_______;;; __;;;  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
PING 127.0.0.1 -n 5 >NUL


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
TITLE -=BACKUP %MES%=-



COLOR 0A
SET COPYCMD=Y
SET _my_datetime=%date%_%time%
SET _my_datetime=%_my_datetime: =_%
SET _my_datetime=%_my_datetime::=%
SET _my_datetime=%_my_datetime:/=_%
SET _my_datetime=%_my_datetime:.=_%
@ECHO.
PING 127.0.0.1 >NUL



@ECHO.
@ECHO UNIDADES PERSONALES (U)
@ECHO =======================
@ECHO.
@ECHO S|NET USE Y: /DELETE /Y >NUL
NET USE Y: \\192.168.110.68\E$\UnidadesU >NUL
PING 127.0.0.1 >NUL



@ECHO S|NET USE Z: /DELETE /Y >NUL
NET USE Z: \\192.168.110.55\backup\SRSHARES01\%MES%\UnidadesU >NUL
PING 127.0.0.1 >NUL



Y:
for /d %%X in (*) do (
 	MKDIR Z:\%%X
 	ECHO S|DEL Z:\%%X\*.* /Q /S
	TITLE -=HACIENDO BACKUP UNIDADES PERSONALES %%X MES %MES%=-
	START /B /LOW /WAIT %WorkDIR%7za.exe a Z:\%%X\%%X.7z Y:\%%X\*.* -r -V1G -bt -y -mx=9 -ms=on -t7z -xr@%WorkDIR%exclude.txt -pTxindoki1346 -mhe
)



C:
CD %WorkDIR%



@ECHO.
@ECHO UNIDADES COMUNES DISCO F
@ECHO ========================
@ECHO.



ECHO S|NET USE Y: /DELETE /Y >NUL
NET USE Y: \\192.168.110.68\F$\UnidadesComunes >NUL
PING 127.0.0.1 >NUL



ECHO S|NET USE Z: /DELETE /Y >NUL
NET USE Z: \\192.168.110.55\BACKUP\SRSHARES01\%MES%\UnidadesComunes >NUL
PING 127.0.0.1 >NUL



Y:
for /d %%X in (*) do ( 
	MKDIR Z:\%%X
	ECHO S|DEL Z:\%%X\*.*
	TITLE -=HACIENDO BACKUP UNIDAD COMUN %%X MES %MES%=-
	START /B /LOW /WAIT %WorkDIR%7za.exe a Z:\%%X\%%X.7z Y:\%%X\*.* -r -V1G -bt -y -mx=9 -ms=on -t7z -xr@%WorkDIR%exclude.txt -pTxindoki1346 -mhe
)



C:
CD %WorkDIR%
@ECHO.
@ECHO UNIDADES COMUNES DISCO G
@ECHO ========================
@ECHO.



ECHO S|NET USE Y: /DELETE /Y >NUL
NET USE Y: \\192.168.110.68\G$\UnidadesComunes >NUL
PING 127.0.0.1 >NUL



Y:
for /d %%X in (*) do ( 
	MKDIR Z:\%%X
	ECHO S|DEL Z:\%%X\*.*
	TITLE -=HACIENDO BACKUP UNIDAD COMUN %%X MES %MES%=-
	START /B /LOW /WAIT %WorkDIR%7za.exe a Z:\%%X\%%X.7z Y:\%%X\*.* -r -V1G -bt -y -mx=9 -ms=on -t7z -xr@%WorkDIR%exclude.txt -pTxindoki1346 -mhe
)



C:
CD %WorkDIR%
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



DEL %WorkDIR%bodymail.txt
@ECHO Realizado el Backup completo de %MES% del servidor SRSHARES01 >>%WorkDIR%bodymail.txt
@ECHO en la ruta \\192.168.110.55\BACKUP\SRSHARES01\%MES%\ >>%WorkDIR%bodymail.txt
@ECHO. >>%WorkDIR%bodymail.txt
@ECHO Para recuperar, usar 7za >>%WorkDIR%bodymail.txt
@ECHO. >>%WorkDIR%bodymail.txt
@ECHO Este correo esta automatizado, no responda a la direccion de origen. >>%WorkDIR%bodymail.txt
@ECHO. >>%WorkDIR%bodymail.txt
@ECHO. >>%WorkDIR%bodymail.txt
@ECHO. >>%WorkDIR%bodymail.txt
@ECHO. >>%WorkDIR%bodymail.txt
@ECHO IT Team >>%WorkDIR%bodymail.txt
@ECHO. >>%WorkDIR%bodymail.txt



%WorkDIR%BLAT -INSTALL previlabor-com.mail.protection.outlook.com Backup_%MES%_SRSHARES01@previlabor.com 10
%WorkDIR%BLAT bodymail.txt -subject "Fin del Backup de las unidades compartidas del servidor SRSHARES01 - %MES%" -tf %WorkDIR%EmailsAddress.txt



PING 127.0.0.1 >NUL
PING 127.0.0.1 >NUL



SHUTDOWN /s /t 30
@ECHO "¡Adios!"
goto:inicio



:op13
CLS

@ECHO [13] Saliendo al DOS, para volver a ir al menu, ejecuta EXIT
@ECHO ============================================================
TITLE Saliendo al DOS
CMD
goto:inicio



:op14
CLS

TITLE Apagando el servidor de BACKUP
@ECHO [14] Apagando este servidor de BACKUP
SHUTDOWN /s /t 30

PING 127.0.0.1 >NUL
PING 127.0.0.1 >NUL



EXIT
EXIT
