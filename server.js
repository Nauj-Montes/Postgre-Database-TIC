const express = require("express");
const contactRoutes = require("./routes/contact.routes");
const interactionRoutes = require("./routes/interaction.routes");
const reportRoutes = require("./routes/report.routes");
const salesRoutes = require("./routes/sales.routes");

const app = express();
const port = 3000;

app.use(express.json());

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

// Testing root route
app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.use("/api/v1/contacts", contactRoutes);
/* app.use("api/v1/interaction", interactionRoutes);
app.use("api/v1/report", reportRoutes);
app.use("api/v1/salesRoutes", salesRoutes); */

/* Middlewares on app
app.use(logErrors);
app.use(boomErrorHandler);
app.use(errorHandler);
 */
