DECLARE
    numero number := &numinput;
    i number := 1;
BEGIN
    loop
        dbms_output.put_line(numero||' X '||i||' = '||numero*i);
        i := i + 1;
        exit when i >10;
    end loop;
END;
/