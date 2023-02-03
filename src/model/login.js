
let CryptoJS = require('crypto-js');


class Login{
    static encrypt_token_key = "qlnk_token_key";
    static encrypt_refresh_token_key = "qlnk_refresh_token_key";
    Login(){}

    static async gen_token(text){
        // return token:string
        if (text == null) return null;
        return CryptoJS.AES
        .encrypt(text, Login.encrypt_token_key)
        .toString();
    }

    static async gen_refresh_token(token){
        // return refresh_token:string
        if (token == null) return null;
        return CryptoJS.AES
        .encrypt(token, Login.encrypt_refresh_token_key)
        .toString();
    }

    static async decrypt_refresh_token(refresh_token){
        // return token:string
        if (refresh_token == null) return null;
        let token = CryptoJS.AES
        .decrypt(refresh_token.toString(), Login.encrypt_refresh_token_key)
        .toString(CryptoJS.enc.Utf8)
        .toString();
        
        return token;
    }

    static async insert(token, username, time){
        var connection = require('../index.js').connection;

        var result;
        let query = `INSERT INTO login VALUE('${token}', null, '${username}', '${time}', '1');`;

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

    static async rejectToken(token){
        var connection = require('../index.js').connection;

        var result;
        let query = `UPDATE login SET active = '0' WHERE token = '${token}'`;

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
        let query = `UPDATE login SET active = '0' WHERE username = '${username}'`;

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

