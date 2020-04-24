const { create, getUserById, getUsers, deleteUser, getUserByUsername, addToken } = require("../services/UserService");
const {hashSync, genSaltSync, compareSync} = require('bcrypt');
const { sign } = require("jsonwebtoken");
const keys = require('../config/auth');

module.exports= {
    createUser: (req, res) => {
        const body = req.body;
        const salt = genSaltSync(10);
        body.password = hashSync(body.password,salt);
        create(body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: "Database connection error"
                });
            }
            return res.status(200).json({
                status_code: 201,
                description: "Successfully registered",
                data: results
            });
        });
    },
    getUserById: (req, res) => {
        const id = req.params.id;
        getUserById(id, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    message: "There is no user with the ID:"+id
                });
            }
            return res.json({
                succes: 1,
                data: results
            });
        });
    },
    getUsers: (req, res) => {
        getUsers((err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            return res.json({
                success: 1,
                data: results
            });
        });
    },
    deleteUser: (req, res) => {
        const data = req.body;
        deleteUser(data, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    success: 0,
                    message: "Nincs ilyen id-jű felhasználó."
                });
            }
            return res.json({
                success: 1,
                message: "Felhasználó sikeresen törölve."
            });
        });
    },
    login: (req,res) =>{
        const body = req.body;
        getUserByUsername(body.username,(err,results)=>{
            if(err){
                console.log(err);
            }
            if(!results){
                return res.json({
                    success:0,
                    data:"Wrong username"
                });
            }
            const correct =compareSync(body.password,results.password) ;
            if(correct){
                const payload ={id: results.id, username: results.username};
                const jsontoken = sign(/*{correct:results}*/payload, keys.secretOrKey,{expiresIn: "1h"});
                const data = {
                    username: body.username,
                    token: jsontoken
                };
                addToken(data,(err) =>{
                    if(err){
                        console.log(err);
                    }
                    }
                );
                return res.json({
                    status_code:201,
                    description:"Login success",
                    token:jsontoken
                });
            }
            else{
                return res.json({
                    status_code:401,
                    description: "Incorrect password!"
                });
            }
        });
    },
    logout:(req,res)=>{

    }

}