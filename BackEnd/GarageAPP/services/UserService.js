const pool = require('../config/db');

module.exports = {
    create: (data,callBack) =>{
        var date = new Date();
        date = date.toISOString();
        pool.query(
            'INSERT INTO users (username, password, email, firstname, lastname, created_at) ' +
            'VALUES(?,?,?,?,?,?)',
            [
                data.username,
                data.password,
                data.email,
                data.first_name,
                data.last_name,
                date
            ],
            (error,results,fields) =>{
                if(error){//ha van result, akkor error null, ha nem, akkor hibánk van
                    return callBack(error);
                }
                return callBack(null,results);//Ha nincs hiba, akkor visszatérünk a resultsal
            }
        );
    },
    getUsers: callBack =>{
        pool.query(
            'select id, username, firstname, lastname, email from users',
            [],
            (error,results,fields) => {
                if(error){
                   return callBack(error);
                }
                return callBack(null,results);
            }

        );
    },
    getUserById: (id,callBack) =>{
        pool.query(
            'select id, username, firstname, lastname, email from users where id = ?',
            [id],
            (error,results,fields) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results[0]);
            }
        );
    },
    getUserByUsername: (username,callBack) =>{
        pool.query(
            'select * from users where username = ?',
            [username],
            (error,results) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results[0]);
            }
        );
    },
    deleteUser: (data, callBack) =>{
        if(true)//TODO: Jogosultság
        {
            pool.query(
                'delete from users where id =?',
                [data.id],
                (error,results,fields) =>{
                    if (error){
                        callBack(error);
                    }
                    return callBack(null,results[0]);
                }
            )
        }
        else{
            return "Permission denied";
        }
    }
};