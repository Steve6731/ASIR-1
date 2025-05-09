for $book in //book
return
<book> 
  <title>{$book/title/string()}</title>
  <numeroAutor>
    {
      let $num := count($book/author)
      return $num
    }
  </numeroAutor>
</book>
