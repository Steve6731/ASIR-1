sum(
  for $num in //baile[./profesor="Laura Mendiola"]
  return $num/plazas*$num/precio
)