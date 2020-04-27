const pool = require('../config/db');
module.exports ={
    getMaterials: callBack =>{
        pool.query(
            'select id, material_name from materials',
            [],
            (error,results,fields) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }

        );
    }
};