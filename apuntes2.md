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

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
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


172.16.100.250

10.0.2.2

Para poder acceder a la configuración de red de VB es en los 3 cuadrados que aparece en herramientas.

Tenemos que ponerle un alias al equipo, el nombre no se puede cambiar (o no se recomienda) porque el nombre en los archivos no cambian. cname

## Instalación Desatendida

A partir de win10, solo tenemos que añadirle un xml con las respuestas a las preguntas de configuración.
En el apartado final hay un script, donde podemos decirle lo que queremos que ejecute nada más termine la instalación, esto pueden ser comandos de powershell. Ejemplo: instalamos/actualizamos winget y ponemos en el script los comandos para que instale lo que ya nos interesa que se instale al terminar la configuración y ya tendremos la máquina 100% preparada.

Para poder realizar la instalación desatendida, necesitamos un programa que nos ayuda, en este caso será: NLite

Probar la ISO creada.

ipconfig /flushdns