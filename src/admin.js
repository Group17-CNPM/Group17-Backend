
let HoKhau = require('./model/hokhau.js').HoKhau;
let Nhankhau = require('./model/nhankhau.js').Nhankhau;
let Response = require('./utils/response.js').Response;
let Thuphi = require('./model/thuphi.js').Thuphi;
let Lichsu = require('./model/lichsu.js').Lichsu;
let Khoanthu = require('./model/khoanthu.js').Khoanthu;
let Tamtrutamvang = require('./model/tamtrutamvang.js').Tamtrutamvang;
let Utils = require('./utils/utils.js').Utils;

class Admin{
	constructor(){}

	async execute(req, res){
		// await this.fix5(req, res);
		res.json("Hello");
	}

	async fix1(req, res){
		// fix chủ hộ khẩu không nằm trong hộ khẩu
		let listHokhau = await HoKhau.selectAll();
		if (listHokhau == null) {
			return Response.response(res, Response.ResponseCode.ERROR, "listHokhau is null");
		}
		for (let hokhau of listHokhau){
			let idchuho = hokhau.idchuho;
			let chuho = await Nhankhau.getById(idchuho);
			if (chuho == null){
				console.log("HoKhau " + idchuho + " co chuho null");
				continue;
			}
			chuho.sohokhau = hokhau.sohokhau;
			chuho.quanhevoichuho = "Là chủ hộ";
			await chuho.save();
		}

		return Response.response(res, Response.ResponseCode.OK, "Success");
	}

	async check_fix1(req, res){
		// fix chủ hộ khẩu không nằm trong hộ khẩu
		let listHokhau = await HoKhau.selectAll();
		if (listHokhau == null) {
			return Response.response(res, Response.ResponseCode.ERROR, "listHokhau is null");
		}
		for (let hokhau of listHokhau){
			let idchuho = hokhau.idchuho;
			let chuho = await Nhankhau.getById(idchuho);
			if (chuho == null){
				console.log("HoKhau " + idchuho + " co chuho null");
				continue;
			}
			if (chuho.sohokhau != hokhau.sohokhau){
				// await Lichsu.delete({sohokhau: hokhau.sohokhau});
				// await Thuphi.delete({sohokhau: hokhau.sohokhau});
				// await HoKhau.deleteHokhau(hokhau.sohokhau);
				console.log("HoKhau " + hokhau.sohokhau + " co chuho.sohokhau != hokhau.sohokhau");
				continue;
			}
		}

		return Response.response(res, Response.ResponseCode.OK, "Success");	
	}

	async fix2(req, res){
		// fix chủ hộ khẩu không có căn cước công dân
		let listHokhau = await HoKhau.selectAll();
		if (listHokhau == null) {
			return Response.response(res, Response.ResponseCode.ERROR, "listHokhau is null");
		}
		let listNhankhau = await Nhankhau.select({});
		if (listNhankhau == null) {
			return Response.response(res, Response.ResponseCode.ERROR, "listNhankhau is null");
		}
		let listCCCD = listNhankhau.map(nhankhau => nhankhau.cccd);
		listCCCD = listCCCD.filter(cccd => (cccd != null));

		for (let hokhau of listHokhau){
			let idchuho = hokhau.idchuho;
			let chuho = await Nhankhau.getById(idchuho);
			if (chuho == null){
				console.log("HoKhau " + idchuho + " co chuho null");
				continue;
			}
			if (chuho.cccd == null){
				console.log(chuho);
				let newCCCD = String(Utils.random(100000, 999999999));
				while (listCCCD.includes(newCCCD)){
					newCCCD = String(Utils.random(100000, 999999999));
				}
				chuho.cccd = newCCCD;
				chuho.save();
			}
		}

		return Response.response(res, Response.ResponseCode.OK, "Success");
	}

	async fix3(req, res){
		// thêm random nhân khẩu chưa có trong hộ khẩu nào vào hộ khẩu
		let listHokhau = await HoKhau.selectAll();
		if (listHokhau == null) {
			return Response.response(res, Response.ResponseCode.ERROR, "listHokhau is null");
		}
		let listNhankhau = await Nhankhau.select({});
		if (listNhankhau == null) {
			return Response.response(res, Response.ResponseCode.ERROR, "listNhankhau is null");
		}

		let listSohokhau = listHokhau.map(hokhau => hokhau.sohokhau);
		let listIdChuho = listHokhau.map(hokhau => hokhau.idchuho);
		let listRole = ["Là cha", "Là mẹ", "Là con", "Là vợ", "Là chồng", "Là cháu", "Là anh", "Là chị", "Là em", "Là ông", "Là bà"];
		let listSohokhauLength = listSohokhau.length;
		let listRoleLength = listRole.length;
		let startDate = new Date('1970-1-1').getTime();
		let endDate = new Date('2023-1-1').getTime();


		let result = {list: []};

		for (let nhankhau of listNhankhau){
			// if (nhankhau.sohokhau == null && nhankhau.quanhevoichuho != null){
			// 	nhankhau.sohokhau = null;
			// 	nhankhau.quanhevoichuho = null;
			// 	await nhankhau.save();
			// }

			if (nhankhau.sohokhau != null) continue;
			let random = Utils.random(0, 3);
			if (random == 0) continue;

			let quanhevoichuho = listRole[Utils.random(0, listRoleLength - 1)];
			let sohokhau = listSohokhau[Utils.random(0, listSohokhauLength - 1)];
			let time = Utils.getStringFromUTCDate(new Date(Utils.random(startDate, endDate)));

			nhankhau.sohokhau = sohokhau;
			nhankhau.quanhevoichuho = quanhevoichuho;
			await nhankhau.save();

			await Lichsu.addNhankhauToHokhau(sohokhau, nhankhau.id, time);
			result.list.push({sohokhau, idnhankhau: nhankhau.id, time});
		}
		return Response.response(res, Response.ResponseCode.OK, "Success", result);
	}


	async fix4(req, res){
		// check value is empty
		let listNhankhau = await Nhankhau.select({});
		if (listNhankhau == null) {
			return Response.response(res, Response.ResponseCode.ERROR, "listNhankhau is null");
		}

		for (let nhankhau of listNhankhau){
			for (let key of Nhankhau.keys()){
				if (String(nhankhau[key]) == ''){
					nhankhau[key] = null;
				}
			}
			nhankhau.save();
		}
		
		return Response.response(res, Response.ResponseCode.OK, "DONE");
	}


	async fix4(req, res){
		// check value is empty
		let listNhankhau = await Nhankhau.select({});
		if (listNhankhau == null) {
			return Response.response(res, Response.ResponseCode.ERROR, "listNhankhau is null");
		}

		for (let nhankhau of listNhankhau){
			for (let key of Nhankhau.keys()){
				if (String(nhankhau[key]) == ''){
					nhankhau[key] = null;
				}
			}
			nhankhau.save();
		}
		
		return Response.response(res, Response.ResponseCode.OK, "DONE");
	}

	async fix5(req, res){
		// delete khoản thu empty
		let listThuphi = await Thuphi.select({});
		let listNotEmptyIdkhoanthu = listThuphi.map(thuphi => thuphi.idkhoanthu);
		console.log("Test");
		console.log(listNotEmptyIdkhoanthu);

		let listKhoanthu = await Khoanthu.select({});
		for (let khoanthu of listKhoanthu){
			await khoanthu.save();
			if (listNotEmptyIdkhoanthu.includes(khoanthu.id)) continue;
			let random = Utils.random(0, 9);
			if (random == 0) continue;
			await Khoanthu.delete({id : khoanthu.id});
		}
	}
}

module.exports = { Admin };




