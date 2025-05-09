for $xml in /artistas
return
<ul>
  {
   for $artista in $xml/artista
   where $artista/pais = "España"
   return <li>{$artista/nombreCompleto/text()}</li>
  }
</ul>