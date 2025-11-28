DECLARE
    -- cdeclaração do cursor, ex: CURSOR c_emp IS select
    -- declaração de variáveis, ex: v_nome, v_salario
BEGIN
    OPEN cursor;

    LOOP
        FETCH cursor INTO variáveis;
        EXIT WHEN cursor acabou  // (condição);

        -- >>> após o exit pode colocar if, calculos etc <<<
        -- se precisar comparar salário, nome, idade, etc.
        -- aqui aplica uma decisão sobre o registro.
    END LOOP;

    CLOSE cursor;
END;
