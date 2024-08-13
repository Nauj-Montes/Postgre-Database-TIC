const industries = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    'Retail',
    'Manufacturing',
    'Real Estate',
    'Transportation',
    'Energy',
    'Entertainment'
  ];
  
  function getRandomIndustry() {
    const randomIndex = Math.floor(Math.random() * industries.length);
    return industries[randomIndex];
  }
  
  module.exports = { getRandomIndustry };