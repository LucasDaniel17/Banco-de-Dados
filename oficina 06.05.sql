use oficina;

create database oficina;

CREATE TABLE Empresa (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEmpresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);

CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bairro VARCHAR(30) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    cep VARCHAR(12) NOT NULL
);

CREATE TABLE TELEFONE (
    idTelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ddd INT NOT NULL,
    numero INT NOT NULL
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
    idTelefone INT NOT NULL,
    CONSTRAINT fk_idTelefone_Funcionario FOREIGN KEY (idTelefone)
        REFERENCES TELEFONE (idTelefone),
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
    idTelefone INT NOT NULL,
    CONSTRAINT fk_idTelefone_Cliente FOREIGN KEY (idTelefone)
        REFERENCES TELEFONE (idTelefone),
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

CREATE TABLE Itens_OS (
    Servico_idServico INT NOT NULL,
    OS_idOS INT NOT NULL
);

CREATE TABLE Servico (
    idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeServico VARCHAR(45) NOT NULL,
    recursos VARCHAR(200) NOT NULL
);