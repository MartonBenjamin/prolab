var express = require('express');
var router = express.Router();

const {addGaragedoor} = require('../controllers/garagedoorcontroller');

router.post('/addGaragedoor', addGaragedoor);

module.exports = router;
