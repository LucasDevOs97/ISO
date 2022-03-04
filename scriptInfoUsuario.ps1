<#$nombre = Read-Host "¿Como te llamas?"

Write-Host $nombre.GetType().Name#>

<#
Get-ADUser -Filter * | Ft SamAccountName, SID, Enabled  Ft -> Format-Table

Información sobre el grupo: (GET-ADUSER –Identity pmovil02 –Properties MemberOf | Select-Object MemberOf).MemberOf

Get-ADGroup -Identity $nombre | Ft 

Get-ADUser -Filter {mail -eq $correo}

#>

Param (
    [Parameter (Mandatory=$true)]
    [string] [alias("user", "u")] $nombre
)

$userexists = Get-ADUser -Filter {SamAccountName -eq $nombre}

$grupo = Get-ADPrincipalGroupMembership $nombre

if ($userexists) {
    
    Write-Output "--- INFORMACION DEL USUARIO ---"
    Write-Output (Get-ADUser -Identity $nombre | Ft SamAccountName, SID, Enabled)

    if($grupo){

        Write-Output "--- GRUPOS A LOS QUE PERTENECE ---"
        Write-Output (Get-ADPrincipalGroupMembership $nombre | Select SamAccountName, SID, GroupScope)

    }
}

else {

    Write-Output "EL USUARIO NO EXISTE" 

}