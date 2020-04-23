const jwt = require("jsonwebtoken");
const keys = require("../config/auth");
module.exports = {
    checkToken: (req, res, next) => {
        let token = req.get("Authorization");
        if (token) {
            jwt.verify(token, keys.secretOrKey, (err, decoded) => {
                if (err) {
                    return res.json({
                        success: 0,
                        message: "Invalid Token..."
                    });
                } else {
                    req.decoded = decoded;
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