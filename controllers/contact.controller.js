const contactService = require("../services/contact.service");

// Get all contacts
async function getContacts(req, res) {
  try {
    const contacts = await contactService.getAllContacts();
    res.json(contacts);
  } catch (error) {
    res.status(error.output.statusCode || 500).json(error.output.payload);
  }
}

// Create a new contact
async function createContact(req, res) {
  try {
    const contactData = req.body;
    const newContact = await contactService.createContact(contactData);
    res.status(201).json(newContact);
  } catch (error) {
    console.error('Error creating contact:', error); // Log the error details
    res.status(error.output.statusCode || 500).json(error.output.payload);
  }
}

// Get contact by ID
async function getContactById(req, res) {
  try {
    const contact = await contactService.getContactById(req.params.id);
    res.json(contact);
  } catch (error) {
    res.status(error.output.statusCode || 404).json(error.output.payload);
  }
}

// Update contact by ID
async function updateContact(req, res) {
  try {
    const updatedContact = await contactService.updateContact(
      req.params.id,
      req.body
    );
    res.json(updatedContact);
  } catch (error) {
    res.status(error.output.statusCode || 404).json(error.output.payload);
  }
}

// Delete contact by ID
async function deleteContact(req, res) {
  try {
    const result = await contactService.deleteContact(req.params.id);
    res.json(result);
  } catch (error) {
    res.status(error.output.statusCode || 404).json(error.output.payload);
  }
}

// Export the controller functions
module.exports = {
  getContacts,
  createContact,
  getContactById,
  updateContact,
  deleteContact,
};