const {getUserIdByToken} = require('../services/UserService');

const {getManagerMessages,getMyMessages,sendMessage} = require('../services/MessageService');

module.exports = {
    sendMessage: (req, res) => {
        const body = req.body;
        let token = req.get("Authorization");
        getUserIdByToken(token,(err,result) =>{
            if(err){
                console.log(err);
                return res.status(401).json({
                    message: "There was an error: "+err
                })
            }
            else{
                body.from = result.id;
                sendMessage(body, (err, results) => {
                    if (err) {
                        console.log(err);
                        return res.status(400).json({
                            status_code: 400,
                            message: "Database error: " + err
                        });
                    }
                    return res.status(201).json({
                        status_code: 201,
                        description: "Message sent!"
                    });
                });
            }
        });
    },
    getMyMessages: (req, res) =>{
        const body = req.body;
        let token = req.get("Authorization");
        getUserIdByToken(token,(err,result) =>{
            if(err){
                console.log(err);
                return res.status(401).json({
                    message: "There was an error: "+err
                })
            }
            else {
                id = result.id;
                getMyMessages(id, (err,results) => {
                    if (err)
                        console.log(err);
                    if(!results){
                        return res.json({
                            message: "You have no messages"
                        })
                    }
                    return res.json({
                        messages: results
                    })
                })
            }
        });
    },
    getManagerMessages:(req, res) =>{
        getManagerMessages((err,results) =>{
            if(err){
                console.log(err);
                return res.json({
                    message: "There was an error: " +err
                })
            }
            else{
                return res.json({
                    messages: results
                })
            }
        })
    }
};