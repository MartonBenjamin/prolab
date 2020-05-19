const pool = require('../config/db');
module.exports ={
    placeOrder:(data, callBack) =>{
        pool.query(
            'INSERT INTO orders (ordered_by, description) '+
            'VALUES(?,?)',
            [
                data.ordered_by,
                data.description
            ],
            (error,results) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }

        );
    },
    addImage:(data, callBack)=>{
        pool.query(
            'INSERT INTO order_images (path,order_id)' +
            'VALUES(?,?)',
            [
                data.path,
                data.order_id
            ],
            (error,results)=>{
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }
        )
    },
    acceptOrder:(data,callBack) =>{
        pool.query(
            ''
        )
    }

};