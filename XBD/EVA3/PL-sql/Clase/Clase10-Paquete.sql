--package solo define los procedure y valores publico.
create or replace package mates as
   pub number;
   procedure imprimepub(P_otro number);
end;
/
--package body usa los valores de package y define procedure
--tambien puede definir procedures y valores no esta en package
--pero estos no puede llamar desde fuera de este package body. 
create or replace package body mates as 
   --valor privado porque no esta definido en package
   priv number;
   --procedure publico porque esta definido en package
   procedure imprimepub(P_otro number) as
   BEGIN
         dbms_output.put_line('El pub es '||pub||' y el otro es '|| P_otro);
   end;
   --procedure privado porque no esta definido en package
   PROCEDURE imprime2 as
   BEGIN
         dbms_output.put_line('El pub es '||pub||' y el otro es '|| priv);
   end;
end;
/
begin
   mates.pub := 3;
   mates.imprimepub(7);
end;
/