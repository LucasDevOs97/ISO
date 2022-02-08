# Scripts con variables:
   
Antes del nombre de la variable tiene que ir el símbolo $ para que powershell sepa que es una variable. Ejemplo:

$thepass=ConvertTo-SecureString abc1234. -AsPlainText -Force

Creando un usuario pasando variables:

PS C:\> $thepass=ConvertTo-SecureString abc1234. -AsPlainText -Force
PS C:\> $thepass
System.Security.SecureString
PS C:\> $theuser="user01"
PS C:\> $theuser
user01
PS C:\> $theuser02="user04"
PS C:\> New-ADUser -SamAccountName $theuser02 -AccountPassword $thepass -Enabled $true -Name $theuser02

---------------------------------

Pasarle valor al script de una variable:

miscript.ps1 -username groucho -password abcd1234.

El nombre del parámetro que pasamos por la consola tiene que ser el mismoq ue tenemos en el script. Si están en el mismo orden que en la definición de las variables en el script no haría falta.