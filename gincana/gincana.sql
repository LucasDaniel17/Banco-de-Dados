create database gincana;

use gincana;

create table Gincana (
	idGincana int auto_increment not null primary key,
	nomeGincana varchar(45) not null,
	anoGincana varchar(8) not null,
    descricaoGincana varchar(120) not null,
    dataGincana varchar(45) not null
);

create table Evento (
	idEvento int auto_increment not null primary key,
    nomeEvento varchar(45) not null,
    localEvento varchar(45) not null,
    dataEvento date not null,
    horarioEvento varchar(5) not null,
    descricaoEvento varchar(120) not null,
    idGincana int,
    constraint fk_idGincana_Evento foreign key (idGincana) 
		references Gincana(idGincana)
);

create table Perfil (
	idPerfil int auto_increment not null primary key,
    cargoPerfil varchar(30) not null
);

create table Usuario (
	idUsuario int auto_increment not null primary key,
    nomeUsuario varchar(60) not null,
	emailUsuario varchar(60) not null,
    senhaUsuario varchar(30) not null,
    cpfUsuario varchar(15) not null,
    sexoUsuario varchar(1) not null,
    idGincana int,
    constraint fk_idGincana_Usuario foreign key (idGincana) 
		references Gincana(idGincana),
	idPerfil int,
    constraint fk_idPerfil_Usuario foreign key (idPerfil)
		references Perfil(idPerfil)
);

create table Equipe (
	idEquipe int auto_increment not null primary key,
    nomeEquipe varchar(45) not null,
    cursoEquipe varchar(15) not null,
    represetanteEquipe varchar(45) not null,
    idGincana int,
    constraint fk_idGincana_Equipe foreign key (idGincana) 
		references Gincana(idGincana)
);

create table Agenda (
	idAgenda int auto_increment not null primary key,
    dataAgenda date not null,
    idGincana int,
    constraint fk_idGincana_Agenda foreign key (idGincana) 
		references Gincana(idGincana)
);

create table Galeria (
	idGaleria int auto_increment not null primary key,
    nomeGaleria varchar(45) not null,
	descricaoGaleria  varchar(45) not null,
    idGincana int,
    constraint fk_idGincana_Prova foreign key (idGincana) 
		references Gincana(idGincana)
);

create table Imagem (
	idImagem int auto_increment not null primary key,
    imagemURL varchar(100) not null,
    idGaleria int,
    constraint fk_idGaleria_Imagem foreign key (idGaleria)
		references Galeria(idGaleria)
);

create table Prova (
	idProva int auto_increment not null primary key,
    nomeProva varchar(30) not null,
	descricaoProva  varchar(120) not null,
    dataProva DATE  not null,
    horarioProva varchar(5) not null,
    idGincana int,
    constraint fk_idGincana_Prova foreign key (idGincana) 
		references Gincana(idGincana),
	idAgenda int,
    constraint fk_idAgenda_Prova foreign key (idAgenda)
		references Agenda(idAgenda)
);

create table Criterio (
	idCriterio int auto_increment not null primary key,
    nomeCriterio varchar(30) not null,
	pontuacaoCriterio  varchar(45) not null,
	idProva int,
    constraint fk_idProva_Criterio foreign key (idProva)
		references Prova(idProva)
);

create table Jurado (
	idJurado int auto_increment not null primary key,
    nomeJurado varchar(45) not null
);

create table NotasCriterio (
	idCriterio int,
    constraint fk_idCriterio_NotasCriterio foreign key (idCriterio)
		references Criterio(idCriterio),
	idJurado int,
    constraint fk_idJurado_NotasCriterio foreign key (idJurado)
		references Jurado(idJurado),
	primary key (idCriterio, idJurado),
    notasCriterios varchar(10) not null
);

create table Jurado_has_Prova (
	idJurado int,
    constraint fk_idJurado_NotasCriterio foreign key (idJurado)
		references Jurado(idJurado),
	idProva int,
    constraint fk_idProva_Criterio foreign key (idProva)
		references Prova(idProva),
	primary key (idJurado, idProva)
);