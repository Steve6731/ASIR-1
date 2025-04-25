create or replace procedure printSalary IS
   salary EMP.sal%type;
   name EMP.EMPNO%type := 'JONES';
BEGIN
   Select Sal into salary from EMP
      where upper(ENAME) = name;
   dbms_output.PUT_LINE(salary);
END;