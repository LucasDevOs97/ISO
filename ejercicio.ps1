# Scripts:

<#- Servicio.ps1 -> Recibe dos parámteros:   
    - nombre: un nombre de servicio [obligatorio]    
    - estado: valores activar o desactivar, que aparecen al tabular, si no se recibe, el valor es activar   

- Modificarlo para que compruebe que el servicio recibido como parámetro existe  #>

Param(
    [Parameter (Mandatory= $true)]
    [string] $nombre,
    [validateset ("Activar", "Desactivar")] $accion="activar"
)

$existe = Get-Service | Where-Object -Property Name -eq $nombre

if($existe){

    if($accion -eq "activar"){

        Start-Service -Name $nombre

    }

    else{

        Stop-Service -Name $nombre 

    }


}

else{

    echo "ERROR: El servicio $($nombre) no existe"

}

<# wisvc #>