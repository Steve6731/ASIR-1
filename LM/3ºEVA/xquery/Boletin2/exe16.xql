for $book in //book
where ends-with($book/year,'3')
return $book
