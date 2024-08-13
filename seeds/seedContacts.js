const { faker } = require('@faker-js/faker'); // Importing the latest Faker version
const sequelize = require('../config/sequelize'); // Your Sequelize instance
const { getRandomIndustry } = require('../utils/getRandomIndustry'); // Your getRandomIndustry function
const Contact = require('../models/contact.model'); // Your Contact model
const User = require('../models/user.model'); // Your User model

// Number of fake contacts to generate
const numberOfContacts = 100; // Adjust the number as needed

// Function to generate fake contact data
async function generateFakeContacts() {

  // Synchronize all models with the database
  await sequelize.sync(); // Creates tables if they don't exist

  // Fetch all users to associate contacts with them
  const users = await User.findAll();
  const fakeContacts = [];

  for (let i = 0; i < numberOfContacts; i++) {
    
    const user = faker.helpers.arrayElement(users);

    const contact = {
      userId: user.id,
      phoneNumber: faker.phone.number(),
      address: faker.location.streetAddress(),
      avatar: user.avatar, // Use avatar from User table
      firstName: user.firstName, // Use firstName from User table
      lastName: user.lastName, // Use lastName from User table
      email: user.email, // Use email from User table
      companyName: faker.company.name(),
      industry: getRandomIndustry(),
      companyLogo: faker.image.urlLoremFlickr({ category: 'business-logo' }), // Generate a fake company logo image URL
      companyDeals: faker.number.int({ min: 0, max: 100 }), // Generate a random number of deals
      companyRevenue: faker.number.int({ min: 1000, max: 1000000 }), // Generate a random revenue amount
    };

    fakeContacts.push(contact);
  }

  try {
    // Bulk insert fake contacts into the database
    await Contact.bulkCreate(fakeContacts, { validate: true });
    console.log('Fake contacts inserted successfully!');
  } catch (error) {
    console.error('Error inserting fake contacts:', error);
  } finally {
    // Close the database connection
    await sequelize.close();
  }
}

// Run the function to generate and insert contacts
generateFakeContacts();