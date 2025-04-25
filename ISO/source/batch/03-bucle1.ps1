$user = import-csv D:\Xuan\ISO\source\batch\listaUsuarios.csv
foreach ($i in $user){
   write-host ("Su nombre es",$i.nombre,", Su nombre completo",$i.nombrecompleto)
}