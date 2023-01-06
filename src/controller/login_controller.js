
let { User, Login } = require('../model/login.js');
let Response = require('../utils/response.js').Response
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

		console.log(`Login username: ${username}, password: ${password}`);

		if (username == undefined || password == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		var result = await User.getUserByUsername(username);
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
		
		result = await Login.insert(token, username, time);
		
		if (result == null){
			Response.response(res, Response.ResponseCode.OK, "Đăng nhập thất bại", {
				username: username
			});
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Đăng nhập thành công", {
			username: username,
			token: token
		});
	}

	async checkToken(req, res){
		let token = req.query.token;
		
	}
}

module.exports = { LoginController };
