const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const OrderItemSchema = mongoose.Schema({
    quantity: { type: Number, required: [true, "Please fill this field"], validate : { validator : Number.isInteger, message: '{VALUE} is not integer' } },
    order: { type: Schema.Types.ObjectId, ref: 'Order', required: true },
    product: { type: Schema.Types.ObjectId, ref: 'Product', required: true },

});

// to create data objects based on the schema we need model
module.exports = OrderItem = mongoose.model('OrderItem',OrderItemSchema);

