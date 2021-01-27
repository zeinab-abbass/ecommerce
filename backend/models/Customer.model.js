const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const CustomerSchema = mongoose.Schema({
    user: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    phone: { type: String, unique: true },
    orders : [{ type: Schema.Types.ObjectId, ref: 'Order' }]
});

// to create data objects based on the schema we need model
module.exports = Customer = mongoose.model('Customer',CustomerSchema);
