for $baile in //baile
order by $baile/sala
return
<profesor>
  {
    <nombre>{$baile/profesor/text()}</nombre>,
    $baile/sala
  }
</profesor>