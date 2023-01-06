

var { LoginController } = require('../controller/login_controller.js');
var { NhankhauController } = require('../controller/nhankhau_controller.js');

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

		this.app.route("/getListNhankhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.getListNhankhau(req, res);
			})
	}
}

module.exports = { Router };

