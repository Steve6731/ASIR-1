create or replace procedure calculator (
   numero1 in number,
   operacion in varchar2,
   numero2 in number
) IS solucion number;
     mostrar BOOLEAN := True;
BEGIN
   if operacion = '!' then
      CASE operacion
         when '*' then solucion := numero1*numero2;
         when '/' then solucion := numero1/numero2;
         when '+' then solucion := numero1+numero2;
         when '-' then solucion := numero1-numero2;
         else dbms_output.PUT_LINE('Error operacion no valirable');
               Bandera := False;
      END CASE;
      dbms_output.PUT_LINE(solucion);
   else
      factorial(numero1);
   end if;
end;