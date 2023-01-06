
let User = require('../model/user.js').User;
let Response = require('../utils/response.js').Response

class UserController{
	constructor(){}

	checkUsername(username){
		let usernameRegex = /^[a-zA-Z0-9]{5,30}$/;
		return usernameRegex.test(username);
	}
	checkPassword(password){
		let passwordRegex = /^[a-zA-Z0-9!@#$%^&*_]{5,30}$/;
		return passwordRegex.test(password);
	}
	checkEmail(email){
		let emailRegex = /([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
		return emailRegex.test(email);
	}
	checkRole(role){
		// role: 1 là Ban quản lý, 2 là Kế toán
		role = String(role);
		return role == "1" || role == "2";
	}

	async createUser(req, res){
		let { username, password, email, role } = req.query;
		if (username == undefined || password == undefined || email == undefined || role == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		if (!this.checkUsername(username)){
			Response.response(res, Response.ResponseCode.ERROR, "Username is invalid", req.query);
			return;
		}
		if (!this.checkPassword(password)){
			Response.response(res, Response.ResponseCode.ERROR, "Password is invalid", req.query);
			return;
		}
		if (!this.checkEmail(email)){
			Response.response(res, Response.ResponseCode.ERROR, "Email is invalid", req.query);
			return;
		}
		if (!this.checkRole(role)){
			Response.response(res, Response.ResponseCode.ERROR, "Role is invalid (1: Ban quản lý, 2: Kế toán)", req.query);
			return;
		}
		
		let user = await User.getUserByUsername(username);
		if (user != null){
			Response.response(res, Response.ResponseCode.ERROR, "Account is existed", req.query);
			return;
		}

		let result = await User.insertUser(username, password, email, role);
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Register failed", req.query);
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Register success", req.query);
	}

	async deleteUser(req, res){

	}

	async changePassword(req, res){

	}

	async updateInfor(req, res){

	}
}


module.exports = {UserController}