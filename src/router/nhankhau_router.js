
var NhankhauController = require('../controller/nhankhau_controller.js').NhankhauController;

class NhankhauRouter{
	constructor(app){
		this.app = app;
	}
	route(){

		this.app.route("/searchNhankhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.searchNhankhau(req, res);
			});

		this.app.route("/getListNhankhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.getListNhankhau(req, res);
			});

		this.app.route("/postListNhankhau")
			.post(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.postListNhankhau(req, res);
			});

		this.app.route("/getListNhankhauBySoHoKhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.getListNhankhauBySoHoKhau(req, res);
			});

		this.app.route("/getNhankhauById")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.getNhankhauById(req, res);
			});

		this.app.route("/getNhankhauByCCCD")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.getNhankhauByCCCD(req, res);
			});

		this.app.route("/addNhankhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.addNhankhau(req, res);
			});

		this.app.route("/updateNhankhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.updateNhankhau(req, res);
			});

		this.app.route("/deleteNhankhau")
			.get(function(req, res){
				let nhankhauController = new NhankhauController();
				nhankhauController.deleteNhankhau(req, res);
			});


		
	}
}

module.exports = { NhankhauRouter };

