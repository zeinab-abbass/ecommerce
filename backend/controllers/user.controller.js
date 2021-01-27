const express = require('express')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

const User = require('../models/User.model.js');
const Customer = require('../models/Customer.model.js');
const Producer = require('../models/Producer.model.js');

//Register

exports.register = async (req, res, next) => {
       let user;

       if ((!req.body.username) || (!req.body.email) || (!req.body.password) || (!req.body.role) ) {
           return res.json({error: 'Enter all fields'})
       }

       //we will not store pass for the act of security
       //we will encrypt and decrypt pass acc to library bcrypt
       //encrypting pass
       await bcrypt.hash(req.body.password, 10, function(err,hash){
            if(err) throw err;

            user = new User({
                username: req.body.username,
                email: req.body.email,
                password: hash,
                role: req.body.role
            })
            User.findOne({
                email: req.body.email
            })
            .then( user1 => {
                if (!user1) {
                  //save user created to database => .then the callback fn it return the json object
                  user.save()
                  .then(result => {
                    if(req.body.role == "customer"){
                        _customer = new Customer({
                            user: user._id
                        })
                        _customer.save()
                        .then( result1 => {
                             return res.status(201).json(
                            {
                               massage: 'User created successfully!',
                               result: result
                            });
                        })
                    }
                    else{
                        producer = new Producer({
                            user: user._id
                        })
                        producer.save()
                        .then( result2 => {
                            return res.status(201).json(
                           {
                              massage: 'User created successfully!',
                              result: result
                           });
                        })
                    }

                  })
                  .catch(err => {
                     return res.status(500).send(
                      {
                         error: err
                      });
                  });

                } else {
                     return res.json({error: 'User already exists.'})
                     }
            })
            .catch(err => {
                return res.send('error: '+err)
            })

       });
}

//Login

exports.login = async (req,res,next) =>{
  let  user1;
  //1.find if the email found
  await User.findOne( { email:req.body.email } )
    .then(user => {
      if (!user) {
        return res.status(401).json({
          massage: "Authentication Failed : User not Found."
        });
      }
      user1 = user;
      //2.we find the email we must compare pass to find if it match
     bcrypt.compare(req.body.password, user.password,function (err,res1) {
       if (!res1) {
         return res.status(401).json({
           massage: 'Authentication Failed: False Password.'
         })
       } else {
         //password match then we want to create the token
         const token = jwt.sign({email: user1.email, id: user1._id}, 'secret-key', {
           algorithm: 'HS256',
           expiresIn: '1h',
           subject: user1.email
         }); //this method create token and we give it the data we want to store

         return res.status(201).json({
           massage: "auth " + user1,
           user: user1,
           token: token,
           expires: 3600
         });
       }
     });
    })
    .catch(err => {
      return res.status(401).json({
        massage : 'Authentication Failed!!'
      })
    });
}

//Verify Token
const verifyToken = require('../middleware/check-auth');

//profile
exports.profile = async (req, res, next) => {

  await User.findById( req.params.id).exec((error, data) => {

    if (error) {
      return res.status(500).send("There was a problem finding the user.");
    }
    else  if (!data) return res.status(404).send("No user found.");
    else {
      return res.status(200).send("profile");
    }
  })
}

// verify that this user is customer
exports.verifyCustomer = async (req, res, next) => {


}