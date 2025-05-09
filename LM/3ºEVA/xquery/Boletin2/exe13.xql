let $sum := sum(//price/number())
return 
<books>
  {
    for $book in //book
    return
    <book>
      <title>{$book/title/string()}</title>
      <price>{$book/price/string()}</price>
    </book>
  }
  <total>{$sum}€</total>
</books>