DECLARE
    n number := 4;
BEGIN
    IF MOD(n, 2) = 0 then
        dbms_output.put_line('Par');
    ELSE dbms_output.put_line('Impar');
    END IF;
END;


DECLARE 
    n number := 1;
BEGIN
    loop
        dbms_output.put_line(n);
        n := n + 1;
        exit when n > 10;
    end loop;
END;

DECLARE 
    valor number;
    i number := 0;
    ac number := 0;
BEGIN
    valor := '&valor';
    
    while i < valor loop
        ac := valor + 1;
        i := i + 1;
    end loop;
    dbms_output.put_line(ac);
END;

DECLARE 
    n number := 1;
BEGIN
    for i in 1 .. 10 loop
        if MOD(i, 2) = 0 then
            dbms_output.put_line(i);
            end if;
    end loop;     
END;

