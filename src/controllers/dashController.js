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

module.exports = {
    capturarEscolhaFinal,
    capturarPergunta1,
    capturarPergunta2,
    capturarPergunta3,
    capturarIdade,
    capturarDispositivo,
    capturarLink
}