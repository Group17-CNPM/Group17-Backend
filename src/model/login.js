
class MyUser {
    constructor(id, username, password, email, role) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.role = role;
    }

    static selectUser(con, req, res) {
        con.connect(function (err) {
            if (err) throw err;
            console.log("MySQL connected!");
            con.query("SELECT * FROM users", function (err, result) {
                if (err) throw err;
                res.json(result);
            })
        })
    }
}

module.exports = MyUser;
