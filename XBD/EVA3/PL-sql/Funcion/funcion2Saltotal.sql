create or replace function Saltotal (
   DNI employees.employee_id%type
) RETURN number IS 
    Total number ;
BEGIN
    Select salary*(1+nvl(commission_pct,0)) into Total from employees where EMPLOYEE_ID = DNI;
    return Total;
END;