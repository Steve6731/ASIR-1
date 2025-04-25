create or replace procedure printSalaryV3(
   name EMP.EMPNO%type
) IS
   salary EMP.sal%type;
BEGIN
   Select Sal into salary from EMP
      where upper(ENAME) = name;
   dbms_output.PUT_LINE('*******');
   dbms_output.PUT_LINE(salary);
   dbms_output.PUT_LINE('*******');
END;