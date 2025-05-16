
<table>
  <thead>
    <tr>
      <th>Baile</th>
      <th>Profesor</th>
    </tr>
  </thead>
  <tbody>
      {
        for $baile in //baile
        return    
         <tr>
          <td>{$baile/nombre/text()}</td>
          <td>{$baile/profesor/text()}</td>
         </tr>
      } 
  </tbody>
</table>