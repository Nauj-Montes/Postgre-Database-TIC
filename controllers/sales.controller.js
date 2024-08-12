const {
    createSale,
    getSales,
    getSaleById,
    updateSale,
    deleteSale,
  } = require('../services/sales.service');
  
  // Controller to create a new sale
  async function createSaleController(req, res) {
    try {
      const sale = await createSale(req.body);
      res.status(201).json(sale);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  // Controller to get all sales
  async function getSalesController(req, res) {
    try {
      const sales = await getSales();
      res.status(200).json(sales);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  // Controller to get sale by ID
  async function getSaleByIdController(req, res) {
    try {
      const sale = await getSaleById(req.params.id);
      res.status(200).json(sale);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
  
  // Controller to update sale by ID
  async function updateSaleController(req, res) {
    try {
      const sale = await updateSale(req.params.id, req.body);
      res.status(200).json(sale);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  // Controller to delete sale by ID
  async function deleteSaleController(req, res) {
    try {
      const sale = await deleteSale(req.params.id);
      res.status(200).json(sale);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  
  module.exports = {
    createSaleController,
    getSalesController,
    getSaleByIdController,
    updateSaleController,
    deleteSaleController,
  };