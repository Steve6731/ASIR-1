for $alum in //alumno
order by apenom descending
return
<alumno>
  <nombre>{$alum/apenom/text()}</nombre>
  <tele>{$alum/telefono/text()}</tele>
</alumno>