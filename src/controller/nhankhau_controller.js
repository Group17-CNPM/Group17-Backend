
let Nhankhau = require('../model/nhankhau.js').Nhankhau;
let Response = require('../utils/response.js').Response;

class NhankhauController{
	constructor(){}

	async getListNhankhau(req, res){
		let listNhankhau = await Nhankhau.selectAll();

		Response.response(res, Response.ResponseCode.OK, "Success", listNhankhau);
	
	}

}

module.exports = { NhankhauController };
