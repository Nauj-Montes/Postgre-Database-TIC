// Importar Sequelize y la conexión a la base de datos
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

// Definir el modelo de interacción
const Interaction = sequelize.define('Interaction', {
  contactId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'contacts', // Nombre de la tabla relacionada
      key: 'id', // Clave foránea que hace referencia al campo 'id' de la tabla 'contacts'
    },
  },
  type: {
    type: DataTypes.ENUM('email', 'call', 'deal', 'meeting', 'other'),
    allowNull: false,
  },
  date: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW, // Fecha por defecto a la fecha y hora actuales
  },
  notes: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
}, {
  timestamps: true,
  tableName: 'interactions',
});

// Exportar el modelo
module.exports = Interaction;