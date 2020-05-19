var express = require('express');
var router = express.Router();

const {addGaragedoor,getDoors,getDoorById} = require('../controllers/garagedoorcontroller');
const{getDoorPrice,getPartsToDoor} = require('../controllers/SelectController');
const { isWorker, isManager ,isSupervisor} = require('../authentication/userPermissions');
const { checkToken } = require("../authentication/token_validation");

router.post('/addDoor', checkToken, isWorker, addGaragedoor);
router.get('/', checkToken, isWorker, getDoors);
router.get('/:id', checkToken, isWorker, getDoorById);
router.get('/price/:id', checkToken, getDoorPrice);
router.get('/partstodoor/:id',checkToken, isWorker, getPartsToDoor);


module.exports = router;
