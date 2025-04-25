create or replace function FunFact (
   numero number
) RETURN number IS 
    i number := 1;
    sumNum number := 0;
BEGIN
    while i <= numero loop
        sumNum := sumNum + i;
        i := i + 1;
    end loop;
    return sumNum;
END;