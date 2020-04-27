var express = require('express');
var router = express.Router();
const {HowToUsePermission} = require('../controllers/PermissionController');
const { checkToken } = require("../authentication/token_validation");
const{
    createUser,
    getUsers,
    getUserById,
    deleteUser,
    login
} = require("../controllers/usercontroller");

router.post('/register', createUser);
router.get('/', checkToken, getUsers);
router.get('/a', HowToUsePermission);
router.delete('/',deleteUser);
router.post("/login", login);
router.get('/:id',checkToken,getUserById);
/*router.get('/current', passport.authenticate('jwt',{session:false}),
    (req,res)=> {
    res.json({msg: 'Success'});
    });*/

module.exports = router;
