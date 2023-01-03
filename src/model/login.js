var con = require("../index.js").connect;

class User {
    constructor(id, username, password, email, role) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.role = role;
    }

    selectUser(req, res) {
        con.connect(function (err) {
            if (err) throw err;
            console.log("connected!");
            con.query("SELECT * FROM users", function (err, result) {
                if (err) throw err;
                res.json(result);
            })
        })
    }
}

exports = User
