DECLARE
    v_fecha1 date := to_date('&v_fecha1','DD/MM/YYYY');
    v_fecha2 date := to_date('&v_fecha2','DD/MM/YYYY');
    distancia1 number := abs(v_fecha1 - sysdate);
    distancia2 number := abs(v_fecha2 - sysdate);
BEGIN
    if distancia1 > distancia2 then
        dbms_output.PUT_LINE(v_fecha2);
    ELSE
        dbms_output.PUT_LINE(v_fecha1);
    end if;
END;
/