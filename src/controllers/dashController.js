var dashModel = require("../models/dashModel");

function capturarEscolhaFinal(req, res) {
    dashModel.capturarEscolhaFinal().then((resultado) => {
        res.status(200).json(resultado);
    })
}

function capturarPergunta1(req, res) {
    dashModel.capturarPergunta1().then((resultado) => {
        res.status(200).json(resultado);
    })
}

function capturarPergunta2(req, res) {
    dashModel.capturarPergunta2().then((resultado) => {
        res.status(200).json(resultado);
    })
}

function capturarPergunta3(req, res) {
    dashModel.capturarPergunta3().then((resultado) => {
        res.status(200).json(resultado);
    })
}

function capturarIdade(req, res) {
    dashModel.capturarIdade().then((resultado) => {
        res.status(200).json(resultado);
    })
}

function capturarDispositivo(req, res) {
    dashModel.capturarDispositivo().then((resultado) => {
        res.status(200).json(resultado);
    })
}

// LINKS
function capturarLink(req, res) {
    dashModel.capturarLink().then((resultado) => {
        res.status(200).json(resultado);
    })
}

// TOTAL
function capturarTotal(req, res) {
    dashModel.capturarTotal().then((resultado) => {
        res.status(200).json(resultado);
    })
}


// INSERT INTO
function inserirAlternativa(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var fkUsuario = req.body.fkUsuarioServer;
    var fkResposta = req.body.fkRespostaServer;

    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    dashModel.inserirAlternativa(fkUsuario, fkResposta)
        .then(            
            function (resultado) {
                console.log("INSERT INTO");
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
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
    inserirAlternativa
}