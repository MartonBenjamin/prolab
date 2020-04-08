const User = require('../models/user');
const message = require('../utilities/jsonmessage')

exports.get_all_users = (req,res,next)=>{
    User.getAllUsers((err, result) =>{
        res.status(200).json(message.compose('200','Az összes felhasználó sikeresen lekérdezve!',result))
    })
}