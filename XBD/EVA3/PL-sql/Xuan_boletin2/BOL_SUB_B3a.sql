create or replace procedure hotelDate IS
BEGIN
   for v_piso in 1..11 LOOP
      for v_habitacion in 1..20 loop
         insert into habitaciones(piso,habitacion,tipo)
            values(v_piso,v_habitacion,'Doble');
      end loop;
      for v_habitacion in 21..25 loop
         insert into habitaciones(piso,habitacion,tipo)
            values(v_piso,v_habitacion,'Individual');
      end loop;
   end loop;
   for v_suite in 1..8 loop
      insert into habitaciones(piso,habitacion,tipo)
         values(12,v_suite,'Suite');
   end loop;
end;
/
execute hotelDate;