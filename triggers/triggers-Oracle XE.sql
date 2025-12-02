CREATE OR REPLACE PROCEDURE nome_procedure (
    parametro1 IN tipo,
    parametro2 OUT tipo
) IS
-- Declarações de variáveis locais
BEGIN
-- Corpo da procedure
-- Lógica do programa
EXCEPTION
-- Tratamento de erros
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END nome_procedure;

