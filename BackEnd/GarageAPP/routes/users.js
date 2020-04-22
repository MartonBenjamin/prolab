var express = require('express');
var router = express.Router();
const{
    createUser,
    getUsers,
    getUserById,
    deleteUser
} = require("../controllers/usercontroller");



router.post('/register', createUser);
router.get('/:id',getUserById);
router.get('/',getUsers);
router.delete('/',deleteUser);

module.exports = router;
