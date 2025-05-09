let $cod := //asignatura[@nombre="LMSGI"]/@cod/string()
let $alum := //nota[@asig=$cod]/@alum/string()
let $alumno := //alumno
where $alumno/@cod = $alum
return $alumno/apenom