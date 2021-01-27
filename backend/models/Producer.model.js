const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const ProducerSchema = mongoose.Schema({
    user: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    description: { type: String, },
    opened: { type: Date, value: Date.now() },
    closed: { type: Date, value: Date.now() },
});

// to create data objects based on the schema we need model
module.exports = Producer = mongoose.model('Producer',ProducerSchema);
