const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const OrderSchema = mongoose.Schema({
    customer: { type: Schema.Types.ObjectId, ref: 'Customer', required: true },
    orderDate: { type: Date, required: true, value: Date.now() },
    total: { type: Number },
    items: [{ type: Schema.Types.ObjectId, ref: 'OrderItem' }]
});

// to create data objects based on the schema we need model
module.exports = Order = mongoose.model('Order',OrderSchema);
