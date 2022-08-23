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

DELIMITER $$

CREATE TRIGGER ATUALIZAR_ESTOQUE AFTER INSERT ON VENDA
FOR EACH ROW

BEGIN
	UPDATE PRODUTOS SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - NEW.QUANTIDADE
    WHERE ID_PRODUTO = NEW.ID_PRODUTO;
END $$

DELIMITER ;
