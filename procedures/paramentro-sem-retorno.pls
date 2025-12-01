-- procedure sem parâmetro
CREATE OR REPLACE PROCEDURE hello_world IS
BEGIN
    dbms_output.put_line('Hello!');
END hello_world;

-- chamada
call hello_world();

-- procedure que recebe parâmetro
CREATE OR REPLACE PROCEDURE hello_nome(nome IN varchar) IS
BEGIN
    dbms_output.put_line('Olá, ' || nome);
END hello_nome;

-- chamada
declare 