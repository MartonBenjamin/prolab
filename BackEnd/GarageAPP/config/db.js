const {createPool} = require('mysql');

const pool = createPool({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'garagedoordatabase',
    timezone : 'utc'
});


module.exports = pool;

