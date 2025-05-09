for $impre in
//impresora[./tamaño="A3"and count(./tamaño)=1]
return 
<impresora>
  {concat(
    "Marca: ",$impre/marca,
    " | Modelo: ",$impre/modelo
  )}
</impresora>