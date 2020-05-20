var express = require('express');
var router = express.Router();
const {placeOrder,addImage,acceptOrder, refuseOrder, addDoorToTrack, getMyOrders, changeTrackDetails, getMyDoorsState} = require('../controllers/OrderController');
const { checkToken } = require("../authentication/token_validation");
const { isWorker, isManager ,isSupervisor} = require('../authentication/userPermissions');

router.post('/place', checkToken,placeOrder);
router.post('/addImage',checkToken, addImage);
router.post('/acceptOrder/:id',checkToken,acceptOrder);
router.post('/refuseOrder/:id',checkToken,isManager, refuseOrder);

router.post('/addDoorToTrack',checkToken,isWorker, addDoorToTrack);
router.get('/getMyOrders', checkToken,getMyOrders);
router.get('/getMyDoorsStates', checkToken,getMyDoorsState);
router.put('/changeTrackDetails', checkToken, isWorker, changeTrackDetails);



module.exports = router;