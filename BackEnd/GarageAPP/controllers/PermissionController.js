const {getUserPermission} = require('../services/PermissionService');

module.exports = {
    HowToUsePermission: (req, res) => {
            const token = req.get("Authorization");
            getUserPermission(token, (err, results) => {
                if (err) {
                    console.log(err);
                    return;
                }
                if (!results) {
                    return res.json({
                        message: "There is no user with the ID:"+id
                    });
                }
                switch(results) {
                    case "User":
                        return res.json({
                            message: "User"
                        });
                        break;
                    case "Engineer":

                        break;
                    case "Worker":

                        break;
                    case "Support":

                        break;
                    case "Manager":

                        break;
                    case "Supervisor":

                        break;
                    default:
                    // code block
                }
                console.log(results);

            });

            //console.log(permission);

        }
};