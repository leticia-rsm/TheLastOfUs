CREATE DATABASE projeto_individual;
USE projeto_individual;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(45),
dtNasc DATE,
email VARCHAR(45),
senha VARCHAR(45),
dispositivo VARCHAR(20),
CONSTRAINT chkDispositivo CHECK (dispositivo IN('playstation 5', 'playstation 4', 'playstation 3', 'notebook/desktop', 'outro')),
fkEscolha INT,
CONSTRAINT fkEscolhaUsuario FOREIGN KEY (fkEscolha)
	REFERENCES escolha(idEscolha)
);

CREATE TABLE escolha (
idEscolha INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

SHOW TABLES;

DESC TABLE usuario;

SELECT * FROM usuario;