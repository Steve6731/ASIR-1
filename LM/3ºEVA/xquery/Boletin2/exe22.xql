let $store := /bookstore
return
<table>
  <tbody>
  <tr>
    <td>Titulo</td>
  </tr>
    {
    for $title in $store//title/text()
    return <tr><td>{$title}</td></tr>
    } 
   </tbody>
</table>