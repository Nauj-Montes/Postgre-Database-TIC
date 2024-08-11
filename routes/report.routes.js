const { Router } = require("express");
const reportController = require("../controllers/report.controller");

const router = Router();

// Crear un nuevo reporte
router.post("/", (req, res) => reportController.createReport(req, res));

module.exports = router;