var express = require('express');
var router = express.Router();
const {placeOrder,addImage} = require('../controllers/OrderController');
const { checkToken } = require("../authentication/token_validation");
const { isWorker, isManager ,isSupervisor} = require('../authentication/userPermissions');

router.post('/place', checkToken,placeOrder);
router.post('/addImage',addImage);

module.exports = router;