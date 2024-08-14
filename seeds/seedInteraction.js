const { faker } = require('@faker-js/faker');
const sequelize = require('../config/sequelize');
const Interaction = require('../models/interaction.model');
const Contact = require('../models/contact.model');

const interactionTypes = ['email', 'call', 'deal', 'meeting', 'other'];

async function seedInteractions() {
  try {
    await sequelize.sync(); // Ensure the database is in sync

    const fakeInteractions = [];

    // Fetch all contacts to associate interactions with them
    const contacts = await Contact.findAll();

    for (let i = 0; i < 20; i++) {
      const randomContact = contacts[Math.floor(Math.random() * contacts.length)];
      const randomType = interactionTypes[Math.floor(Math.random() * interactionTypes.length)];

      const interaction = {
        contactId: randomContact.id,
        type: randomType,
        /* I want a random date from august 1 to august 31 of 2024 */
        date: faker.date.between('2024-08-01', '2024-08-31'),
        notes: faker.lorem.sentence(),
      };

      fakeInteractions.push(interaction);
    }

    await Interaction.bulkCreate(fakeInteractions); // Bulk insert interactions
    console.log('Interactions have been seeded successfully.');
  } catch (error) {
    console.error('Error seeding interactions:', error);
  } finally {
    await sequelize.close(); // Close the database connection
  }
}

// Execute the seed function
seedInteractions();
