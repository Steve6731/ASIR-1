create or replace procedure MuestraDNI (
   V_nombre cliente.nombre%type,
   V_prapellido cliente.nombre%type,
   V_sgapellido cliente.nombre%type
)is
   DNI cliente.DNICL%type;
begin 
   Select DNICL into DNI from cliente
      where V_nombre = nombre and V_prapellido = prapellido and V_sgapellido = prapellido;
   dbms_output.put_line('El dni de Elena Farcía Sánchez es '||DNI);
end;
/
create or replace procedure MuestraDNI (
   V_text cliente.nombre%type,
   V_tipo varchar
)is
   DNI cliente.DNICL%type;
begin 
   case v_tipo
      when 'nomb' then Select DNICL into DNI from cliente where upper(V_text) like upper(nombre) and rownum = 1;
      when 'prap' then Select DNICL into DNI from cliente where upper(V_text) like upper(prapellido) and rownum = 1;
      when 'sgap' then Select DNICL into DNI from cliente where upper(V_text) like upper(sgapellido)  and rownum = 1;
   end case;
   dbms_output.put_line(DNI);
end;
/

EXECUTE MuestraDNI('Elena','nomb');