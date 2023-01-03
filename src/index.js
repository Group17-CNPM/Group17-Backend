const express = require('express')
// import { User } from "./model/login.js"
var User = require('./model/login.js')
var mysql = require('mysql')
const app = express()
const port = 3000

var connect = mysql.createConnection({
    host: "db4free.net",
    user: "quanlynhankhau",
    password: "quanlynhankhau",
    database: "quanlynhankhau"
})

app.get('/', (req, res) => {
    User.selectUser(req, res);
    // res.json({
    //     user: "alsj",
    //     id: "ầ;sfk"
    // });
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})

exports.connect = connect