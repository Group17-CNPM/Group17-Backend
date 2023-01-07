
var NhankhauController = require('../controller/nhankhau_controller.js').NhankhauController;

class NhankhauRouter{
	constructor(app){
		this.app = app;
	}
	route(){

		this.app.route("/getListNhankhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.getListNhankhau(req, res);
			});
			
	}
}

module.exports = { NhankhauRouter };

