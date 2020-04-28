const pool = require('../config/db');

module.exports = {
    create: (data,callBack) =>{
        var date = new Date();
        date = date.toISOString();
        pool.query(
            'INSERT INTO garagedoors (name, description, width, height, material, style, smartdoor, craft_date) ' +
            'VALUES(?,?,?,?,?,?,?,?)',
            [
                data.name,
                data.description,
                data.width,
                data.height,
                data.material,
                data.style,
                data.smartdoor,
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

    getDoors: callBack =>{
        pool.query(
            'select id, name, description, width, height, material, style, smartdoor from garagedoors',
            [],
            (error,results,fields) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }

        );
    },



    getDoorById: (id,callBack) =>{
        pool.query(
            'select id, name, description, width, height, material, style, smartdoor from garagedoors where id = ?',
            [id],
            (error,results,fields) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results[0]);
            }
        );
    },

    /*
    getDoorsByName: (name,callBack) =>{
        pool.query(
            'select * from garagedoors where name = ?',
            [name],
            (error,results) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results[0]);
            }
        );
    },

     */


    deleteDoor: (data, callBack) =>{
        if(true)//TODO: Jogosultság
        {
            pool.query(
                'delete from garagedoors where id =?',
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
    },

    /*
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
    },*/
};