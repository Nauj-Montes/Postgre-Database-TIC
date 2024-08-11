const { Router } = require("express");
const salesController = require("../controllers/sales.controller");

const router = Router();

// Crear una nueva venta
router.post("/", (req, res) => salesController.createSale(req, res));

// Actualizar una venta por ID
router.put("/:id", (req, res) => salesController.updateSale(req, res));

module.exports = router;