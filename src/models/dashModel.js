var database = require("../database/config");

function capturarEscolhaFinal() {
    var instrucaoSql = `
    SELECT alternativa.caractere, COUNT(resposta.fkAlternativa) AS 'qtd' FROM usuario JOIN resposta 
	ON usuario.idUsuario = resposta.fkUsuario JOIN alternativa 
    ON alternativa.idAlternativa = resposta.fkAlternativa
    WHERE fkPesquisa = 1
	GROUP BY alternativa.caractere;
    `;

    return database.executar(instrucaoSql);
}

function capturarPergunta1() {
    var instrucaoSql = `
    SELECT alternativa.caractere, COUNT(resposta.fkAlternativa) AS 'qtd' FROM usuario JOIN resposta 
	ON usuario.idUsuario = resposta.fkUsuario JOIN alternativa 
    ON alternativa.idAlternativa = resposta.fkAlternativa
    WHERE fkPesquisa = 2
	GROUP BY alternativa.caractere;
    `;

    return database.executar(instrucaoSql);
}

function capturarPergunta2() {
    var instrucaoSql = `
    SELECT alternativa.caractere, COUNT(resposta.fkAlternativa) AS 'qtd' FROM usuario JOIN resposta 
	ON usuario.idUsuario = resposta.fkUsuario JOIN alternativa 
    ON alternativa.idAlternativa = resposta.fkAlternativa
    WHERE fkPesquisa = 3
	GROUP BY alternativa.caractere;
    `;

    return database.executar(instrucaoSql);
}

function capturarPergunta3() {
    var instrucaoSql = `
    SELECT alternativa.caractere, COUNT(resposta.fkAlternativa) AS 'qtd'  FROM usuario JOIN resposta 
	ON usuario.idUsuario = resposta.fkUsuario JOIN alternativa 
    ON alternativa.idAlternativa = resposta.fkAlternativa
    WHERE fkPesquisa = 4
	GROUP BY alternativa.caractere;
    `;

    return database.executar(instrucaoSql);
}

function capturarIdade() {
    var instrucaoSql = `
    SELECT TIMESTAMPDIFF(YEAR, dtNasc, now()) AS idade FROM usuario;
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

// LINK
function capturarLink() {
    var instrucaoSql = `
    SELECT nome, COUNT(idSite) AS 'qtd' FROM siteFooter
	GROUP BY nome;
    `;

    return database.executar(instrucaoSql);
}

// TOTAL
function capturarTotal() {
    var instrucaoSql = `
    SELECT COUNT(fkAlternativa) 'qtd'
	FROM resposta JOIN alternativa ON fkAlternativa = idAlternativa
    WHERE fkPesquisa = 1
    GROUP BY fkPesquisa;
    `;

    return database.executar(instrucaoSql);
}

// INSERTS
function inserirAlternativa(fkUsuario, fkAlternativa) {
    console.log("INSERT INTO");
    var instrucaoSql = `
        INSERT INTO resposta (fkUsuario, fkAlternativa) VALUES ('${fkUsuario}', '${fkAlternativa}');
    `;
    return database.executar(instrucaoSql);
}

function inserirSite(nome) {
    var instrucaoSql = `
        INSERT INTO siteFooter (nome) VALUES ('${nome}');
    `;
    return database.executar(instrucaoSql);
}

module.exports = {
    capturarEscolhaFinal,
    capturarPergunta1,
    capturarPergunta2,
    capturarPergunta3,
    capturarIdade,
    capturarDispositivo,
    capturarLink,
    capturarTotal,
    inserirAlternativa,
    inserirSite
}