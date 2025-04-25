create or replace procedure muestralumno as
   cursor c_alumno is select nombre from alumno;
   v_alumno c_alumno%rowtype;
BEGIN
   open c_alumno;
   fetch c_alumno into v_alumno;
   while c_alumno%found loop
      dbms_output.put_line(v_alumno.nombre);
      fetch c_alumno into v_alumno;
   end loop;
   close c_alumno;
end;
/

execute muestralumno;