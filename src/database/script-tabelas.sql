DROP DATABASE IF EXISTS projeto_individual;
CREATE DATABASE projeto_individual;
USE projeto_individual;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(45),
dtNasc DATE,
email VARCHAR(45),
senha VARCHAR(45),
dispositivo VARCHAR(20),
CONSTRAINT chkDispositivo CHECK (dispositivo IN('ps5', 'ps4', 'ps3', 'pc', 'outro'))
);

CREATE TABLE pesquisa (
idPesquisa INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(100)
)AUTO_INCREMENT = 1000;

CREATE TABLE resposta (
idResposta INT PRIMARY KEY AUTO_INCREMENT,
alternativa CHAR(1),
fkPesquisa INT,
CONSTRAINT fkPesquisaResposta FOREIGN KEY (fkPesquisa)
	REFERENCES pesquisa(idPesquisa)
)AUTO_INCREMENT = 2000;

CREATE TABLE grafico (
idGrafico INT PRIMARY KEY AUTO_INCREMENT,
fkUsuario INT,
CONSTRAINT fkUsuarioGrafico FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),
fkResposta INT,
CONSTRAINT fkRespostaGrafico FOREIGN KEY (fkResposta)
	REFERENCES resposta(idResposta)
)AUTO_INCREMENT = 3000;

SHOW TABLES;

DESC TABLE usuario;

SELECT * FROM usuario;