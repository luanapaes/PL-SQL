-- Exercício 1 – Cursor para reajuste de salário
-- Crie um bloco PL/SQL que:
--  -> Percorra a tabela empregados usando um cursor.
--  -> Aumente o salário em 5% se o salário for menor que 2000.
--  -> Exiba uma mensagem com o nome e o novo salário.

DECLARE 
    CURSOR c_emp IS 
    SELECT nome, salario
    FROM empregados;
    
    vNome empregados.nome%type;
    vSalario empregados.salario%type;
BEGIN
    OPEN c_emp;
    LOOP 
    FETCH c_emp INTO vNome, vSalario;
    EXIT WHEN c_emp%NOTFOUND;
    
    IF vSalario < 2000 then
        vSalario := vSalario + vSalario * 0.05;
        dbms_output.put_line(vNome || ' - ' || vSalario);
    ELSE 
        dbms_output.put_line('Funcionário não elegível para receber aumento.');
    END IF;
    END LOOP; 
END;