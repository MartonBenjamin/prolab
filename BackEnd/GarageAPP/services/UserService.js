const pool = require('../config/db');

module.exports = {
    changeGroupId: (data, callBack) =>
    {
        pool.query(
            'UPDATE users SET groupid = ? WHERE username=?',
            [
                data.groupid,
                data.username
            ],
            (error,results)=>{
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }
        )

    },
    create: (data,callBack) =>{
        pool.query(
            'INSERT INTO users (username, password, email, firstname, lastname) ' +
            'VALUES(?,?,?,?,?)',
            [
                data.username,
                data.password,
                data.email,
                data.first_name,
                data.last_name
            ],
            (error,results) =>{
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
            (error,results) => {
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
            (error,results) => {
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
                (error,results) =>{
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
    },
    addToken: (data,callBack) =>{
        pool.query(
            'UPDATE users SET token = ? WHERE username=?',
            [
                data.token,
                data.username
            ],
            (error) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null);
            }
        );
    },
    getUserByToken: (token,callBack) =>{
        pool.query(
            'select username from users where token = ?',
            [token],
            (error,results) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results[0]);
            }
        );
    },
    getUserIdByToken: (token,callBack) =>{
        pool.query(
            'select id from users where token = ?',
            [token],
            (error,results) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results[0]);
            }
        );
    },
};