create or replace PROCEDURE listaAsig(
   P_DNI alumno.DNI%type
) is
   v_codcf asignatura.codcf%type;
   cursor c_tipo(P_codcf asignatura.codcf%type) is select * from asignatura where codcf = p_codcf;
begin
   Select distinct codcf into v_codcf from asignatura a,lineamatricula lm,matricula m
      where lm.codasig = a.codasig
      and m.codmatr = lm.codmatr
      and DNI = P_DNI
      order by codcf desc;
   for v_asig in c_asig(v_codcf) LOOP
      dbms_output.put_line(v_asig.nombre);
   end loop;
end;