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

module.exports = {
    capturarEscolhaFinal,
    capturarPergunta1,
    capturarPergunta2,
    capturarPergunta3
}