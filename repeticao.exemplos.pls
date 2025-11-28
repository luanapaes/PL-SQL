-- Crie um bloco PL/SQL que:
-- -> Declare duas variáveis numéricas a e b
-- -> Some as duas
-- -> Exiba o resultado com DBMS_OUTPUT.PUT_LINE

DECLARE
    n number := 4;
BEGIN
    IF MOD(n, 2) = 0 then
        dbms_output.put_line('Par');
    ELSE dbms_output.put_line('Impar');
    END IF;
END;

-- Crie um bloco que:
-- -> Leia um número (pode colocar fixo na variável)
-- -> Verifique se ele é par ou ímpar
-- -> Mostre na tela

DECLARE 
    n number := 1;
BEGIN
    loop
        dbms_output.put_line(n);
        n := n + 1;
        exit when n > 10;
    end loop;
END;

-- Crie um bloco que:
-- -> Receba um número N
-- -> Some todos os valores de 1 até N usando WHILE
-- -> Imprima o total

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

-- Escreva um bloco que:
-- -> Percorra os números de 1 a 10
-- -> Imprima apenas os números pares

DECLARE 
    n number := 1;
BEGIN
    for i in 1 .. 10 loop
        if MOD(i, 2) = 0 then
            dbms_output.put_line(i);
            end if;
    end loop;     
END;

