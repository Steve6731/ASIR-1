create or replace procedure printSalaryV2 IS
   salary EMP.sal%type;
   name EMP.EMPNO%type := 'JONES';
BEGIN
   Select Sal into salary from EMP
      where upper(ENAME) = name;
   dbms_output.PUT_LINE('*******');
   dbms_output.PUT_LINE(salary);
   dbms_output.PUT_LINE('*******');
END;