for $baile in //baile
where $baile/precio > 30
and $baile//@moneda = "euro"
return $baile/nombre