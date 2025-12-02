CREATE TABLE t_empregados (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(50),
    cargo VARCHAR2(30),
    salario NUMBER(10,2)
);
insert into t_empregados (id, nome, cargo, salario) values (1, 'Luana', 'Dev', 5000);
insert into t_empregados (id, nome, cargo, salario) values (2, 'Grazi', 'Dev', 5000);
insert into t_empregados (id, nome, cargo, salario) values (3, 'Rogerio', 'Gerente', 5000);
insert into t_empregados (id, nome, cargo, salario) values (4, 'Isabel', 'Diretora', 5000);
insert into t_empregados (id, nome, cargo, salario) values (5, 'Pedro', 'Dev', 5000);


CREATE TABLE log_emp (
    id_log NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_emp NUMBER,
    acao VARCHAR2(20),
    data_acao DATE
);

CREATE OR REPLACE TRIGGER trg_log_emp
AFTER INSERT ON t_empregados
FOR EACH ROW
BEGIN
    INSERT INTO log_emp (id_emp, acao, data_acao)
    VALUES (:NEW.id, 'INSERIDO', SYSDATE);
END;

CREATE TABLE log_salarios (
    id_emp NUMBER,
    salario_antigo number,
    salario_novo number,
    data_alteracao DATE
);

/*Exercício 1 – Trigger de auditoria
Crie uma trigger que registre em uma tabela log_salarios toda vez que um salário for alterado, 
armazenando: id_emp, salario_antigo, salario_novo, data_alteracao
Dica: use :OLD.salario e :NEW.salario.*/

CREATE TABLE log_salarios (
    id_emp NUMBER,
    salario_antigo number,
    salario_novo number,
    data_alteracao DATE
);

CREATE OR REPLACE TRIGGER trg_log_salarios
AFTER UPDATE OF salario ON t_empregados
FOR EACH ROW
BEGIN
    INSERT INTO log_salarios (id_emp, salario_antigo, salario_novo, data_alteracao)
    VALUES (:OLD.id, :OLD.salario, :NEW.salario, SYSDATE);
END;

UPDATE t_empregados
SET salario = 25000
where id = 3;

/* 
Exercício 2 – Impedir exclusão de gerentes
Crie uma trigger que bloqueie exclusões de empregados com cargo 'GERENTE'.
Dica: utilize BEFORE DELETE e RAISE_APPLICATION_ERROR.
*/

CREATE OR REPLACE TRIGGER trg_no_delete_gerente
BEFORE DELETE ON t_empregados
FOR EACH ROW
BEGIN
  IF :OLD.cargo = 'Gerente' THEN
    RAISE_APPLICATION_ERROR(-20001, 'Não é permitido excluir um gerente!');
  END IF;
END;

delete from t_empregados
where cargo = 'Gerente';

select * from t_empregados;