var database = require("../database/config");

function capturarEscolhaFinal() {
    var instrucaoSql = `
    SELECT resposta.r_alternativa, COUNT(alternativa.fkResposta) FROM usuario JOIN alternativa 
	ON usuario.idUsuario = alternativa.fkUsuario JOIN resposta 
    ON resposta.idResposta = alternativa.fkResposta
    WHERE fkPesquisa = 1
	GROUP BY resposta.r_alternativa;
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    capturarEscolhaFinal
}