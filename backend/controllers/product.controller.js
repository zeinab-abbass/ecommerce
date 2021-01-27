const express = require('express')

const Producer = require('../models/Producer.model.js');
const Product = require('../models/Product.model.js');

//add product


//list producers
exports.listProducts = async (req, res, next) => {
       let products Product.find({ { producer: req.body.producer } })
       .exec((error, data) => {

           if (error) {
             return res.status(500).send("There was a problem finding the user.");
           }
           else  if (!data) return res.status(404).send("No data found.");
           else {
             return res.status(200).send(data);
           }
       })
 }
