for $impre in
//impresora[count(./enred)=1]
return 
<impresora>
  {concat(
    "Marca: ",$impre/marca,
    " | Modelo: ",$impre/modelo
  )}
</impresora>