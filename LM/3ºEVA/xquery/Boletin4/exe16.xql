

<thead>
  <th>Baile</th>
  <th>Profesor</th>
</thead>
<tbody>
{
  for $baile in //baile
  return $baile/nombre,$baile/profesor
} 
</tbody>