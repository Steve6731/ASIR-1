DECLARE
    numero number := &numinput;
    i number := 1;
BEGIN
    while i <= 10 loop
        dbms_output.put_line(numero||' X '||i||' = '||numero*i);
        i := i + 1;
    end loop;
END;
/