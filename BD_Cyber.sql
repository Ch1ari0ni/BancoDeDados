CREATE DATABASE escola;

USE escola;

DROP DATABASE escola;

-- DDL - Criação do banco de dados (base aluno)
CREATE TABLE aluno(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    email VARCHAR(50)
);

CREATE TABLE professor(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    disciplina VARCHAR(50)
);

-- DML - inserindo registros
INSERT INTO aluno (nome, idade, email) VALUES ('Joao', 18, 'pastel@gmail.com');
INSERT INTO aluno (nome, idade, email) VALUES ('Maria', 22, 'coxinha@gmail.com');

INSERT INTO professor(nome, disciplina) VALUES ('Caique', 'Banco de dados');
INSERT INTO professor(nome, disciplina) VALUES ('Hebert', 'Nuvem');
INSERT INTO professor(nome, disciplina) VALUES ('Demay', 'Pentest');

-- DML - atualizando registros
UPDATE aluno SET email = 'joao@senai.br' WHERE id = 1;
UPDATE aluno SET email = 'maria@senai.br' WHERE id = 2;

UPDATE professor SET nome = 'Tiago' WHERE id = 3;
-- DML - deletando registros
DELETE FROM aluno;
DELETE FROM professor WHERE id = 2;
-- DML - consultando dados de tabelas
SELECT * FROM aluno;
SELECT * FROM professor;
