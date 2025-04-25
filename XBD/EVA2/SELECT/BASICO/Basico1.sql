--1
Select DNI,COD_DEP,NOMBRE,ANNO_INCORP,CARGO from TEMPLEADOS;
--2
Select NOMBRE,CARGO from TEMPLEADOS;
--3
Select NOMBRE,CARGO from TEMPLEADOS
   where CARGO in('contable','comercial');
--4
Select NOMBRE,ANNO_INCORP from TEMPLEADOS
   where ANNO_INCORP >= 2003;
--5
Select NOMBRE,ANNO_INCORP from TEMPLEADOS
   where ANNO_INCORP = 2003
   ORDER BY NOMBRE,DNI DESC;
--6
Select distinct CARGO from TEMPLEADOS;
--7
Select NOMBRE,ANNO_INCORP,CARGO from TEMPLEADOS
   where CARGO in('cantable') and ANNO_INCORP = 2005;
--8
Select NOMBRE from TEMPLEADOS
   where CARGO is null;
--9
Select NOMBRE,CARGO from TEMPLEADOS
   where CARGO is not null;
--10
Select DNI,SALARIO * 1.03 from TSALARIOS;
--11
Select DNI,SALARIO + 100 from TSALARIOS;
--12
Select count(*) from TEMPLEADOS
   where CARGO is null;
--13
Select Min(SALARIO) from TSALARIOS;
--14
Select DNI,SUN(SALARIO) from TSALARIOS
   GROUP BY DNI;
--15
Select count(*),ANNO_INCORP from TEMPLEADOS
   GROUP BY ANNO_INCORP;
--16
Select COUNT(*),COD_DEP from TEMPLEADOS
   GROUP BY COD_DEP;
--17
Select count(*),ANNO_INCORP from TEMPLEADOS
   where ANNO_INCORP > 2001
   GROUP BY ANNO_INCORP;
--18
Select count(*),ANNO_INCORP from TEMPLEADOS
   where ANNO_INCORP > 2001
   GROUP BY ANNO_INCORP
   HAVING COUNT(*) > 2;
--19 listar os DNIs dos colabradores dos departamentos de 'contabilidade','vendas',e 'legal'.
Select c.DNI,d.nombre from tdep d,tcolaboradores c
   where c.cod_dep = d.COD_DEP 
   and d.nombre in ('contabilidade','vendas','legal');
--20. Calcular o custo salarial do departamento de 'vendas'
Select d.nombre,sum(s.salario) from tdep d,templeados e,tsalarios s
   where s.DNI=e.DNI and e.COD_DEP=d.COD_DEP and d.nombre='vendas'
   GROUP by d.COD_DEP,d.NOMBRE;
--21. Calcular o salario medio dos empregados incorporados no ano 2003.
Select e.ANNO_INCORP,avg(s.salario) from templeados e,TSALARIOS s
   where s.DNI=e.DNI and e.ANNO_INCORP = 2003
   group by ANNO_INCORP;
--22. Listar o nome de cada empregado e o máximo dos seus salarios, sempre que a suma dos seus salarios sexa superior a 3.000€ e non pertenza ao departamento de 'enxeñaría'.
Select e.nombre,max(s.salario),sum(s.salario),d.nombre from tdep d,TEMPLEADOS e,TSALARIOS s
   where s.DNI=e.DNI and d.COD_DEP = e.COD_DEP
   and d.nombre != 'enxeñaría'
   GROUP by e.DNI,e.nombre,d.COD_DEP,d.nombre
   having sum(s.salario) > 3000;