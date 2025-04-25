--1
Select nome from Piezas;
--2
Select * from PROVEEDORES;
--3
Select round(avg(Precio),2) as "Precio Medio" from suministra
   group by CODIGOPIEZA;
--4
Select nombre from PROVEEDORES
   where ID in(Select IDPROVEEDOR from suministra
      where CODIGOPIEZA = 1);
--5
Select p.nombre from PIEZAS p,SUMINISTRA s,PROVEEDORES pr
   where s.CODIGOPIEZA = p.CODIGO
   and s.IDPROVEEDOR = pr.ID
   and pr.ID = 'HAL';
--6
Select pr.nombre,p.nombre,s.PRECIO from PIEZAS p,SUMINISTRA s,PROVEEDORES pr
   where s.CODIGOPIEZA = p.CODIGO
   and s.IDPROVEEDOR = pr.ID
   and s.precio = (Select max(precio) from SUMINISTRA);
--7
Insert into PROVEEDORES(id,nombre) VALUES(TNBC,'Skellington Supplies');
Insert into suministra(CODIGOPIEZA,IDPROVEEDOR,PRECIO) VALUES(1,TNBC,0.3);
--8
UPDATE SUMINISTRA set precio = precio + 1;
--9
DELETE from suministra where IDPROVEEDOR = 'RBT';
--10
Delete from SUMINISTRA where IDPROVEEDOR = 'RBT' and CODIGOPIEZA = '4';