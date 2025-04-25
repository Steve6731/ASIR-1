Set serveroutput ON
DECLARE
   v_nombre foo.nombre%type;
BEGIN
   select nombre into v_nombre from foo where id=1;
   dbms_output.put_line('El nombre es '||v_nombre);
END;