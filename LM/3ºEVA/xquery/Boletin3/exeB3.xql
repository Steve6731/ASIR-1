for $impre in
//impresora[./tamaño="A3"]
return 
<impresora>
  {concat(
    "Marca: ",$impre/marca,
    " | Modelo: ",$impre/modelo
  )}
</impresora>