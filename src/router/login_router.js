

var LoginController = require('../controller/login_controller.js').LoginController;

class LoginRouter{
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
		this.app.route("/logoutAllDevice")
			.get(function(req, res){
				let loginController = new LoginController();
				loginController.logoutAllDevice(req, res);
			});
		this.app.route("/checkToken")
			.get(function(req, res){
				let loginController = new LoginController();
				loginController.checkToken(req, res);
			});
		this.app.route("/refreshToken")
			.get(function(req, res){
				let loginController = new LoginController();
				loginController.refreshToken(req, res);
			});
	}
}

module.exports = { LoginRouter };

