
let Nhankhau = require('../model/nhankhau.js').Nhankhau;
let Response = require('../utils/response.js').Response;

class NhankhauController{
	constructor(){}

	getListNhankhau(req, res){
		Nhankhau.selectAll(function(listNhankhau){
			Response.response(res, Response.ResponseCode.OK, "Success", listNhankhau);
		});
	}

}

module.exports = { NhankhauController };
