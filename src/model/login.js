


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
            return null;
        }
        
        return result;
    }

    static async getLogin(token){
        var connection = require('../index.js').connection;

        var result;
        let query = `SELECT * FROM login WHERE token = '${token}'`;

        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
            return null;
        }

        if (result.length <= 0) return null;
        
        return result[0];
    }

    static async getUsernameByToken(token){
        var connection = require('../index.js').connection;

        var result;
        let query = `SELECT * FROM login WHERE token = '${token}'`;

        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
            return null;
        }

        if (result.length <= 0) return null;
        
        return result[0].username;
    }

    static async deleteToken(token){
        var connection = require('../index.js').connection;

        var result;
        let query = `DELETE FROM login WHERE token = '${token}'`;

        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
            return null;
        }

        return result;
    }

    static async logout(username){
        var connection = require('../index.js').connection;

        var result;
        let query = `DELETE FROM login WHERE username = '${username}'`;

        try {
            result = await connection.my_query(query);
        } catch(err){
            console.log(err);
            return null;
        }

        return result;
    }
}


module.exports = { Login };

