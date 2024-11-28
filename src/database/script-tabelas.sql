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

CREATE TABLE alternativa (
idAlternativa INT PRIMARY KEY AUTO_INCREMENT,
caractere CHAR(1),
CONSTRAINT chkr_caractere CHECK (caractere IN('A', 'B', 'C', 'D')),
fkPesquisa INT,
CONSTRAINT fkPesquisaAlternativa FOREIGN KEY (fkPesquisa)
	REFERENCES pesquisa(idPesquisa)
);

CREATE TABLE resposta (
idResposta INT AUTO_INCREMENT,
fkUsuario INT,
CONSTRAINT fkUsuarioResposta FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),
fkAlternativa INT,
CONSTRAINT fkAlternativaResposta FOREIGN KEY (fkAlternativa)
	REFERENCES alternativa(idAlternativa),
PRIMARY KEY (idResposta, fkUsuario, fkAlternativa)
);

SELECT * FROM siteFooter;
SELECT * FROM usuario;
SELECT * FROM pesquisa;
SELECT * FROM resposta;
SELECT * FROM alternativa;

-- INSERTS
INSERT INTO siteFooter (nome) VALUES
('PS'),
('PS'),
('PS'),
('HBO'),
('HBO');

INSERT INTO usuario (nickname, dtNasc, email, senha, dispositivo) VALUES
('User1', '1996-01-01', 'user1@example.com', 'senha123', 'ps5'),
('User2', '1995-05-05', 'user2@example.com', 'senha456', 'pc'),
('User3', '1992-03-12', 'user3@example.com', 'senha789', 'ps4'),
('User4', '1996-07-22', 'user4@example.com', 'senha101', 'outro'),
('User5', '2004-11-11', 'user5@example.com', 'senha102', 'ps5'),
('User6', '2004-09-09', 'user6@example.com', 'senha103', 'ps3'),
('User7', '2000-02-20', 'user7@example.com', 'senha104', 'pc'),
('User8', '2000-12-12', 'user8@example.com', 'senha105', 'outro'),
('User9', '1996-08-18', 'user9@example.com', 'senha106', 'ps4'),
('User10', '2004-06-06', 'user10@example.com', 'senha107', 'ps3');

INSERT INTO pesquisa (descricao) VALUES
('Sua escolha'),
('Porque você escolheu essa opção?'),
('Como você se sentiu ao fazer essa escolha?'),
('Qual você acha que seria o impacto dessa escolha no futuro dos personagens?');


INSERT INTO alternativa (caractere, fkPesquisa) VALUES
('A', 1),
('B', 1),
-- Pergunta 2
('A', 2),
('B', 2),
('C', 2),
('D', 2),
-- Pergunta 3
('A', 3),
('B', 3),
('C', 3),
('D', 3),
-- Pergunta 4
('A', 4),
('B', 4),
('C', 4),
('D', 4);

INSERT INTO resposta (fkUsuario, fkAlternativa) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 9),
(1, 14);

-- SELECTS

-- SELECT SITES FOOTER
SELECT nome, COUNT(idSite) FROM siteFooter
	GROUP BY nome;

-- SELECT AUXILIAR (GERAL)
SELECT * FROM pesquisa JOIN alternativa ON fkPesquisa = idPesquisa JOIN resposta ON fkAlternativa = idAlternativa;

-- QUESTIONÁRIO
-- VOTOS
SELECT alternativa.caractere, COUNT(resposta.fkAlternativa) AS 'qtd' FROM usuario JOIN resposta 
	ON usuario.idUsuario = resposta.fkUsuario JOIN alternativa 
    ON alternativa.idAlternativa = resposta.fkAlternativa
    WHERE fkPesquisa = 1
	GROUP BY alternativa.caractere;

-- PERGUNTA 1
SELECT alternativa.caractere, COUNT(resposta.fkAlternativa) FROM usuario JOIN resposta 
	ON usuario.idUsuario = resposta.fkUsuario JOIN alternativa 
    ON alternativa.idAlternativa = resposta.fkAlternativa
    WHERE fkPesquisa = 2
	GROUP BY alternativa.caractere;

-- PERGUNTA 2    
SELECT alternativa.caractere, COUNT(resposta.fkAlternativa) FROM usuario JOIN resposta 
	ON usuario.idUsuario = resposta.fkUsuario JOIN alternativa 
    ON alternativa.idAlternativa = resposta.fkAlternativa
    WHERE fkPesquisa = 3
	GROUP BY alternativa.caractere;
    
-- PERGUNTA 3
SELECT alternativa.caractere, COUNT(resposta.fkAlternativa) FROM usuario JOIN resposta 
	ON usuario.idUsuario = resposta.fkUsuario JOIN alternativa 
    ON alternativa.idAlternativa = resposta.fkAlternativa
    WHERE fkPesquisa = 4
	GROUP BY alternativa.caractere;

SELECT * FROM pesquisa JOIN alternativa ON fkPesquisa = idPesquisa
JOIN resposta ON fkAlternativa = idAlternativa;

SELECT * FROM alternativa JOIN resposta ON fkAlternativa = idAlternativa;

-- TOTAL DE RESPOSTAS EM CADA PERGUNTA
SELECT COUNT(idAlternativa) 'qtd'
	FROM alternativa JOIN resposta ON fkAlternativa = idAlternativa 
    WHERE fkPesquisa = 1
    GROUP BY fkPesquisa;
    
-- IDADE
SELECT TIMESTAMPDIFF(YEAR, dtNasc, now()) AS idade FROM usuario;

-- DISPOSITIVOS
SELECT usuario.dispositivo, COUNT(usuario.idUsuario) FROM usuario GROUP BY usuario.dispositivo;