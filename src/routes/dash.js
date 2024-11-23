var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/capturarEscolhaFinal", function (req, res) {
    dashController.capturarEscolhaFinal(req, res);
});

router.get("/capturarPergunta1", function (req, res) {
    dashController.capturarPergunta1(req, res);
});

router.get("capturarPergunta2", function (req, res) {
    dashController.capturarPergunta2(req, res);
})

router.get("capturarPergunta3", function (req, res) {
    dashController.capturarPergunta3(req, res);
})

module.exports = router;