const pool = require('../config/db');
module.exports ={
    placeOrder:(data, callBack) =>{
        var date = new Date();
        date = date.toISOString();
        pool.query(
            'INSERT INTO orders (ordered_by, order_date, description) '+
            'VALUES(?,?,?)',
            [
                data.ordered_by,
                date,
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