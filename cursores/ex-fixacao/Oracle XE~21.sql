create table aluno (
    id number,
    nome varchar(100),
    turma varchar(20)
);

insert into aluno (id, nome, turma) values (1, 'luana', '2025.1');
insert into aluno (id, nome, turma) values (2, 'ingrid', '2025.1');
insert into aluno (id, nome, turma) values (3, 'lais', '2025.1');
insert into aluno (id, nome, turma) values (4, 'isabela', '2025.1');

insert into aluno (id, nome, turma) values (5, 'laura', '2024.2');
insert into aluno (id, nome, turma) values (6, 'julia', '2025.2');

insert into aluno (id, nome, turma) values (7, 'alex', '2025.2');

select * from aluno where id > 5;


DECLARE 
    CURSOR c_aluno IS 
    SELECT nome, turma
    FROM aluno
    WHERE id > 3;
    
    vNome aluno.nome%type;
    vTurma aluno.turma%type;
BEGIN
    OPEN c_aluno;
    LOOP
    FETCH c_aluno INTO vNome, vTurma;
    EXIT WHEN c_aluno%NOTFOUND;
        CASE
            WHEN vTurma = '2024.1' OR vTurma = '2024.2' then
                dbms_output.put_line('Restam 3 anos para a formatura!');
            WHEN vTurma = '2025.1' OR vTurma = '2025.2' then
                dbms_output.put_line('Restam 4 anos para a formatura!');
            ELSE 
                dbms_output.put_line('Restam mais de 4 anos para sua formatura, se manhatema firme!');
        END CASE;
    END LOOP;
    CLOSE c_aluno;
END;