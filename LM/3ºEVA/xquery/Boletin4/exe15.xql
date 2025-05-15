for $baile in //baile
return
  <baile>
    {
      for $nodo in $baile/*[
         string(node-name()) != "comienzo" and
         string(node-name()) != "fin"
       ]
      return $nodo
    }
  </baile>