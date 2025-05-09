let $max := max(//price/number())
let $min := min(//price/number())
return 
<precio>
  <maximo>{$max}</maximo>
  <minimo>{$min}</minimo>
</precio>