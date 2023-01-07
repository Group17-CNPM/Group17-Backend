
let User = require('../model/user.js').User;
let LoginController = require('../controller/login_controller.js').LoginController;
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


	
	/*
	route: GET [domain]/createUser
	query: {
		token: "xxx",
		username: "admin",
		password: "admin",
		email: "abc@email.com",
		role: 1
	}
	*/
	async createUser(req, res){
		// chỉ ban quản lý mới có thể tạo được user mới
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		let { token, username, password, email, role } = req.query;
		if (username == undefined || password == undefined || email == undefined || role == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý mới có thể tạo tài khoản mới");
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


	/*
	route: GET [domain]/deleteUser
	query: {
		token: "xxx",
		username: "admin"
	}
	*/
	async deleteUser(req, res){
		// chỉ ban quản lý mới có thể xóa được user
		// chỉ có thể xóa user có vai trò là Kế toán
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		let { token, username, password, email, role } = req.query;
		if (username == undefined || password == undefined || email == undefined || role == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý mới có thể tạo tài khoản mới");
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

	async updateUser(req, res){
		// chỉ ban quản lý mới có thể tạo được user mới
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		let { token, username, password, email, role } = req.query;
		if (username == undefined || password == undefined || email == undefined || role == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý mới có thể tạo tài khoản mới");
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

	async changePassword(req, res){
		// chỉ ban quản lý mới có thể tạo được user mới
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		let { token, username, password, email, role } = req.query;
		if (username == undefined || password == undefined || email == undefined || role == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý mới có thể tạo tài khoản mới");
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

	static async cancelUser(req, res){
		
	}
}


module.exports = {UserController}