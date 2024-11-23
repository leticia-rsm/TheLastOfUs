var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/capturarEscolhaFinal", function (req, res) {
    dashController.capturarEscolhaFinal(req, res);
});

module.exports = router;