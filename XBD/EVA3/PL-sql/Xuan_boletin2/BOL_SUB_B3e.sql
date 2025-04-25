--no se como combina números en fechas.
--entonces hay parte es copiado por CalDiaConf de version 1 de ejecicio 3b.

create or replace PROCEDURE CalPrecio(
   p_piso reservas.piso%type,
   p_habitacion reservas.habitacion%type,
   p_fechaEntrada reservas.fechaentrada%type,
   p_noches reservas.noches%type
) is
   cursor c_temporadas is 
      select * from temporadas
         where nombre = 'Alta';
   v_temp c_temporadas%rowtype;
   v_tipo habitacion.tipo%type;
   precio number;
   precioTotal number;
   DiaAlta number := 0;
   DiaAltaCadaAno number;

   diaInicial number := extract(day from p_fechaEntrada);
   mesInicial number := extract(month from p_fechaEntrada);
   anoInicial number := extract(year from p_fechaEntrada);
   FechaSalida reservas.fechaentrada%type := p_fechaEntrada + p_noches;
   diaFinal number := extract(day from FechaSalida);
   mesFinal number := extract(month from FechaSalida);
   anoFinal number := extract(year from FechaSalida);

   cal_InicialconP BOOLEAN := false;
   cal_FinalconP BOOLEAN := false;
   cal_diaInicial number;
   cal_mesInicial number;
   cal_diaFinal number;
   cal_mesFinal number;
   cal_anoI BOOLEAN := false;
   cal_anoF BOOLEAN := false;

BEGIN

   for v_temp in c_temporadas loop
      if mesInicial > v_temp.mesInicio then
            cal_InicialconP := True;
      elsif mesInicial = v_temp.mesInicio then
         if diaInicial > v_temp.diaInicio then
            cal_InicialconP := True;
         end if;
      end if;

      if cal_InicialconP = True then
         cal_diaInicial := diaInicial;
         cal_mesInicial := mesInicial;
      else
         cal_diaInicial := v_temp.diaInicio;
         cal_mesInicial := v_temp.mesInicio;
      end if;

      if mesFinal > v_temp.mesFIN then
            cal_FinalconP := True;
      elsif mesInicial = v_temp.mesFIN then
         if diaInicial > v_temp.diaFIN then
            cal_FinalconP := True;
         end if;
      end if;

      if cal_InicialconP = True then
         cal_diaFinal := diaFinal;
         cal_mesFinal := mesFinal;
      else
         cal_diaFinal := v_temp.diaFIN;
         cal_mesFinal := v_temp.mesFIN;
      end if;
      
      if anoInicial = anoFinal then
         for mes in cal_mesInicial..(cal_mesFinal-1) loop
            DiaAlta := DiaAlta + diadeMes(mes,anoInicial);
         end loop;
         DiaAlta := DiaAlta - cal_diaInicial + cal_diaFinal+1;
      else
         if cal_mesInicial < v_temp.mesFIN then
               cal_anoI := True;
         elsif cal_mesInicial = v_temp.mesFIN then
            if cal_diaInicial < v_temp.diaFIN then
               cal_anoI := True;
            end if;
         end if;

         if cal_anoI = True then
            for mesI in cal_mesInicial..v_temp.mesFIN loop
               DiaAlta := DiaAlta + diadeMes(mesI,anoInicial);
            end loop;
            DiaAlta := DiaAlta - cal_diaInicial;
         end if;

         if cal_mesFinal > v_temp.mesInicio then
               cal_anoF := True;
         elsif cal_mesFinal = v_temp.mesInicio then
            if cal_diaFinal > v_temp.diaInicio then
               cal_anoF := True;
            end if;
         end if;

         if cal_anoF = True then
            for mesF in v_temp.mesInicio..cal_mesFinal-1 loop
               DiaAlta := DiaAlta + diadeMes(mesF,anoFinal);
            end loop;
            DiaAlta := DiaAlta + cal_diaInicial;
         end if;

         if anoInicial - anoFinal > 2 then 
            for AltaMes in v_temp.mesFIN..v_temp.mesFIN-1 loop
               DiaAltaCadaAno := DiaAltaCadaAno + diadeMes(AltaMes,anoInicial);
            end loop;
            DiaAltaCadaAno := DiaAltaCadaAno - v_temp.diaInicio + v_temp.diaFIN+1;
            for ano in (anoInicial+1)..(anoFinal-1) loop
               DiaAlta := DiaAlta + DiaAltaCadaAno;
            end loop;
         end if;

      end if;
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
   dbms_output.put_line('Precio total es '||precioTotal);
END;
/
