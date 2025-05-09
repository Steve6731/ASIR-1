for $book in //book
return
<books>
  {concat($book/title/text(),"(",count($book/author),")")}
</books>