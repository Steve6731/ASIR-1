create or replace procedure insertTeacher(
   P_DNI teacher.DNI%type,
   P_Nombre teacher.Nombre%type,
   P_PrApellido teacher.PrApellido%type,
   P_SgApellido teacher.SgApellido%type
) IS

BEGIN
   Insert into teacher(DNI,Nombre,PrApellido,SGAPELLIDO)
      values(P_DNI,P_Nombre,P_PrApellido,P_SGAPELLIDO);
   dbms_output.PUT_LINE('Insert'||P_DNI||' '||P_Nombre||' '||P_PrApellido||' '||P_SGAPELLIDO||'to table TEACHER correctly');
END;
--Create table teacher(
--   DNI number(8),
--   Nombre varchar2(30),
--   PrApellido varchar(20),
--   SgApellido varchar(20),
--   constraint pk_teacher PRIMARY KEY(DNI)
--);
/