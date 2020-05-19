var express = require('express');
var router = express.Router();

const{sendMessage,getMyMessages, getManagerMessages} = require('../controllers/MessageController');
const { isWorker, isManager ,isSupervisor} = require('../authentication/userPermissions');
const {checkToken} = require('../authentication/token_validation');

router.post("/send", checkToken,sendMessage);
router.get("/mymessages",checkToken, getMyMessages);
router.get("/managermessages", isManager, getManagerMessages);



module.exports = router;