CREATE OR REPLACE PROCEDURE dobro(numero IN number, resultado OUT number) IS
BEGIN
    resultado := numbero * 2;
END dobro;

-- para fazer a chamada é necessário um bloco
DECLARE
    resultado number;
BEGIN
    dobro(10, resultado); // passa o valor e a variável onde o retorno ficará armazenado
    dbms_output.put_line('Dobro: ' || resultado)
END;