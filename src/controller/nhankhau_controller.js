
let Nhankhau = require('../model/nhankhau.js').Nhankhau;
let Response = require('../utils/response.js').Response;
let LoginController = require('../controller/login_controller.js').LoginController;

class NhankhauController{
	constructor(){}


	/*
	route: GET [domain]/getListNhankhau
	query: {
		token: "xxx"
	}
	*/
	async getListNhankhau(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let username = req.username;
		let listNhankhau = await Nhankhau.selectAll();

		Response.response(res, Response.ResponseCode.OK, "Success", listNhankhau);
	}

}

module.exports = { NhankhauController };
