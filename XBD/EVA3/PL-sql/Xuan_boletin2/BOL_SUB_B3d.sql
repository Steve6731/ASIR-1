create or replace PROCEDURE reservaV3(
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
   v_fechaSalida reservas.fechaentrada%type;
   v_fechaInicial reservas.fechaentrada%type := p_fechaEntrada;
   valido boolean;
   diaConfTotal number := 0;
   diaConf number;
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
         values(p_piso,p_habitacion,v_fechaInicial,p_noches);
   ELSE
      dbms_output.put_line
         ('Va buscar un tiempo inicial nuevo');
      v_fechaInicial := buscaTiempoInicial(p_piso,p_habitacion,p_noches);
      if tiempoValidoV2(v_reserva.fechaEntrada,v_reserva.noches,v_fechaInicial,p_noches) = false then
         dbms_output.put_line
            ('Lo siendo, no encuentramos un tiempo inicial valido');
      else
         dbms_output.PUT_LINE
            ('La fecha final seleccionada es '||v_fechaInicial);
         insert into reservas(piso,habitacion,fechaentrada,noches)
            values(p_piso,p_habitacion,v_fechaInicial,p_noches);
      end if;
   end if;
END;
/
