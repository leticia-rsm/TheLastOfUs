DROP DATABASE IF EXISTS projeto_individual;
CREATE DATABASE projeto_individual;
USE projeto_individual;

CREATE TABLE siteFooter(
idSite INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
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
CONSTRAINT chkr_alternativa CHECK (r_alternativa IN('A', 'B', 'C', 'D')),
fkPesquisa INT,
CONSTRAINT fkPesquisaResposta FOREIGN KEY (fkPesquisa)
	REFERENCES pesquisa(idPesquisa)
);

CREATE TABLE alternativa (
idAlternativa INT AUTO_INCREMENT,
fkUsuario INT,
CONSTRAINT fkUsuarioAlternativa FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),
fkResposta INT,
CONSTRAINT fkRespostaAlternativa FOREIGN KEY (fkResposta)
	REFERENCES resposta(idResposta),
PRIMARY KEY (idAlternativa, fkUsuario, fkResposta)
);

-- SELECTS

-- SELECT SITES FOOTER
SELECT nome, COUNT(idSite) FROM siteFooter
	GROUP BY nome;

-- SELECT AUXILIAR (GERAL)
SELECT * FROM pesquisa JOIN resposta ON fkPesquisa = idPesquisa JOIN alternativa ON fkResposta = idResposta;

-- QUESTIONÁRIO
-- VOTOS
SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 1
	GROUP BY resposta.r_alternativa;

-- PERGUNTA 1
SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 2
	GROUP BY resposta.r_alternativa;

-- PERGUNTA 2    
SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 3
	GROUP BY resposta.r_alternativa;
    
-- PERGUNTA 3
SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 4
	GROUP BY resposta.r_alternativa;

SELECT * FROM pesquisa JOIN resposta ON fkPesquisa = idPesquisa
JOIN alternativa ON fkResposta = idResposta;

SELECT * FROM resposta JOIN alternativa ON fkResposta = idResposta;

-- TOTAL DE RESPOSTAS EM CADA PERGUNTA
SELECT COUNT(idAlternativa) 'qtd'
	FROM alternativa JOIN resposta ON fkAlternativa = idAlternativa 
    WHERE fkPesquisa = 1
    GROUP BY fkPesquisa;
    
-- IDADE
SELECT TIMESTAMPDIFF(YEAR, dtNasc, now()) AS idade FROM usuario;

-- DISPOSITIVOS
SELECT usuario.dispositivo, COUNT(usuario.idUsuario) FROM usuario GROUP BY usuario.dispositivo;