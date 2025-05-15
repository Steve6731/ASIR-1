for $baile in //baile
return 
<baile>{
  $baile/nombre,
  <precio>
    {$baile/precio/number()}
  </precio>,
  <descuento>
    {$baile/number(precio*0.85)}
  </descuento>
}</baile>