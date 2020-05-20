const {placeOrder,addImage, acceptOrder, refuseOrder,addDoorToTrack,changeTrackDetails, getMyDoorsState, getMyOrders} = require('../services/OrderService');
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
        },
        getMyOrders:(req,res) =>{
            let token = req.get("Authorization");
            getUserIdByToken(token,(err,result) =>{
                if(err){
                    console.log(err);
                }
                else{
                    let id = result.id;
                    getMyOrders(id, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(400).json({
                                message: "Database error: " + err
                            });
                        }
                        return res.status(201).json({
                            orders: results
                        });
                    });
                }
            });

        },
        acceptOrder: (req, res) => {
            const id = req.params.id;
            acceptOrder(id, (err, results) => {
                if (err) {
                    console.log(err);
                    return;
                }
                if (!results) {
                    return res.json({
                        message: "There is no order with the ID:"+id
                    });
                }
                return res.json({
                    message: "You accepted the order!"
                });
            });
        },
        refuseOrder: (req, res) => {
            const id = req.params.id;
            refuseOrder(id, (err, results) => {
                if (err) {
                    console.log(err);
                    return;
                }
                if (!results) {
                    return res.json({
                        message: "There is no order with the ID:"+id
                    });
                }
                return res.json({
                    message: "You refused the order!"
                });
            });
        },
        addDoorToTrack: (req,res) =>{
            const body = req.body;
            addDoorToTrack(body, (err,result) =>{
                if(err) {
                    consol.log(err);
                    return res.json({
                        message: "Error: "+err
                    });
                }
                return res.status(200).json({
                    message: "Door added to track successfully!"
                })
            })
        },
        changeTrackDetails: (req,res) =>{
            const body = req.body;
            changeTrackDetails(body, (err,result) =>{
                if(err) {
                    consol.log(err);
                    return res.json({
                        message: "Error: "+err
                    });
                }
                return res.status(200).json({
                    message: "Track updated successful"
                })
            })

        },
        getMyDoorsState: (req,res) =>{
            let token = req.get("Authorization");
            getUserIdByToken(token,(err,result) =>{
                if(err){
                    console.log(err);
                }
                else{
                    let id = result.id;
                    console.log(id);
                    getMyDoorsState(id, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(400).json({
                                message: "Database error: " + err
                            });
                        }
                        return res.status(201).json({
                            state: results
                        });
                    });
                }
            });

        }

}