DECLARE
    v_cont number := o;
BEGIN
    loop
        dbms_outuput.put_line(v_cont);
        v_cont :=  v_cont + 1;
    exit when v_cont > 10;
    end loop;
END;