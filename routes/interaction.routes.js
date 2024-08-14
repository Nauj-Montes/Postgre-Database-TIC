const { Router } = require("express");
const { createInteractionController, getInteractionsController, getInteractionByIdController, updateInteractionController, deleteInteractionController } = require('../controllers/interaction.controller');

const router = Router();

router.post('/', createInteractionController);
router.get('/', getInteractionsController);
router.get('/:id', getInteractionByIdController);
router.put('/:id', updateInteractionController);
router.delete('/:id', deleteInteractionController);

module.exports = router;