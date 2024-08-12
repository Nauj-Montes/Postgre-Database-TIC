const express = require("express");
const cors = require("cors");
const contactRoutes = require("./routes/contact.routes");
const interactionRoutes = require("./routes/interaction.routes");
const reportRoutes = require("./routes/report.routes");
const salesRoutes = require("./routes/sales.routes");
const { logErrors, boomErrorHandler, errorHandler } = require('./middlewares/error.handler');

const app = express();
const port = 3000;

const corsOptions = {
  origin: '*',
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  preflightContinue: false,
  optionsSuccessStatus: 204,
};

app.use(cors(corsOptions));
app.use(express.json());

try {
  app.listen(port, () => console.log(`Example app listening on port ${port}!`));
} catch (error) {
  console.error('Error starting the server:', error);
}

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.use("/api/v1/contacts", contactRoutes);
app.use("/api/v1/interaction", interactionRoutes);
app.use("/api/v1/report", reportRoutes);
app.use("/api/v1/sales", salesRoutes);

app.use(logErrors);
app.use(boomErrorHandler);
app.use(errorHandler);

// Global error handler for unhandled promise rejections and uncaught exceptions
process.on('unhandledRejection', (reason, promise) => {
  console.error('Unhandled Rejection at:', promise, 'reason:', reason);
});

process.on('uncaughtException', (error) => {
  console.error('Uncaught Exception:', error);
});