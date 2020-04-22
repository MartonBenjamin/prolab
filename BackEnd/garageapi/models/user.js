const sql = require('./db');
var moment = require('moment');

const User = function(user){
    this.username = user.username;
    this.email = user.email;
    this.password = user.password;
    this.first_name = user.first_name;
    this.last_name = user.last_name;
    this.created_at = moment(new Date()).format("YYYY-MM-DD");
};

User.createUser = (newUser, result)=>{
    sql.query("INSERT INTO user SET ?", newUser, (err, res) =>{
        if (err){
            result(err, null);
        }
        else{
            result(null, res.insertId);
        };
    });
};

User.getAllUsers = (result) =>{
    sql.query("SELECT id, user.username, user.first_name, user.last_name, user.email FROM user",(err, res)=>{
        if (err){
            result(err, null);
        }
        else{
            result(null, res)
        }

    })
};

User.getUserByUsername = (username, result) =>{
    sql.query("SELECT id, username, first_name, last_name, email FROM use WHERE username =?",username,(err, res)=>{
        if (err){
            result(err, null);
        }
        else{
            result(null, res)
        }
    })
};
User.getUserById = (id, result) =>{
    sql.query("SELECT id, username, first_name, last_name, email FROM use WHERE id =?",id,(err, res)=>{
        if (err){
            result(err, null);
        }
        else{
            result(null, res)
        }
    })
};

module.exports = User;