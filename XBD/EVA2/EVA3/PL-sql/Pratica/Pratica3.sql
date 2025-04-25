DECLARE
    v_ds varchar2(16);
    v_fecha date;
BEGIN
   v_fecha:= to_date('&v_fecha','DD/MM/YYYY');
   select to_char(v_fecha,'day') into v_ds
   from dual;
   DBMS_OUTPUT.PUT_LINE('Naciste un '||v_ds);  
END;
/