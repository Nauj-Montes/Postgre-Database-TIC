function logErrors(err, req, res, next) {
  console.error(err.stack);
  next(err);
}

function boomErrorHandler(err, req, res, next) {
  if (err.isBoom) {
    const { output } = err;
    res.status(output.statusCode).json(output.payload);
  } else {
    next(err);
  }
}

function errorHandler(err, req, res, next) {
  res.status(500).json({
    message: "An internal server error occurred",
    statusCode: 500,
    error: "Internal Server Error"
  });
}

module.exports = { logErrors, boomErrorHandler, errorHandler };