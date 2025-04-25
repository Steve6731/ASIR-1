create or replace procedure createDept(
   New_dname DEPT.dname%type
) IS
   New_deptno DEPT.deptno%type;
BEGIN
   Select max(deptno)+10 into New_deptno from DEPT;
   Insert into dept(deptno,dname)
      values(New_deptno,New_dname);
   dbms_output.PUT_LINE('Insert'||New_dname||' su numero de departamento es '||New_dname);
END;
/