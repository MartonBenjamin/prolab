var express = require('express');
var router = express.Router();
const { checkToken } = require("../authentication/token_validation");
const{
    createUser,
    getUsers,
    getUserById,
    deleteUser,
    login
} = require("../controllers/usercontroller");



router.post('/register', createUser);
router.get('/:id',getUserById);
router.get('/', getUsers);
router.delete('/',deleteUser);
router.post("/login", login);

module.exports = router;
