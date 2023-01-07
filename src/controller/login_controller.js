
let Login = require('../model/login.js').Login;
let User = require('../model/user.js').User;
let Response = require('../utils/response.js').Response;
let CryptoJS = require('crypto-js');


class LoginController{
	constructor(){}

	static getCurrentStringTime(){
		let d = new Date();
		return `${d.getFullYear()}-${d.getMonth() + 1}-${d.getDate()} ${d.getHours()}:${d.getMinutes()}:${d.getSeconds()}`;
	}

	async login(req, res){
		let username = req.query.username;
		let password = req.query.password;

		// console.log(`Login username: ${username}, password: ${password}`);

		if (username == undefined || password == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		var user = await User.getUserByUsername(username);
		if (user == null){
			Response.response(res, Response.ResponseCode.ERROR, "Account is not exist", req.query);
			return;
		}
		if (password != user.password){
			Response.response(res, Response.ResponseCode.ERROR, "Mật khẩu không đúng", {
				username: username
			});
			return;
		}

		let time = LoginController.getCurrentStringTime();
		let token = String(CryptoJS.MD5(`${username}${password}${time}`));
		
		let result = await Login.insert(token, username, time);
		
		if (result == null){
			Response.response(res, Response.ResponseCode.OK, "Đăng nhập thất bại", {
				username: username
			});
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Đăng nhập thành công", {
			user: {
				username: username,
				email: user.email,
				role: user.role
			},
			token: token
		});
	}

	async checkToken(req, res){
		let result = await LoginController.checkToken(req, res);
		if (!result) return;
		
		let username = req.username;
		let user = await User.getUserByUsername(username);
		if (user == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Token is expired", req.query);
			return;
		}
		
		Response.response(res, Response.ResponseCode.OK, "Token is valid", user);
	}

	static async checkToken(req, res){
		let token = req.query.token;
		let username = null;
		
		if (token == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of token", req.query);
			return false;
		} 

		username = await Login.getUsernameByToken(token);
		if (username == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Token is invalid", req.query);
			return false;
		}

		req.username = username;
		return true;
	}

	async logout(req, res){
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let token = req.query.token;
		result = await Login.deleteToken(token);

		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Logout failed", req.query, "Đăng xuất thất bại");
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Logout success", req.query, "Đăng xuất thành công");
	}

	async logoutAllDevice(req, res){
		
	}
}

module.exports = { LoginController };
