CREATE DATABASE concessionaria;

USE concessionaria

CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE carro (
	id_carro INT AUTO_INCREMENT PRIMARY KEY,
	modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    preco DECIMAL(10,2)
);

CREATE TABLE venda (
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_carro INT NOT NULL,
    data_venda DATE NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_carro) REFERENCES carro(id_carro)
);
-- DML

INSERT INTO cliente (nome, cpf) VALUES
('Ana Souza', '123.456.789-00'), 
('Carlos Pereira', '987.654.321-00');

INSERT INTO carro (modelo, marca, ano, preco) VALUES
('Civic', 'Honda', '2017', 100000.00),
('Marea', 'Fiat', '2008', 15000.00),
('Chevete', 'Chevrolet', '1987', 80000.00);

INSERT INTO venda (id_cliente, id_carro, data_venda, valor_venda) VALUES
(1, 2, '2025-11-04', '25000.00'),
(2, 1, '2025-10-08', '200000.00');
-- DQL

SELECT * FROM cliente;
SELECT * FROM carro;
SELECT * FROM venda;

-- Cliente + Carro + Venda

SELECT
	v.id_venda, 
    c.nome AS nome_cliente,
    c.cpf,
    ca.modelo AS carro_modelo,
    ca.marca AS carro_marca,
    ca.ano,
    v.data_venda,
    v.valor_venda
FROM venda v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN carro ca ON v.id_carro = ca.id_carro     
ORDER BY v.id_venda DESC;