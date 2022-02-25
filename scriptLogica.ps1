Param(
    [Parameter (Mandatory=$true, HelpMessage = "La operacion solo puede ser: xor, nxor",ParameterSetName="user", "u")]
    [string] $operacion,
    [Parameter (ParameterSetName="op1")]
    [bool] $operando1 = $true,
    [Parameter (ParameterSetName="op2")]
    [bool] $operando2 = $true,
    [bool] $resultado
)

if ($operacion -eq "xor") {

    if($operando1 -eq $operando2){

        $operando1 = $true
        $operando2 = $true

        $resultado = $false

        Write-Output $operando1 $operacion $operando2 $resultado

    }

    else{

        $operando1 = $true
        $operando2 = $false

        $resultado = $true

        Write-Output $operando1 $operacion $operando2 $resultado

    }
    
}

elseif ($operacion -eq "nxor") {
    
    if($operando1 -eq $operando2){

        $operando1 = $true
        $operando2 = $true

        $resultado = $true

        Write-Output $operacion $operando2 $resultado

    }

    else{

        $operando1 = $true
        $operando2 = $false

        $resultado = $false

        Write-Output $operando1 $operacion $operando2 $resultado

    }

}

else {
    
    Write-Output "-- Error: operacion no reconocida, inténtelo de nuevo --"

}