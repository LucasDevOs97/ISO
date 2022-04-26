- La estructura de un dominio de Windows es jerárquica.

- Para poder unir una máquina a un dominio, además de que las máquinas se vean correctamente, se necesitan: credenciales de un administrador del dominio y de la máquina local.

- Si un usuario EQUIS pertenece al grupo ZETA y el grupo ZETA pertenece a una OU OMEGA: sobre OMEGA no se pueden aplicar permisos.

- Indicar cual es el Distinguished Name correcto para el usuario EQUIS del grupo ZETA: CN=EQUIS, OU=OMEGA, DC=zz, DC=top

- Para que se pueda crear un dominio en Windows es necesario: un controlador de dominio, un seridor DNS

- La nomenclatura ZZ\Administrator se refiere a: CN=Administrator, CN=Users, DC=zz, DC=top

- Si el usuario EQUIS pertenece al grupo ZETA, y a un recurso CARPETA se le deniega escritura al usuario EQUIS y concede control total al grupo ZETA: El usuario EQUIS tiene permiso de lectura pero no de escritura sobre CARPETA

- Si un usuario EQUIS pertenece al grupo ZETA y el grupo ZETA pertenece a una Unidad Organizativa OMEGA: sobre OMEGA se pueden aplicar directivas enlazando GPOs, sobre ZETA se pueden aplicar permisos

- La nomenclatura gibbons@zz.top es equivalente a: ZZ\gibbons

- Desde una máquina con Windows 10 unida al dominio zz.top, el usuario gibbons se puede conectar como: gibbons, si es una cuenta local; gibbons@zz.top, si es una cuenta del dominio.

- Si se quiere dar otro nombre a un servidor controlador de dominio, lo más sencillo y eficiente es: crear un alias en el ámbito del servidor DNS

- Los ususarios definidos en una máquina windows 10 anteriormente al dominio: solo se pueden conectar a la máquina de manera local

- Desde una máquina con windows 10 unida a un dominio, un usuario se puede conectar: con una cuenta local o con una cuenta de dominio.

- Las GPOs se aplican sobre: Unidades Organizativas

- El nombre NetBios del dominio midominio.local es: MIDOMINIO

- Para poder añadir una máqiuna a un dominio, es necesario configurar correctamente: los servidores DNS

- El criterio de aplicación de permisos en windows es: en caso de conflicto, el más restrictivo prevalece