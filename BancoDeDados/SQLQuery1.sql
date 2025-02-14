
INSERT INTO Categoria(CategoriaPro)
VALUES ('Alimentos');
INSERT INTO Categoria(CategoriaPro)
VALUES (' Bebidas');

SELECT * FROM Categoria

INSERT INTO	Fornecedor(NomeFornecedor, Endereco, Bairro, Cidade, Estado, Telefone, CNPJ)
VALUES ('Bombom', 'R. da Liberdade', 'Bairro Rua Nova', 'Centro Estância', 'SE,', '79 99846-4832', '04.136.442/0002-00' )
INSERT INTO	Fornecedor(NomeFornecedor, Endereco, Bairro, Cidade, Estado, Telefone, CNPJ)
VALUES ('Gbarbosa', 'Rua Direita da Piedade', 'Bairro Santa Algustin', 'Salvador', 'BA',' 71 3314-4916', '39.346.861/0359-76' )
INSERT INTO	Fornecedor(NomeFornecedor, Endereco, Bairro, Cidade, Estado, Telefone, CNPJ)
VALUES ('Americanas', 'Rua Sacadura Cabral', 'Bairro Alagoas', 'Rio de Janeiro', 'RJ', '21 2782-7015', '00.776.574/0006-60' )

SELECT * FROM Fornecedor

INSERT INTO Produto(DescricaoPro, UnidadeMedida, PrecoProd, EstoqueAtual, IdCategoria)
VALUES ('Cuscuz', 'Pacote', '1', '10', 'Alimentos');
INSERT INTO Produto(DescricaoPro, UnidadeMedida, PrecoProd, EstoqueAtual, IdCategoria)
VALUES ('Cafe', 'Pacote', '30', '20', 'Bebidas');
INSERT INTO Produto(DescricaoPro, UnidadeMedida, PrecoProd, EstoqueAtual, IdCategoria)
VALUES ('Bolo', 'Unidade', '150', '100', 'Alimentos' );

SELECT * FROM Produto

