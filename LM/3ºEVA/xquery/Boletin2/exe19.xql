for $book in //book
let $title := $book/title
return
<book>
  {concat($book/title/text(),"(",string-length($book/title/text()),")")}
</book>