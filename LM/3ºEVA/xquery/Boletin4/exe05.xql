for $baile in //baile
where contains($baile/comienzo,"/1/")
return 
  <baile>{
    $baile/nombre,
    $baile/comienzo
  }</baile>