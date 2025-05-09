let $count :=
<counts>
{
for $artista in //artista
where $artista/nacimiento < 1600
return <a></a>
}
</counts>

return count($count/a)