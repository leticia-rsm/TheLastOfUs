DROP DATABASE IF EXISTS projeto_individual;
CREATE DATABASE projeto_individual;
USE projeto_individual;

CREATE TABLE escolha (
idEscolha INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(45),
dtNasc DATE,
email VARCHAR(45),
senha VARCHAR(45),
dispositivo VARCHAR(20),
CONSTRAINT chkDispositivo CHECK (dispositivo IN('ps5', 'ps4', 'ps3', 'pc', 'outro')),
fkEscolha INT,
CONSTRAINT fkEscolhaUsuario FOREIGN KEY (fkEscolha)
	REFERENCES escolha(idEscolha)
);

SHOW TABLES;

DESC TABLE usuario;

SELECT * FROM usuario;