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
                return callBack(null,results);

            }
        );
    },
};