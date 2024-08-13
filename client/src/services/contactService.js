import axios from "axios";

const API_URL =
  "https://sturdy-train-6ww6p76v777f4465-3000.app.github.dev/api/v1/contacts";

const getContacts = async () => {
  const response = await axios.get(API_URL);
  console.log(response.data);
  return response.data;
};

const getContactById = async (id) => {
  const response = await axios.get(`${API_URL}/${id}`);
  return response.data;
};

const createContact = async (contact) => {
  const response = await axios.post(API_URL, contact);
  return response.data;
};

const updateContact = async (id, contact) => {
  const response = await axios.put(`${API_URL}/${id}`, contact);
  return response.data;
};

const deleteContact = async (id) => {
  const response = await axios.delete(`${API_URL}/${id}`);
  return response.data;
};

export default {
  getContacts,
  getContactById,
  createContact,
  updateContact,
  deleteContact,
};
