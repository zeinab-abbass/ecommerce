const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const ProductSchema = mongoose.Schema({
    name: { type: String, required: [true, "Please fill this field"] },
    description: { type: String, required: [true, "Please fill this field"] },
    price: { type: Number, required: [true, "Please fill this field"] },
    currency: { type: String, required: [true, "Please fill this field"] },
    quantity: { type: Number, required: [true, "Please fill this field"], validate : { validator : Number.isInteger, message: '{VALUE} is not integer'} },
    image: { type: String, required: [true, "Please fill this field"] },
    available: { type: Boolean, required: true },
    producer: { type: Schema.Types.ObjectId, ref: 'Producer', required: true },
    category: { type: Schema.Types.ObjectId, ref: 'Category', required: true },
});

// to create data objects based on the schema we need model
module.exports = Product = mongoose.model('Product', ProductSchema);
