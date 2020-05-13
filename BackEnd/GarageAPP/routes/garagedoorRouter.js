var express = require('express');
var router = express.Router();

const {addGaragedoor,getDoors,getDoorById} = require('../controllers/garagedoorcontroller');
const{getDoorPrice,getPartsToDoor} = require('../controllers/SelectController');

router.post('/addDoor', addGaragedoor);
router.get('/', getDoors);
router.get('/:id', getDoorById);
router.get('/price/:id', getDoorPrice);
router.get('/partstodoor/:id',getPartsToDoor);


module.exports = router;
