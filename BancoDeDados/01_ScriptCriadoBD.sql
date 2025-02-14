CREATE DATABASE dbAlmoxarifado
GO
USE dbAlmoxarifado
GO

CREATE TABLE Categoria  (
    Codigo INT IDENTITY(1,1) PRIMARY KEY,
    CategoriaPro VARCHAR(100)
 );

 CREATE TABLE Produto (
    Codigo INT IDENTITY(1,1) PRIMARY KEY,
    DescricaoPro VARCHAR(100),
    UnidadeMedida VARCHAR(100) NOT NULL,
    EstoqueAtual INT,
	IdItensEntrada INT,
    PrecoProd INT NOT NULL, 
	IdCategoria VARCHAR(100)
); 
alter table Produto
add FOREIGN KEY (Codigo) REFERENCES Categoria(Codigo)
    
	 

CREATE TABLE Fornecedor (
    Codigo INT IDENTITY(1,1) PRIMARY KEY,
    NomeFornecedor VARCHAR(100) NOT NULL,
	Endereco VARCHAR(100),
	Bairro VARCHAR(100),
	Cidade VARCHAR(100),
	Estado VARCHAR(100),
	Telefone VARCHAR(100),
    CNPJ VARCHAR(100) UNIQUE
);
CREATE TABLE Entrada (
    Codigo INT IDENTITY(1,1) PRIMARY KEY,
    DataEntrada DATETIME NOT NULL,
    CodigoFornecedor INT NOT NULL,
    Observacao VARCHAR(100),
);
 CREATE TABLE ItensEntrada (
    Codigo INT IDENTITY(1,1) PRIMARY KEY,
    CodigoProduto INT,
    CodigoEntrada INT, 
    Quantidade INT,
    Preço FLOAT,
	Total FLOAT
);
CREATE TABLE Secretaria(
    IdSecretaria INT IDENTITY(1,1) PRIMARY KEY ,
	NomeSecretaria VARCHAR(100),
	Endereco VARCHAR(100),
	Bairro VARCHAR(100),
	Cidade VARCHAR(100),
	Estado VARCHAR(100),
	Telefone VARCHAR(100),
	CNPJ VARCHAR(100) UNIQUE
);

CREATE TABLE IntensSaida (
    IdItensSaida INT IDENTITY(1,1) PRIMARY KEY,
	IdSaida INT,
);
alter table IntensSaida
add FOREIGN KEY (IdSaida) REFERENCES Saida(IdSaida)


CREATE TABLE Saida(
    IdSaida INT IDENTITY(1,1) PRIMARY KEY ,
	IdSecretaria INT,
	IdItensSaida INT,
	dataSaida INT,
);
alter table Saida
add FOREIGN KEY (IdSecretaria) REFERENCES Secretaria(IdSecretaria),
	FOREIGN KEY (IdItensSaida) REFERENCES IntensSaida(IdItensSaida)


