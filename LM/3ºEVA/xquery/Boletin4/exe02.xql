for $bailes in /bailes
return
<losbailes>
  {
    for $baile in $bailes/baile
    return 
      <baile>{
        concat(
        $baile/nombre/text(),' (',
        $baile/plazas/text(),')')
       }</baile>
  }
</losbailes>