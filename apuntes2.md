# SEGUNDA EVALUACIÓN

Objetivos: 
- Windows Server: Active Directory para crear un dominio. Los servidores están en la cúspide de la pirámide. Después van los terminales de los usuarios. Controlaores de dominio (Domain Controllers).
- Domain Controllers > Otros servicores (DHCP, DNS, FTP, HTTP) > 
- Es obligatorio que haya un servidor DNS, si no existe el DC asume el rol.
- Resgistro tipo A -> Host.
- Registros CNAME -> Alias.
- Existen las características y los roles:
    - Caracaterísticas: 
    - Roles: Incluyen las características.
    - Una vez establecidos los roles y las características instaladas se promociona para que pueda actuar como DC
    
- PuTTY
- Nos podemos conectar remotamente por PowerShell
- Si el Liceo tuviera un dominio y nos separaran por ramas de estudios sería: liceolapaz.local > ciclos.liceolapaz.local , eso.licoelapaz.local [...] Sería una infraestructura de árbol y los Bosques son conjuntos (réplicas) de árboles
- El primer dominio que se crea ya es un Bosque por sí solo.
- SYSPREP
- Cuando tenemos una interfaz NAT, VB crea como un router que lo conecta con la máquina real y le pone: 10.0.2.15
- Con Host-Only le asigna una dirección a la interfaz, crea una especie de switch y los equipos se pueden ver, tiene que estar en la misma dirección que la del anfitrión.

> Cuando trabajamos con el Core, el que no tiene parte gráfica, y ejecutamos un comando que nos abrirá una ventana de entorno gráfico, no lo veremos.

## Imstalar SSH por comandos

Add-WindowsCapability -Online -Name OpenSSH.Server
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

Si el puerto no está abierto:
New-NetFirewallRule -DisplayName "SSH ALLOW TCP PORT 22" -Direction inbound -Profile Any -Action Allow -LocalPort 22 -Protocol TCP

Promocionar un servidor a DC:

> Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
  
IncludeManagementTools es por si hace falta alguna herramient adicional.
  
> Test-ADDSForestInstallation   

> Install-ADDSForest 

         


Manage > Add Roles And Features > Role-Based or feature-based installation

Root Domain name: asir20.local

Contraseña restauración: la de administrador

#
# Windows PowerShell script for AD DS Deployment
#

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "asir20.local" `
-DomainNetbiosName "ASIR20" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

---------------------------------------------------------------------------------------------------------------

Comandos:    
   
> Get-ADForest       
> Get-ADDomain   
> Get-ADComputer -Filter *     
> Get-ADUser -Filter *   

- CN: Canonical Name -> Se utiliza para grupos de equipos
- DC: Domain Controller -> ComputersContainer: CN=Computers,DC=asir20,DC=local
- OU: Organizational Unity -> DomainControllersContainer: OU=Domain Controllers,DC=asir20,DC=local


Primary Domain Controller Emulator: PDCEmulator -> PDCEmulator: WIN-Q8MOC76L76P.asir20.local


- Servidor: windows server 2022
- Cliente: windows 10

Redactar problemas cuando tenemos dos tarjetas de red.

Solución: modificar manualmente y eliminar las ip 10.0....

- APIPA (Automatic Private IP Addressing): direccion que se autoadjudica windows cuando no le pasamos una configuración 


172.16.100.71

255.255.0.0



10.0.2.15

255.255.0.0

1.1.1.1
1.1.1.2

Para poder acceder a la configuración de red de VB es en los 3 cuadrados que aparece en herramientas.

Tenemos que ponerle un alias al equipo, el nombre no se puede cambiar (o no se recomienda) porque el nombre en los archivos no cambian. cname

## Instalación Desatendida

A partir de win10, solo tenemos que añadirle un xml con las respuestas a las preguntas de configuración.
En el apartado final hay un script, donde podemos decirle lo que queremos que ejecute nada más termine la instalación, esto pueden ser comandos de powershell. Ejemplo: instalamos/actualizamos winget y ponemos en el script los comandos para que instale lo que ya nos interesa que se instale al terminar la configuración y ya tendremos la máquina 100% preparada.

Para poder realizar la instalación desatendida, necesitamos un programa que nos ayuda, en este caso será: NLite

Probar la ISO creada.

ipconfig /flushdns

En domain controller solo habrá controladores de cominio
En computers estarán todos los equipos que no sean DC

Security group: sirven para establecer permisos, reglas, etc. Estos pueden ser Local, Global y Universal.
Distribution group: solo sirven para mandar ocrreos

# Administración y creación de Usuarios y Grupos por powershell

> New-ADUser [-Name] <string> [-ChangePasswordAtLogon <bool>] [-Enabled <bool>] [-ProfilePath <string>] [-PasswordNeverExpires <bool>]  

> New-ADGroup   

> add-ADGroupMember     

- Haremos 3 grupos (grupo01, grupo02, grupo03) y 3 usuarios (user01 (g01), user02 (g01, g02), user03 (g01, g02, g03)).
Nos piden: fichero para crear, fichero para eliminar. crear.ps1, eliminar.ps1

Ejemplo creación usuario:   
    
New-ADUser -Name usuario -Surname testuser -SamAccountName testuser -AccountPassword (ConvertTo-SecureString 1234.Abcd -AsPlainText -Force) -Enabled 1

El script de crear los usuarios y los grupos y añadir dichos usuarios a dichos grupos está en la máquina virtual, Administrator\Documents\scripts


New-ADUser -Name user01 -SamAccountName u01 -AccountPassword (ConvertTo-SecureString abc1234. -AsPlainText -Force) -Enabled 1

(Obtener información del equipo: Get-ComputerInfo)

## Perfiles

- Perfil por defecto (Locales): La primera vez que inician sesión el DC le organiza las carpetas en la máquina. Todo queda en local.

- Perfil móvil: Al cerrar sesión, el perfil vuelve al DC y le vuelve a cargar todo al volver a iniciar sesión. Mucho tráfico en picos.  

- Perfil + redirección de carpetas: Crearíamos en el servidor una carpeta, por ejemplo datos, y se crearán entradas para los usuarios. Ej: C:\datos\user01\Documents ... C:\datos\user01\Images. Cuando acceda a esas carpetas estará accediendo en el servidor, no en su máquina. Los picos serán mucho menores que en los del perfil móvil. 
  

Indicamos el perfil en la ventana: Properties > Profile      
Creamos una carpeta en C en el servidor llamada pmoviles    
Problemas: 
- Permisos y seguridad: error -> la carpeta está creada en el servidor, tendremos que compartir la carpeta
- Después de compartir creamos un grupo para los perfiles móviles y les damos permisos.

Cuando entramos al perfil una vez la carpeta ya está compartida, no cargará todo lo del perfil hasta que se cierre la sesión porque es un perfil móvil

Para el perfil + redireccionamiento de carpetas lo haremos desde Management > Group Policy Management, a través de las directivas.

## GPO

- Unidades Organizativas (OU): conjunto de elementos del dominio que se utiliza a nivel organizativo.
- Un usuario puede pertenecer a varios grupos pero solo a UNA unidad organizativa.
- Los grupos no son jerárquicos, las unidades organizativas si.

> Get-ADOrganizationalUnit 

- Primero creamos una unidad organizativa y metemos a los usuarios.




- Comando actualización de Directivas: gpupdate /force

- Redirigir carpetas: gpos

    - Si no lo hacemos por unuidades organizativas, tenemos que modificar el filtro de seguridad

- Perfiles móviles: en el perfil


### Práctica usuarios con perfil móvil y carpetas redirigidas

- Primera Forma:
    - Crear grupo, crear usuario, crear gpo filtrando usuarios y grupos 
- Segunda forma:
    - Crear OU, crear grupo, crear usuarios, crear gpo enlazada/asociada a la OU
    - Configuración de las carpetas redirigidas: básica; crear una para cada perfil dentro de la raiz.


## Windows Server Core

Una vez configurada la red del Core y que al hacer ping al server con entorno gráfico da respuesta, al hacerlo de la de entorno gráfico al Core no deja. Para que nos deje tenemos que crear una nueva regla de Firewall:

> New-NteFirewallRule -DisplayName "ping" -Direction Inbound -Action Allow -Protocol ICMPv4 -Enabled True

> Install-WindowsFeature AS_DomainServices -IncludeManagementTools -Verbose (instalación de caracteríticas)

> Install-ADDSDomainController

Como va a ser un respaldo del otro servidor, también necesitaremos configurar el DNS.
Este DNS se lo tendremos que poner como segunda opción a la máquina cliente.
