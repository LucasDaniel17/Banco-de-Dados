CREATE SCHEMA AGENDA;

use agenda;

CREATE TABLE CATEGORIA(
	id int not null primary key auto_increment,
    nome varchar(45) not null
);

CREATE TABLE CONTATO(
	ID INT NOT NULL primary KEY auto_increment,
    NOME VARCHAR(45) NOT NULL,
    EMAIL VARCHAR(45) NOT NULL,
    FONE VARCHAR(45) NOT NULL,
    CELULAR VARCHAR(45) NOT NULL,
    ID_CATEGORIA INT NOT NULL,
    constraint fk_id_categoria foreign key (id_categoria) references CATEGORIA(id)
);

insert into categoria (nome) values 
	("Amigos"),
    ("Trabalho"),
    ("Familia");
    
insert into contato (nome, email, fone, celular, id_categoria) values
	("cicero", "cicerolobo1000@gmail.com", "32810643", "75516482131", 1),
    ("jubileu", "jubileu@gmail.com", "87542115", "798513174", 2),
    ("bililiu", "bililiu@gmail.com", "40028922", "7523194389", 3);

select * from categoria;
select * from contato;