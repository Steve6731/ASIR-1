create or replace procedure printSalaryAllv2 IS
   cursor c_EMP is Select * from EMP;
   v_EMP c_EMP%rowtype;
   line number := 0;
BEGIN
   open C_EMP;
   dbms_output.PUT_LINE('-----------------------');
   loop
      fetch c_EMP into v_EMP;
      exit when c_EMP%notfound;
      dbms_output.PUT_LINE('Salario de '||V_EMP.ENAME||' es '||V_EMP.SAL);
      line := line + 1;
      if line >= 5 then
         dbms_output.PUT_LINE('-----------------------');
         line := 0;
      end if;
   end loop;
END;
/
execute printSAlaryALlv2;