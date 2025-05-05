--insert signaturas(nombre,codigo,numhora,bilingue,codciclo) si paso codigo de ciclo no exixte amosa error nomhoras menor que 40 amosa error
create or replace PROCEDURE insertSignatura (
   P_nombre asignatura.nombre%type,
   P_codigo asignatura.codasig%type,
   P_numhora asignatura.numhoras%type,
   P_bilingue asignatura.B%type
) as
   Vhora boolean := false;
   Vnombre boolean := false;
   Vcodigo boolean := false;
begin
   dbms_output.put_line('');
end;