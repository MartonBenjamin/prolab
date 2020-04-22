const { create, getUserById, getUsers, deleteUser, getUserByUsername } = require("../services/UserService");
const passwordHash = require('password-hash');
const compareSync = require('bcrypt');
module.exports= {
    createUser: (req, res) => {
        const body = req.body;
        body.password = passwordHash.generate(body.password);
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
                    success: 0,
                    message: "There is no user with the given ID."
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
                    data:"Hibás felhasználónév vagy rossz jelszó."
                });
            }
            const result = compareSync(body.password, results.password);
            if(results){
                results.password=undefined;
                //TODO: jsontokent kell majd generálni
                const jsontoken = sign({result:results},"asdasd",{
                    expiresIn: "2h"
                });
                return res.json({
                    status_code:201,
                    description:"Login success",
                    token:jsontoken
                });
            }
            else{
                return res.json({
                    status_code:401,
                    description: "Wrong username or password!"
                });
            }
        });
    },
    logout:(req,res)=>{

    }

}