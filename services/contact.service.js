const Contact = require("../models/contact.model");
const Interaction = require("../models/interaction.model");
const boom = require("@hapi/boom");

// Get all contacts
async function getAllContacts() {
  try {
    const contacts = await Contact.findAll();
    return contacts;
  } catch (error) {
    console.error('Error retrieving contacts:', error); // Log the error details
    throw boom.internal("Error retrieving contacts", error);
  }
}

// Create a new contact
async function createContact(data) {
  try {
    const newContact = await Contact.create(data);
    return newContact;
  } catch (error) {
    if (error.name === "SequelizeUniqueConstraintError") {
      throw boom.conflict("Email already exists", error);
    } else if (error.name === "SequelizeValidationError") {
      throw boom.badData("Validation error", error);
    }
    throw boom.badData("Error creating contact", error);
  }
}

// Get contact by ID
async function getContactById(id) {
  try {
    const contact = await Contact.findByPk(id);
    if (!contact) {
      throw boom.notFound("Contact not found");
    }
    return contact;
  } catch (error) {
    throw boom.internal("Error retrieving contact", error);
  }
}

// Update contact by ID
async function updateContact(id, data) {
  try {
    const contact = await Contact.findByPk(id);
    if (!contact) {
      throw boom.notFound("Contact not found");
    }
    await contact.update(data);
    return contact;
  } catch (error) {
    throw boom.badData("Error updating contact", error);
  }
}

// Delete contact by ID
async function deleteContact(id) {
  try {
    const contact = await Contact.findByPk(id);
    if (!contact) {
      throw boom.notFound("Contact not found");
    }

    // Now delete the contact
    await contact.destroy();
    return { message: "Contact deleted successfully" };
  } catch (error) {
    console.error('Error deleting contact:', error); // Log the error details
    throw boom.internal("Error deleting contact", error);
  }
}

// Export the service functions
module.exports = {
  getAllContacts,
  createContact,
  getContactById,
  updateContact,
  deleteContact,
};