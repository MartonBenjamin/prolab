const pool = require('../config/db');
module.exports ={
    sendMessage:(data,callBack)=>{
        pool.query(
            'INSERT INTO messages (from, to, message,)' +
            'VALUES(?,?,?)',
            [
                data.from,
                data.to,
                data.message
            ],
            (error,results)=>{
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }
        );
    },
    getMyMessages: (id,callBack) => {
        pool.query(
            'SELECT messages.from, message FROM messages WHERE to = ?',
            [id],
            (error, results) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    getManagerMessages: callBack=>{
        pool.query(
            'SELECT messages.from, message FROM messages WHERE to = 111',
            [],
            (error,results) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        );
    },

};