create or replace procedure insertTeacher(
   P_DNI teacher.DNI%type
) IS

BEGIN
   Delete from teacher where DNI=P_DNI;
   dbms_output.PUT_LINE('Delete the information of techer whose id is '||P_DNI);
END;
--Create table teacher(
--   DNI number(8),
--   Nombre varchar2(30),
--   PrApellido varchar(20),
--   SgApellido varchar(20),
--   constraint pk_teacher PRIMARY KEY(DNI)
--);
/