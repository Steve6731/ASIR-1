for $x in //book
where $x/price <= 30
return <title>{$x/title/text()}</title>