const mongoose = require('mongoose');

mongoose.connect('mongodb://127.0.0.1:27017/GrowDb',{
    useMongoClient: true
  })
  .then( () =>{
    console.log("Connected to Database!")
  })
  .catch( ()=>{
    console.log("Connection Failed!")
  });