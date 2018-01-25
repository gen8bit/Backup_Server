# Backup_Server
language: DOS Script
Date: 25 January 2018

Script que permite seleccionar que backup full quieres hacer (por mes) de un servidor de ficheros y comprimirlo con 7za en una unidad remota.

Esta primera versión esta personalizada y sin rutas por variables, en proximas versiones lo modificare para que sea más flexible.
Este script se ejecuta en un pequeño PC/Servidor Windows 7, con minimo 6GB de RAM y al que hemos sustituido el shell por este script para que autoarranque automaticamente y espere ordenes.
El proceso para sustituir el Shell de Windows por nuestro script es el siguiente:

Ejecuta REGEDIT.EXE

Buscar la Key: 
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
Name: Shell
Type: REG_SZ
Value: Explorer.exe

Cambiar 'Value: Explorer.exe' por nuestro script, por ejemplo: 'Value: c:\scripts\BackupCarpetasMENSUAL\INICIO_Backup.cmd'

Al arrancar el servidor, solo veremos el script preguntando que versión de backuup queremos realizar:

[1]  Enero
[2]  Febrero
[3]  Marzo
[4]  Abril
[5]  Mayo
[6]  Junio
[7]  Julio
[8]  Agosto
[9]  Septiembre
[10] Octubre
[11] Noviembre
[12] Diciembre

[13] Salir al DOS
[14] Apagar este servidor de BACKUP


