

var LoginController = require('../controller/login_controller.js').LoginController;
var UserController = require('../controller/user_controller.js').UserController;
var NhankhauController = require('../controller/nhankhau_controller.js').NhankhauController;

class Router{
	constructor(app){
		this.app = app;
	}
	route(){
		this.app.route("/login")
			.get(function(req, res){
				let loginController = new LoginController();
				loginController.login(req, res);
			});
		this.app.route("/logout")
			.get(function(req, res){
				let loginController = new LoginController();
				loginController.logout(req, res);
			});
		this.app.route("/checkToken")
			.get(function(req, res){
				let loginController = new LoginController();
				loginController.checkToken(req, res);
			});
		this.app.route("/register")
			.get(function(req, res){
				let userController = new UserController();
				userController.createUser(req, res);
			});

		this.app.route("/getListNhankhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.getListNhankhau(req, res);
			})
	}
}

module.exports = { Router };

