
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



	/*
	route: GET [domain]/login
	query: {
		username: "admin",
		password: "admin"
	}
	*/
	async login(req, res){
		// check params
		let username = req.query.username;
		let password = req.query.password;
		if (username == undefined || password == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		// check exist account and password is valid
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

		// Login:
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


	/*
	route: GET [domain]/checkToken
	query: {
		token: "xxx",
	}
	*/
	async checkToken(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;
		
		// get User
		let username = req.username;
		let user = await User.getUserByUsername(username);
		if (user == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Token is expired", req.query);
			return;
		}
		
		Response.response(res, Response.ResponseCode.OK, "Token is valid", user);
	}

	static async checkToken(req, res){
		// get token
		let token = req.query.token;
		let username = null;
		
		// check lack of token
		if (token == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of token", req.query);
			return false;
		} 

		// get username by token
		username = await Login.getUsernameByToken(token);
		if (username == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Token is invalid", req.query);
			return false;
		}

		req.username = username;
		return true;
	}


	/*
	route: GET [domain]/logout
	query: {
		token: "xxx",
	}
	*/
	async logout(req, res){
		// check token
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


	/*
	route: GET [domain]/logoutAllDevice
	query: {
		token: "xxx"
	}
	*/
	async logoutAllDevice(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// logout all device
		let username = req.username;
		result = await Login.logout(username);

		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Logout failed", req.query, "Đăng xuất thất bại");
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Logout success", req.query, "Đăng xuất thành công");
	}
}

module.exports = { LoginController };
