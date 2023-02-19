

var ThuphiController = require('../controller/thuphi_controller.js').ThuphiController;

class ThuphiRouter{
	constructor(app){
		this.app = app;
	}
	route(){
		
		this.app.route("/getKhoanthu")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.getKhoanthu(req, res);
			});
		this.app.route("/getDetailKhoanthu")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.getDetailKhoanthu(req, res);
			});
		this.app.route("/getListKhoanthu")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.getListKhoanthu(req, res);
			});
		this.app.route("/searchKhoanthu")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.searchKhoanthu(req, res);
			});
		this.app.route("/addKhoanthu")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.addKhoanthu(req, res);
			});
		this.app.route("/updateKhoanthu")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.updateKhoanthu(req, res);
			});
		this.app.route("/deleteKhoanthu")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.deleteKhoanthu(req, res);
			});

		this.app.route("/addThuphi")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.addThuphi(req, res);
			});
		this.app.route("/updateThuphi")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.updateThuphi(req, res);
			});
		this.app.route("/deleteThuphi")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.deleteThuphi(req, res);
			});
		this.app.route("/getThuphi")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.getThuphi(req, res);
			});
		this.app.route("/getListThuphi")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.getListThuphi(req, res);
			});
		this.app.route("/getNotCompleteListHokhau")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.getNotCompleteListHokhau(req, res);
			});
		this.app.route("/searchThuphi")
			.get(function(req, res){
				let thuphiController = new ThuphiController();
				thuphiController.searchThuphi(req, res);
			});


	}
}

module.exports = { ThuphiRouter };

