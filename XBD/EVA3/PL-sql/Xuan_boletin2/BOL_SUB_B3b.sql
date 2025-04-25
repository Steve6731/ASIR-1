--------------README---------------
--Cuando hago este version de programa olvido que puedo calcular con valor fecha directamente
--Por eso hago un programa tan complejo, si cres que es dificil leer este.
--es mejor que leer el version 2 que es más simple y calculo valor fecha directamente.

--------------INDICE---------------
--L. 15- 53 PROCEDURE "reserva(piso,habitacion,fechaentrada,noches)"
--L. 57-107 FUNCTION  "tiempoValido(fechaEntra1,noches1,fechaEntra2,noche2)" funtion para comprobar el tiempo es valido o no
--L.110-140 FUNCTION  "diaDeMes(mes,ano)" funtion que Ingrese el mes y el año y devuelva cuantas días hay en ese mes.
--L.143-262 FUNCTION  "diaConf(fechaEntra1,noches1,fechaEntra2,noche2)"  funtion para calcular hay cuandos dias conflictos.


create or replace PROCEDURE reserva(
   p_piso reservas.piso%type,
   p_habitacion reservas.habitacion%type,
   p_fechaEntrada reservas.fechaentrada%type,
   p_noches reservas.noches%type
) is
   cursor c_reserva is 
      select * from RESERVAS
         where piso = p_piso 
         and habitacion = p_habitacion;
   v_reserva c_reserva%rowtype;
   valido boolean;
   diaConfTotal number := 0;
   diaConf number;
   v_fechaSalida reservas.fechaentrada%type;
BEGIN
   dbms_output.put_line
      ('Quiere reservar el habitacion '||p_habitacion||' del piso '||p_piso);
   open c_reserva;
   LOOP
      fetch c_reserva into v_reserva;
      exit when c_reserva%notfound;
      valido := tiempoValido(v_reserva.fechaEntrada,v_reserva.noches,p_fechaEntrada,p_noches);
      if valido = false THEN
         diaConf := CalDiaConf(v_reserva.fechaEntrada,v_reserva.noches,p_fechaEntrada,p_noches);
         diaConfTotal := diaConfTotal + diaConf;
         v_fechaSalida := v_reserva.fechaEntrada+v_reserva.noches;
         dbms_output.put_line
            ('Lo siendo, tiempo invalido, está conflicto con un reserva entre '||
            v_reserva.fechaEntrada||' y '||v_fechaSalida||
            ' hay '||diaConf||' dias conflictos.');
      end if;
   end loop;
   if diaConfTotal = 0 then
      dbms_output.put_line
         ('El tiempo inicial que quiere es '||p_fechaEntrada||' va vivir '||p_noches||' noches');
      insert into reservas(piso,habitacion,fechaentrada,noches)
         values(p_piso,p_habitacion,p_fechaEntrada,p_noches);
   end if;
END;
/

create or replace function tiempoValido(
   --'R' como la reserva registrada
   R_FechaEntrada reservas.fechaentrada%type,
   R_noches reservas.noches%type,
   --'N' como la reserva nueva
   N_FechaEntrada reservas.fechaentrada%type,
   N_noches reservas.noches%type
) return boolean IS
   valido boolean := False;
   R_diaInicial number := extract(day from R_FechaEntrada);
   R_mesInicial number := extract(month from R_FechaEntrada);
   R_anoInicial number := extract(year from R_FechaEntrada);
   R_FechaSalida reservas.fechaentrada%type := R_FechaEntrada + R_noches;
   R_diaFinal number := extract(day from R_FechaSalida);
   R_mesFinal number := extract(month from R_FechaSalida);
   R_anoFinal number := extract(year from R_FechaEntrada);

   N_diaInicial number := extract(day from N_FechaEntrada);
   N_mesInicial number := extract(month from N_FechaEntrada);
   N_anoInicial number := extract(year from R_FechaEntrada);
   N_FechaSalida reservas.fechaentrada%type := N_FechaEntrada + N_noches;
   N_diaFinal number := extract(day from N_FechaSalida);
   N_mesFinal number := extract(month from N_FechaSalida);
   N_anoFinal number := extract(year from R_FechaEntrada);

BEGIN
   if N_anoInicial > R_anoFinal then
      valido := True;
   elsif N_anoInicial = R_anoFinal then 
      if N_mesInicial > R_mesFinal then 
         valido := True;
      elsif N_mesInicial = R_mesFinal then
         if N_diaInicial > R_diaFinal then
            valido := True;
         end if;
      end if;
   end if;

   if N_anoFinal < R_anoInicial then
      valido := True;
   elsif N_anoFinal = R_anoInicial then
      if N_mesFinal < R_mesInicial then
         valido := True;
      elsif N_mesFinal = R_mesInicial then 
         if N_diaFinal < R_diaInicial then
            valido := True;
         end if;               
      end if;
   end if;

   return valido;
END;
/


create or replace function diaDeMes(
   mes number,
   ano number
) return number is
   dia number;
BEGIN
   case mes
      when 1 then dia:= 31;
      when 3 then dia:= 31;
      when 5 then dia:= 31;
      when 7 then dia:= 31;
      when 8 then dia:= 31;
      when 10 then dia:= 31;
      when 12 then dia := 31;

      when 4 then dia:= 30;
      when 6 then dia:= 30;
      when 9 then dia:= 30;
      when 11 then dia := 30;

      when 2 then 
         if mod(ano,4) = 0 then
            dia := 29;
         else
            dia := 28;
         end if;

   end case;
   return dia;
END;
/


create or replace function CalDiaConf(
   --'R' como la reserva registrada
   R_FechaEntrada reservas.fechaentrada%type,
   R_noches reservas.noches%type,
   --'N' como la reserva nueva
   N_FechaEntrada reservas.fechaentrada%type,
   N_noches reservas.noches%type
) return number IS
   R_diaInicial number := extract(day from R_FechaEntrada);
   R_mesInicial number := extract(month from R_FechaEntrada);
   R_anoInicial number := extract(year from R_FechaEntrada);
   R_FechaSalida reservas.fechaentrada%type := R_FechaEntrada + R_noches;
   R_diaFinal number := extract(day from R_FechaSalida);
   R_mesFinal number := extract(month from R_FechaSalida);
   R_anoFinal number := extract(year from R_FechaEntrada);

   N_diaInicial number := extract(day from N_FechaEntrada);
   N_mesInicial number := extract(month from N_FechaEntrada);
   N_anoInicial number := extract(year from R_FechaEntrada);
   N_FechaSalida reservas.fechaentrada%type := N_FechaEntrada + N_noches;
   N_diaFinal number := extract(day from N_FechaSalida);
   N_mesFinal number := extract(month from N_FechaSalida);
   N_anoFinal number := extract(year from R_FechaEntrada);

   cal_InicialconN boolean;
   cal_FinalconN boolean;
   cal_anoInicial number;
   cal_anoFinal number;
   cal_diaInicial number;
   cal_diaFinal number;
   cal_mesInicial number;
   cal_mesFinal number;
   diaConf number := 0; 

BEGIN
   if N_anoInicial > R_anoInicial then
      cal_InicialconN := True;
   elsif N_anoInicial = R_anoInicial then
      if N_mesInicial > R_mesInicial then
         cal_InicialconN := True;
      elsif N_mesInicial = R_mesInicial then
         if N_diaInicial > R_diaInicial then
            cal_InicialconN := True;
         else
            cal_InicialconN := False;
         end if;
      else
         cal_InicialconN := False;
      end if;
   else
      cal_InicialconN := False;
   end if;

   if N_anoFinal < R_anoFinal then
      cal_FinalconN := True;
   elsif N_anoFinal = R_anoFinal then
      if N_mesFinal < R_mesFinal then
         cal_FinalconN := True;
      elsif N_mesFinal = R_mesFinal then
         if N_diaFinal < R_diaFinal then
            cal_FinalconN := True;
         else
            cal_FinalconN := False;
         end if;
      else
         cal_FinalconN := False;
      end if;
   else
      cal_FinalconN := False;
   end if;

   if cal_InicialconN = True then
      cal_anoInicial := N_anoInicial;
      cal_mesInicial := N_mesInicial;
      cal_diaInicial := N_diaInicial;
   else
      cal_anoInicial := R_anoInicial;
      cal_mesInicial := R_mesInicial;
      cal_diaInicial := R_diaInicial;
   end if;

   if cal_FinalconN = True then
      cal_anoFinal := N_anoFinal;
      cal_mesFinal := N_mesFinal;
      cal_diaFinal := N_diaFinal;
   else
      cal_anoFinal := R_anoFinal;
      cal_mesFinal := R_mesFinal;
      cal_diaFinal := R_diaFinal;
   end if;

   if cal_anoFinal = cal_anoInicial then
      if cal_mesFinal = cal_mesInicial then
         diaConf := diaConf - cal_diaInicial + cal_diaFinal ;
      else
         for i in cal_mesInicial..(cal_mesFinal-1) loop
            diaConf := diaConf + DiadeMes(i,cal_anoInicial);
         end loop;
         diaConf := diaconf - cal_diaInicial + cal_diaFinal;
      end if;
   else
      for i in cal_anoInicial..(cal_anoFinal-1) loop
         if mod(i,4)=0 then
            diaConf := diaConf + 366;
         else
            diaConf := diaConf + 365;
         end if;
      end loop;
      for mes_I in 1..(cal_mesInicial-1) loop
         diaConf := diaConf - DiadeMes(mes_I,cal_anoInicial);
      end loop;
      for mes_F in 1..(cal_mesFinal-1) loop
         diaConf := diaConf + DiadeMes(mes_F,cal_anoFinal);
      end loop;
         diaConf := diaconf - cal_diaInicial + cal_diaFinal;
   end if;

   return diaConf;
END;
/
