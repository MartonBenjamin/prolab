const pool = require('../config/db');

module.exports = {
    getUserPermission: (token,callBack) =>{
        pool.query(
            'select groupid from users where token = ?',
            [token],
            (error,results,fields) => {
                if(error){
                    return callBack(error);
                }
                result = results[0].groupid;
                console.log(result);
                switch (result) {
                    case 1:
                        console.log("user");
                        return callBack(null,"User");
                        break;
                    case 2:
                        console.log("Engineer");
                        return "Engineer";
                        break;
                    case 3:
                        console.log("Worker");
                        return "Worker";
                        break;
                    case 4:
                        console.log("Support");
                        return "Support";
                        break;
                    case 5:
                        console.log("Manager");
                        return "Manager";
                        break;
                    case 6:
                        console.log("Supervisor");
                        return "Supervisor";
                        break;
                    default:
                        console.log("Default");
                        return "Error";

                }

                return callBack(null,results[0]);

            }
        );
    },
};