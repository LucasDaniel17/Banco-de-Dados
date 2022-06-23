use biblioteca;

create database biblioteca;

-- CRIAÇÃO DAS TABELAS:

CREATE TABLE BIBLIOTECA (
	idBiblioteca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeBiblioteca VARCHAR (60) NOT NULL,
    tipoBiblioteca VARCHAR (15) NOT NULL,
    idEndereco INT,
    constraint fk_idEndereco_Biblioteca foreign key (idEndereco)
		references ENDERECO (idEndereco)
);

CREATE TABLE ENDERECO (
	idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bairroEndereco VARCHAR (45) NOT NULL,
    ruaEndereco VARCHAR (45) NOT NULL,
    numeroEndereco INT NOT NULL,
    cepEndereco VARCHAR (10) NOT NULL,
    cidadeEndereco VARCHAR (20) NOT NULL
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

CREATE TABLE LIVRO (
	idLivro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeLivro VARCHAR (45) NOT NULL,
    anoPublicacao VARCHAR (10) NOT NULL,
    categoriaLivro VARCHAR (20) NOT NULL,
    idEditora INT,
    constraint fk_idEditora_Livro foreign key (idEditora) 
		references EDITORA (idEditora),
	idCadastroLocacao INT,
    constraint fk_idCadastroLocacao_Livro foreign key (idCadastroLocacao)
		references CADASTRO_LOCACAO (idCadastroLocacao)
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

CREATE TABLE EDITORA (
	idEditora INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEditora VARCHAR (45) NOT NULL,
    cnpjEditora VARCHAR (20) NOT NULL,
    emailEditora VARCHAR (45) NOT NULL
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

-- SELECT:

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