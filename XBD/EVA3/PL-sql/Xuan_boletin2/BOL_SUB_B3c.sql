create or replace function buscaTiempoInicial(
   p_piso reservas.piso%type,
   p_habitacion reservas.habitacion%type,
   p_noches reservas.noches%type
) return date IS
   cursor c_reserva is select * from reservas 
      where piso=p_piso 
      and habitacion =p_habitacion
      and fechaentrada + noches > sysdate;
   v_reserva c_reserva%rowtype;
   fichaBusque reservas.fechaentrada%type;
   fichaRevolve reservas.fechaentrada%type;
   encuentrado boolean := FALSE;
   valido boolean := false;
BEGIN
   LOOP
      fetch c_reserva into v_reserva;
      exit when c_reserva%notfound or encuentrado = True;
      fichaBusque :=  v_reserva.fechaentrada + v_reserva.noches + 1;
      dbms_output.PUT_LINE('Encuentrado fecha inicial: '||fichaBusque);
      valido := tiempoValidoV2(v_reserva.fechaEntrada,v_reserva.noches,fichaBusque,P_noches);
      if valido = True then
         fichaRevolve := fichaBusque;
         encuentrado := True;
         dbms_output.PUT_LINE('Es no valido para '||P_noches||' noches!');
      ELSE
         dbms_output.PUT_LINE('Pero no valido para '||P_noches||' noches.');
      end if;
   end loop;

   return fichaRevolve;
END;
/