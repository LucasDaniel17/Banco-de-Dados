use biblioteca;

create database biblioteca;

-- CRIAÇÃO DAS TABELAS:

CREATE TABLE ENDERECO (
	idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bairroEndereco VARCHAR (45) NOT NULL,
    ruaEndereco VARCHAR (45) NOT NULL,
    numeroEndereco INT NOT NULL,
    cepEndereco VARCHAR (10) NOT NULL,
    cidadeEndereco VARCHAR (20) NOT NULL
);

CREATE TABLE BIBLIOTECA (
	idBiblioteca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeBiblioteca VARCHAR (60) NOT NULL,
    tipoBiblioteca VARCHAR (15) NOT NULL,
    idEndereco INT,
    constraint fk_idEndereco_Biblioteca foreign key (idEndereco)
		references ENDERECO (idEndereco)
);

CREATE TABLE FUNCIONARIO (
	idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFuncionario VARCHAR (45) NOT NULL,
    cpfFuncionario VARCHAR (15) NOT NULL,
    idBiblioteca INT,
    constraint fk_idBiblioteca_Funcionario foreign key (idBiblioteca)
		references BIBLIOTECA (idBiblioteca),
    idEndereco INT,
    constraint fk_idEndereco_Funcionario foreign key (idEndereco)
		references ENDERECO (idEndereco)
);

CREATE TABLE USUARIO (
	idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeUsuario VARCHAR (45) NOT NULL,
    cpfUsuario VARCHAR (15) NOT NULL, 
    emailUsuario VARCHAR (45) NOT NULL,
    idEndereco INT,
    constraint fk_idEndereco_Usuario foreign key (idEndereco)
		references ENDERECO (idEndereco)
);

CREATE TABLE TELEFONE (
	idTelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dddTelefone INT NOT NULL,
    numeroTelefone INT NOT NULL,
    idBiblioteca INT,
    constraint fk_idBiblioteca_Telefone foreign key (idBiblioteca)
		references BIBLIOTECA (idBiblioteca),
	idFuncionario INT, 
    constraint fk_idFuncionario_Telefone foreign key (idFuncionario)
		references FUNCIONARIO (idFuncionario),
	idUsuario INT,
    constraint fk_idUsuario_Telefone foreign key (idUsuario)
		references USUARIO (idUsuario)
);

CREATE TABLE EDITORA (
	idEditora INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEditora VARCHAR (45) NOT NULL,
    cnpjEditora VARCHAR (20) NOT NULL,
    emailEditora VARCHAR (45) NOT NULL
);

CREATE TABLE LIVRO (
	idLivro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeLivro VARCHAR (45) NOT NULL,
    anoPublicacao VARCHAR (10) NOT NULL,
    categoriaLivro VARCHAR (20) NOT NULL,
    quantidadeLivro INT NOT NULL,
    idEditora INT,
    constraint fk_idEditora_Livro foreign key (idEditora) 
		references EDITORA (idEditora)
);

CREATE TABLE CADASTRO_LOCACAO (
	idCadastroLocacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dataLocacao VARCHAR (10) NOT NULL,
    dataDevolucao VARCHAR (10) NOT NULL,
    descricaoLocacao VARCHAR (60) NOT NULL,
    idUsuario INT,
    constraint fk_idUsuario_CadastroLocacao foreign key (idUsuario)
		references USUARIO (idUsuario),
	idFuncionario INT,
    constraint fk_idFuncionario_CadastroLocacao foreign key (idFuncionario)
		references FUNCIONARIO (idFuncionario)
);

CREATE TABLE CADASTRO_LOCACAO_HAS_LIVRO (
	idCadastroLocacao INT NOT NULL,
    constraint fk_idCadastroLocacao_CadastroLocacaoHasLivro foreign key (idCadastroLocacao)
		references CADASTRO_LOCACAO (idCadastroLocacao),
	idLivro INT NOT NULL,
    constraint fk_idLivro_CadastroLocacaoHasLivro foreign key (idLivro)
		references LIVRO (idLivro),
	PRIMARY KEY (idCadastroLocacao, idLivro)
);

CREATE TABLE AUTOR (
	idAutor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeAutor VARCHAR (45) NOT NULL,
    cpfAutor VARCHAR (15) NOT NULL
);

CREATE TABLE AUTOR_HAS_LIVRO (
	idAutor INT NOT NULL,
    constraint fk_idAutor_AutorHasLivro foreign key (idAutor)
		references AUTOR (idAutor),
	idLivro INT NOT NULL,
    constraint fk_idLivro_AutorHasLivro foreign key (idLivro)
		references LIVRO (idLivro),
	PRIMARY KEY (idAutor, idLivro)
);

-- INDEX:

CREATE INDEX idx_IdBiblioteca on BIBLIOTECA (idBiblioteca);
CREATE INDEX idx_IdEndereco on ENDERECO (idEndereco);
CREATE INDEX idx_IdTelefone on TELEFONE (idTelefone);
CREATE INDEX IDX_idFuncionario on FUNCIONARIO (idFuncionario);
CREATE INDEX idx_idUsuario on USUARIO (idUsuario);
CREATE INDEX idx_idLivro on LIVRO (idLivro);
CREATE INDEX idx_idAutor on AUTOR (idAutor);
CREATE INDEX idx_idLivro on AUTOR_HAS_LIVRO (idLivro); 
CREATE INDEX idx_idAutor on AUTOR_HAS_LIVRO (idAutor);
CREATE INDEX idx_idEditora on EDITORA (idEditora);
CREATE INDEX idx_idCadastroLocacao on CADASTRO_LOCACAO (idCadastroLocacao);

-- SELECTs TABELA INTEIRA:

Select * from BIBLIOTECA;
Select * from ENDERECO;
Select * from TELEFONE;
Select * from FUNCIONARIO;
Select * from USUARIO;
Select * from LIVRO;
Select * from AUTOR;
Select * from AUTOR_HAS_LIVRO;
Select * from EDITORA;
Select * from CADASTRO_LOCACAO;

-- INSERTs:

insert into ENDERECO (bairroEndereco, ruaEndereco, numeroEndereco, cepEndereco, cidadeEndereco)
	values ("Centro", "Getúlio Vargas", "312", "48702-098", "Paulo Afonso"),
		   ("Perpetuo Socorro", "Joana Angélica", "270", "48602-063", "Paulo Afonso"),
           ("Centro", "Rua A", "21", "48706-002", "Paulo Afonso"),
           ("Centro", "Rua B", "872", "48706-094", "Paulo Afonso"),
           ("Centro", "Rua C", "78", "48706-006", "Paulo Afonso"),
           ("Centro", "Rua D", "12", "48706-041", "Paulo Afonso"),
           ("Prainha", "Hebert de Souza", "43", "48799-024", "Paulo Afonso");

insert into BIBLIOTECA (nomeBiblioteca, tipoBiblioteca, idEndereco)
	values ("Livraria Feliz", "Matriz", 1);
    
insert into FUNCIONARIO (nomeFuncionario, cpfFuncionario, idBiblioteca, idEndereco)
	values ("Adriano", "921724202", 1, 3),
		   ("Maria", "233721639", 1, 4),
           ("Joaquim", "726229912", 1, 5);
           
insert into USUARIO (nomeUsuario, cpfUsuario, emailUsuario, idEndereco)
	values ("Lucas", "0273129042", "daniel@gmail.com", 2),
		   ("Cicero", "342340575", "ricardo@live.com", 6),
           ("Igor", "8721742920", "prof_igor@outlook.com", 7);
           
insert into TELEFONE (dddTelefone, numeroTelefone, idBiblioteca, idFuncionario, idUsuario)
	values ("75", "982742679", 1, 1, 1),
		   ("75", "328120428", 1, 2, 2),
           ("75", "818292947", 1, 3, 3);

insert into CADASTRO_LOCACAO (dataLocacao, dataDevolucao, descricaoLocacao, idUsuario, idFuncionario)
	values ("12/03/2022", "19/03/2022", "Devolvido em bom estado", 1, 3),
		   ("23/06/2022", "30/06/2022", "Devolvido em mau estado", 2, 1),
           ("06/05/2022", "13/05/2022", "Estado original", 3, 2);
           
insert into AUTOR (nomeAutor, cpfAutor) 
	values ("Machado de Assis", "123456789"),
		   ("Jonas Madureira", "987654321"),
           ("Clarice Lispector", "123456789"),
           ("Guimarães Rosa", "0819232302"),
           ("C.S. Lewis", "4438429323");

insert into EDITORA (nomeEditora, cnpjEditora, emailEditora)
	values ("Thomas Nelson", "81272", "thomasnelson@outlook.com"),
		   ("Editora Aleatoria", "21403", "aleatoria@gmail.com");

insert into LIVRO (nomeLivro, anoPublicacao, categoriaLivro, quantidadeLivro, idEditora)
	values ("Dom Casmurro", "1950", "Clássicos", 10, 1),
		   ("Inteligencia Humilhada", "2018", "Cristão", 5, 2),
           ("Harry Potter", "2008", "Ficção", 7, 2),
           ("Crônicas de Narnia", "1940", "Fantastico", 22, 1),
           ("Cristianismo Puro e Simples", "1945", "Cristão", 17, 1);

insert into AUTOR_HAS_LIVRO (idAutor, idLivro)
	values (1, 1),
		   (2, 2),
           (3, 3),
           (5, 4),
           (5, 5);
           
insert into CADASTRO_LOCACAO_HAS_LIVRO (idCadastroLocacao, idLivro)
	values (1, 3),
		   (3, 2),
		   (2, 1);
           
-- QUERRYs:

Select nomeUsuario from Usuario;
Select nomeLivro from Livro;

Select f.nomeFuncionario, f.cpfFuncionario, e.cepEndereco from Funcionario f, Endereco e;

Select c.idCadastroLocacao, u.nomeUsuario, f.nomeFuncionario from Cadastro_Locacao c, Usuario u, Funcionario f where
	u.idUsuario = c.idUsuario and
    c.idFuncionario = f.idFuncionario;

Select idEndereco, ruaEndereco from Endereco where ruaEndereco like 'rua%';

-- JOIN:

Select l.idLivro, a.nomeAutor, l.nomeLivro, e.nomeEditora from Autor a inner join Autor_Has_Livro al ON a.idAutor = al.idAutor
	inner join Livro l ON al.idLivro = l.idLivro
    inner join Editora e ON l.idEditora = e.idEditora;
    

-- AVAL. III Unidade:

-- 2.1) SubQuery como coluna (quantidade de livros que cada autor possui)
Select a.nomeAutor, (select COUNT(l.nomeLivro) from livro l, autor_has_livro al where a.idAutor = al.idAutor 
	and l.idLivro = al.idLivro) AS Quantidade_Livros from autor a;

-- 2.2) SubQuery como filtro (autor que não tem nenhum livro)
Select a.nomeAutor from Autor a where a.idAutor not in (select al.idAutor from autor_has_livro al); 

-- 2.3) SubQuery como fonte de dados (autores que possuem mais de um livro)
Select x.nomeAutor, x.Quantidade_Livros from (select a.nomeAutor, (select count(l.nomeLivro) from 
	livro l, autor_has_livro al where a.idAutor = al.idAutor and l.idLivro = al.idLivro) AS 
    Quantidade_Livros from autor a group by a.idAutor) x where x.Quantidade_Livros < 1;

-- 3.1) Procedure sem parâmetro
DELIMITER $$
CREATE PROCEDURE LISTAR_USUARIOS ()
BEGIN 
	select * from Usuario;
END $$
DELIMITER ;

CALL LISTAR_USUARIOS;

-- 3.2) Procedure com parâmetro
DELIMITER $$
CREATE PROCEDURE QUANTIDADE_CadastroLocacao (OUT quantidade INT)
BEGIN
	select COUNT(*) into quantidade from cadastro_locacao;
END $$
DELIMITER ;

CALL QUANTIDADE_CadastroLocacao(@total);
select @total;