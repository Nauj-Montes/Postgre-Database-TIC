const Sale = require('../models/sales.model');
const boom = require('@hapi/boom');

// Create a new sale
async function createSale(data) {
  try {
    const newSale = await Sale.create(data);
    return newSale;
  } catch (error) {
    throw boom.badData('Error creating sale', error);
  }
}

// Get all sales
async function getSales() {
  try {
    const sales = await Sale.findAll();
    return sales;
  } catch (error) {
    throw boom.internal('Error retrieving sales', error);
  }
}

// Get sale by ID
async function getSaleById(id) {
  try {
    const sale = await Sale.findByPk(id);
    if (!sale) {
      throw boom.notFound('Sale not found');
    }
    return sale;
  } catch (error) {
    throw boom.internal('Error retrieving sale', error);
  }
}

// Update sale by ID
async function updateSale(id, data) {
  try {
    const sale = await Sale.findByPk(id);
    if (!sale) {
      throw boom.notFound('Sale not found');
    }
    await sale.update(data);
    return sale;
  } catch (error) {
    throw boom.badData('Error updating sale', error);
  }
}

// Delete sale by ID
async function deleteSale(id) {
  try {
    const sale = await Sale.findByPk(id);
    if (!sale) {
      throw boom.notFound('Sale not found');
    }
    await sale.destroy();
    return { message: 'Sale deleted successfully' };
  } catch (error) {
    throw boom.internal('Error deleting sale', error);
  }
}

module.exports = {
  createSale,
  getSales,
  getSaleById,
  updateSale,
  deleteSale,
};