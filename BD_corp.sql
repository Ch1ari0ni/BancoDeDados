DROP DATABASE IF EXISTS corporativo;

CREATE DATABASE corporativo;

USE corporativo;

-- DDL
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100),
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin', 'analyst') DEFAULT 'user',
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    department VARCHAR(50),
    phone VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE credentials_store (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100),
    username VARCHAR(100),
    password VARCHAR(255),
    privilege_level VARCHAR(50),
    source VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    session_token VARCHAR(255),
    ip_address VARCHAR(45),
    status ENUM('active', 'expired') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE auth_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    ip_address VARCHAR(45),
    status ENUM('SUCCESS', 'FAIL'),
    user_agent TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE query_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    query_executed TEXT,
    affected_rows INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner VARCHAR(100),
    classification ENUM('public', 'internal', 'confidential'),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE data_access_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    record_id INT,
    action ENUM('READ', 'UPDATE', 'DELETE'),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (record_id) REFERENCES records(id)
);

CREATE TABLE system_config (
    id INT AUTO_INCREMENT PRIMARY KEY,
    config_key VARCHAR(100),
    config_value TEXT
);

CREATE TABLE backups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(255),
    created_by VARCHAR(50),
    location TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE integrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100),
    api_key VARCHAR(255),
    status ENUM('active', 'inactive'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- DML
INSERT INTO users (username, email, password, role) VALUES
('admin', 'admin@corp.local', 'admin123', 'admin'),
('c.oliveira', 'coliveira@corp.local', '123456', 'user'),
('r.almeida', 'ralmeida@corp.local', 'senha123', 'analyst'),
('l.costa', 'lcosta@corp.local', 'password', 'user');

INSERT INTO user_profiles (user_id, full_name, department, phone) VALUES
(1, 'Administrador Sistema', 'TI', '11999999999'),
(2, 'Carlos Oliveira', 'Financeiro', '11988888888'),
(3, 'Rafael Almeida', 'Segurança', '11977777777'),
(4, 'Lucas Costa', 'RH', '11966666666');

INSERT INTO credentials_store (service_name, username, password, privilege_level, source) VALUES
('mysql_db', 'root', 'root123', 'full', 'github'),
('internal_api', 'admin_api', 'api123', 'high', 'config_file'),
('backup_service', 'backup_user', 'backup123', 'medium', 'backup_script');

INSERT INTO integrations (service_name, api_key, status) VALUES
('payment_gateway', 'sk_test_ABC123', 'active'),
('email_service', 'mail_key_789XYZ', 'active');

INSERT INTO records (owner, classification, content) VALUES
('financeiro', 'confidential', 'Relatório financeiro anual'),
('rh', 'confidential', 'Dados de salários'),
('operacoes', 'internal', 'Procedimentos internos'),
('diretoria', 'confidential', 'Plano estratégico');

INSERT INTO system_config (config_key, config_value) VALUES
('db_user', 'root'),
('db_password', 'root123'),
('debug_mode', 'true');

INSERT INTO auth_logs (user_id, ip_address, status, user_agent) VALUES
(1, '172.18.0.5', 'FAIL', 'Mozilla/5.0'),
(1, '172.18.0.5', 'SUCCESS', 'Mozilla/5.0');

INSERT INTO sessions (user_id, session_token, ip_address, status, expires_at) VALUES
(1, 'abc123token', '172.18.0.5', 'active', DATE_ADD(NOW(), INTERVAL 1 HOUR));

INSERT INTO query_logs (user_id, query_executed, affected_rows) VALUES
(1, 'SELECT * FROM records', 4),
(1, 'SELECT * FROM credentials_store', 3);

INSERT INTO data_access_logs (user_id, record_id, action) VALUES
(1, 1, 'READ'),
(1, 2, 'READ'),
(1, 4, 'READ');

-- DQL
SELECT * FROM users;
SELECT * FROM user_profiles;
SELECT * FROM credentials_store;
SELECT * FROM sessions;
SELECT * FROM auth_logs;
SELECT * FROM query_logs;
SELECT * FROM records;
SELECT * FROM data_access_logs;
SELECT * FROM system_config;
SELECT * FROM backups;
SELECT * FROM integrations;