-- Excluir todos os empregados com salário abaixo de 1000 e exibir o total excluído.

DECLARE
    CURSOR c_emp IS
        SELECT salario, id
        FROM empregados;

    vSalario empregados.salario%TYPE;
    id_func  empregados.id%TYPE;

    vCount NUMBER := 0;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO vSalario, id_func;
        EXIT WHEN c_emp%NOTFOUND; 

        IF vSalario < 1000 THEN
            DELETE FROM empregados
            WHERE id = id_func;

            vCount := vCount + SQL%ROWCOUNT;
        END IF;

    END LOOP;
    CLOSE c_emp;

    dbms_output.put_line('Total excluídos: ' || vCount);
END;