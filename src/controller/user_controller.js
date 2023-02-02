
let User = require('../model/user.js').User;
let Login = require('../model/login.js').Login;
let LoginController = require('../controller/login_controller.js').LoginController;
let Response = require('../utils/response.js').Response;
let Utils = require('../utils/utils.js').Utils;

class UserController{
	constructor(){}
	
	/*
	route: GET [domain]/register
	query: {
		token: "xxx",
		username: "admin",
		password: "admin",
		email: "abc@email.com",
		role: 1
	}
	*/
	async createUser(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params 
		let { token, username, password, email, role } = req.query;
		if (username == undefined || password == undefined || email == undefined || role == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		// chỉ ban quản lý mới có thể tạo được user mới
		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý mới có thể tạo tài khoản mới");
			return;
		}

		// check fields is valid
		if (!Utils.checkUsername(username)){
			Response.response(res, Response.ResponseCode.ERROR, "Username is invalid", req.query);
			return;
		}
		if (!Utils.checkPassword(password)){
			Response.response(res, Response.ResponseCode.ERROR, "Password is invalid", req.query);
			return;
		}
		if (!Utils.checkEmail(email)){
			Response.response(res, Response.ResponseCode.ERROR, "Email is invalid", req.query);
			return;
		}
		if (!Utils.checkRole(role)){
			Response.response(res, Response.ResponseCode.ERROR, "Role is invalid", req.query, "1: Ban quản lý, 2: Kế toán");
			return;
		}
		
		// check account existed
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
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params
		let { token, username, password, email, role } = req.query;
		if (username == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of username", req.query, "Thiếu username");
			return;
		}

		// chỉ ban quản lý mới có thể xóa được user
		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý thực hiện được hành động này");
			return;
		}

		// chỉ có thể xóa user có vai trò là Kế toán
		let targetUser = await User.getUserByUsername(username);
		if (targetUser == null || targetUser.role == "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Không thể xóa tài khoản này");
			return;
		}

		let result = await User.deleteUser(username);
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Delete failed", req.query);
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Delete success", req.query, "Đã xóa tài khoản này");
	}


	/*
	route: GET [domain]/updateUser
	query: {
		token: "xxx",
		username: "admin",
		email: "email",
		role: "2"
	}
	*/
	async updateUser(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params
		let { token, username, email, role } = req.query;
		if (username == undefined || email == undefined || role == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		// Chỉ Ban quản lý mới đổi được thông tin tài khoản
		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		// console.log(curUser);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý thực hiện được");
			return;
		}

		// Chỉ có thể đổi thông tin tài khoản cho tài khoản của mình hoặc Kế toán
		let targetUser = await User.getUserByUsername(username);
		if (targetUser == null || (targetUser.username != curUser.username && targetUser.role == "1")){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Không đổi thông tin được cho tài khoản này");
			return;
		}

		// check fields is valid
		if (!Utils.checkEmail(email)){
			Response.response(res, Response.ResponseCode.ERROR, "Email is invalid", req.query);
			return;
		}
		if (!Utils.checkRole(role)){
			Response.response(res, Response.ResponseCode.ERROR, "Role is invalid", req.query, "1: Ban quản lý, 2: Kế toán");
			return;
		}

		let result = await User.updateUser(username, email, role);
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Change infor failed", req.query);
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Change infor success", req.query);
	}


	/*
	route: GET [domain]/changePassword
	query: {
		token: "xxx",
		username: "admin",
		password: "password"
	}
	*/
	async changePassword(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params
		let { token, username, password } = req.query;
		if (username == undefined || password == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		// Chỉ Ban quản lý mới đổi được mật khẩu
		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý thực hiện được");
			return;
		}

		// Chỉ có thể đổi mật khẩu cho tài khoản của mình hoặc Kế toán
		let targetUser = await User.getUserByUsername(username);
		if (targetUser == null || (targetUser.username != curUser.username && targetUser.role == "1")){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Không đổi mật khẩu được cho tài khoản này");
			return;
		}

		// check password is valid
		if (!Utils.checkPassword(password)){
			Response.response(res, Response.ResponseCode.ERROR, "Password is invalid", req.query);
			return;
		}

		let result1 = await User.updatePassword(username, password);
		if (result1 == null){
			Response.response(res, Response.ResponseCode.ERROR, "Change password failed", req.query);
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Change password success", req.query);
		Login.logout(username);
	}


	/*
	route: GET [domain]/cancelUser
	query: {
		token: "xxx",
		password: "password"
	}
	*/
	async cancelUser(req, res){
		// checkToken:
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params
		let {token, password} = req.query;
		if (password == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of password", req.query, "Thiếu mật khẩu");
			return;
		}

		// Chỉ ban quản lý mới có thể tự hủy tài khoản của mình
		let curUsername = req.username;
		let curUser = await User.getUserByUsername(curUsername);
		if (curUser == null || curUser.role != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "No right", req.query, "Chỉ Ban quản lý thực hiện được");
			return;
		}

		// check password
		if (password != curUser.password){
			Response.response(res, Response.ResponseCode.ERROR, "Password is wrong", req.query, "Mật khẩu sai");
			return;
		}

		result = await User.deleteUser(curUsername);
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "cancel user failed", req.query, "Hủy tài khoản thất bại");
			return;
		}

		Response.response(res, Response.ResponseCode.ERROR, "cancel user success", req.query, "Hủy tài khoản thành công");
	}
}


module.exports = {UserController}