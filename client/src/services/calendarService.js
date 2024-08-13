import axios from "axios";

const API_URL =
  "https://sturdy-train-6ww6p76v777f4465-3000.app.github.dev/api/v1/interaction";

const getEvents = async () => {
  const response = await axios.get(API_URL);
  return response.data;
};

const getEventsById = async (id) => {
  const response = await axios.get(`${API_URL}/${id}`);
  return response.data;
};

const createEvent = async (event) => {
  const response = await axios.post(API_URL, event);
  return response.data;
};

const updateEvent = async (id, event) => {
  const response = await axios.put(`${API_URL}/${id}`, event);
  return response.data;
};

const deleteEvent = async (id) => {
  const response = await axios.delete(`${API_URL}/${id}`);
  return response.data;
};

export default {
  getEvents,
  getEventsById,
  createEvent,
  updateEvent,
  deleteEvent,
};
