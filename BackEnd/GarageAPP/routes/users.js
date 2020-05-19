var express = require('express');
var router = express.Router();
const { checkToken } = require("../authentication/token_validation");
const { isWorker, isManager ,isSupervisor} = require('../authentication/userPermissions');
const{
    createUser,
    getUsers,
    getUserById,
    deleteUser,
    login
} = require("../controllers/usercontroller");

router.post('/register', createUser);
router.get('/', checkToken, getUsers, isSupervisor);
router.delete('/',checkToken, isSupervisor, deleteUser);
router.post("/login", login);
router.get('/:id',checkToken,isSupervisor, getUserById);

module.exports = router;
