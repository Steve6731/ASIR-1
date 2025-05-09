let $cod := 
  //asignatura[@nombre="FH"]/@cod/string()
for $nota in
  //nota[@asig=$cod and @calificacion>=5]
   let $alumno := 
   //alumno[./@cod/string() = $nota/@alum/string()]
return 
  concat
  (
    "Nombre: ",$alumno/apenom/string()," | ",
    "Nota: ",$nota/@calificacion
  )