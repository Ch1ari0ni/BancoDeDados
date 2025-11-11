
-- Limpa o ambiente caso exista para começar um novo do zero
DROP DATABASE IF EXISTS exemplo_joins;
CREATE DATABASE exemplo_joins;
USE exemplo_joins;

-- inner join
-- mostra apenas registros que tem correspondencia nas duas tabelas

-- Criar tabela do cliente e pedidos
CREATE TABLE clientes(
	id INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE pedidos(
	id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- DML - inserts (popular banco)
INSERT INTO clientes VALUES
(1, 'Ana'),
(2, 'Bruno'),
(3, 'Carlos');

INSERT INTO pedidos VALUES (1, 1, '2025-11-01'), (2, 2, '2025-11-03');

-- DQL

SELECT * FROM clientes;
SELECT * FROM pedidos;

SELECT
	c.nome AS Cliente,
    p.data_pedido AS DataPedido
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id;

-- LEFT JOIN
-- Mostra todos os pedidos da tabela da esquerda (ou tabela A),
-- mesmo que não haja corespondencia em "pedidos"

SELECT
	c.nome AS ClienteBanana,
    p.data_pedido AS DataPedido
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;

-- RIGHT JOIN
-- Mostra todos os registros da tabela da direita (ou tabela B),
-- mesmo que não haja cliente correspondente

INSERT INTO clientes VALUES(999, '');
INSERT INTO pedidos VALUES (3, 999, '2025-11-05');

SELECT
	c.nome AS ClienteBanana,
    p.data_pedido As DataPedido
FROM clientes c
RIGHT JOIN pedidos p ON c.id = p.cliente_id;
