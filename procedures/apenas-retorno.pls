CREATE OR REPLACE PROCEDURE contar_clientes(total OUT number) IS
BEGIN
    SELECT count(*) INTO p_total FROM clientes;
END contar_clientes;

DECLARE 
    v_total number;
BEGIN
    contar_clientes(v_total);
    dbms_output.put_line('Total: ' || total_clientes);
END;
