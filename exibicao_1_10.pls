DECLARE
    v_cont NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line(v_cont);

        v_cont := v_cont + 1;

        EXIT WHEN v_cont > 10;
    END LOOP;
END;