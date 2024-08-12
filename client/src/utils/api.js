import axios from "axios";

const API = axios.create({
  baseURL:
    "https://potential-invention-xxx64q6rjpgf9pxq-3000.app.github.dev/api/v1", // Github Dev Server
});

export { API };
