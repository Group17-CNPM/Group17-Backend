const express = require('express')
// import { MyUser } from "./model/login.js"
var MyUser = require('./model/login.js')
var mysql = require('mysql')
const app = express()
const port = 3000

var connect = mysql.createConnection({
    host: "db4free.net",
    user: "quanlynhankhau",
    password: "quanlynhankhau",//cc
    database: "quanlynhankhau"
})

app.get('/', (req, res) => {
    // MyUser user = MyUser();
    MyUser.selectUser(req, res);
    // User.selectUser(req, res);
    // res.json({
    //     user: "alsj",
    //     id: "ầ;sfk"
    // });
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})

exports.connect = connect