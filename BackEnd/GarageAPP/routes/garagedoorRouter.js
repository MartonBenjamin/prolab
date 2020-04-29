var express = require('express');
var router = express.Router();

const {addGaragedoor,getDoors,getDoorById} = require('../controllers/garagedoorcontroller');

router.post('/addGaragedoor', addGaragedoor);
router.get('/', getDoors);
router.get('/:id', getDoorById);

module.exports = router;
