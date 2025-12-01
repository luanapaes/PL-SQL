-- Exercício 1
-- Crie uma procedure chamada aumentar_salario que receba o id do funcionário e um percentual de aumento, e atualize o salário.
-- Dica: Use UPDATE funcionarios SET salario = salario * (1 + percentual/100).
CREATE OR REPLACE PROCEDURE aumentar_salario(func_id IN number, percentual_aumento IN number, novo_salario OUT number) IS
BEGIN 
    UPDATE funcionarios
    SET salario = salario * (1 + percentual_aumento/100)
    WHERE id_func = func_id;
    
    SELECT salario
    INTO novo_salario
    FROM funcionarios
    WHERE id_func = func_id;
END aumentar_salario;

DECLARE
    id_funcionario number;
    percentual_aumento number;
    novo_salario number;
BEGIN
    id_funcionario := '&id_funcionario';
    percentual_aumento := '&percentual_aumento';
    
    aumentar_salario(id_funcionario, percentual_aumento, novo_salario);
    dbms_output.put_line('Novo salário do funcionário com ID ' || id_funcionario || ' R$' || novo_salario);
END;
 
-- Exercício 2
-- Crie uma function chamada situacao_cliente que receba o valor total de compras e retorne:
-- -> 'VIP' se o valor > 5000
-- -> 'REGULAR' caso contrário
CREATE OR REPLACE function f_situacao_cliente(valor_total IN number) return varchar IS situacao varchar(20);
BEGIN
    IF valor_total > 5000 then
        situacao := 'VIP';
    ELSE 
        situacao := 'REGULAR';
    END IF;
    return situacao;
END f_situacao_cliente;

DECLARE
    valor_total number;
BEGIN
    valor_total := '&valor_total';
    dbms_output.put_line('Situação: ' || f_situacao_cliente(valor_total));
END;
select * from pedidos;
-- Exercício 3
-- Crie uma procedure contar_pedidos_cliente que receba o id do cliente e retorne 
-- (via parâmetro OUT)o número de pedidos desse cliente.
CREATE OR REPLACE PROCEDURE t_contar_pedidos_cliente(cliente_id IN number, qtd_pedidos OUT number)IS
BEGIN
    SELECT COUNT(*) INTO qtd_pedidos
    FROM pedidos
    WHERE id_cliente = cliente_id;
    
END t_contar_pedidos_cliente;

declare
    id_cliente number;
    qtd_pedidos number;
begin
    id_cliente := '&id_cliente';
    t_contar_pedidos_cliente(id_cliente, qtd_pedidos);
    
    dbms_output.put_line('Quantidade de pedidos do cliente com ID ' || id_cliente || ': ' || qtd_pedidos);
end;
SELECT * FROM itens_pedido;
-- Exercício 4
-- Crie uma function valor_total_pedido que receba o id do pedido e retorne o valor total
-- (quantidade * preço_unitário) dos itens do pedido.
CREATE OR REPLACE FUNCTION f_valor_total_pedido(p_id_pedido IN number) return number 
IS 
quantidade number;
preco_unitario number;
valor_total number;
BEGIN 
    SELECT quantidade, preco_unitario
    INTO quantidade, preco_unitario
    FROM itens_pedido
    WHERE id_pedido = p_id_pedido;
    
    valor_total := quantidade * preco_unitario;
    return valor_total;
END f_valor_total_pedido;

DECLARE
    v_id_pedido number;
BEGIN
    v_id_pedido := '&id_pedido';
    
    dbms_output.put_line('Valor total dos pedidos R$' || _valor_total_pedido(v_id_pedido));
END;
    