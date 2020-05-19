const{getUserPermission} =  require("../services/PermissionService");

module.exports = {
    isWorker: (req,res,next) => {
        let token = req.get("Authorization");

        getUserPermission(token, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    message: "There is no user with the token"
                });
            }
            let result = results[0].groupid;
            if (result >= 2)
            {
                console.log("With permission worker");
                next();
            }
            else return res.json({
                success: 0,
                message: "Acces denied!"
            });
        });
    },
    isManager: (req,res,next) => {
        let token = req.get("Authorization");

        getUserPermission(token, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    message: "There is no user with the token"
                });
            }
            let result = results[0].groupid;
            if (result >= 3)
            {
                console.log("With permission Manager");
                next();
            }
            else return res.json({
                success: 0,
                message: "Acces denied!"
            });
        });
    },
    isSupervisor: (req,res,next) => {
        let token = req.get("Authorization");

        getUserPermission(token, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    message: "There is no user with the token"
                });
            }
            let result = results[0].groupid;
            if (result === 4) {
                console.log("With permission Supervisor");
                next();
            } else return res.json({
                success: 0,
                message: "Acces denied!"
            });
        });
    }
};