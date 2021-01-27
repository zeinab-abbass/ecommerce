const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const UserSchema = mongoose.Schema({
    username : { type: String, required: [true, "Please fill this field"] , unique: [true, "Already taken"] },
    email : { type: String, required: [true, "Please fill this field"], unique: [true, "Already taken"] },
    password : { type: String, required: [true, "Please fill this field"], minlength: 8 },
    image: { type: String },
    role: { type: String, enum: ['customer', 'producer'], required: [true, "Please fill this field"] }
});

// to create data objects based on the schema we need model
module.exports = User = mongoose.model('User',UserSchema);
