
let { User, Login } = require('../model/login.js');
let Response = require('../utils/response.js').Response
let CryptoJS = require('crypto-js');


class LoginController{
	constructor(){}

	static getCurrentStringTime(){
		let d = new Date();
		return `${d.getFullYear()}-${d.getMonth() + 1}-${d.getDate()} ${d.getHours()}:${d.getMinutes()}:${d.getSeconds()}`;
	}

	login(req, res){
		let username = req.query.username;
		let password = req.query.password;

		User.getUserByUsername(username, function(result){
			if (result == null){
				Response.response(res, Response.ResponseCode.ERROR, "Account is not exist", req.query);
				return;
			}
			if (password != result.password){
				Response.response(res, Response.ResponseCode.ERROR, "Mật khẩu không đúng", {
					username: username
				});
				return;
			}
			let time = LoginController.getCurrentStringTime();
			let token = String(CryptoJS.MD5(`${username}${password}${time}`));
			Login.insert(token, username, time, function(result){
				Response.response(res, Response.ResponseCode.OK, "Đăng nhập thành công", {
					username: username,
					token: token
				});
				return;
			});
		});
	}

	checkToken(req, res){
		
	}
}

module.exports = { LoginController };
