--------------README---------------
--este es version 2 es mucho mas simple que anteriol.
--------------Indice---------------
--L.  8- 48 PROCEDURE "reservaV2(piso,habitacion,fechaentrada,noches)"
--L. 50- 72 FUNCTION  "tiempoValidoV2(fechaEntra1,noches1,fechaEntra2,noche2)" funtion para comprobar el tiempo es valido o no
--L. 75- 95 FUNCTION  "diaConfV2(fechaEntra1,noches1,fechaEntra2,noche2)"  funtion para calcular hay cuandos dias conflictos.

create or replace PROCEDURE reservaV2(
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
      valido := tiempoValidoV2(v_reserva.fechaEntrada,v_reserva.noches,p_fechaEntrada,p_noches);
      if valido = false THEN
         diaConf := CalDiaConfV2(v_reserva.fechaEntrada,v_reserva.noches,p_fechaEntrada,p_noches);
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

create or replace function tiempoValidoV2(
   --'R' como la reserva registrada
   R_FechaEntrada reservas.fechaentrada%type,
   R_noches reservas.noches%type,
   --'N' como la reserva nueva
   N_FechaEntrada reservas.fechaentrada%type,
   N_noches reservas.noches%type
) return boolean IS
   valido boolean := False;
   R_FechaSalida reservas.fechaentrada%type := R_FechaEntrada + R_noches;
   N_FechaSalida reservas.fechaentrada%type := N_FechaEntrada + N_noches;
BEGIN
   if N_FechaEntrada > R_FechaSalida then
      valido := True;
   end if;

   if N_FechaSalida < R_FechaEntrada then
      valido := True;
   end if;

   return valido;
END;
/


create or replace function CalDiaConfV2(
   --'R' como la reserva registrada
   R_FechaEntrada reservas.fechaentrada%type,
   R_noches reservas.noches%type,
   --'N' como la reserva nueva
   N_FechaEntrada reservas.fechaentrada%type,
   N_noches reservas.noches%type
) return number IS
   R_FechaSalida reservas.fechaentrada%type := R_FechaEntrada + R_noches;
   N_FechaSalida reservas.fechaentrada%type := N_FechaEntrada + N_noches;

   cal_Inicial reservas.fechaentrada%type;
   cal_Final reservas.fechaentrada%type;

   diaConf number;

BEGIN
   diaConf := cal_Final - cal_Inicial;

   return diaConf;
END;