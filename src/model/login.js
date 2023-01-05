

class User {
    constructor(id = null, username = null, password = null, email = null, role = null) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
    }
    copy_from(user){
        if (user == null) return;
        this.id         = user.id;
        this.username   = user.username;
        this.password   = user.password;
        this.email      = user.email;
        this.role       = user.role;
    }
    static fromJson(json){
        if (json == null) return;
        var user = new User();
        user.id         = json.id;
        user.username   = json.username;
        user.password   = json.password;
        user.email      = json.email;
        user.role       = json.vaitro;
        return user;
    }


    static selectUser(callback = null) {
        var connection = require('../index.js').connection;
        connection.query("SELECT * FROM users", function (err, result) {
            if (err) throw err;
            let listUser = [];
            result.forEach(function(element){
                listUser.push(User.fromJson(element));
            });
            
            if (callback != null) callback(listUser);
        });
    }

    static getUserByUsername(username, callback = null){
        var connection = require('../index.js').connection;
        connection.query(`SELECT * FROM users WHERE username = '${username}'`, function (err, result) {
            if (err) throw err;
            let user = null;
            if (result.length > 0) user = User.fromJson(result[0]);
            
            if (callback != null) callback(user);
        });
    }
    
}

class Login{
    Login(){}

    static insert(token, username, time, callback = null){
        var connection = require('../index.js').connection;
        let query = `INSERT INTO login VALUE('${token}', null, '${username}', '${time}');`;
        connection.query(query, function (err, result) {
            if (err) throw err;
            if (callback != null) callback(result);
        });
    }

    static checkToken(token, callback = null){

    }
}

module.exports = { User, Login };
