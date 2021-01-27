const path = require('path');
const express = require('express');
const app = express();
const http = require('http').createServer(app);
const cors = require("cors");
const bodyParser = require('body-parser');
require('./database/connection');

const userRoutes = require('./routes/user.route');
const producerRoutes = require('./routes/producer.route');

app.use(cors());

app.use(bodyParser.urlencoded({
  extended: false
}));

app.use(bodyParser.json()); // to give Express the ability to read JSON payloads from the HTTP request body

app.use(express.json());

//user router
app.use(userRoutes);
app.use(producerRoutes);

// start server
const port = '6000';
app.set('port',port);


http.listen(6000, '192.168.0.107');

app.use(function (err, req, res, next) {
  console.error(err.message);
  if (!err.statusCode) err.statusCode = 500;
  res.status(err.statusCode).send(err.message);
});

