
let Nhankhau = require('../model/nhankhau.js').Nhankhau;
let Response = require('../utils/response.js').Response;
let LoginController = require('../controller/login_controller.js').LoginController;

class NhankhauController{
	constructor(){}

	async getListNhankhau(req, res){
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let username = req.username;
		let listNhankhau = await Nhankhau.selectAll();

		Response.response(res, Response.ResponseCode.OK, "Success", listNhankhau);
	
	}

}

module.exports = { NhankhauController };
