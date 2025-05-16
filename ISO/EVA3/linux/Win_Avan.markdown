_______
Regedit
=======
| Valor      | Tipo          | de datos Descripción                      |
| :--------- | :------------ | :---------------------------------------- |
| Cadena     | REG_SZ        | Cadena de texto Unicode de longitud fija. |
| Binario    | REG_BINARY    | Número de hasta 4 bytes de longitud.      |
| DWord      | REG_DWORD     | Número de hasta 8 bytes de longitud.      |
| QWord      | REG_QWORD     | Número de hasta 16 bytes de longitud.     |
| Múltiple   | REG_MULTI_SZ  | Múltiples datos separado por un caracter  |
| Expandible | REG_EXPAND_SZ | Datos de longitud variable.               |

+ EY_LOCAL_MACHINE(HKLM)
  + Contiene información sobre el sistema del equipo local, incluyendo datos del** hardware, software** y del sistema operativo tales como el tipo de bus, la memoria del sistema, los controladores de dispositivo y datos de control de inicio. Incluyendo dispositivos que puede que no estén conectados en este momento. 
  + set devmgr_show_nonpresent_devices=1 
  + start devmgmt.msc
+ EY_CLASSES_ROOT(HKCR)
  + Contiene **asociaciones de archivos**. También contiene la base de datos del registro OLE, el antiguo REG.DAT de Win 3.x
  + (HKLM\Software\Classes)
+ HKEY_CURRENT_USER(HKCU)
  + Contiene** el perfil del usuario que ha iniciado la sesión** actual de modo interactivo (no remoto) e incluye las variables de entorno, la configuración del escritorio, las conexiones de red, las impresoras y las preferencias para los programas. 
  + (HKU\SID del usuario actual)
+ HKEY_USERS(HKU)
  + Contiene una entrada para cada usuario que haya iniciado una sesión previamente en la computadora. Se incluye información que también aparece en **HKEY_CURRENT_USER.** Los usuarios con acceso remoto al servidor no tienen perfiles en esta clave del servidor. Sus perfiles se cargan en el Registro de sus propios equipos.
+ HKEY_CURRENT_CONFIG(HKCC) 
  + Contiene información para **la configuración de hardware del equipo local al iniciarse**. Esta información se usa para configurar opciones tales como los controladores de dispositivo y la resolución de pantalla que se va a utilizar. 
  + (HKLM\SYSTEM\CurrentControlSet\Hardware Profiles\Current.)
+ nombre de la clave raiz(Abreb)
  + Descripcion
  + (Enlace)
_________________
HKEY_CURRENT_USER
=================
| Subclave      | Descripción                                                                                |
| ------------- | ------------------------------------------------------------------------------------------ |
| AppEvents     | Asociaciones de Eventos/Sonidos                                                            |
| Console       | Ajustes en la consola de comandos (alto, ancho, colores)                                   |
| Control Panel | SalvaPantallas, escritorio, ajustes de teclado y ratón, accesibilidad y ajustes regionales |
| Environment   | Variables de entorno definidas específicamente para este usuario                           |
| Keyboard      | Layout Disposición del teclado                                                             |
| Network       | Mapeado de unidades de red y ajustes                                                       |
| Printers      | Impresoras conectadas                                                                      |
| Software      | Preferencias de software específicas de este usuario                                       |

__________________
HKEY_LOCAL_MACHINE
==================
| Subclave | Descripción                                                                          |
| -------- | ------------------------------------------------------------------------------------ |
| Hardware | Información sobre el hardware y los controladores de dispositivos.                   |
| SAM      | Información sobre las cuentas de usuario y grupos locales, contraseñas.              |
| Security | Información de seguridade                                                            |
| Software | Información del sistema que no es necesaria durante el arranque, aplicaciones.       |
| System   | Información necesaria para el arranque, que drivers cargar y que servicios arrancar. |

______________________________
Estructura Física del Registro
==============================
| Sección del Registro        | Ubicación                          | Archivo    |
| --------------------------- | ---------------------------------- | ---------- |
| HKEY_LOCAL_MACHINE\SAM      | %Windir%/System32/Config           | Sam        |
| HKEY_LOCAL_MACHINE\SECURITY | %Windir%/System32/Config           | Security   |
| HKEY_LOCAL_MACHINE\SOFTWARE | %Windir%/System32/Config           | Software   |
| HKEY_LOCAL_MACHINE\SYSTEM   | %Windir%/System32/Config           | System     |
| HKEY_USERS\.DEFAULT         | %Windir%/System32/Config           | Default    |
| HKEY_CURENT_USER            | %SystemDrive%:\Usuarios\%Username% | Ntuser.dat |
| HKEY_CURRENT_CONFIG         | Volatil                            |            |


___________
CMD command
===========
Si queremos cambiar el valor de las claves predeterminadas @=”Hola”  
Si queremos eliminar un valor “Límite días”=-  

+ **Regedit /s nombre_archivo.reg:** importa el archivo reg sin pedir confirmación.
+ **Regedit /e nombre_archivo.reg:** exporta la rama especificada en modo nativo; si no se especifica nada, se exporta toda la información del registro. Útil para hacer una copia de seguridad de todo el registro.
+ **Regedit /a nombre_archivo.reg**, exporta la rama especificada en formato regedit4 (utilizado por Win9x). 
+ **Reg export:** (idéntico al comando “regedit /e”) exporta la configuración del registro o de la ramas especificadas.
+ **Reg import:** Incorpora la información incluida en un fichero.reg al registro.
+ **Reg add:** agrega una clave específica al registro
+ **Reg delete:** borra una clave específica del registro
+ **Reg copy:** Copia todos las claves y valores de una rama a otra.
+ **Reg compare:** Compara las diferencias entre claves de distintas ramas o equipos
+ **Reg query :** consulta una clave específica del registro
   + **reg query clave /v variable** => devuelve el valor de esa variable 
   + **reg query hklm\Software\Mozilla\Mozilla /v  CurrentVersion** => Devuelve el valor de la variable CurrentVersion dentro de esa ruta
   + **reg query \\172.20.4.2\hklm\Software\Mozilla\Mozilla /v CurrentVersion** => Hace lo  mismo en ese equipo de red. Si tenemos  los permisos adecuados

```powershell
reg query [Abrev]\[enlace] /v [nombreVariable]  
reg add [Abrev]\[enlace] /v [nombreVariable] /t [tipoDato] /d [date]
```
____
Otro
====
Configuracion Servicio  
> HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run (TodoUsuario) 
> HKCU\Software\Microsoft\Windows\CurrentVersion\Run (MyUsuario)
> HKCU\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run (MyUsuario*)

### estructura de configuracion

| Nombre             | Tipo   | dato           |
| ------------------ | ------ | -------------- |
| [NombreDePrograma] | [Tipo] | [rutaAbsoluta] |