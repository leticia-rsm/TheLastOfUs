CREATE DATABASE projeto_individual;
USE projeto_individual;

CREATE TABLE siteFooter(
idSite INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
qtdClick INT
);

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
);

CREATE TABLE resposta (
idResposta INT PRIMARY KEY AUTO_INCREMENT,
r_alternativa CHAR(1),
CONSTRAINT chkr_alternativa CHECK (r_alternativa IN('a', 'b', 'c', 'd')),
fkPesquisa INT,
CONSTRAINT fkPesquisaResposta FOREIGN KEY (fkPesquisa)
	REFERENCES pesquisa(idPesquisa)
)AUTO_INCREMENT = 1000;

CREATE TABLE alternativa (
idAlternativa INT AUTO_INCREMENT,
fkUsuario INT,
CONSTRAINT fkUsuarioAlternativa FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),
fkResposta INT,
CONSTRAINT fkRespostaAlternativa FOREIGN KEY (fkResposta)
	REFERENCES resposta(idResposta),
PRIMARY KEY (idAlternativa, fkUsuario, fkResposta)
)AUTO_INCREMENT = 3000;