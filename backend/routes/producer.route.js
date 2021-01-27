const express = require('express')
const router = express.Router()

const actions = require("../controllers/producer.controller")
const verifyToken = require('../middleware/check-auth');

router.get('/', (req,res) => {
    res.send('hello world');
});

router.get('/listProducers',actions.listProducers)

module.exports = router;
