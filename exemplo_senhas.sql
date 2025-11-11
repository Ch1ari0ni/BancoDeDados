DROP DATABASE exemplo_senhas;
CREATE DATABASE exemplo_senhas;
USE exemplo_senhas;

CREATE TABLE usuarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(128) NOT NULL,
    salt VARCHAR(32)
);

INSERT INTO usuarios (nome, email, salt, senha_hash)
VALUES ('Ana Silva', 'ana@exemple.com', 'Aidp7uabpwbg4I', SHA2(CONCAT('minhaSenha@123', 'Aidp7uabpwbg4I'), 256));

SELECT * FROM usuarios;

-- validação de login
SELECT *
FROM usuarios
WHERE email = 'ana@exemple.com' AND senha_hash = SHA2(CONCAT('minhaSenha@123', salt), 256);

INSERT INTO usuarios (nome, email, salt, senha_hash)
VALUES ('Burno Lima', 'burno@exemple.com', 'Piqwe5rbbm8coam', SHA2(CONCAT('minhaSenha@123', 'Piqwe5rbbm8coam'), 256));

-- salt

