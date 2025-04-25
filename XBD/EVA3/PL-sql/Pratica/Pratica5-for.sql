DECLARE
    numero number := &numinput;
BEGIN
    for i in 1..10 loop
        dbms_output.put_line(numero||' X '||i||' = '||numero*i);
    end loop;
END;
/