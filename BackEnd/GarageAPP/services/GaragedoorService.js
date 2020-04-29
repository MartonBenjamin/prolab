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
            'select garagedoors.name, garagedoors.description, garagedoors.width, garagedoors.height, materials.material_name, style.style_description, garagedoors.smartdoor from garagedoors ' +
            'INNER JOIN materials  ON garagedoors.material=materials.id ' +
            'INNER JOIN style ON garagedoors.style=style.id',
            [],
            (error,results,fields) => {
                if(error){
                    return callBack(error);
                }

                //console.log(results);
                return callBack(null,results);
            }

        );
    },



    getDoorById: (id,callBack) =>{
        pool.query(
            'select garagedoors.name, garagedoors.description, garagedoors.width, garagedoors.height, materials.material_name, style.style_description, garagedoors.smartdoor from garagedoors ' +
            'INNER JOIN materials ON garagedoors.material=materials.id ' +
            'INNER JOIN style ON garagedoors.style=style.id where garagedoors.id = ? ',
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

};