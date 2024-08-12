const { Router } = require("express");
const { createSaleController, getSalesController, getSaleByIdController, updateSaleController, deleteSaleController } = require("../controllers/sales.controller");

const router = Router();

// Create a new sale

router.post("/", (req, res) => createSaleController(req, res));

// Get all sales

router.get("/", (req, res) => getSalesController(req, res));

// Get a sale by ID

router.get("/:id", (req, res) => getSaleByIdController(req, res));

// Update a sale by ID

router.put("/:id", (req, res) => updateSaleController(req, res));

// Delete a sale by ID

router.delete("/:id", (req, res) => deleteSaleController(req, res));

module.exports = router;

