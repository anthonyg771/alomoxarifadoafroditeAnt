CREATE DATABASE dbAlmoxarifado
GO
USE dbAlmoxarifado
GO

CREATE TABLE Categoria  (
    CodigoCategoria INT PRIMARY KEY IDENTITY (1,1),
    DescricaoCat VARCHAR(100)
 );

 CREATE TABLE Produto (
    IdProduto INT PRIMARY KEY IDENTITY(1,1),
    DescricaoPro VARCHAR(100),
    UnidadeMedida VARCHAR(100),
    EstoqueAtual FLOAT DEFAULT 0,
	IdItensEntrada INT,
	IdCategoria INT,
    PrecoProd FLOAT DEFAULT 0, 

); 

CREATE TABLE Fornecedor (

    CodigoFornecedor INT PRIMARY KEY IDENTITY(1,1),
    NomeFornecedor VARCHAR(100),
	Endereco VARCHAR(100),
	Bairro VARCHAR(100),
	Cidade VARCHAR(100),
	Estado VARCHAR(100),
	Telefone VARCHAR(100),
    CNPJ VARCHAR(100) UNIQUE
);
CREATE TABLE Entrada (
    CodigoEntrada INT PRIMARY KEY IDENTITY(1,1),
    DataEntrada DATETIME DEFAULT CURRENT_TIMESTAMP,
    CodigoFornecedor INT,
    Observacao VARCHAR(100),
    FOREIGN KEY (CodigoFornecedor) REFERENCES Fornecedor(CodigoFornecedor)
);
 CREATE TABLE ItensEntrada (
    CodigoItemEntrada INT PRIMARY KEY IDENTITY(1,1),
    CodigoProduto INT,
    CodigoEntrada INT,
    NomeFornecedor VARCHAR(100) NOT NULL,
    Categoria BIT NOT NULL, 
    QuantidadeRecebida FLOAT NOT NULL CHECK (QuantidadeRecebida > 0),
    QuantidadeMinima FLOAT NOT NULL CHECK (QuantidadeMinima >= 0),
    UnidadeMedida VARCHAR(50) NOT NULL,
    DataEntrada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    NotaFiscal VARCHAR(50) NOT NULL,
    Observacoes VARCHAR(255),
    FOREIGN KEY (CodigoProduto) REFERENCES Produto(CodigoProduto),
    FOREIGN KEY (CodigoEntrada) REFERENCES Entrada(CodigoEntrada)
);
CREATE TABLE Secretaria(
    CodigoSecretaria INT PRIMARY KEY IDENTITY,
	NomeSecretaria VARCHAR(100) NOT NULL
);
CREATE TABLE Saida(
    CodigoSaida INT PRIMARY KEY IDENTITY ,
	DataSaida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CodigoSecretaria INT NOT NULL,
	ValorTotal FLOAT DEFAULT 0 NOT NULL,
	FOREIGN KEY (CodigoSecretaria) REFERENCES Secretaria(CodigoSecretaria)
);
CREATE TABLE IntensSaida (
    CodigoIntensSaida INT PRIMARY KEY IDENTITY,
	CodigoProduto INT NOT NULL,
	QuantidadeSaida FLOAT DEFAULT 0 NOT NULL,
	UnidadeMedida VARCHAR(50) NOT NULL,
	DataSaida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Requisição INT NOT NULL,
	FOREIGN KEY (CodigoProduto) REFERENCES Produto(CodigoProduto)
);

INSERT INTO Categoria(Descricao)
VALUES ('Alimentos');
INSERT INTO Categoria(Descricao)
VALUES (' Bebidas');

SELECT * FROM Categoria

INSERT INTO	Fornecedor(NomeFornecedor, Endereco, CNPJ)
VALUES ('Bombom', 'R. da Liberdade - Centro Estância-SE Brasil,)', '04.136.442/0002-00' )
INSERT INTO	Fornecedor(NomeFornecedor, Endereco, CNPJ)
VALUES ('Gbarbosa', 'Rua Direita da Piedade - Salvador-BA Brasil', '39.346.861/0359-76' )
INSERT INTO	Fornecedor(NomeFornecedor, Endereco, CNPJ)
VALUES ('Americanas', 'Rua Sacadura Cabral - Rio de Janeiro-RJ Brasil', '00.776.574/0006-60' )

SELECT * FROM Fornecedor

INSERT INTO Produto(Descricao, UnidadeMedida, Preços, EstoqueAtual, CodigoCategoria)
VALUES ('Cuscuz', 'Pacote', 'R$1,00', '10', '1');
INSERT INTO Produto(Descricao, UnidadeMedida, Preços, EstoqueAtual, CodigoCategoria)
VALUES ('Cafe', 'Pacote', 'R$30,00','20', '2');
INSERT INTO Produto(Descricao, UnidadeMedida, Preços, EstoqueAtual, CodigoCategoria)
VALUES ('Bolo', 'Unidade', 'R$150,00', '100', '1' );
SELECT * FROM Produto
