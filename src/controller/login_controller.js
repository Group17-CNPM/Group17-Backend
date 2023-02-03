
let Login = require('../model/login.js').Login;
let User = require('../model/user.js').User;
let Response = require('../utils/response.js').Response;
let CryptoJS = require('crypto-js');
let Utils = require('../utils/utils.js').Utils;


class LoginController{
	constructor(){}

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
		let time = Utils.getStringFromUTCDate(new Date());
		let token = await Login.gen_token(`${username}${time}`);		
		let refresh_token = await Login.gen_refresh_token(token);

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
			token: encodeURIComponent(token),
			refresh_token: encodeURIComponent(refresh_token)
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
			Response.response(res, Response.ResponseCode.ERROR, "Token is invalid", req.query);
			return;
		}
		
		Response.response(res, Response.ResponseCode.OK, "Token is valid", user);
	}

	/*
	route: GET [domain]/refreshToken
	query: {
		refresh_token: "xxx",
	}
	*/
	async refreshToken(req, res){
		try{
			// check refresh token
			let {refresh_token} = req.query;
			if (refresh_token == null || refresh_token == "")
				return Response.response(res, Response.ResponseCode.ERROR, "Lack of refresh_token", req.query);
			refresh_token = String(refresh_token);
			// console.log(refresh_token);
			
			let token = await Login.decrypt_refresh_token(refresh_token);
			let login = await Login.getLogin(token);
			// console.log(token);
			
			if (login == null || login.active != 1)
				return Response.response(res, Response.ResponseCode.ERROR, "refresh_token is invalid", req.query);

			// get User
			let username = login.username;
			let user = await User.getUserByUsername(username);
			if (user == null)
				return Response.response(res, Response.ResponseCode.ERROR, "refresh_token is invalid", req.query, "Not exist user");

			// reject old token:
			let rs = await Login.rejectToken(token);
			if (!rs) return Response.response(res, Response.ResponseCode.ERROR, "refresh token failed", req.query, "On rejecting old token");

			// gen new token-refresh_token
			let time = Utils.getStringFromUTCDate(new Date());
			let new_token = await Login.gen_token(`${username}${time}`);
			let new_refresh_token = await Login.gen_refresh_token(new_token);

			// update db
			rs = await Login.insert(new_token, username, time);
			if (!rs) return Response.response(res, Response.ResponseCode.ERROR, "refresh token failed", req.query, "On update new token");
			
			return Response.response(res, Response.ResponseCode.OK, "Success", {
				"token" : encodeURIComponent(new_token),
				"refresh token" : encodeURIComponent(new_refresh_token)
			});
		}
		catch (e){
			return Response.response(res, Response.ResponseCode.ERROR, "refresh_token is invalid", req.query, "Exception: " + e);
		}
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

		// get login by token
		let login = await Login.getLogin(token);
		if (login == null || login.active != 1) {
			Response.response(res, Response.ResponseCode.ERROR, "Token is invalid", req.query);
			return false;
		}

		// console.log(login);

		// check token is expired
		let expire = 24 * 60 * 60 * 1000; // 24 hours to miliseconds
		let loginTime = Utils.getUTCDateFromString(login.time).getTime();
		let now = new Date().getTime();
		if (now - loginTime > expire){
			Response.response(res, Response.ResponseCode.ERROR, "Token is expired", req.query, "Token đã hết hạn");
			return false;
		}

		req.username = login.username;
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
		result = await Login.rejectToken(token);

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
