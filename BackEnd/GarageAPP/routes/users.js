var express = require('express');
var router = express.Router();
var passport = require('passport');
const { checkToken } = require("../authentication/token_validation");
const{
    createUser,
    getUsers,
    getUserById,
    deleteUser,
    login
} = require("../controllers/usercontroller");



router.post('/register', createUser);
router.get('/:id',checkToken,getUserById);
router.get('/', checkToken, getUsers);
router.delete('/',deleteUser);
router.post("/login", login);
/*router.get('/current', passport.authenticate('jwt',{session:false}),
    (req,res)=> {
    res.json({msg: 'Success'});
    });*/

module.exports = router;
