create or replace procedure factorial (
   numero in number
) IS 
    i number := 1;
    sumNum number := 0;
BEGIN
    while i <= numero loop
        sumNum := sumNum + i;
        i := i + 1;
    end loop;
    dbms_output.put_line(sumNum);
END;
/