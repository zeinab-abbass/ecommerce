const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const CategorySchema = mongoose.Schema({
    name: { type: String, required: true, unique: true }
    producer: { type: Schema.Types.ObjectId, ref: 'Producer', required: true },
});

// to create data objects based on the schema we need model
module.exports = Category = mongoose.model('Category', CategorySchema);
