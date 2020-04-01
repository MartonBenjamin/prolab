var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var passwordHash = require('password-hash');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "garagedoordatabase"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Successfully connected to garageDoor database!");
});

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/add', function(req, res, next) {
  if (err) throw err;
  //var sql = "INSERT INTO `garagedoordatabase`.`users` (`username`, `password`, `email`, `firstname`, `lastname`, `created_at`) VALUES ('tesztss', 'test', 'asds@asd.hu', 'name', 'keds', '2018-12-12');\n";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
});
router.post('/register',function (req,res) {
  try {
    const hashedPassword=passwordHash.generate(req.body.password); //Jelszó hashelése
    var values = [
      ['username', req.body.username],
      ['password', hashedPassword],
      ['email', req.body.email],
      ['first_name', req.body.first_name],
      ['last_name', req.body.last_name],
      ['created_at', '2012-12-12']
    ];
    console.log(values);
    var sql = "INSERT INTO users (username, password, email, firstname, lastname, created_at) VALUES ('"+req.body.username+"','"+hashedPassword+"','"+req.body.email+"','"+req.body.first_name+"','"+req.body.last_name+"','2018-12-12')";

    con.query(sql,[values],function(err,result){
        if (err) return console.log(err);
      console.log("Successfully registered");
    });
    res.status(201).send();
    console.log(user.username);
  }
  catch
  {
    res.status(500).send();
  }
});

router.get('/listuser',function(req,res){
  console.log(users);
});

module.exports = router;
