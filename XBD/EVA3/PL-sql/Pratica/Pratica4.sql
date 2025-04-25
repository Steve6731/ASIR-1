DECLARE
    v_fecha1 date ;
    v_fecha2 date ;
BEGIN
    v_fecha1 := to_date('&v_fecha1','DD/MM/YYYY');
    v_fecha2 := to_date('&v_fecha2','DD/MM/YYYY');
    if v_fecha1 > v_fecha2 then
        DBMS_OUTPUT.PUT_LINE(v_fecha1);
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_fecha2);
    end if;
END;
/