$user = import-csv listaUsuariosV2.csv

foreach ($i in $user){
   if (Get-LocalUser $i.nombre -ErrorAction SilentlyContinue){
      write-host $i.name,"Exist"
   }else{
      write-host "No exist"
      New-LocalUser -Name $i.nombre -NoPassword -FullName $i.nombrecompleto 
      if ($i.admin -eq "Ture"){
         Add-LocalGroupMember -Group "Administrador" -Member $i.nombre
      }
   }
}