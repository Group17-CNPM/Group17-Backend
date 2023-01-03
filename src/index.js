const express = require('express')
var mysql = require('mysql')
const app = express()
const port = 3000

var MyUser = require('./model/login.js')


// var connect = mysql.createConnection({
//     host: "db4free.net",
//     user: "quanlynhankhau",
//     password: "quanlynhankhau",//cc
//     database: "quanlynhankhau"
// });

var connect = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "quanlynhankhau"
});

app.get('/', (req, res) => {
    MyUser.selectUser(connect, req, res);
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
