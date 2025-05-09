for $book in //book
where starts-with($book/@category,'C')
return $book
