CREATE DATABASE loja;

USE loja;

DROP DATABASE loja;

-- DDL - Criação do banco de dados (base loja)
CREATE TABLE cliente(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    email VARCHAR(50)
);

CREATE TABLE carro(
	id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(50),
    preco VARCHAR(50)
);

CREATE TABLE venda(
	id INT AUTO_INCREMENT PRIMARY KEY,
    data_venda VARCHAR(50),
    carro_vendido VARCHAR(50),
    preco_venda VARCHAR(50)
);

-- DML - inserindo registros
INSERT INTO cliente (nome, idade, email) VALUES ('Joao', 18, 'pastel@gmail.com');
INSERT INTO cliente (nome, idade, email) VALUES ('Maria', 22, 'coxinha@gmail.com');

INSERT INTO carro(modelo, preco) VALUES ('safira', 'R$25.000');
INSERT INTO carro(modelo, preco) VALUES ('prisma', 'R$30.000');
INSERT INTO carro(modelo, preco) VALUES ('palio', 'R$15.000');

INSERT INTO venda(data_venda, carro_vendido, preco_venda) VALUES ('15/04/2025', 'prisma', 'R$30.000');
INSERT INTO venda(data_venda, carro_vendido, preco_venda) VALUES ('10/08/2025', 'palio', 'R$15.000');

-- DML - consultando dados de tabelas
SELECT * FROM cliente;
SELECT * FROM carro;
SELECT * FROM venda;