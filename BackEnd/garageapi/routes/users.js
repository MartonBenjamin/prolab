var express = require('express');
var router = express.Router();
var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "garagedoordatabase"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
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

module.exports = router;
