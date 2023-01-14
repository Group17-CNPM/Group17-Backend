
let LoginController = require('../controller/login_controller.js').LoginController;
let Response = require('../utils/response.js').Response;
let Nhankhau = require('../model/nhankhau.js').Nhankhau;
// let Hokhau = require('../model/hokhau.js').Hokhau;
let History = require('../model/history.js').History;

class LichsuController{
	constructor(){}


	/*
	route: GET [domain]/addNhankhauToHokhau
	query:
		token: "xxx",
		sohokhau: "xxx"
		idnhankhau: "xxx"
		cccd: "xxx"
	constraint:
		required params: token, sohokhau
		others: one of two params (sohokhau, cccd) are required, another must be not accept
	*/
	async addNhankhauToHokhau(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params:
		let { token, sohokhau, idnhankhau, cccd } = req.query;
		if (sohokhau == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of sohokhau", req.query, "Thiếu số hộ khẩu");
			return;
		}
		if (idnhankhau != undefined && cccd != undefined){
			Response.response(res, Response.ResponseCode.ERROR, "params is invalid", req.query, "idnhankhau và cccd không cùng xuất hiện");
			return;
		}
		if (idnhankhau == undefined && cccd == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu idnhankhau hoặc cccd");
			return;
		}

		var nhankhau, hokhau;
		
		// check sohokhau is existed
		hokhau = await Hokhau.getBySohokhau(sohokhau);
		if (hokhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Hokhau is not existed", req.query, "Hộ khẩu không tồn tại");
			return;
		}

		// check nhankhau is existed
		if (idnhankhau != null) {
			nhankhau = await Nhankhau.getNhankhauById(idnhankhau);
		} else { // cccd != null
			nhankhau = await Nhankhau.getNhankhauByCCCD(cccd);
		}
		if (nhankhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Nhankhau is not existed", req.query, "Nhân khẩu không tồn tại");
			return;
		}


		// check nhankhau đã có hộ khẩu
		if (nhankhau.hokhau != null){
			if (nhankhau.hokhau == sohokhau){
				// nhân khẩu đã ở trong hộ khẩu sohokhau
				Response.response(res, Response.ResponseCode.ERROR, "nhankhau is already in hokhau", req.query, "Nhân khẩu đã ở trong hộ khẩu rồi");
				return;
			} else {
				// nhân khẩu đã ở trong hộ khẩu khác
				Response.response(res, Response.ResponseCode.ERROR, "nhankhau is in another hokhau", req.query, "Nhân khẩu đang ở trong hộ khẩu khác");
				return;
			}
		}

		// nhân khẩu chưa trong hộ khẩu nào, thêm nhân khẩu vào hộ khẩu
		let time = LoginController.getCurrentStringTime();
		result = await History.addNhankhauToHokhau(sohokhau, nhankhau.idnhankhau, time);

		// Thêm lỗi
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Đã có lỗi xảy ra");
			return;	
		}

		// Thành công
		Response.response(res, Response.ResponseCode.ERROR, "Success", req.query, "Thêm nhân khẩu thành công vào hộ khẩu");
	}



	/*
	route: GET [domain]/deleteNhankhauFromHokhau
	query:
		token: "xxx",
		sohokhau: "xxx"
		idnhankhau: "xxx"
		cccd: "xxx"
	constraint:
		required params: token, sohokhau
		others: one of two params (sohokhau, cccd) are required, another must be not accept
		Không thể xóa chủ hộ khẩu khỏi nhân khẩu được mà phải chuyển chủ hộ khẩu trước
			(update lại chủ hộ khẩu cho hộ khẩu)
	*/
	async deleteNhankhauFromHokhau(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params:
		let { token, sohokhau, idnhankhau, cccd } = req.query;
		if (sohokhau == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of sohokhau", req.query, "Thiếu số hộ khẩu");
			return;
		}
		if (idnhankhau != undefined && cccd != undefined){
			Response.response(res, Response.ResponseCode.ERROR, "params is invalid", req.query, "idnhankhau và cccd không cùng xuất hiện");
			return;
		}
		if (idnhankhau == undefined && cccd == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu idnhankhau hoặc cccd");
			return;
		}

		var nhankhau, hokhau;
		
		// check sohokhau is existed
		hokhau = await Hokhau.getBySohokhau(sohokhau);
		if (hokhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Hokhau is not existed", req.query, "Hộ khẩu không tồn tại");
			return;
		}

		// check nhankhau is existed
		if (idnhankhau != null) {
			nhankhau = await Nhankhau.getNhankhauById(idnhankhau);
		} else { // cccd != null
			nhankhau = await Nhankhau.getNhankhauByCCCD(cccd);
		}
		if (nhankhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Nhankhau is not existed", req.query, "Nhân khẩu không tồn tại");
			return;
		}

		// check nhankhau phải ở trong hộ khẩu
		if (nhankhau.hokhau != sohokhau){
			Response.response(res, Response.ResponseCode.ERROR, "nhankhau is not in this hokhau", req.query, "Nhân khẩu không thuộc hộ khẩu này");
			return;
		}

		// check nhankhau không phải chủ hộ khẩu
		if (hokhau.idchuho == nhankhau.idnhankhau){
			Response.response(res, Response.ResponseCode.ERROR, "cannot delete chuhokhau", req.query, "Không thể xóa chủ hộ khẩu khỏi hộ khẩu");
			return;
		}

		// xóa nhân khẩu khói hộ khẩu
		let time = LoginController.getCurrentStringTime();
		result = await History.deleteNhankhauFromHokhau(sohokhau, nhankhau.idnhankhau, time);

		// Xóa bị lỗi
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Đã có lỗi xảy ra");
			return;	
		}

		// Thành công
		Response.response(res, Response.ResponseCode.ERROR, "Success", req.query, "Xóa nhân khẩu khỏi hộ khẩu thành công");
	}


}


module.exports = { LichsuController };
