--1 Obter os apelidos dos empregaods
Select apellidos from EMPLEADOS;
--2 Obter os apelidos dos empregaods sen repeticions
Select DISTINCT apellidos from EMPLEADOS;
--3 Obter tódolos datos dos empregaods que se apelidan 'Lopez'
Select * from EMPLEADOS
   where lower(apellidos) in ('%lopez%');
--4 Obter os datos dos empregados que se apelidan 'Lopez' e dos que se apelidan 'Perez'
Select * from EMPLEADOS
   where lower(apellidos) in ('%lopez%','%perez%');
--5 Obter os datos dos empregados que traballan para o departamento 14
Select * from EMPLEADOS
   where DEPARTAMENTO = 14;
--6 Obter os datos dos empregados que traballan para o departamento 37 e para o departamento 77
Select * from EMPLEADOS
   where DEPARTAMENTO = 37 and DEPARTAMENTO = 77;
--7 Obter os datos dos empregaods que teñan o 'P' como inicial do seu apelido
Select apellidos from EMPLEADOS
   where lower(apellidos) in ('p%');
--8 Obter o presuposto total de todos os departamentos
Select sum(presupuesto) from Departamentos;
--9 Obter o numero de empregados en cada departamentos
Select nombre,count(*) from Departamentos d, Empleados e
   where e.DEPARTAMENTO = d.CODIGO
   group by d.codigo,d.nombre;
--10 Obter un listado completo de empreagdos incluingod por cada un deles os datos do empregaod e do seu departamento.
Select * from EMPLEADOS e,DEPARTAMENTOS d
   where e.DEPARTAMENTO = d.CODIGO;
--11 Obter un listado completo de empregados inluindo o nome e apelidos do empregaod xun co nome e presuposto do seu departamento.
Select * from EMPLEADOS e,DEPARTAMENTOS d
   where e.DEPARTAMENTO = d.CODIGO;
--12 Obter o nome e apelidos dos empregados que traballan en departamentos que teñan un presuposto maior de 60.000€
Select * from EMPLEADOS e,DEPARTAMENTOS d
   where e.DEPARTAMENTO = d.CODIGO and d.presupuesto > 60000;
--13 Obter os datos dos departamentos que teñan un presuposto superior ó presuposto medio de todos os departamentos
Select * from EMPLEADOS e,DEPARTAMENTOS d
   where e.DEPARTAMENTO = d.CODIGO 
   group by d.codigo,d.nombre
   having d.PRESUPUESTO > avg(d.PRESUPUESTO);
--14 Obter os nomes dos departamentos que teñan máis de dous empregados.
Select d.NOMBRE,count(e.DNI) from EMPLEADOS e,DEPARTAMENTOS d
   where e.DEPARTAMENTO = d.CODIGO(+) 
   group by d.codigo,d.nombre
   having count(e.DNI) > 2;
--15 Engadir un novo departamento:'Calidade' con presuposto de 40000€ e código
INSERT into departamento(codigo,nombre,Presupuesto) values (11,Calidade,40000);
--16 Aplicar un recorte presupuestario do 10% a tódolos departamentos.
Update departamento set presupuesto = presupuesto*0.9;
--17 Reasignar ós empregaods de 'investigación' (código 77) ó departamento de informatica (codigo 14)
Update empleados set departamento = 14 where departamento = 77;
--18 Despedir ós empregados que traballan no departamento de informática (codigo 14)
delete empleados where departamento = 14;
--19 Despedir a todos os empregados que traballen para departamentos que teñan un presuposto superior ós 60000€
DELETE empleados from empleados 
      where DNI = (select empleados.DNI from empleados
   join departamentos on departamentos.codigo = empleados.departamento 
   where departamentos.presuposto > 60000);
--20 Despedir a tódolos empregados
Delete from empreados; TRUNCATE table empreados;