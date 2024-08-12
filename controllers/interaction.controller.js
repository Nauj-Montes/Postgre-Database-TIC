const {
    createInteraction,
    getInteractions,
    getInteractionById,
    updateInteraction,
    deleteInteraction,
  } = require('../services/interaction.service');
  
  // Controller to create a new interaction
  async function createInteractionController(req, res) {
    try {
      const interaction = await createInteraction(req.body);
      res.status(201).json(interaction);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  // Controller to get all interactions
  async function getInteractionsController(req, res) {
    try {
      const interactions = await getInteractions();
      res.status(200).json(interactions);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  // Controller to get interaction by ID
  async function getInteractionByIdController(req, res) {
    try {
      const interaction = await getInteractionById(req.params.id);
      res.status(200).json(interaction);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
  
  // Controller to update interaction by ID
  async function updateInteractionController(req, res) {
    try {
      const interaction = await updateInteraction(req.params.id, req.body);
      res.status(200).json(interaction);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  // Controller to delete interaction by ID
  async function deleteInteractionController(req, res) {
    try {
      const interaction = await deleteInteraction(req.params.id);
      res.status(200).json(interaction);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  module.exports = {
    createInteractionController,
    getInteractionsController,
    getInteractionByIdController,
    updateInteractionController,
    deleteInteractionController,
  };