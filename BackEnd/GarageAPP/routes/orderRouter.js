var express = require('express');
var router = express.Router();
const {placeOrder,addImage,acceptOrder, refuseOrder} = require('../controllers/OrderController');
const { checkToken } = require("../authentication/token_validation");
const { isWorker, isManager ,isSupervisor} = require('../authentication/userPermissions');

router.post('/place', checkToken,placeOrder);
router.post('/addImage',addImage);
router.post('/acceptOrder/:id',checkToken,acceptOrder);
router.post('/refuseOrder/:id',checkToken,isManager, refuseOrder);

module.exports = router;