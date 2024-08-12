const express = require("express");
const cors = require("cors"); // Import cors
const contactRoutes = require("./routes/contact.routes");
const interactionRoutes = require("./routes/interaction.routes");
const reportRoutes = require("./routes/report.routes");
const salesRoutes = require("./routes/sales.routes");
/* const { logErrors, boomErrorHandler, errorHandler } = require('./middlewares/error.handler'); // Assuming these are your error handlers */

const app = express();
const port = 3000;

const corsOptions = {
  origin: '*', // Or specify your front-end's origin
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  preflightContinue: false,
  optionsSuccessStatus: 204,
};

app.use(cors(corsOptions));

// Enable parsing JSON bodies
app.use(express.json());

// Start the server
app.listen(port, () => console.log(`Example app listening on port ${port}!`));

// Root route
app.get("/", (req, res) => {
  res.send("Hello World!");
});

// Routes
app.use("/api/v1/contacts", contactRoutes);
app.use("/api/v1/interaction", interactionRoutes);
app.use("/api/v1/report", reportRoutes);
app.use("/api/v1/sales", salesRoutes);

/* // Error handling middlewares
app.use(logErrors);
app.use(boomErrorHandler);
app.use(errorHandler); */
