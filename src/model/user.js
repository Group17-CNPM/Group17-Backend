let Login = require('./login.js').Login;

class User {
    constructor(username = null, password = null, email = null, role = null) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
    }
    copy_from(user){
        if (user == null) return;
        this.username   = user.username;
        this.password   = user.password;
        this.email      = user.email;
        this.role       = user.role;
    }
    static fromJson(json){
        if (json == null) return;
        var user = new User();
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

    static async insertUser(username, password, email, role){
    	var connection = require('../index.js').connection;

        var result, query = `INSERT INTO users VALUE('${username}', '${password}', '${email}' ,'${role}');`;
        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
        }
        
        return result;
    }

    static async deleteUser(username){
    	var connection = require('../index.js').connection;

        var result;
        let query1 = `DELETE FROM login WHERE username = '${username}'`;
        let query2 = `DELETE FROM users WHERE username = '${username}';`;
        try {
            let result1 = await connection.my_query(query1)
            let result2 = await connection.my_query(query2);
            result = result1 && result2;
        } catch(err){
            console.log(err);
        }
        
        return result;
    }

    static async updateUser(username, email, role){
    	var connection = require('../index.js').connection;

        var result, query = `UPDATE users 
        					 SET email = '${email}', vaitro = '${role}' 
        					 WHERE username = '${username}';`;
        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
        }
        
        return result;
    }

    static async updatePassword(username, password){
        var connection = require('../index.js').connection;

        var result, query = `UPDATE users 
        					 SET password = '${password}' 
        					 WHERE username = '${username}';`;
        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
        }
        
        return result;
    }
    
}


module.exports = { User };