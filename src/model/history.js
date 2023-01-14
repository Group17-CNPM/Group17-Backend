

class History{
	constructor(
		id = null,
		sohokhau = null,
		idnhankhau = null,
		loaithaydoi = null,
		thoigian = null
	) {
		this.id = id;
		this.sohokhau = sohokhau;
		this.idnhankhau = idnhankhau;
		this.loaithaydoi = loaithaydoi;
		this.thoigian = thoigian;
	}
	static fromJson(json){
		if (json == null) return null;
		let history = new History();
		history.id 			= json.id;
		history.sohokhau 	= json.sohokhau;
		history.idnhankhau 	= json.idnhankhau;
		history.loaithaydoi = json.trangthai;
		history.thoigian 	= json.thoigian;
		return history;
	}
	copy_from(history){
		if (history == null) return;
		this.id 			= history.id 			?? this.id;
		this.sohokhau 		= history.sohokhau 		?? this.sohokhau;
		this.idnhankhau 	= history.idnhankhau 	?? this.idnhankhau;
		this.loaithaydoi 	= history.loaithaydoi 	?? this.loaithaydoi;
		this.thoigian 		= history.thoigian 		?? this.thoigian;
	}

	static getDeleteString(key, value){
		if (value == null) return "";
		return ` AND (${key} = '${value}') `;
	}

	static async delete(history){
		var connection = require('../index.js').connection;
		let query1 = `DELETE FROM lichsu WHERE TRUE`;
		query1 = query1 + History.getDeleteString("id", history.id);
		query1 = query1 + History.getDeleteString("sohokhau", history.sohokhau);
		query1 = query1 + History.getDeleteString("idnhankhau", history.idnhankhau);
		query1 = query1 + History.getDeleteString("trangthai", history.loaithaydoi);
		query1 = query1 + History.getDeleteString("thoigian", history.thoigian);

		var result;

		try{
			result = await connection.my_query(query1);
		} catch (e){
			console.log(e);
			return null;
		}

		if (!result) return null;

		return result;
	}

	static async addNhankhauToHokhau(sohokhau, idnhankhau, thoigian){
		var connection = require('../index.js').connection;
		let query1 = `UPDATE nhankhau SET sohokhau = '${sohokhau}' WHERE idnhankhau = '${idnhankhau}'`;
		let query2 = `INSERT INTO lichsu VALUE(null, '${sohokhau}', '${idnhankhau}', '1', '${thoigian}')`;
		var result;

		try{
			result = await connection.my_query(query1);
			result = result && (await connection.my_query(query2));
		} catch (e){
			console.log(e);
			return null;
		}

		if (!result) return null;

		return result;
	}

	static async deleteNhankhauFromHokhau(sohokhau, idnhankhau, thoigian){
		var connection = require('../index.js').connection;
		let query1 = `UPDATE nhankhau SET sohokhau = null WHERE idnhankhau = '${idnhankhau}'`;
		let query2 = `INSERT INTO lichsu VALUE(null, '${sohokhau}', '${idnhankhau}', '2', '${thoigian}')`;
		var result;

		try{
			result = await connection.my_query(query1);
			result = result && (await connection.my_query(query2));
		} catch (e){
			console.log(e);
			return null;
		}

		if (!result) return null;

		return result;
	}

}


module.exports = { History };
