
let LoginController = require('../controller/login_controller.js').LoginController;
let Response = require('../utils/response.js').Response;
let Utils = require('../utils/utils.js').Utils;
let Khoanthu = require('../model/khoanthu.js').Khoanthu;
let Thuphi = require('../model/thuphi.js').Thuphi;
let HoKhau = require('../model/hokhau.js').HoKhau;

class ThuphiController{
	constructor(){}
	
	/*
	route: GET [domain]/getKhoanthu
	query: {
		token: "xxx",
		idkhoanthu: "xxx"
	}
	*/
	async getKhoanthu(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params
		let {idkhoanthu} = req.query;
		if (idkhoanthu == undefined)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu id khoản thu");

		let khoanthu = await Khoanthu.getById(idkhoanthu);

		if (khoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Not exist khoanthu", req.query, "Không tồn tại khoanthu");

		return Response.response(res, Response.ResponseCode.OK, "Success", khoanthu);
	}

	/*
	route: GET [domain]/getDetailKhoanthu
	query: {
		token: "xxx",
		idkhoanthu: "xxx"
	}
	*/
	async getDetailKhoanthu(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params
		let {idkhoanthu} = req.query;
		if (idkhoanthu == undefined)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu id khoản thu");

		let [khoanthu, listThuphi] = await Promise.all([
			await Khoanthu.getById(idkhoanthu),
			await Thuphi.select({idkhoanthu : idkhoanthu})
		]);

		if (khoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Not exist khoanthu", req.query, "Không tồn tại khoanthu");

		let sum_money = 0;
		for (let thuphi of listThuphi){
			sum_money = sum_money + Number(thuphi.sotien);
		}

		khoanthu.listThuphi = listThuphi;
		khoanthu["sum_money"] = sum_money;
		return Response.response(res, Response.ResponseCode.OK, "Success", khoanthu);
	}

	/*
	route: GET [domain]/getListKhoanthu
	query: {
		token: "xxx",
		start: "xxx",
		length: "xxx"
	}
	*/
	async getListKhoanthu(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		let {start, length} = req.query;
		if (start != null && !Utils.checkNumber(start)) 
            return Response.response(res, Response.ResponseCode.ERROR, "start is invalid", req.query);
        if (length != null && !Utils.checkNumber(length)) 
            return Response.response(res, Response.ResponseCode.ERROR, "length is invalid", req.query);
        let pagination = null;
        if (start != null && length != null){
        	pagination = {
        		start: start,
        		length: length
        	}
        }

		let listKhoanthu = await Khoanthu.select({}, null, pagination);
		if (listKhoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);

		for (let khoanthu of listKhoanthu){
			let listThuphi = await Thuphi.select({idkhoanthu: khoanthu.id});
			if (listThuphi == null) listThuphi = [];
			let sum_money = 0;
			for (let thuphi of listThuphi){
				sum_money = sum_money + Number(thuphi.sotien);
			}
			khoanthu["sum_money"] = sum_money;
			khoanthu["count"] = listThuphi.length;
		}

		return Response.response(res, Response.ResponseCode.OK, "Success", listKhoanthu);
	}

	/*
	route: GET [domain]/searchKhoanthu
	query: {
		token: "xxx",
		idkhoanthu : "xxx"
		ngaytao : "xxx"
		thoihan : "xxx"
		tenkhoanthu : "xxx"
		batbuoc : "xxx"
		ghichu : "xxx"
		start: 12
		length: 12
	options params: all except token
	}
	*/
	async searchKhoanthu(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params:
		let {idkhoanthu, ngaytao, thoihan, tenkhoanthu, batbuoc, ghichu} = req.query;
		if (batbuoc != null) batbuoc = String(batbuoc);

		if (ngaytao != null && !Utils.checkDate(ngaytao))
			return Response.response(res, Response.ResponseCode.ERROR, "ngaytao is invalid", req.query);
		if (thoihan != null && !Utils.checkDate(thoihan))
			return Response.response(res, Response.ResponseCode.ERROR, "thoihan is invalid", req.query);
		if (batbuoc != null && batbuoc != "0" && batbuoc != "1")
			return Response.response(res, Response.ResponseCode.ERROR, "batbuoc is invalid", req.query);

		let {start, length} = req.query;
		if (start != null && !Utils.checkNumber(start)) 
            return Response.response(res, Response.ResponseCode.ERROR, "start is invalid", req.query);
        if (length != null && !Utils.checkNumber(length)) 
            return Response.response(res, Response.ResponseCode.ERROR, "length is invalid", req.query);
        let pagination = null;
        if (start != null && length != null){
        	pagination = {
        		start: start,
        		length: length
        	}
        }

		let khoanthu = new Khoanthu({
			id: idkhoanthu,
			ngaytao: ngaytao,
			thoihan: thoihan,
			tenkhoanthu: tenkhoanthu,
			batbuoc: batbuoc,
			ghichu: ghichu	
		});

		let listKhoanthu = await Khoanthu.search(khoanthu, null, pagination);
		if (listKhoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		return Response.response(res, Response.ResponseCode.OK, "Successes", listKhoanthu);
	}

	/*
	route: GET [domain]/addKhoanthu
	query: {
		token: "xxx",
		tenkhoanthu : "xxx"
		thoihan : "xxx"
		batbuoc : "xxx"
		ghichu : "xxx"
	options params: ghichu
	}
	*/
	async addKhoanthu(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params:
		let { thoihan, tenkhoanthu, batbuoc, ghichu } = req.query;
		if (tenkhoanthu == null || thoihan == null || batbuoc == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query);
		batbuoc = String(batbuoc);

		if (tenkhoanthu == "")
			return Response.response(res, Response.ResponseCode.ERROR, "tenkhoanthu is invalid", req.query);
		let ngaytao = Utils.getStringFromUTCDate(new Date());
		if (!Utils.checkDate(thoihan))
			return Response.response(res, Response.ResponseCode.ERROR, "thoihan is invalid", req.query);
		let thoihanDate = Utils.getUTCDateFromString(thoihan);
		if (thoihanDate.getTime() < Date.now())
			return Response.response(res, Response.ResponseCode.ERROR, "thoihan is invalid", req.query);
		if (batbuoc != "0" && batbuoc != "1")
			return Response.response(res, Response.ResponseCode.ERROR, "batbuoc is invalid", req.query);

		// create object
		let khoanthu = new Khoanthu({
			id: null,
			ngaytao: ngaytao,
			thoihan: thoihan,
			tenkhoanthu: tenkhoanthu,
			batbuoc: batbuoc,
			ghichu: ghichu	
		});
		let result = await Khoanthu.insert(khoanthu);

		if (result == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		khoanthu.id = result.insertId;
		return Response.response(res, Response.ResponseCode.OK, "Success", khoanthu);
	}	
	
	/*
	route: GET [domain]/updateKhoanthu
	query: {
		token: "xxx",
		idkhoanthu : "xxx"
		ngaytao : "xxx"
		thoihan : "xxx"
		tenkhoanthu : "xxx"
		batbuoc : "xxx"
		ghichu : "xxx"
	options params: all except token, idkhoanthu
	}
	*/
	async updateKhoanthu(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params:
		let {idkhoanthu, ngaytao, thoihan, tenkhoanthu, batbuoc, ghichu} = req.query;
		if (idkhoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of idkhoanthu", req.query);
		if (batbuoc != null) batbuoc = String(batbuoc);

		if (ngaytao != null && !Utils.checkDate(ngaytao))
			return Response.response(res, Response.ResponseCode.ERROR, "ngaytao is invalid", req.query);
		if (thoihan != null && !Utils.checkDate(thoihan))
			return Response.response(res, Response.ResponseCode.ERROR, "thoihan is invalid", req.query);
		if (batbuoc != null && batbuoc != "0" && batbuoc != "1")
			return Response.response(res, Response.ResponseCode.ERROR, "batbuoc is invalid", req.query);

		// check khoan thu is existed
		let oldKhoanthu = await Khoanthu.getById(idkhoanthu);
		if (oldKhoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "khoanthu is not existed", req.query);

		// update
		let khoanthu = new Khoanthu({
			id: idkhoanthu,
			ngaytao: ngaytao,
			thoihan: thoihan,
			tenkhoanthu: tenkhoanthu,
			batbuoc: batbuoc,
			ghichu: ghichu
		});
		oldKhoanthu.copy_from(khoanthu);

		let result = await Khoanthu.update(oldKhoanthu, {id: idkhoanthu});
		if (result == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		return Response.response(res, Response.ResponseCode.OK, "Success", oldKhoanthu);
	}

	/*
	route: GET [domain]/deleteKhoanthu
	query: {
		token: "xxx",
		idkhoanthu : "xxx"
	}
	*/
	async deleteKhoanthu(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params:
		let {idkhoanthu} = req.query;
		if (idkhoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of idkhoanthu", req.query);

		// check khoan thu is existed
		let khoanthu = await Khoanthu.getById(idkhoanthu);
		if (khoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "khoanthu is not existed", req.query);

		// delete
		let result = await Khoanthu.delete({id: idkhoanthu});
		if (result == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		await Thuphi.delete({idkhoanthu: idkhoanthu});
		return Response.response(res, Response.ResponseCode.OK, "Success", khoanthu);
	}

	/*
	route: GET [domain]/addThuphi
	query: {
		token: "xxx",
		idkhoanthu: "xxx"
		sohokhau: "xxx"
		sotien: "xxx"
		nguoinop: "xxx"
		ghichu: "xxx"
	options params: ghichu
	}
	*/
	async addThuphi(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params:
		let { idkhoanthu, sohokhau, sotien, nguoinop, ghichu } = req.query;
		if (idkhoanthu == null || sohokhau == null || sotien == null || nguoinop == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query);

		let ngaynop = Utils.getStringFromUTCDate(new Date());
		if (!Utils.checkNumber(sohokhau))
			return Response.response(res, Response.ResponseCode.ERROR, "sohokhau is invalid", req.query);
		if (!Utils.checkNumber(sotien))
			return Response.response(res, Response.ResponseCode.ERROR, "sotien is invalid", req.query);

		// check if khoanthu and sohokhau is existed
		let [khoanthu, hokhau] = await Promise.all([
			await Khoanthu.getById(idkhoanthu),
			await HoKhau.getHokhauBySoHokhau(sohokhau)
		]);
		if (khoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "khoanthu is not existed", req.query);
		if (hokhau == null) 
			return Response.response(res, Response.ResponseCode.ERROR, "hokhau is not existed", req.query);

		// create object
		let thuphi = new Thuphi({
			id: null,
			idkhoanthu: idkhoanthu,
			sohokhau: sohokhau,
			sotien: sotien,
			nguoinop: nguoinop,
			ngaynop: ngaynop,
			ghichu: ghichu
		});
		let result = await Thuphi.insert(thuphi);

		if (result == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		thuphi.id = result.insertId;
		return Response.response(res, Response.ResponseCode.OK, "Success", thuphi);
	}

	/*
	route: GET [domain]/updateThuphi
	query: {
		token: "xxx",
		idthuphi: "xxx"
		idkhoanthu: "xxx"
		sohokhau: "xxx"
		sotien: "xxx"
		nguoinop: "xxx"
		ngaynop: "xxx"
		ghichu: "xxx"
	option params: all except token and idthuphi
	}
	*/
	async updateThuphi(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params:
		let { idthuphi, idkhoanthu, sohokhau, sotien, nguoinop, ngaynop, ghichu } = req.query;
		if (idkhoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of idkhoanthu", req.query);

		if (idkhoanthu != null){
			let khoanthu = await Khoanthu.getById(idkhoanthu);
			if (khoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "khoanthu is not existed", req.query);
		}
		if (sohokhau != null){
			if (!Utils.checkNumber(sohokhau))
				return Response.response(res, Response.ResponseCode.ERROR, "sohokhau is invalid", req.query);
			let hokhau = await HoKhau.getHokhauBySoHokhau(sohokhau);			
			if (hokhau == null) 
				return Response.response(res, Response.ResponseCode.ERROR, "hokhau is not existed", req.query);
		}
		if (sotien != null && !Utils.checkNumber(sotien))
			return Response.response(res, Response.ResponseCode.ERROR, "sotien is invalid", req.query);
		if (ngaynop != null && !Utils.checkDate(ngaynop))
			return Response.response(res, Response.ResponseCode.ERROR, "ngaynop is invalid", req.query);

		// check if thuphi is existed
		let old_thuphi = await Thuphi.getById(idthuphi);
		if (old_thuphi == null)
			return Response.response(res, Response.ResponseCode.ERROR, "thuphi is not existed", req.query);

		// create object
		let thuphi = new Thuphi({
			id: idthuphi,
			idkhoanthu: idkhoanthu,
			sohokhau: sohokhau,
			sotien: sotien,
			nguoinop: nguoinop,
			ngaynop: ngaynop,
			ghichu: ghichu
		});
		old_thuphi.copy_from(thuphi);
		let result = await Thuphi.update(old_thuphi, {id: idthuphi});

		if (result == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		return Response.response(res, Response.ResponseCode.OK, "Success", thuphi);
	}

	/*
	route: GET [domain]/deleteThuphi
	query: {
		token: "xxx",
		idthuphi: "xxx"
	}
	*/
	async deleteThuphi(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params:
		let { idthuphi } = req.query;
		if (idthuphi == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of idthuphi", req.query);

		// check if thuphi is existed
		let thuphi = await Thuphi.getById(idthuphi);
		if (thuphi == null)
			return Response.response(res, Response.ResponseCode.ERROR, "thuphi is not existed", req.query);

		let result = await Thuphi.delete({id: idthuphi});

		if (result == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		return Response.response(res, Response.ResponseCode.OK, "Success", thuphi);
	}

	/*
	route: GET [domain]/getThuphi
	query: {
		token: "xxx",
		idthuphi: "xxx"
	}
	*/
	async getThuphi(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params
		let {idthuphi} = req.query;
		if (idthuphi == undefined)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu id thu phí");

		let thuphi = await Thuphi.getById(idthuphi);
		if (thuphi == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Not exist thuphi", req.query, "Không tồn tại thuphi");
		return Response.response(res, Response.ResponseCode.OK, "Success", thuphi);
	}


		/*
	route: GET [domain]/getListThuphi
	query: {
		token: "xxx"
		idkhoanthu: "xxx"
		start: 1
		lenth: 2
	}
	*/
	async getListThuphi(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		// check params:
		let {idkhoanthu} = req.query;
		if (idkhoanthu == undefined)
			return Response.response(res, Response.ResponseCode.ERROR, "Lack of idkhoanthu", req.query);

		let {start, length} = req.query;
		if (start != null && !Utils.checkNumber(start)) 
            return Response.response(res, Response.ResponseCode.ERROR, "start is invalid", req.query);
        if (length != null && !Utils.checkNumber(length)) 
            return Response.response(res, Response.ResponseCode.ERROR, "length is invalid", req.query);
        let pagination = null;
        if (start != null && length != null){
        	pagination = {
        		start: start,
        		length: length
        	}
        }

		// check if khoan thu is existed
		let khoanthu = await Khoanthu.getById(idkhoanthu);
		if (khoanthu == null)
			return Response.response(res, Response.ResponseCode.ERROR, "khoanthu is not existed", req.query);

		let listThuphi = await Thuphi.select({idkhoanthu : idkhoanthu}, null, pagination);
		if (listThuphi == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		return Response.response(res, Response.ResponseCode.OK, "Success", listThuphi);
	}

	/*
	route: GET [domain]/searchThuphi
	query: {
		token: "xxx",
		idthuphi: "xxx"
		idkhoanthu: "xxx"
		sohokhau: "xxx"
		sotien: "xxx"
		nguoinop: "xxx"
		ngaynop: "xxx"
		ghichu: "xxx"
		start: 12
		length: 12
	options params: all except token
	}
	*/
	async searchThuphi(req, res){
		// check token
		let okay = await LoginController.checkToken(req, res);
		if (!okay) return;

		let { idthuphi, idkhoanthu, sohokhau, sotien, nguoinop, ngaynop, ghichu } = req.query;

		let thuphi = new Thuphi({
			id: idthuphi,
			idkhoanthu: idkhoanthu,
			sohokhau: sohokhau,
			sotien: sotien,
			nguoinop: nguoinop,
			ngaynop: ngaynop,
			ghichu: ghichu
		});

		let {start, length} = req.query;
		if (start != null && !Utils.checkNumber(start)) 
            return Response.response(res, Response.ResponseCode.ERROR, "start is invalid", req.query);
        if (length != null && !Utils.checkNumber(length)) 
            return Response.response(res, Response.ResponseCode.ERROR, "length is invalid", req.query);
        let pagination = null;
        if (start != null && length != null){
        	pagination = {
        		start: start,
        		length: length
        	}
        }

		let listThuphi = await Thuphi.search(thuphi, null, pagination);
		if (listThuphi == null)
			return Response.response(res, Response.ResponseCode.ERROR, "Query failed", req.query);
		return Response.response(res, Response.ResponseCode.OK, "Success", listThuphi);
	}
}


module.exports = { ThuphiController }

