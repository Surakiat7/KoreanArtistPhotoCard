
var mysql = require('mysql');
var config = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'aStore'
};


var pool = mysql.createPool(config);


function RunQuery(sql, callback) {
    pool.getConnection(function (err, conn) {
        if (err) {
            ShowErrors(err);
        }
        conn.query(sql, function (err, rows, fields) {
            if (err) {
                ShowErrors(err);
            }
            conn.release();
            callback(rows);
        });
    });
}


function ShowErrors(err) {
    throw err;
}

module.exports = {
    RunQuery: RunQuery
};