const { Router } = require("express");
const interactionController = require("../controllers/interaction.controller");

const router = Router();

// Crear una nueva interacción
router.post("/", (req, res) => interactionController.createInteraction(req, res));

// Obtener todas las interacciones
router.get("/", (req, res) => interactionController.getInteractions(req, res));

// Obtener una interacción por ID
router.get("/:id", (req, res) => interactionController.getInteractionById(req, res));

// Actualizar una interacción por ID
router.put("/:id", (req, res) => interactionController.updateInteraction(req, res));

module.exports = router;