for $artista in //artista
where count($artista/fallecimiento) = 0
return $artista/nombreCompleto/text()