#Script que crea un usuario a partir del nombre y la contraseña en claro
param ($nombre, $password)

Write-Output "Valor de nombre: $nombre"
Write-Output "Valor de password: $password"



#Se crea la contraseña segura
$thepass=ConvertTo-SecureString $password -AsPlainText -Force 

#Se crea el usuario
New-ADUser -Name $nombre -SamAccountName $nombre -AccountPassword $thepass -Enabled 1

Write-Output "Se ha creado el usuario $nombre correctamente"