create or replace FUNCTION apruebaTodo (
   P_DNI alumno.DNI%type
) RETURN BOOLEAN is
   P_nota lineamatricula.nota%type;
   P_proba BOOLEAN := False;
BEGIN
   Select count(lm.nota) into P_nota from lineamatricula lm,matricula m
      where m.DNI = P_DNI and lm.codMatr = m.codMatr and lm.nota >= 5;
   if P_nota = 0 THEN
      P_proba := True;
   end if;
   return P_proba;
end;
/
   Select lm.nota from lineamatricula lm,matricula m
      where m.DNI = 51437206 and lm.codMatr = m.codMatr;