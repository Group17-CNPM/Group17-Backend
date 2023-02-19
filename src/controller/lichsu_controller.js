
let LoginController = require('../controller/login_controller.js').LoginController;
let Response = require('../utils/response.js').Response;
let Nhankhau = require('../model/nhankhau.js').Nhankhau;
let Hokhau = require('../model/hokhau.js').HoKhau;
let Lichsu = require('../model/lichsu.js').Lichsu;
let Utils = require('../utils/utils.js').Utils;

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
			Response.response(res, Response.ResponseCode.ERROR, "params is invalid", req.query, "idnhankhau và cccd không được cùng xuất hiện");
			return;
		}
		if (idnhankhau == undefined && cccd == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu idnhankhau hoặc cccd");
			return;
		}

		var nhankhau, hokhau;
		
		// check sohokhau is existed
		hokhau = await Hokhau.getHokhauBySoHokhau(sohokhau);
		if (hokhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Hokhau is not existed", req.query, "Hộ khẩu không tồn tại");
			return;
		}

		// check nhankhau is existed
		if (idnhankhau != null) {
			nhankhau = await Nhankhau.getById(idnhankhau);
		} else { // cccd != null
			nhankhau = await Nhankhau.select({cccd : cccd});
			if (nhankhau != null) nhankhau = nhankhau[0];
		}
		if (nhankhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Nhankhau is not existed", req.query, "Nhân khẩu không tồn tại");
			return;
		}


		// check nhankhau đã có hộ khẩu
		if (nhankhau.sohokhau != null){
			if (nhankhau.sohokhau == sohokhau){
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
		let time = Utils.getStringFromUTCDate(new Date());
		result = await Lichsu.addNhankhauToHokhau(sohokhau, nhankhau.id, time);

		// Thêm lỗi
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Đã có lỗi xảy ra");
			return;	
		}

		// Thành công
		req.query.time = Utils.getStringFromUTCDate(new Date());
		Response.response(res, Response.ResponseCode.OK, "Success", req.query, "Thêm nhân khẩu thành công vào hộ khẩu");
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
			Response.response(res, Response.ResponseCode.ERROR, "params is invalid", req.query, "idnhankhau và cccd không được cùng xuất hiện");
			return;
		}
		if (idnhankhau == undefined && cccd == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu idnhankhau hoặc cccd");
			return;
		}

		var nhankhau, hokhau;
		
		// check sohokhau is existed
		hokhau = await Hokhau.getHokhauBySoHokhau(sohokhau);
		if (hokhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Hokhau is not existed", req.query, "Hộ khẩu không tồn tại");
			return;
		}

		// check nhankhau is existed
		if (idnhankhau != null) {
			nhankhau = await Nhankhau.getById(idnhankhau);
		} else { // cccd != null
			nhankhau = await Nhankhau.select({cccd : cccd});
			if (nhankhau != null) nhankhau = nhankhau[0];
		}
		if (nhankhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Nhankhau is not existed", req.query, "Nhân khẩu không tồn tại");
			return;
		}

		// check nhankhau phải ở trong hộ khẩu
		if (nhankhau.sohokhau != sohokhau){
			Response.response(res, Response.ResponseCode.ERROR, "nhankhau is not in this hokhau", req.query, "Nhân khẩu không thuộc hộ khẩu này");
			return;
		}

		// check nhankhau không phải chủ hộ khẩu
		if (hokhau.idchuho == nhankhau.id){
			Response.response(res, Response.ResponseCode.ERROR, "cannot delete chuhokhau", req.query, "Không thể xóa chủ hộ khẩu khỏi hộ khẩu");
			return;
		}

		// xóa nhân khẩu khỏi hộ khẩu
		let time = Utils.getStringFromUTCDate(new Date());
		result = await Lichsu.deleteNhankhauFromHokhau(sohokhau, nhankhau.id, time);

		// Xóa bị lỗi
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Đã có lỗi xảy ra");
			return;	
		}

		// Thành công
		Response.response(res, Response.ResponseCode.OK, "Success", req.query, "Xóa nhân khẩu khỏi hộ khẩu thành công");
	}


	/*
	route: GET [domain]/getHokhauHistory
	query:
		token: "xxx",
		sohokhau: "xxx"
	constraint:
		required params: token, sohokhau
	*/
	async getHokhauHistory(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params:
		let { token, sohokhau } = req.query;
		if (sohokhau == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of sohokhau", req.query, "Thiếu số hộ khẩu");
			return;
		}

		// check hokhau is existed
		let hokhau = await Hokhau.getHokhauBySoHokhau(sohokhau);
		if (hokhau == null){
			Response.response(res, Response.ResponseCode.ERROR, "hokhau is not existed", req.query, "Hộ khẩu không tồn tại");
			return;
		}

		let member = [await Nhankhau.getById(hokhau.idchuho, ["id", "hoten", "cccd", "quanhevoichuho"])];

		result = [
			{
				time: hokhau.ngaylamhokhau,
				loaithaydoi: 0,
				member: [...member]
			}
		]

		let listLichsu = await Lichsu.select({sohokhau: sohokhau});

		for (let lichsu of listLichsu){
			let data = {
				time: lichsu.thoigian,
				loaithaydoi: lichsu.loaithaydoi,
				nhankhau: await Nhankhau.getById(lichsu.idnhankhau, ["id", "hoten", "cccd", "quanhevoichuho"]),
				member: member
			};
			if (String(lichsu.loaithaydoi) == '1'){
				// add nhankhau
				let index = member.findIndex(element => element.id == lichsu.idnhankhau);
				if (index < 0) {
					member.push(data.nhankhau);
				}
			} else if (String(lichsu.loaithaydoi) == '2'){
				member = member.filter(element => element.id != lichsu.idnhankhau);
			}
			data.member = [...member];
			result.push(data);
		}

		Response.response(res, Response.ResponseCode.OK, "Success", result);
		
	}


	/*
	route: GET [domain]/getHokhauAtTime
	query:
		token: "xxx",
		sohokhau: "xxx"
		time: "YYYY-MM-DD hh:mm:ss"
	constraint:
		required params: token, sohokhau
	*/
	async getHokhauAtTime(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params:
		let { token, sohokhau, time } = req.query;
		if (sohokhau == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}
		if (time == undefined){
			time = Utils.getStringFromUTCDate(new Date());
		} else {
			 // check time is valid
			if (!Utils.checkDate(time)){
				Response.response(res, Response.ResponseCode.ERROR, "time is invalid", req.query, "Thời gian không đúng định dạng YYYY-MM-DD hh:mm:ss");
				return;
			}
		}

		// check hokhau is existed
		let hokhau = await Hokhau.getHokhauBySoHokhau(sohokhau);
		if (hokhau == null){
			Response.response(res, Response.ResponseCode.ERROR, "hokhau is not existed", req.query, "Hộ khẩu không tồn tại");
			return;
		}

		let reqTime = Utils.getUTCDateFromString(time).getTime() / 1000;
		let createTime = Utils.getUTCDateFromString(hokhau.ngaylamhokhau).getTime() / 1000;
		let now = (new Date()).getTime() / 1000;
		// console.log("createTime: " + createTime);
		// console.log("now: " + now);
		// console.log("reqTime: " + reqTime);
		if (reqTime < createTime) {
			Response.response(res, Response.ResponseCode.ERROR, "Not create HoKhau yet", {}, "Hộ khẩu chưa được tạo vào thời gian này");
			return;
		}
		if (reqTime > now){
			Response.response(res, Response.ResponseCode.ERROR, "Travel in future", {}, "Không thể du hành thời gian");
			return;
		}

		let member = [await Nhankhau.getById(hokhau.idchuho, ["id", "hoten", "cccd", "quanhevoichuho"])];

		let listLichsu = await Lichsu.select({sohokhau: sohokhau});

		for (let lichsu of listLichsu){
			let curTime = new Date(lichsu.thoigian).getTime() / 1000;
			if (curTime > reqTime) break;

			if (String(lichsu.loaithaydoi) == '1'){
				// add nhankhau
				let index = member.findIndex(element => element.id == lichsu.idnhankhau);
				if (index < 0) {
					member.push(await Nhankhau.getById(lichsu.idnhankhau, ["id", "hoten", "cccd", "quanhevoichuho"]));
				}
			} else if (String(lichsu.loaithaydoi) == '2'){
				member = member.filter(element => element.id != lichsu.idnhankhau);
			}
		}
		hokhau.member = member;
		hokhau["get at"] = time;

		Response.response(res, Response.ResponseCode.OK, "Success", hokhau);
		
	}


}


module.exports = { LichsuController };
