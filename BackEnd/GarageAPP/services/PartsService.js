const pool = require('../config/db');
module.exports ={
    getParts: callBack =>{
        pool.query(
            'select * from parts',
            [],
            (error,results,fields) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }

        );
    },

    orderParts: (data,callBack) =>{
        pool.query(
            'UPDATE parts SET ' +
            'ordered = ordered + ? WHERE id = ?',
            [
                data.id,
                data.amount
            ],
            (error,results) =>{
                if(error){//ha van result, akkor error null, ha nem, akkor hibánk van
                    return callBack(error);
                }
                return callBack(null,results);//Ha nincs hiba, akkor visszatérünk a resultsal
            }
        );
    },
    orderCompleted:(data,callBack)=>{
        pool.query(
            'UPDATE parts SET ordered = ordered - ? WHERE id = ?;\n' +
            'UPDATE parts SET  amount = amount + ? WHERE id = ?; ',
            [
                data.amount,
                data.id,
                data.amount,
                data.id
            ],
            (error,results)=>{
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }
        )
    },

    getPartsToDoor: (id,callBack)=>{
        pool.query(
            'SELECT parts.name, parts.price FROM parts'
        )
    }

};