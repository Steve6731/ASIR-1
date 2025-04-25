Set serveroutput ON
DECLARE
   v_nombre varchar2(128);
   v_prapellido varchar2(128);
   v_sgapellido varchar2(128);
   DNI number := &&DNI;
BEGIN
   SELECT nombre,prapellido,sgapellido 
   into v_nombre,v_prapellido,v_sgapellido
   from cliente
   where dnicl = &&DNI;
   dbms_output.put_line(v_nombre||' '||v_prapellido||' '||v_sgapellido);
end;