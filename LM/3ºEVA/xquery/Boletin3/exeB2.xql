for $impre in
//impresora[count(./tamaño)>1]
return 
<impresora>
  {concat(
    "Marca: ",$impre/marca,
    " | Modelo: ",$impre/modelo
  )}
</impresora>