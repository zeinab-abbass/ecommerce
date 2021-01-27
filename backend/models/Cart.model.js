const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const CartSchema = mongoose.Schema({
    total: { type: Number, default: 0 },
    customer: { type: Schema.Types.ObjectId, ref: 'Customer', required: true },
    order: { type: Schema.Types.ObjectId, ref: 'Order', required: true },
});

// to create data objects based on the schema we need model
module.exports = Cart = mongoose.model('Cart', CartSchema);
