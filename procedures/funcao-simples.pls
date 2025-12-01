CREATE OR REPLACE function f_contar_clientes return number is 
v_total number;
BEGIN
    SELECT COUNT(*) INTO v_total FROM clientes;
    return v_total;
END f_contar_clientes;

BEGIN
    dbms_output.put_line('Total: ' || f_contar_clientes());
END;