$user = import-csv D:\Xuan\ISO\source\batch\listaUsuarios.csv
foreach ($i in $user){
   New-LocalUser -Name $user.nombre -NoPassword -FullName $user.nombrecompleto 
}