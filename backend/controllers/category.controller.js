const express = require('express')

const Category = require('../models/Category.model.js');

// add category
exports.addCategory = async (req, res, next) => {
      let category;
      
}

//list categories
exports.listCategories = async (req, res, next) => {
      let categories Category.find({ { producer: req.body.producer } })
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
