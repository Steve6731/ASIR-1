create or replace PROCEDURE CalPrecio(
   p_piso reservas.piso%type,
   p_habitacion reservas.habitacion%type,
   p_fechaEntrada reservas.fechaentrada%type,
   p_noches reservas.noches%type
) is
   cursor c_temporadas is select * from temporadas where nombre = 'Alta';
   v_temp c_temporadas%rowtype;
   v_tipo habitaciones.tipo%type;
   precio number;
   precioTotal number;
   diaAlta number := 0;

   p_fechaSalida reservas.fechaentrada%type := p_fechaEntrada + p_noches;
   anoInicial number := extract(year from p_fechaEntrada);
   anoFinal number := extract(year from p_fechaSalida);
   InicioAlta date;
   FinalAlta date;
   cal_fechaInicial date;
   cal_fechaFinal date;

   BEGIN
      for ano in anoInicial..anoFinal loop
         for v_temp in c_temporadas loop
            InicioAlta := to_date(v_temp.DIAINICIO||'/'||v_temp.MESINICIO||'/'||ano,'DD/MM/YYYY');
            FinalAlta := to_date(v_temp.DIAFIN||'/'||v_temp.MESFIN||'/'||ano,'DD/MM/YYYY');
            if p_fechaEntrada > InicioAlta then
               cal_fechaInicial := p_fechaEntrada;
            else
               cal_fechaInicial := InicioAlta;
            end if;
            if p_fechaSalida < FinalAlta then
               cal_fechaFinal := p_fechaSalida;
            else
               cal_fechaFinal := FinalAlta;
            end if;
            if cal_fechaFinal - cal_fechaInicial > 0 then
               diaAlta := diaAlta + (cal_fechaFinal - cal_fechaInicial);
            end if;
         end loop;
      end loop;

   select tipo into v_tipo
      from habitaciones 
      where piso = p_piso
      and habitacion = p_habitacion;
   case v_tipo
      when 'Individual' then precio := 100;
      when 'Doble' then precio := 120;
      when 'Suite' then precio := 200;
   end case;
   precioTotal := (p_noches-DiaAlta)*precio + DiaAlta*precio*1.3;
   dbms_output.put_line('Dia dentro de alta es '||diaAlta);
   dbms_output.put_line('Precio total es '||precioTotal);
END;
/
execute CalPrecio(1,1,'22/05/25',20);

select * from temporadas
         where nombre = 'Alta';