Remove-ADGroupMember -Identity group01 -Members u01, u02, u03
Remove-ADGroupMember -Identity group02 -Members u02, u03
Remove-ADGroupMember -Identity group03 -Members u03
Remove-ADGroup -Identity group01
Remove-ADGroup -Identity group02
Remove-ADGroup -Identity group03
Remove-ADUser -Identity u01
Remove-ADUser -Identity u02
Remove-ADUser -Identity u03