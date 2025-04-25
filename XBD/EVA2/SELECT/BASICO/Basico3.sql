--1
Select * from emple
   where dept_no in(Select dept_no from emple
      where apellido ='GIL');
--2
Select * from emple
   where oficio in(Select oficio from emple
      where apellido ='CERDEIRA');
--3
Select apellidos,oficio,salario,fecha_alt from emple
   where oficio in(Select oficio from emple
      where apellido ='JUMÉNEZ')
   and salario >= (Select oficio from emple
      where apellido ='FERNÁNDEZ');
--4
Select apellido,oficio,salario from emple
   where dept_no in(Select dept_no from emple
      where apellido ='FERNÁNDEZ')
   and salario = (Select oficio from emple
      where apellido ='FERNÁNDEZ');
--5
Select * from emple
   where dept_no = 10
   and sal > (Select sal from emple
      where apellido ='GIL');
--6
Select e.apelido,e.oficio,d.loc from emple e,depart d
   where e.dept_no = d.dept_no;
--7
Select e.apelido,e.oficio,d.loc from emple e,depart d
   where e.dept_no = d.dept_no
   and e.oficio = 'ANALISTAS';
--8
Select apellido,oficio,salario from emple
   where dept_no in(Select dept_no from depart
      where lower(loc) = 'madrid');
--9
Select e.apelido,e.oficio,d.loc from emple e,depart d
   where e.dept_no = d.dept_no
   and e.salario between 200000 and 300000;
--10
Select e.apellido,e.salario,d.dnombre from emple e,depart d
   where oficio in(Select oficio from emple
      where apellido ='GIL');
--11
Select e.apellido,e.salario,d.dnombre from emple e,depart d
   where oficio in(Select oficio from emple
      where apellido ='GIL')
   and comision is null;
--12
Select * from emple e,depart d
   where lower(d.dnombre) = 'contabilidad';
--13
Select e.apellido from emple e,depart d
   where lower(loc) = 'sevilla'
   and lower(oficio) in('analista','empregado');
--14
Select avg(salario) from emple;
--15
Select max(salario) from emple
   where dept_no = 10;
--16
Select min(e.salario) from emple e,depart d
   where lower(d.dnombre) = 'vendas';
--17
Select avg(e.salario) from emple e,depart d
   where lower(d.dnombre) = 'contabilidade';
--18
Select * from emple
   where sal > (Select avg(sal) from emple);
--19
Select count(*) from emple
   where dept_no = 10;
--20
Select count(*) from emple e,depart d
   where lower(d.dnombre) = 'vendas';
--21
Select count(*) from emple
   where comision is null;
--22
Select apellido from emple
   where salario in(Select max(salario) from emple);
--23
Select apellido from emple
   where salario in(Select min(salario) from emple);
--24
Select apellido from emple
   where salario in(Select max(salario) from emple)
   and dept_no in(Select detp_no from depart
      where lower(dnombre) = 'vandas');
--25
Select count(*) from emple
   where lower(apellido) in('a%');
--26
Select avg(salario+nvl(comision,0)) from emple
   where departamento = 30;
Select count(comision) from emple
   where departamento = 30;
Select max(salario+nvl(comision,0)) from emple
   where departamento = 30;
Select min(salario+nvl(comision,0)) from emple
   where departamento = 30;

