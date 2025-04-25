create or replace procedure printSalary IS
   cursor c_EMP is Select * from EMP;
   v_EMP c_EMP%rowtype;
BEGIN
   open C_EMP;
   loop
      fetch c_EMP into v_EMP;
      exit when c_EMP%notfound;
      dbms_output.PUT_LINE('Salario de '||V_EMP.EMPNO||' es '||V_EMP.SAL);
   end loop;
END;
/
execute printSAlaryALl;