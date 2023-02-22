
let Nhankhau = require('../model/nhankhau.js').Nhankhau;
let Response = require('../utils/response.js').Response;
let LoginController = require('../controller/login_controller.js').LoginController;
let Utils = require('../utils/utils.js').Utils;
let HoKhau = require('../model/hokhau.js').HoKhau;
let Tamtrutamvang = require('../model/tamtrutamvang.js').Tamtrutamvang;
let Lichsu = require('../model/lichsu.js').Lichsu;

class NhankhauController {
	constructor() { }


	async postListNhankhau(req, res){
		res.json(req.body);
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
		start: 12
		length: 13
	required params: token
	optional params: others params
	}
	*/
	async searchNhankhau(req, res) {
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// get params
		let {
			token, idnhankhau, hoten, ngaysinh, gioitinh, quequan, dantoc, tongiao,
			sohokhau, quanhevoichuho, cccd, ngaycap, noicap, nghenghiep,
			ngaydangkythuongtru, ngaythemnhankhau, ghichu, start, length
		} = req.query;

		if (start != null && !Utils.checkNumber(start))
			return Response.response(res, Response.ResponseCode.ERROR, "start is invalid", req.query);
		if (length != null && !Utils.checkNumber(length))
			return Response.response(res, Response.ResponseCode.ERROR, "length is invalid", req.query);
		let pagination = null;
		if (start != null && length != null) {
			pagination = {
				start: start,
				length: length
			}
		}

		var nhankhau = new Nhankhau({
			id: idnhankhau, hoten: hoten, ngaysinh: ngaysinh, gioitinh: gioitinh, quequan: quequan, dantoc: dantoc,
			tongiao: tongiao, sohokhau: sohokhau, quanhevoichuho: quanhevoichuho,
			cccd: cccd, capngay: ngaycap, noicap: noicap, nghenghiep: nghenghiep,
			ngaydangkythuongtru: ngaydangkythuongtru, ngaythemnhankhau: ngaythemnhankhau, ghichu: ghichu
		});

		// search
		let listNhankhau = await Nhankhau.search(nhankhau, null, pagination);

		if (listNhankhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
			return;
		}

		Response.response(res, Response.ResponseCode.OK, "Success", listNhankhau, "Thành công");

	}

	/*
	route: GET [domain]/getListNhankhau
	query: {
		token: "xxx"
		start: 123,
		length: 12
	}
	*/
	async getListNhankhau(req, res) {
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let { start, length } = req.query;
		if (start != null && !Utils.checkNumber(start))
			return Response.response(res, Response.ResponseCode.ERROR, "start is invalid", req.query);
		if (length != null && !Utils.checkNumber(length))
			return Response.response(res, Response.ResponseCode.ERROR, "length is invalid", req.query);
		let pagination = null;
		if (start != null && length != null) {
			pagination = {
				start: start,
				length: length
			}
		}

		let listNhankhau = await Nhankhau.select({}, null, pagination);

		if (listNhankhau == null) {
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
	async getListNhankhauBySoHoKhau(req, res) {
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let { token, sohokhau } = req.query;
		if (sohokhau == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of sohokhau", req.query, "Thiếu số hộ khẩu");
			return;
		}

		let listNhankhau = await Nhankhau.select({ sohokhau: sohokhau });

		if (listNhankhau == null) {
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
	async getNhankhauById(req, res) {
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let { token, idnhankhau } = req.query;
		if (idnhankhau == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of idnhankhau", req.query, "Thiếu id Nhân khẩu");
			return;
		}

		let nhankhau = await Nhankhau.getById(idnhankhau);

		if (nhankhau == null) {
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
	async getNhankhauByCCCD(req, res) {
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		let { token, cccd } = req.query;
		if (cccd == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu số căn cước công dân");
			return;
		}

		let nhankhau = await Nhankhau.select({ cccd: cccd });

		if (nhankhau == null) {
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
	async addNhankhau(req, res) {
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
			dantoc == undefined || tongiao == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
			return;
		}

		var nhankhau = new Nhankhau({
			id: null, hoten: hoten, ngaysinh: ngaysinh, gioitinh: gioitinh, quequan: quequan, dantoc: dantoc, tongiao: tongiao,
			sohokhau: sohokhau, quanhevoichuho: quanhevoichuho,
			cccd: cccd, capngay: ngaycap, noicap: noicap, nghenghiep: nghenghiep,
			ngaydangkythuongtru: ngaydangkythuongtru, ngaythemnhankhau: ngaythemnhankhau, ghichu: ghichu
		});

		// check cccd is existed:
		if (cccd != null) {
			let nhankhau = await Nhankhau.select({ cccd: cccd });
			if (nhankhau != null && nhankhau.length > 0) {
				Response.response(res, Response.ResponseCode.ERROR, "cccd is existed", req.query);
				return;
			}
		}

		// check sohokhau is existed:
		if (sohokhau != null) {
			let hokhau = await HoKhau.getHokhauBySoHokhau(sohokhau);
			if (hokhau == null) {
				return Response.response(res, Response.ResponseCode.ERROR, "hokhau is not existed", req.query);
			}
		}

		// check fields:
		if (hoten.length <= 0) {
			Response.response(res, Response.ResponseCode.ERROR, "hoten is invalid", req.query);
			return;
		}
		if (!Utils.checkDate(ngaysinh)) {
			Response.response(res, Response.ResponseCode.ERROR, "ngaysinh is invalid", req.query);
			return;
		}
		gioitinh = new String(gioitinh);
		if (gioitinh != "0" && gioitinh != "1") {
			Response.response(res, Response.ResponseCode.ERROR, "gioitinh is invalid", req.query);
			return;
		}
		if (sohokhau != null && !Utils.checkNumber(sohokhau)) {
			Response.response(res, Response.ResponseCode.ERROR, "sohokhau is invalid", req.query);
			return;
		}
		if (cccd != null && !Utils.checkNumber(cccd)) {
			Response.response(res, Response.ResponseCode.ERROR, "cccd is invalid", req.query);
			return;
		}
		if (ngaycap != null && !Utils.checkDate(ngaycap)) {
			Response.response(res, Response.ResponseCode.ERROR, "ngaycap is invalid", req.query);
			return;
		}
		if (ngaydangkythuongtru != null && !Utils.checkDate(ngaydangkythuongtru)) {
			Response.response(res, Response.ResponseCode.ERROR, "ngaydangkythuongtru is invalid", req.query);
			return;
		}
		if (ngaythemnhankhau != null && !Utils.checkDate(ngaythemnhankhau)) {
			Response.response(res, Response.ResponseCode.ERROR, "ngaythemnhankhau is invalid", req.query);
			return;
		}

		// add Nhankhau
		result = await Nhankhau.insert(nhankhau);

		if (result == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Thêm nhân khẩu thất bại");
			return;
		}

		nhankhau.id = result.insertId;
		if (sohokhau != null) {
			let time = Utils.getStringFromUTCDate(new Date());
			await Lichsu.addNhankhauToHokhau(sohokhau, nhankhau.id, time);
		}
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
	async updateNhankhau(req, res) {
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params
		let {
			token, idnhankhau, hoten, ngaysinh, gioitinh, quequan, dantoc, tongiao,
			sohokhau, quanhevoichuho, cccd, ngaycap, noicap, nghenghiep,
			ngaydangkythuongtru, ngaythemnhankhau, ghichu
		} = req.query;

		if (idnhankhau == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of idnhankhau", req.query, "Thiếu id Nhân khẩu");
			return;
		}

		var nhankhau = new Nhankhau({
			id: idnhankhau, hoten: hoten, ngaysinh: ngaysinh, gioitinh: gioitinh, quequan: quequan, dantoc: dantoc,
			tongiao: tongiao, sohokhau: sohokhau, quanhevoichuho: quanhevoichuho,
			cccd: cccd, capngay: ngaycap, noicap: noicap, nghenghiep: nghenghiep,
			ngaydangkythuongtru: ngaydangkythuongtru, ngaythemnhankhau: ngaythemnhankhau,
			ghichu: ghichu
		});

		// check nhankhau is existed:
		var old_nhankhau = await Nhankhau.getById(idnhankhau);
		if (old_nhankhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "nhankhau is not existed", req.query, "Không tồn tại nhân khẩu");
			return;
		}

		// check cccd is existed:
		if (cccd != null) {
			let nhankhau2 = (await Nhankhau.select({ cccd: cccd }))[0];
			if (nhankhau2 != null && nhankhau2.length > 0 && String(nhankhau2.id) != String(idnhankhau)) {
				Response.response(res, Response.ResponseCode.ERROR, "cccd is existed", req.query);
				return;
			}
		}

		// check sohokhau is existed:
		if (sohokhau != null) {
			let hokhau = await HoKhau.getHokhauBySoHokhau(sohokhau);
			if (hokhau == null) {
				return Response.response(res, Response.ResponseCode.ERROR, "hokhau is not existed", req.query);
			}
		}

		// check fields:
		if (hoten != null && hoten.length <= 0) {
			Response.response(res, Response.ResponseCode.ERROR, "hoten is invalid", req.query);
			return;
		}
		if (ngaysinh != null && !Utils.checkDate(ngaysinh)) {
			Response.response(res, Response.ResponseCode.ERROR, "ngaysinh is invalid", req.query);
			return;
		}
		if (gioitinh != undefined && (String(gioitinh) != "0") && (String(gioitinh) != "1")) {
			// console.log("giới tính: " + gioitinh);
			Response.response(res, Response.ResponseCode.ERROR, "gioitinh is invalid", req.query);
			return;
		}
		if (sohokhau != null && !Utils.checkNumber(sohokhau)) {
			Response.response(res, Response.ResponseCode.ERROR, "sohokhau is invalid", req.query);
			return;
		}
		if (cccd != null && !Utils.checkNumber(cccd)) {
			Response.response(res, Response.ResponseCode.ERROR, "cccd is invalid", req.query);
			return;
		}
		if (ngaycap != null && !Utils.checkDate(ngaycap)) {
			Response.response(res, Response.ResponseCode.ERROR, "ngaycap is invalid", req.query);
			return;
		}
		if (ngaydangkythuongtru != null && !Utils.checkDate(ngaydangkythuongtru)) {
			Response.response(res, Response.ResponseCode.ERROR, "ngaydangkythuongtru is invalid", req.query);
			return;
		}
		if (ngaythemnhankhau != null && !Utils.checkDate(ngaythemnhankhau)) {
			Response.response(res, Response.ResponseCode.ERROR, "ngaythemnhankhau is invalid", req.query);
			return;
		}

		let time = Utils.getStringFromUTCDate(new Date());
		if (old_nhankhau.sohokhau != sohokhau && sohokhau != null) {
			if (old_nhankhau.sohokhau != null) {
				// remove old hokhau
				let old_hokhau = await HoKhau.getHokhauBySoHokhau(old_nhankhau.sohokhau);
				if (old_hokhau.idchuho == idnhankhau) {
					return Response.response(res, Response.ResponseCode.ERROR, "nhankhau is chuho", req.query, "Nhân khẩu đang là chủ hộ của hộ khẩu cũ");
				}
				await Lichsu.deleteNhankhauFromHokhau(old_nhankhau.sohokhau, nhankhau.id, time);
			}
			// add to new sohokhau
			await Lichsu.addNhankhauToHokhau(sohokhau, nhankhau.id, time);
		}

		// add Nhankhau
		old_nhankhau.copy_from(nhankhau);
		result = await Nhankhau.update(old_nhankhau, { id: old_nhankhau.id });

		if (result == null) {
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
	async deleteNhankhau(req, res) {
		// check token
		let result = await LoginController.checkToken(req, res);
		if (!result) return;

		// check params
		let { token, idnhankhau } = req.query;
		if (idnhankhau == undefined) {
			Response.response(res, Response.ResponseCode.ERROR, "Lack of idnhankhau", req.query, "Thiếu id nhân khẩu");
			return;
		}

		// check nhankhau is existed:
		let nhankhau = await Nhankhau.getById(idnhankhau);
		if (nhankhau == null) {
			Response.response(res, Response.ResponseCode.ERROR, "nhankhau is not existed", req.query, "Nhân khẩu không tồn tại");
			return;
		}

		// Không thể xóa một nhân khẩu đang là chủ hộ khẩu
		if (nhankhau.sohokhau != null) {
			let hokhau = await HoKhau.getHokhauBySoHokhau(nhankhau.sohokhau);
			if (hokhau != null) {
				if (hokhau.idchuho == idnhankhau) {
					Response.response(res, Response.ResponseCode.ERROR, "cannot delete chuho", req.query, "Không xóa chủ hộ được");
					return;
				}
			}
		}

		// delete nhankhau
		let r1 = await Lichsu.delete({ idnhankhau: idnhankhau });
		let r2 = await Tamtrutamvang.deleteTamtrutamvangByIdnhankhau(idnhankhau);
		result = await Nhankhau.delete({ id: idnhankhau });
		if (result == null || r2 == null || r1 == null) {
			Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Xóa nhân khẩu thất bại");
			return;
		}

		Response.response(res, Response.ResponseCode.ERROR, "Success", req.query, "Đã xóa nhân khẩu");
	}

}

module.exports = { NhankhauController };
