Param(
    [Parameter (Mandatory=$true, HelpMessage = "La operacion solo puede ser: xor, nxor")]
    [string] [alias("op")] $operacion,
    [string] [Alias("op2")] $operando1 = "TRUE",
    [string] [Alias("op1")] $operando2 = "TRUE",
    [string] $resultado,
    [bool] $cierto1,
    [bool] $cierto2
)

if($operando1 -eq "true"){

    $cierto1 = $true

}

elseif($operando2 -eq "true"){

    $cierto2 = $true

}

else{

    $cierto1 = $false

    $cierto2 = $false

}

$resul = ($cierto1 -xor $cierto2)


if($operacion -eq "xor"){

    if($resul = $false){

        echo "$($operando1.ToUpper()) $($operacion.ToUpper()) $($operando2.ToUpper()) = TRUE"

    }

    else{

        echo "$($operando1.ToUpper()) $($operacion.ToUpper()) $($operando2.ToUpper()) = FALSE"

    }

}

if ($operacion -eq "nxor") {
    
    if($resul = $true){

        echo "$($operando1.ToUpper()) $($operacion.ToUpper()) $($operando2.ToUpper()) = TRUE"

    }

    else{

        echo "$($operando1.ToUpper()) $($operacion.ToUpper()) $($operando2.ToUpper()) = FALSE"

    }

}