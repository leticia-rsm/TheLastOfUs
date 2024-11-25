var database = require("../database/config");

function capturarEscolhaFinal() {
    var instrucaoSql = `
    SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) AS 'qtd' FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 1
	GROUP BY resposta.r_alternativa;
    `;

    return database.executar(instrucaoSql);
}

function capturarPergunta1() {
    var instrucaoSql = `
    SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) AS 'qtd' FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 2
	GROUP BY resposta.r_alternativa;
    `;

    return database.executar(instrucaoSql);
}

function capturarPergunta2() {
    var instrucaoSql = `
    SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) AS 'qtd' FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 3
	GROUP BY resposta.r_alternativa;
    `;

    return database.executar(instrucaoSql);
}

function capturarPergunta3() {
    var instrucaoSql = `
    SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) AS 'qtd' FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 4
	GROUP BY resposta.r_alternativa;
    `;

    return database.executar(instrucaoSql);
}

function capturarIdade() {
    var instrucaoSql = `
    SELECT nickname,
    CASE 
    	WHEN TIMESTAMPDIFF(YEAR, dtNasc, now()) <= 21 AND TIMESTAMPDIFF(YEAR, dtNasc, now()) >= 18 THEN '18 a 21'
        WHEN TIMESTAMPDIFF(YEAR, dtNasc, now()) <= 25 AND TIMESTAMPDIFF(YEAR, dtNasc, now()) >= 22 THEN '22 a 25'
        WHEN TIMESTAMPDIFF(YEAR, dtNasc, now()) <= 29 AND TIMESTAMPDIFF(YEAR, dtNasc, now()) >= 26 THEN '26 a 29'
        WHEN TIMESTAMPDIFF(YEAR, dtNasc, now()) >= 30 THEN '30+'
    END AS 'faixaEtaria'
    FROM usuario;
    `;

    return database.executar(instrucaoSql);
}

function capturarDispositivo() {
    var instrucaoSql = `
    SELECT usuario.dispositivo, COUNT(usuario.idUsuario) AS 'qtd' FROM usuario 
    GROUP BY usuario.dispositivo;
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    capturarEscolhaFinal,
    capturarPergunta1,
    capturarPergunta2,
    capturarPergunta3,
    capturarIdade,
    capturarDispositivo
}