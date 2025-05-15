for $profe in distinct-values(//profesor)
return 
  <profesor>
    <nobmre>{$profe}</nobmre>
    <sala>{
      for $sala in distinct-values(
          //baile[./profesor=$profe]/sala/text()
        )
      return concat($sala," ")
    }</sala>
 </profesor>