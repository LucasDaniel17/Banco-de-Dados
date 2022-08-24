CREATE DATABASE VENDAS;

USE VENDAS;

CREATE TABLE PRODUTOS (
    ID_PRODUTO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(30),
    ESTOQUE_PRODUTO INT NOT NULL,
    PRECO_PRODUTO DOUBLE
);
   
 CREATE TABLE VENDA (
    ID_VENDA INT NOT  NULL PRIMARY KEY AUTO_INCREMENT,
    NUMERO_VENDA INT NOT NULL,
    ID_PRODUTO INT,
    QUANTIDADE INT
);

insert into produtos (descricao, estoque_produto, preco_produto) value ("cuscuz", 35, 4);
insert into produtos (descricao, estoque_produto, preco_produto) value ("arroz", 20, 6);
insert into produtos (descricao, estoque_produto, preco_produto) value ("feijão", 50, 8);

select * from produtos;

Insert into VENDA (numero_venda, id_produto, quantidade) value (10, 1, 15);
Insert into VENDA (numero_venda, id_produto, quantidade) value (3, 2, 5);

DELIMITER $$
CREATE TRIGGER ATUALIZAR_ESTOQUE AFTER INSERT ON VENDA
FOR EACH ROW

BEGIN
	UPDATE PRODUTOS SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - NEW.QUANTIDADE
    WHERE ID_PRODUTO = NEW.ID_PRODUTO;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER DEVOLUCAO_ESTOQUE AFTER DELETE ON VENDA
FOR EACH ROW

BEGIN
	UPDATE PRODUTOS SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO + OLD.QUANTIDADE
    WHERE ID_PRODUTO = OLD.ID_PRODUTO;
END $$
DELIMITER ;

select * from venda;

DELETE FROM VENDA where id_venda = 4;