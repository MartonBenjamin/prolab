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
    getMyOrders:(id, callBack) =>{
        pool.query(
            'SELECT garagedoors.name, orders.description, orders.order_date, garagedoors.width, garagedoors.height, garagedoors.material, garagedoors.style, garagedoors.smartdoor ' +
            'FROM orders ' +
            'INNER JOIN garagedoors ON orders.id = garagedoors.ordernum ' +
            'WHERE ordered_by = ?',
            [id],
            (error,results)=>{
                if(error){
                    return callBack(error);
                }
                return callBack(null,results);
            }

        )
    },
    acceptOrder:(id,callBack) =>{
        pool.query(
            'UPDATE orders SET ' +
            'isAccepted = 1 WHERE id = ?',
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
    refuseOrder:(id,callBack) =>{
        pool.query(
            'UPDATE orders SET ' +
            'isAccepted = 0 WHERE id = ?',
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
    addDoorToTrack:(data,callBack)=>{
        pool.query(
            'INSERT INTO tracking (order_id, garagedoor_id, ordered_by, state, parts_installed, parts_needed) '+
            'VALUES (?,?,?,?,?,?)',
            [
                data.order_id,
                data.garagedoor_id,
                data.order_by,
                data.state,
                data.parts_installed,
                data.parts_needed
            ],
            (error, results) =>{
                if(error){
                    return callBack(error);
                }
                return callBack(null, results);
            }
        )
    },
    changeTrackDetails:(data, callBack) =>{
        pool.query(
            'UPDATE tracking SET state= ?, parts_installed = ? ' +
            'WHERE id = ?',
            [
                data.state,
                data.parts_installed,
                data.id
            ],
            (error, results) =>{
                if(error){
                    return callBack(error);
                }
                return callBack(null, results);
            }
        )
    },
    getMyDoorsState:(id, callBack) => {
        pool.query(
            'SELECT state, parts_installed, parts_needed FROM tracking ' +
            'WHERE ordered_by = id',
            [id],
            (error,results)=>{
                if(error){
                    return callBack(error);
                }
                return callBack(null, results);
            }
        )
    }

};