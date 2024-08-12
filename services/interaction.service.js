const Interaction = require('../models/interaction.model');
const boom = require('@hapi/boom');

// Create a new interaction
async function createInteraction(data) {
  try {
    const newInteraction = await Interaction.create(data);
    return newInteraction;
  } catch (error) {
    throw boom.badData('Error creating interaction', error);
  }
}

// Get all interactions
async function getInteractions() {
  try {
    const interactions = await Interaction.findAll();
    return interactions;
  } catch (error) {
    throw boom.internal('Error retrieving interactions', error);
  }
}

// Get interaction by ID
async function getInteractionById(id) {
  try {
    const interaction = await Interaction.findByPk(id);
    if (!interaction) {
      throw boom.notFound('Interaction not found');
    }
    return interaction;
  } catch (error) {
    throw boom.internal('Error retrieving interaction', error);
  }
}

// Update interaction by ID
async function updateInteraction(id, data) {
  try {
    const interaction = await Interaction.findByPk(id);
    if (!interaction) {
      throw boom.notFound('Interaction not found');
    }
    await interaction.update(data);
    return interaction;
  } catch (error) {
    throw boom.badData('Error updating interaction', error);
  }
}

// Delete interaction by ID
async function deleteInteraction(id) {
  try {
    const interaction = await Interaction.findByPk(id);
    if (!interaction) {
      throw boom.notFound('Interaction not found');
    }
    await interaction.destroy();
    return { message: 'Interaction deleted successfully' };
  } catch (error) {
    throw boom.internal('Error deleting interaction', error);
  }
}

module.exports = {
  createInteraction,
  getInteractions,
  getInteractionById,
  updateInteraction,
  deleteInteraction,
};