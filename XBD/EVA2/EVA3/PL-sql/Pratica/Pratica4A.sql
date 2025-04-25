DECLARE
    v_fecha1 date ;
    v_fecha2 date ;
    distancia1 number;
    distancia2 number;
BEGIN
    v_fecha1 := to_date('&v_fecha1','DD/MM/YYYY');
    v_fecha2 := to_date('&v_fecha2','DD/MM/YYYY');
    distancia1 := abs(v_fecha1 - sysdate);
    distancia2 := abs(v_fecha2 - sysdate);
    if distancia1 > distancia2 then
        dbms_output.PUT_LINE(v_fecha2);
    ELSE
        dbms_output.PUT_LINE(v_fecha1);
    end if;
END;
/