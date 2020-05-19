const pool = require('../config/db');
module.exports ={
    sendMessage:(data,callBack) =>{
        pool.query(
            'INSERT INTO messages (messages.from, messages.to, messages.message) ' +
            'VALUES (?,?,?)',
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
            'SELECT messages.from, messages.message FROM messages WHERE messages.to = ?',
            [id],
            (error, results) => {
                console.log(id);
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    getManagerMessages: callBack=>{
        pool.query(
            'SELECT messages.from, messages.message FROM messages WHERE messages.to = 111',
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