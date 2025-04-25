create or replace procedure insertTeacher(
   ID EMP.EMPNO%type
) IS

BEGIN
   Update EMP set SAL = SAL*2 where EMPNO = ID;
   dbms_output.PUT_LINE('Doubled the salary of employe whose id is '||P_DNI);
END;

/