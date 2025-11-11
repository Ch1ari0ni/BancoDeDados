CREATE DATABASE rede_supermercados;

USE rede_supermercados;

DROP DATABASE rede_supermercados;

-- DDL
CREATE TABLE supermercado (
    id_supermercado INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    endereco VARCHAR(150) NOT NULL
);

CREATE TABLE filial (
    id_filial INT AUTO_INCREMENT PRIMARY KEY,
    id_supermercado INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    FOREIGN KEY (id_supermercado) REFERENCES supermercado(id_supermercado)
);

CREATE TABLE cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    descricao VARCHAR(150)
);

CREATE TABLE pessoas (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(15) UNIQUE NOT NULL,
    rg VARCHAR(15),
    idade INT
);

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT NOT NULL,
    id_cargo INT NOT NULL,
    id_filial INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa),
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo),
    FOREIGN KEY (id_filial) REFERENCES filial(id_filial)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa)
);

CREATE TABLE enderecos_cliente (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    logradouro VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(150)
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(150),
    preco_base DECIMAL(10,2),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE fornecedores_produtos (
    id_fornecedor INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_fornecedor, id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE estoque (
    id_filial INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT DEFAULT 0,
    PRIMARY KEY (id_filial, id_produto),
    FOREIGN KEY (id_filial) REFERENCES filial(id_filial),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_filial INT NOT NULL,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_filial) REFERENCES filial(id_filial),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE itens_venda (
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venda, id_produto),
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- DML
INSERT INTO supermercado (nome, cnpj, endereco) VALUES
('Atacadinho', '11.111.111/0001-11', 'Av. Central, 100');

INSERT INTO filial (id_supermercado, nome, endereco) VALUES
(1, 'Atacadinho Centro', 'Rua das Flores, 200'),
(1, 'Atacadinho Norte', 'Av. Brasil, 500');

INSERT INTO cargos (titulo, descricao) VALUES
('Caixa', 'Responsável por registrar as vendas'),
('Gerente', 'Responsável pela filial');

INSERT INTO pessoas (nome, cpf, rg, idade) VALUES
('Fulano Silva', '123.456.789-00', 'MG12345', 30),
('João Santos', '987.654.321-00', 'MG54321', 82),
('Cicero Lima', '555.555.555-55', 'MG99999', 47),
('Ana Souza', '111.222.333-44', 'MG88888', 19);

INSERT INTO funcionarios (id_pessoa, id_cargo, id_filial) VALUES
(1, 1, 1),
(2, 2, 1);

INSERT INTO clientes (id_pessoa) VALUES
(3),
(4);

INSERT INTO enderecos_cliente (id_cliente, logradouro, numero, bairro, cidade, estado, cep) VALUES
(1, 'Rua A', '100', 'Centro', 'Diadema', 'SP', '30100-000'),
(1, 'Rua B', '200', 'Oeste', 'São Caetano', 'SP', '30200-000'),
(2, 'Av. C', '300', 'Sul', 'Chique-Chique', 'BA', '32000-000');

INSERT INTO categorias (nome, descricao) VALUES
('Bebidas', 'Líquidos em geral'),
('Limpeza', 'Produtos de limpeza doméstica');

INSERT INTO produtos (id_categoria, nome, descricao, preco_base) VALUES
(1, 'Refrigerante Cola 2L', 'Bebida gaseificada', 8.50),
(2, 'Detergente Neutro', 'Produto de limpeza', 3.20);

INSERT INTO fornecedores (nome, cnpj) VALUES
('RefriBrasil', '22.222.222/0001-22'),
('CleanHouse', '33.333.333/0001-33');

INSERT INTO fornecedores_produtos (id_fornecedor, id_produto) VALUES
(1, 1),
(2, 2);

INSERT INTO estoque (id_filial, id_produto, quantidade) VALUES
(1, 1, 200),
(1, 2, 150),
(2, 1, 300),
(2, 2, 180);

INSERT INTO vendas (id_filial, id_cliente, id_funcionario, data_venda, valor_total) VALUES
(1, 1, 1, '2025-11-04', 25.70),
(2, 2, 2, '2025-10-30', 16.40);

INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 8.50),
(1, 2, 1, 3.20),
(2, 2, 2, 8.20);

-- DQL
SELECT * FROM supermercado;
SELECT * FROM filial;
SELECT * FROM cargos;
SELECT * FROM pessoas;
SELECT * FROM funcionarios;
SELECT * FROM clientes;
SELECT * FROM enderecos_cliente;
SELECT * FROM categorias;
SELECT * FROM produtos;
SELECT * FROM fornecedores;
SELECT * FROM fornecedores_produtos;
SELECT * FROM estoque;
SELECT * FROM vendas;
SELECT * FROM itens_venda;