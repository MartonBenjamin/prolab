const {placeOrder,addImage} = require('../services/OrderService');
const {getUserIdByToken} = require("../services/UserService");
let lastOrderId;
module.exports=
    {
        placeOrder: (req, res) => {
            const body = req.body;
            let token = req.get("Authorization");
            getUserIdByToken(token,(err,result) =>{
                if(err){
                    console.log(err);
                }
                else{
                    body.ordered_by = result.id;
                    console.log("Ordered by:" + body.ordered_by);
                    placeOrder(body, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(400).json({
                                status_code: 400,
                                message: "Database error: " + err
                            });
                        }
                        lastOrderId = results.insertId;
                        return res.status(201).json({
                            status_code: 201,
                            description: "Order sent successfully.",
                            data: results
                        });
                    });
                }
            });
        },
        addImage:(req, res) =>{
            const body = req.body;
            body.order_id = lastOrderId;
            console.log("Last order id: "+lastOrderId);
            addImage(body,(err,result) =>{
                if (err) {
                    console.log(err);
                    return res.status(400).json({
                        status_code: 400,
                        message: "Database error: " + err
                    });
                }
                return res.status(201).json({
                    status_code: 201,
                    description: "Image added successfully to order: "+lastOrderId
                })
            });
        }
}