const {createPool} = require('mysql');

const pool = createPool({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'garagedoordatabase',
    timezone : 'utc',
    connectionLimit: 10
});


module.exports = pool;

