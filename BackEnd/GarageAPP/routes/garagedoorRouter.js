var express = require('express');
var router = express.Router();

const {addGaragedoor,getDoors,getDoorById} = require('../controllers/garagedoorcontroller');
const { isWorker, isManager ,isSupervisor} = require('../authentication/userPermissions');
const { checkToken } = require("../authentication/token_validation");
const {orderParts,partOrderCompleted,getDoorTotalParts,getParts,getPartsToDoor,getMaterials,getDoorPrice} = require('../controllers/SelectController');

router.post('/addDoor', checkToken, isWorker, addGaragedoor);
router.get('/', checkToken, isWorker, getDoors);
router.get('/:id', checkToken, isWorker, getDoorById);
router.get('/price/:id', checkToken, getDoorPrice);
router.get('/partstodoor/:id',checkToken, isWorker, getPartsToDoor);
router.post('/orderPart',checkToken,isWorker,orderParts);
router.post('/orderCompleted',checkToken,isWorker,partOrderCompleted); //Alkatrész érkezése esetén
router.get('/totalParts',checkToken,isWorker,getDoorTotalParts); //ajtóhoz való alkatrész
router.get('/getparts',checkToken,isWorker,getParts);//Összes alkatrész
router.get('/materials',getMaterials);


module.exports = router;
