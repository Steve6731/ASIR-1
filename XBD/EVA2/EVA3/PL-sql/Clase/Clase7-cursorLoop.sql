--si quiero seleccionar varias filos => curosr
--1º se declara e lcurosr
-- cursor c_nombre is select ....
--2º tengo que asgnar la posicion del cursor a una valiable
--open c.nombre;
create or replace procedure muestralumno as
   cursor c_alumno is select nombre from alumno;
   v_alumno c_alumno%rowtype;
BEGIN
   open c_alumno;
   LOOP
      fetch c_alumno into v_alumno;
      exit when c_alumno%notfound;
      dbms_output.put_line(v_alumno.nombre);
   end loop;
   close c_alumno;
end;
/

execute muestralumno;