create or replace procedure calculator (
   numero1 in number,
   operacion in varchar2,
   numero2 in number
) IS solucion number;
     mostrar BOOLEAN;
BEGIN
   CASE operacion
      when '*' then solucion := numero1*numero2;
      when '/' then solucion := numero1/numero2;
      when '+' then solucion := numero1+numero2;
      when '-' then solucion := numero1-numero2;
      when '!' then factorial(numero1);
      else dbms_output.PUT_LINE('Error operacion no valirable');
            Mostrar := False;
   END CASE;
   if operacion != '!' and Mostrar = True then 
      dbms_output.PUT_LINE(solucion);
   end if;
end;