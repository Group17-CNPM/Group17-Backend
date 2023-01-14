

var LichsuController = require('../controller/lichsu_controller.js').LichsuController;

class LichsuRouter{
	constructor(app){
		this.app = app;
	}

	route(){

		this.app.route('/addNhankhauToHokhau')
			.get(function(req, res) {
				let lichsuController = new LichsuController();
				lichsuController.addNhankhauToHokhau(req, res);
			});

		this.app.route('/deleteNhankhauFromHokhau')
			.get(function(req, res) {
				let lichsuController = new LichsuController();
				lichsuController.deleteNhankhauFromHokhau(req, res);
			});

		this.app.route('/getHokhauAtTime')
			.get(function(req, res) {
				let lichsuController = new LichsuController();
				lichsuController.getHokhauAtTime(req, res);
			});

		this.app.route('/getHokhauHistory')
			.get(function(req, res) {
				let lichsuController = new LichsuController();
				lichsuController.getHokhauHistory(req, res);
			});
	}

}

module.exports = { LichsuRouter };
