const jwt = require("jsonwebtoken");
const keys = require("../config/auth");
const {getUserByToken} = require("../services/UserService");
module.exports = {
    checkToken: (req, res, next) => {
        let loggedUser;
        let token = req.get("Authorization");
        if (token) {
            jwt.verify(token, keys.secretOrKey, (err, decoded) => {
                if (err) {
                    return res.json({
                        success: 0,
                        message: "Invalid Token..."
                    });
                } else {
                    getUserByToken(token,(err,result) =>{
                        if(err){
                            console.log(err);
                        }
                        else{
                            loggedUser = result.username;
                            console.log(loggedUser +"'s request:");
                        }
                    });
                    req.decoded = decoded;
                    //console.log(token);
                    next();
                }
            });
        } else {
            return res.json({
                success: 0,
                message: "Access Denied! Unauthorized User"
            });
        }
    }
};