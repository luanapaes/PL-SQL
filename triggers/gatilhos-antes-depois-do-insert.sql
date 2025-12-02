-- EXERCÍCIO EXTRA
-- Criar uma trigger na tabela itens_pedido para verificar o estoque 
-- ao inserir um item. Após inserir o item, criar uma trigger para 
-- atualizar o estoque.

CREATE OR REPLACE TRIGGER trg_itens_pedidos
BEFORE INSERT ON itens_pedido
FOR EACH ROW
DECLARE
    v_quantidade_produto_estoque number;
BEGIN
    SELECT quantidade into v_quantidade_produto_estoque
    FROM estoque 
    WHERE nome_produto = :NEW.produto;
    
    IF v_quantidade_produto_estoque < :NEW.quantidade THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não há quantidade disponível no estoque.');
    END IF;
END;

CREATE OR REPLACE TRIGGER atualiza_estoque
AFTER INSERT ON itens_pedido
FOR EACH ROW
DECLARE 
    quantidade_produto estoque.quantidade%type;
BEGIN   
        SELECT quantidade INTO quantidade_produto
        FROM estoque
        WHERE nome_produto = :NEW.produto;
        
        UPDATE estoque
        SET quantidade = quantidade_produto - :NEW.quantidade
        WHERE nome_produto = :NEW.produto;
END;


