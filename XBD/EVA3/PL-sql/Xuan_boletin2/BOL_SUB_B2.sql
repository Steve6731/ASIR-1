create or replace procedure createDeptV2(
   New_dname DEPT.dname%type,
   input_deptno DEPT.deptno%type
) IS
   New_deptno DEPT.deptno%type := input_deptno;
   cursor c_dept is select * from dept;
   v_dept c_dept%rowtype;
BEGIN
   dbms_output.PUT_LINE('Insert'||New_dname||' el deptno que quieres es '||input_deptno);

   open c_dept;
   loop
      fetch c_dept into v_dept;
      exit when c_dept%notfound or (v_dept.deptno != New_deptno and v_dept.deptno >= input_deptno);
      if New_deptno = v_dept.deptno then
         dbms_output.PUT_LINE('El deptno '||New_deptno||'es usado');
         New_deptno := New_deptno + 1;
         dbms_output.PUT_LINE('Cambiado al '||New_deptno);
      end if;
   end loop;
   Insert into dept(deptno,dname)
      values(New_deptno,New_dname);
   dbms_output.PUT_LINE('El número final elegido para usted es '||New_deptno);
END;
/