const express = require('express')

const Producer = require('../models/Producer.model.js');
const User = require('../models/User.model.js');

//list producers
exports.listProducers = async (req, res, next) => {
       let producers = Producer.find({}).populate({ path: 'user', model: User}).exec((error, data) => {
           if (error) {
                return res.status(500).send("There was a problem finding the data");
           }
           else  if (!data) return res.status(404).send("No data found.");
           else {
                return res.status(200).send(data);
           }
       })
 }
