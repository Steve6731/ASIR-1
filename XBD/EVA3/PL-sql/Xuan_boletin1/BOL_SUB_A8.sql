create or replace procedure printSalaryDepno(
   P_deptno EMP.deptno%type
) IS
   cursor c_EMP is Select * from EMP where deptno = P_deptno;
   v_EMP c_EMP%rowtype;
   line number := 0;
BEGIN
   dbms_output.PUT_LINE('-----------------------');
   for v_EMP in C_EMP loop 
      dbms_output.PUT_LINE('Salario de '||V_EMP.ENAME||' es '||V_EMP.SAL);
      line := line + 1;
      if line >= 5 then
         dbms_output.PUT_LINE('-----------------------');
         line := 0;
      end if;
   end loop;
END;
/
execute printSAlarydepno(10);