Set serveroutput ON
DECLARE
   nombre varchar2(16);
   edad number(3) := 26;
   text varchar2(128);
BEGIN
   nombre := 'Manuel';
   text := 'hola '||nombre||' tienes '||edad||' años';
   dbms_output.put_line(text);
END;