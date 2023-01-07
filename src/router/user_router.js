

var UserController = require('../controller/user_controller.js').UserController;

class UserRouter{
	constructor(app){
		this.app = app;
	}
	route(){
		
		this.app.route("/register")
			.get(function(req, res){
				let userController = new UserController();
				userController.createUser(req, res);
			});
		this.app.route("/deleteUser")
			.get(function(req, res){
				console.log("call delete");
				let userController = new UserController();
				userController.deleteUser(req, res);
			});
		this.app.route("/updateUser")
			.get(function(req, res){
				console.log("call update");
				let userController = new UserController();
				userController.updateUser(req, res);
			});
		this.app.route("/changePassword")
			.get(function(req, res){
				let userController = new UserController();
				userController.changePassword(req, res);
			});
		this.app.route("/cancelUser")
			.get(function(req, res){
				let userController = new UserController();
				userController.cancelUser(req, res);
			});

	}
}

module.exports = { UserRouter };

