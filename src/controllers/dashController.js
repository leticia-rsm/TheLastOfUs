var dashModel = require("../models/dashModel");

function capturarEscolhaFinal(req, res) {
    dashModel.capturarEscolhaFinal().then((resultado) => {
        res.status(200).json(resultado);
    })
}

module.exports = {
    capturarEscolhaFinal
}