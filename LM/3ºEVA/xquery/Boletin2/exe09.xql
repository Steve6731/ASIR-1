let $num := count(//book)
return
<booksotre>
  {
    for $book in //book
    return $book/title
  }
  <total>{$num}</total>
</booksotre>