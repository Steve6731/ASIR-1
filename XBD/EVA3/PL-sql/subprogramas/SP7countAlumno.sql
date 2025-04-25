create or replace PROCEDURE countAlumno (
   P_DNI alumno.DNI%type
) AS
   numero number := 0;
   V_nombre alumno.nombre%type;
   V_prapellido alumno.prapellido%type;
   V_sgapellido alumno.sgapellido%type;
   cursor c_matricula is select codmatr from matricula where DNI = P_DNI;
BEGIN
   Select nombre,prapellido,sgapellido 
      into V_nombre,V_prapellido,V_sgapellido from alumno
      where DNI = P_DNI;
   for V_matricula in c_matricula loop
      numero := numero + 1;
   end loop;
   dbms_output.put_line('El alumno que tiene DNI '||P_DNI||'. Se llama'||' '||V_nombre||' '||V_prapellido||' '||V_sgapellido||'y matricula '||numero);
end;
/
DECLARE
   V_DNI alumno.DNI%type;
BEGIN
   Select DNI into V_DNI from (
      Select rownum as fila,DNI from (
         Select * from alumno order by 1))
      where fila = 7;
   COUNTALUMNO(P_DNI);
END;
/