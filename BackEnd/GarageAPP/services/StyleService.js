const pool = require('../config/db');
module.exports ={
    getStyles: callBack =>{
        pool.query(
            'select id, style_description from style',
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