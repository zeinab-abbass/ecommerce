const express = require('express')
const router = express.Router()

const actions = require("../controllers/user.controller")
const verifyToken = require('../middleware/check-auth');

router.get('/', (req,res) => {
    res.send('hello world');
});

router.post('/signup', actions.register)
router.post('/login', actions.login)
router.get('/profile/:id', verifyToken, actions.profile)

module.exports = router;
