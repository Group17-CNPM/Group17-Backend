

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


    static async selectUser() {
        var connection = require('../index.js').connection;
        var result, query = "SELECT * FROM users";

        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
        }

        let listUser = [];
        result.forEach(function(element){
            listUser.push(User.fromJson(element));
        });
        
        return listUser;
    }

    static async getUserByUsername(username){
        var connection = require('../index.js').connection;

        var result, query = `SELECT * FROM users WHERE username = '${username}'`;
        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
        }

        let user = null;
        if (result.length > 0) user = User.fromJson(result[0]);
        
        return user;
    }
    
}

class Login{
    Login(){}

    static async insert(token, username, time){
        var connection = require('../index.js').connection;

        var result;
        let query = `INSERT INTO login VALUE('${token}', null, '${username}', '${time}');`;

        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
        }
        
        return result;
    }

    static checkToken(token, callback = null){

    }
}


module.exports = { User, Login };

