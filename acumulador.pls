DECLARE
    i number := 1;
    ac number = 0;
BEGIN
    while i <= 5 loop
        ac := ac + i;
        i := i + 1;
    end loop
        dbms_output.put_line('Soma:' || ac);
END;