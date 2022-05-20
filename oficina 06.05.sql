use oficina;

create database oficina;

CREATE TABLE Empresa (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEmpresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);

CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bairroEndereco VARCHAR(30) NOT NULL,
    ruaEndereco VARCHAR(30) NOT NULL,
    numeroEndereco INT NOT NULL,
    cepEndereco VARCHAR(12) NOT NULL
);

CREATE TABLE TELEFONE (
    idTelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ddd INT NOT NULL,
    numero INT NOT NULL,
    idFuncionario int,
    constraint fk_idFuncionario_Telefone foreign key (idFuncionario) 
		references Funcionario(idFuncionario),
    idCliente int,
    constraint fk_idCliente_Telefone foreign key (idCliente)
		references Cliente(idCliente)
);

CREATE TABLE DEPARTAMENTO (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeDepartamento VARCHAR(45) NOT NULL,
    descricaoDepartamento VARCHAR(100) NOT NULL,
    idEmpresa INT NOT NULL,
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (idEmpresa)
        REFERENCES Empresa (idEmpresa)
);

CREATE TABLE FUNCIONARIO (
    idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFuncionario VARCHAR(45) NOT NULL,
    cpfFuncionario VARCHAR(45) NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT fk_idEndereco_Funcionario FOREIGN KEY (idEndereco)
        REFERENCES ENDERECO (idEndereco),
    idDepartamento INT NOT NULL,
    CONSTRAINT fk_idDepartamento_funcionario FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento)
);

CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(45) NOT NULL,
    cpfCliente VARCHAR(11) NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT fk_idEndereco_Cliente FOREIGN KEY (idEndereco)
        REFERENCES ENDERECO (idEndereco)
);

CREATE TABLE OS (
    idOS INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dataSolicitacao VARCHAR(10) NOT NULL,
    dataPrevisao VARCHAR(10),
    resposta VARCHAR(45),
    idFuncionario INT NOT NULL,
    CONSTRAINT fk_idFuncionario_OS FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
    idDepartamento INT NOT NULL,
    CONSTRAINT fk_idDepartamento_OS FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento),
    idCliente INT NOT NULL,
    CONSTRAINT fk_idCliente_OS FOREIGN KEY (idCliente)
        REFERENCES CLIENTE (idCliente)
);

CREATE TABLE Servico (
    idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeServico VARCHAR(45) NOT NULL,
    recursos VARCHAR(200) NOT NULL
);

CREATE TABLE ITENS_OS (
	idServico int not null,
    constraint fk_idServico_ItensOS foreign key (idServico) 
		references Servico(idServico),
	idOS int not null,
    constraint fk_idOS_ItensOS foreign key (idOS) 
		references OS(idOS),
	primary key (idServico, idOS)
);

-- INDEX:

CREATE INDEX idx_IDEmpresa on Empresa (idEmpresa);
CREATE INDEX idx_IDEndereco on Endereco (idEndereco);
CREATE INDEX idx_IDTelefone on Telefone (idTelefone);
CREATE INDEX idx_IDDepartamento on Departamento (idDepartamento);
CREATE INDEX idx_IDFuncionario on Funcionario (idFuncionario);
CREATE INDEX idx_IDCliente on Cliente (idCliente);
CREATE INDEX idx_IDos on OS (idOS);
CREATE INDEX idx_IDServico on Servico (idServico);
CREATE INDEX idx_IDServico on ITENS_OS (idServico);
CREATE INDEX idx_IDos on ITENS_OS (idOS);

-- INSERT:

-- endereço 1:
insert into ENDERECO (bairroEndereco, ruaEndereco, numeroEndereco, cepEndereco) values ("Perpetuo Socorro", "Joana Angelica", "530", "48603-000");
-- endereço 2:
insert into ENDERECO (bairroEndereco, ruaEndereco, numeroEndereco, cepEndereco) values ("BNH", "Sol", "27", "48609-001");

insert into EMPRESA (nomeEmpresa, tipo) values ("ZX", "Matriz");
insert into SERVICO (nomeServico, recursos) values ("jogar bola", "xxxxxx");
insert into DEPARTAMENTO (nomeDepartamento, descricaoDepartamento, idEmpresa) values ("Diren", "Direção da empresa", 1);
insert into CLIENTE (nomeCliente, cpfCliente, idEndereco) values ("Ze Maria", "12345678998", 2);
insert into FUNCIONARIO (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values ("mariana", "98765432123", 1, 1);
insert into TELEFONE (ddd, numero, idFuncionario, idCliente) values ("75", "40028922", 1, 1);
insert into OS (dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente) values ("10/04/22", "17/04/22", "yyy", 1, 1, 1);
insert into ITENS_OS (idServico, idOs) values ("1", "1");

-- SELECT:

Select * from empresa;
Select * from endereco;
Select * from departamento;
Select * from servico;
Select * from cliente;
Select * from funcionario;
Select * from telefone;
Select * from os;