Param(
    [Parameter (Mandatory=$true, HelpMessage = "La operacion solo puede ser: xor, nxor")]
    [string] [alias("op")] $operacion,
    [string] [Alias("op2")] $operando1 = "TRUE",
    [string] [Alias("op1")] $operando2 = "TRUE",
    [string] $resultado
)

$iguales = ($operando1 -eq $operando2)

$diferentes = ($operando1 -ne $operando2)

$output = "$($operando1.ToUpper()) $($operacion.ToUpper()) $($operando2.ToUpper()) = "

if($operacion -eq "xor") {

    if($diferentes){

        $resultado = "TRUE"

        echo "$($output) $($resultado)"

    }

    else {

        $resultado = "FALSE"

        echo "$($output) $($resultado)"

    }

}

if($operacion -eq "nxor"){

    if($iguales){

        $resultado = "TRUE"

        echo "$($output) $($resultado)"

    }

    else {

        $resultado = "FALSE"

        echo "$($output) $($resultado)"

    }

}

else {

    echo "-- Error: operacion no reconocida, inténtelo de nuevo --"

}

<#
Para que la salida sea en una única línea tenemos que poner todo entre comillas doble y poner el $ antes de los paréntesis para cada variable.
Para simplificar un poco el código y por posibles modificaciones en el futuro, declaro el output al prnicipio ya que siempre va a ser igual
pero no podemos poner dentro el parámetro resultado porque no es un valor "fijo", se le da valor después, dentro de las condiciones
y al declararlo no le damos ningún parámetro por lo que el resultado siempre estaría en blanco, si le hubiera puesto que por defecto 
fuese TRUE o FALSE, siempre tendría ese valor y el ejercicio no estaría bien
#>