
let Nhankhau = require('../model/nhankhau.js').Nhankhau;
let Response = require('../utils/response.js').Response;
let LoginController = require('../controller/login_controller.js').LoginController;

class NhankhauController{
	constructor(){}
	checkDate(date){
		if (date == null) return false;
		let dateRegex = /^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/;
		return dateRegex.test(date);
	}
	checkNumber(number){
		if (number == null) return false;
		let numberRegex = /^[0-9]{1,}$/;
		return numberRegex.test(String(number));
	}


	/*
	route: GET [domain]/searchNhankhau
	query: {
		token: "xxx",
		idnhankhau: "xxx"
		hoten: "Trần Văn Phúc"
		ngaysinh: "2001-04-22"
		gioitinh: 1   (0: nữ, 1: nam)
		quequan: "Hưng Yên"
		dantoc: "Kinh"
		tongiao: "Không"
		sohokhau: "1"
		quanhevoichuho: "Là chủ hộ"
		cccd: "123456789"
		ngaycap: "2022-12-20"
		noicap: "Hưng Yên"
		nghenghiep: "Sinh viên"
		ngaydangkythuongtru: "2022-04-22"
		ngaythemnhankhau: "2022-04-22"
		ghichu: "Không có ghi chú"
	required params: token
	optional params: others params
	}
	*/
	async searchNhankhau(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// get params
		let { 
			token, idnhankhau, hoten, ngaysinh, gioitinh, quequan, dantoc, tongiao, 
		 	sohokhau, quanhevoichuho, cccd, ngaycap, noicap, nghenghiep, 
			ngaydangkythuongtru, ngaythemnhankhau, ghichu
		} = req.query;

		var nhankhau = new Nhankhau({
			idnhankhau: idnhankhau, hoten: hoten, ngaysinh: ngaysinh, gioitinh: gioitinh, quequan: quequan, dantoc: dantoc, 
			tongiao: tongiao, sohokhau: sohokhau, quanhevoichuho: quanhevoichuho,
			cccd: cccd, ngaycap: ngaycap, noicap: noicap, nghenghiep: nghenghiep, 
			ngaydangkythuongtru: ngaydangkythuongtru, ngaythemnhankhau: ngaythemnhankhau, ghichu: ghichu
		});

		// search
		let listNhankhau = await Nhankhau.search(nhankhau);

		if (listNhankhau == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Success", listNhankhau, "Thành công");
	
	}

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

		let listNhankhau = await Nhankhau.select({});

		if (listNhankhau == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Success", listNhankhau);
	}


	/*
	route: GET [domain]/getListNhankhauBySoHoKhau
	query: {
		token: "xxx",
		sohokhau: "xxx"
	}
	*/
	async getListNhankhauBySoHoKhau(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let {token, sohokhau} = req.query;
		if (sohokhau == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of sohokhau", req.query, "Thiếu số hộ khẩu");
			return;
		}

		let listNhankhau = await Nhankhau.select({sohokhau: sohokhau});

		if (listNhankhau == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Success", listNhankhau);
	}


	/*
	route: GET [domain]/getNhankhauById
	query: {
		token: "xxx",
		idnhankhau: "xxx"
	}
	*/
	async getNhankhauById(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let {token, idnhankhau} = req.query;
		if (idnhankhau == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of idnhankhau", req.query, "Thiếu id Nhân khẩu");
			return;
		}

		let nhankhau = await Nhankhau.getById(idnhankhau);

		if (nhankhau == null){
			Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy");
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Success", nhankhau);
	}


	/*
	route: GET [domain]/getNhankhauByCCCD
	query: {
		token: "xxx",
		cccd: "xxx"
	}
	*/
	async getNhankhauByCCCD(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let {token, cccd} = req.query;
		if (cccd == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu số căn cước công dân");
			return;
		}

		let nhankhau = await Nhankhau.select({cccd: cccd});

		if (nhankhau == null){
			Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy");
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Success", nhankhau[0]);
	}


	/*
	route: GET [domain]/addNhankhau
	query: {
		token: "xxx"
		hoten: "Trần Văn Phúc"
		ngaysinh: "2001-04-22"
		gioitinh: 1   (0: nữ, 1: nam)
		quequan: "Hưng Yên"
		dantoc: "Kinh"
		tongiao: "Không"
		sohokhau: "1"
		quanhevoichuho: "Là chủ hộ"
		cccd: "123456789"
		ngaycap: "2022-12-20"
		noicap: "Hưng Yên"
		nghenghiep: "Sinh viên"
		ngaydangkythuongtru: "2022-04-22"
		ngaythemnhankhau: "2022-04-22"
		ghichu: "Không có ghi chú"
	}
	Optional params:
		sohokhau, quanhevoichuho, cccd, ngaycap, noicap, 
		nghenghiep, ngaydangkythuongtru, ngaythemnhankhau, ghichu
	*/
	async addNhankhau(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params
		let { 
			token, hoten, ngaysinh, gioitinh, quequan, dantoc, tongiao, 
		 	sohokhau, quanhevoichuho, cccd, ngaycap, noicap, nghenghiep, 
			ngaydangkythuongtru, ngaythemnhankhau, ghichu
		} = req.query;
		if (hoten == undefined || ngaysinh == undefined || 
			gioitinh == undefined || quequan == undefined || 
			dantoc == undefined || tongiao == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		var nhankhau = new Nhankhau({
			id: null, hoten: hoten, ngaysinh: ngaysinh, gioitinh: gioitinh, quequan: quequan, dantoc: dantoc, tongiao: tongiao, 
			sohokhau: sohokhau, quanhevoichuho: quanhevoichuho,
			cccd: cccd, ngaycap: ngaycap, noicap: noicap, nghenghiep: nghenghiep, 
			ngaydangkythuongtru: ngaydangkythuongtru, ngaythemnhankhau: ngaythemnhankhau, ghichu: ghichu
		});

		// check cccd is existed:
		if (cccd != null){
			let nhankhau = await Nhankhau.select(cccd);
			if (nhankhau != null && nhankhau.length > 0){
				Response.response(res, Response.ResponseCode.ERROR, "cccd is existed", req.query);
				return;
			}
		}

		// check sohokhau is existed:
		// chua lam model hokhau

		// check fields:
		if (hoten.length <= 0) {
			Response.response(res, Response.ResponseCode.ERROR, "hoten is invalid", req.query);
			return;
		}
		if (!this.checkDate(ngaysinh)){
			Response.response(res, Response.ResponseCode.ERROR, "ngaysinh is invalid", req.query);
			return;
		}
		gioitinh = new String(gioitinh);
		if (gioitinh != "0" && gioitinh != "1"){
			Response.response(res, Response.ResponseCode.ERROR, "gioitinh is invalid", req.query);
			return;
		}
		if (sohokhau != null && !this.checkNumber(sohokhau)){
			Response.response(res, Response.ResponseCode.ERROR, "sohokhau is invalid", req.query);
			return;
		}
		if (cccd != null && !this.checkNumber(cccd)){
			Response.response(res, Response.ResponseCode.ERROR, "cccd is invalid", req.query);
			return;
		}
		if (ngaycap != null && !this.checkDate(ngaycap)){
			Response.response(res, Response.ResponseCode.ERROR, "ngaycap is invalid", req.query);
			return;
		}
		if (ngaydangkythuongtru != null && !this.checkDate(ngaydangkythuongtru)){
			Response.response(res, Response.ResponseCode.ERROR, "ngaydangkythuongtru is invalid", req.query);
			return;
		}
		if (ngaythemnhankhau != null && !this.checkDate(ngaythemnhankhau)){
			Response.response(res, Response.ResponseCode.ERROR, "ngaythemnhankhau is invalid", req.query);
			return;
		}

		// add Nhankhau
		result = await Nhankhau.insert(nhankhau);

		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Thêm nhân khẩu thất bại");
			return;
		}

		nhankhau.id = result.insertId;
		Response.response(res, Response.ResponseCode.OK, "Success", nhankhau, "Đã thêm nhân khẩu");
		// Response.response(res, Response.ResponseCode.OK, "Success", result, "Đã thêm nhân khẩu");
	}


	/*
	route: GET [domain]/updateNhankhau
	query: {
		token: "xxx"
		idnhankhau: "xxx"
		hoten: "Trần Văn Phúc"
		ngaysinh: "2001-04-22"
		gioitinh: 1   (0: nữ, 1: nam)
		quequan: "Hưng Yên"
		dantoc: "Kinh"
		tongiao: "Không"
		sohokhau: "1"
		quanhevoichuho: "Là chủ hộ"
		cccd: "123456789"
		ngaycap: "2022-12-20"
		noicap: "Hưng Yên"
		nghenghiep: "Sinh viên"
		ngaydangkythuongtru: "2022-04-22"
		ngaythemnhankhau: "2022-04-22"
		ghichu: "Không có ghi chú"
	}
	Optional params: all except {token, id}
	*/
	async updateNhankhau(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params
		let { 
			token, idnhankhau, hoten, ngaysinh, gioitinh, quequan, dantoc, tongiao, 
		 	sohokhau, quanhevoichuho, cccd, ngaycap, noicap, nghenghiep, 
			ngaydangkythuongtru, ngaythemnhankhau, ghichu
		} = req.query;

		if (idnhankhau == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of idnhankhau", req.query, "Thiếu id Nhân khẩu");
			return;
		}

		var nhankhau = new Nhankhau({
			id: idnhankhau, hoten: hoten, ngaysinh: ngaysinh, gioitinh: gioitinh, quequan: quequan, dantoc: dantoc, 
			tongiao: tongiao, sohokhau: sohokhau, quanhevoichuho: quanhevoichuho,
			cccd: cccd, ngaycap: ngaycap, noicap: noicap, nghenghiep: nghenghiep, 
			ngaydangkythuongtru: ngaydangkythuongtru, ngaythemnhankhau: ngaythemnhankhau, 
			ghichu: ghichu
		});

		// check nhankhau is existed:
		var old_nhankhau = await Nhankhau.getById(idnhankhau);
		if (old_nhankhau == null){
			Response.response(res, Response.ResponseCode.ERROR, "nhankhau is not existed", req.query, "Không tồn tại nhân khẩu");
			return;
		}

		// check cccd is existed:
		if (cccd != null){
			let nhankhau2 = await Nhankhau.select({cccd: cccd});
			if (nhankhau2 != null && nhankhau2.length > 0 && String(nhankhau2.id) != String(idnhankhau)){
				Response.response(res, Response.ResponseCode.ERROR, "cccd is existed", req.query);
				return;
			}
		}

		// check sohokhau is existed:
		// chua lam model hokhau

		// check fields:
		if (hoten != null && hoten.length <= 0) {
			Response.response(res, Response.ResponseCode.ERROR, "hoten is invalid", req.query);
			return;
		}
		if (ngaysinh != null && !this.checkDate(ngaysinh)){
			Response.response(res, Response.ResponseCode.ERROR, "ngaysinh is invalid", req.query);
			return;
		}
		if (gioitinh != undefined && (String(gioitinh) != "0") && (String(gioitinh) != "1")){
			// console.log("giới tính: " + gioitinh);
			Response.response(res, Response.ResponseCode.ERROR, "gioitinh is invalid", req.query);
			return;
		}
		if (sohokhau != null && !this.checkNumber(sohokhau)){
			Response.response(res, Response.ResponseCode.ERROR, "sohokhau is invalid", req.query);
			return;
		}
		if (cccd != null && !this.checkNumber(cccd)){
			Response.response(res, Response.ResponseCode.ERROR, "cccd is invalid", req.query);
			return;
		}
		if (ngaycap != null && !this.checkDate(ngaycap)){
			Response.response(res, Response.ResponseCode.ERROR, "ngaycap is invalid", req.query);
			return;
		}
		if (ngaydangkythuongtru != null && !this.checkDate(ngaydangkythuongtru)){
			Response.response(res, Response.ResponseCode.ERROR, "ngaydangkythuongtru is invalid", req.query);
			return;
		}
		if (ngaythemnhankhau != null && !this.checkDate(ngaythemnhankhau)){
			Response.response(res, Response.ResponseCode.ERROR, "ngaythemnhankhau is invalid", req.query);
			return;
		}

		// add Nhankhau
		old_nhankhau.copy_from(nhankhau);
		result = await Nhankhau.update(old_nhankhau);

		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Update nhân khẩu thất bại");
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Success", old_nhankhau, "Đã cập nhật thông tin nhân khẩu");
	}


	/*
	route: GET [domain]/deleteNhankhau
	query: {
		token: "xxx",
		idnhankhau: "xxx"
	}
	*/
	async deleteNhankhau(req, res){
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params
		let { token, idnhankhau } = req.query;
		if (idnhankhau == undefined){
			Response.response(res, Response.ResponseCode.ERROR, "Lack of idnhankhau", req.query, "Thiếu id nhân khẩu");
			return;
		}

		// check nhankhau is existed:
		let nhankhau = await Nhankhau.getById(idnhankhau);
		if (nhankhau == null){
			Response.response(res, Response.ResponseCode.ERROR, "nhankhau is not existed", req.query, "Nhân khẩu không tồn tại");
			return;
		}


		// Không thể xóa một nhân khẩu đang là chủ hộ khẩu
		// chưa làm api hộ khẩu


		// delete nhankhau
		result = await Nhankhau.delete({id: idnhankhau});
		if (result == null){
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Xóa nhân khẩu thất bại");
			return;
		}

		Response.response(res, Response.ResponseCode.ERROR, "Success", req.query, "Đã xóa nhân khẩu");
	}

}

module.exports = { NhankhauController };
