
/*
id
hoten
ngaysinh
gioitinh
quequan
dantoc
tongiao
sohokhau
quanhevoichuho
cccd
ngaycap
noicap
nghenghiep
ngaydangkythuongtru
ngaythemnhankhau
ghichu
*/

class Nhankhau {
    constructor(
    	id = null,
    	hoten = null,
    	ngaysinh = null, 
    	gioitinh = null,
    	quequan = null,
    	dantoc = null,
    	tongiao = null,
    	sohokhau = null, 
    	quanhevoichuho = null, 
    	cccd = null, 	
    	ngaycap = null,
    	noicap = null,
    	nghenghiep = null,
    	ngaydangkythuongtru = null,
    	ngaythemnhankhau = null,
    	ghichu = null
	) { 
		this.id 				 	= id;
		this.hoten 					= hoten;
		this.ngaysinh 				= ngaysinh;
		this.gioitinh 				= gioitinh;
		this.quequan 				= quequan;
		this.dantoc 				= dantoc;
		this.tongiao 				= tongiao;
		this.sohokhau 				= sohokhau;
		this.quanhevoichuho 		= quanhevoichuho;
		this.cccd 					= cccd;
		this.ngaycap 				= ngaycap;
		this.noicap 				= noicap;
		this.nghenghiep 			= nghenghiep;
		this.ngaydangkythuongtru 	= ngaydangkythuongtru;
		this.ngaythemnhankhau 		= ngaythemnhankhau;
		this.ghichu 				= ghichu;
    }
    copy_from(user){
        if (user == null) return;
        this.id 					= user.id 					?? this.id;
        this.hoten 					= user.hoten 				?? this.hoten;
		this.ngaysinh 				= user.ngaysinh 			?? this.ngaysinh;
		this.gioitinh 				= user.gioitinh 			?? this.gioitinh;
		this.quequan 				= user.quequan 				?? this.quequan;
		this.dantoc 				= user.dantoc 				?? this.dantoc;
		this.tongiao 				= user.tongiao 				?? this.tongiao;
		this.sohokhau 				= user.sohokhau 			?? this.sohokhau;
		this.quanhevoichuho 		= user.quanhevoichuho 		?? this.quanhevoichuho;
		this.cccd 					= user.cccd 				?? this.cccd;
		this.ngaycap 				= user.ngaycap 				?? this.ngaycap;
		this.noicap 				= user.noicap 				?? this.noicap;
		this.nghenghiep 			= user.nghenghiep 			?? this.nghenghiep;
		this.ngaydangkythuongtru 	= user.ngaydangkythuongtru 	?? this.ngaydangkythuongtru;
		this.ngaythemnhankhau 		= user.ngaythemnhankhau 	?? this.ngaythemnhankhau;
		this.ghichu 				= user.ghichu 				?? this.ghichu;
    }
    static fromJson(json){
        if (json == null) return;
        var user = new Nhankhau();
        user.id 					= json.id;
        user.hoten 					= json.hoten;
		user.ngaysinh 				= Nhankhau.getDateString(json.ngaysinh);
		user.gioitinh 				= json.gioitinh;
		user.quequan 				= json.quequan;
		user.dantoc 				= json.dantoc;
		user.tongiao 				= json.tongiao;
		user.sohokhau 				= json.sohokhau;
		user.quanhevoichuho 		= json.quanhevoichuho;
		user.cccd 					= json.cccd;
		user.role 					= json.role;
		user.ngaycap 				= Nhankhau.getDateString(json.capngay);
		user.noicap 				= json.noicap;
		user.nghenghiep 			= json.nghenghiep;
		user.ngaydangkythuongtru 	= Nhankhau.getDateString(json.ngaydangkythuongtru);
		user.ngaythemnhankhau 		= Nhankhau.getDateString(json.ngaythemnhankhau);
		user.ghichu 				= json.ghichu;
        return user;
    }
    static getSQLValue(field){
    	if (field == null) return "null";
    	return `'${field}'`;
    }
    static getDateString(d){
    	d = new Date(String(d));
    	return `${d.getFullYear()}-${d.getMonth() + 1}-${d.getDate()} ${d.getHours()}:${d.getMinutes()}:${d.getSeconds()}`;
    }

    static async selectAll() {
        var connection = require('../index.js').connection;
        var result;
        
        try {
        	let query = `SELECT * FROM nhankhau`;
        	result = await connection.my_query(query);
        } catch (err){
        	console.log(err);
        }

        let listNhankhau = [];
        result.forEach(function(element){
            listNhankhau.push(Nhankhau.fromJson(element));
        });
        
        return listNhankhau;
    }

    static async selectBySoHoKhau(sohokhau){
    	var connection = require('../index.js').connection;
        var result;
        
        try {
        	let query = `SELECT * FROM nhankhau WHERE sohokhau = '${sohokhau}'`;
        	result = await connection.my_query(query);
        } catch (err){
        	console.log(err);
        }

        let listNhankhau = [];
        result.forEach(function(element){
            listNhankhau.push(Nhankhau.fromJson(element));
        });
        
        return listNhankhau;
    }

    static async getNhankhauById(idnhankhau){
    	var connection = require('../index.js').connection;
        var result;
        
        try {
        	let query = `SELECT * FROM nhankhau WHERE id = '${idnhankhau}'`;
        	result = await connection.my_query(query);
        } catch (err){
        	console.log(err);
        }

        if (result.length <= 0) return null;
        
        return Nhankhau.fromJson(result[0]);
    }

    static async getNhankhauByCCCD(cccd){
    	var connection = require('../index.js').connection;
        var result;
        
        try {
        	let query = `SELECT * FROM nhankhau WHERE cccd = '${cccd}'`;
        	result = await connection.my_query(query);
        } catch (err){
        	console.log(err);
        }

        if (result.length <= 0) return null;
        
        return Nhankhau.fromJson(result[0]);    	
    }
    
    static async addNhankhau(nhankhau){
    	var connection = require('../index.js').connection;
        var result;
        let query = `INSERT INTO nhankhau VALUE (
        				null, 
        				${Nhankhau.getSQLValue(nhankhau.hoten)}, 	${Nhankhau.getSQLValue(nhankhau.ngaysinh)}, 
        				${Nhankhau.getSQLValue(nhankhau.gioitinh)}, ${Nhankhau.getSQLValue(nhankhau.quequan)}, 
        				${Nhankhau.getSQLValue(nhankhau.dantoc)}, 	${Nhankhau.getSQLValue(nhankhau.tongiao)}, 
        				${Nhankhau.getSQLValue(nhankhau.sohokhau)}, ${Nhankhau.getSQLValue(nhankhau.quanhevoichuho)}, 
        				${Nhankhau.getSQLValue(nhankhau.cccd)}, 	${Nhankhau.getSQLValue(nhankhau.ngaycap)}, 
        				${Nhankhau.getSQLValue(nhankhau.noicap)}, 	${Nhankhau.getSQLValue(nhankhau.nghenghiep)}, 
        				${Nhankhau.getSQLValue(nhankhau.ngaydangkythuongtru)}, ${Nhankhau.getSQLValue(nhankhau.ngaythemnhankhau)}, 
        				${Nhankhau.getSQLValue(nhankhau.ghichu)}
        			);`;
        try {	
        	result = await connection.my_query(query);
        } catch (err){
        	console.log(err);
        }

        return result;
    }

    static async updateNhankhau(nhankhau){
    	var connection = require('../index.js').connection;
        var result;
        let query = `UPDATE nhankhau SET
        				hoten 				= ${Nhankhau.getSQLValue(nhankhau.hoten)}, 	
        				ngaysinh 			= ${Nhankhau.getSQLValue(nhankhau.ngaysinh)}, 
        				gioitinh 			= ${Nhankhau.getSQLValue(nhankhau.gioitinh)}, 
        				quequan 			= ${Nhankhau.getSQLValue(nhankhau.quequan)}, 
        				dantoc 				= ${Nhankhau.getSQLValue(nhankhau.dantoc)}, 	
        				tongiao 			= ${Nhankhau.getSQLValue(nhankhau.tongiao)}, 
        				sohokhau 			= ${Nhankhau.getSQLValue(nhankhau.sohokhau)}, 
        				quanhevoichuho 		= ${Nhankhau.getSQLValue(nhankhau.quanhevoichuho)}, 
        				cccd 				= ${Nhankhau.getSQLValue(nhankhau.cccd)}, 	
        				capngay 			= ${Nhankhau.getSQLValue(nhankhau.ngaycap)}, 
        				noicap 				= ${Nhankhau.getSQLValue(nhankhau.noicap)}, 	
        				nghenghiep 			= ${Nhankhau.getSQLValue(nhankhau.nghenghiep)}, 
        				ngaydangkythuongtru = ${Nhankhau.getSQLValue(nhankhau.ngaydangkythuongtru)}, 
        				ngaythemnhankhau 	= ${Nhankhau.getSQLValue(nhankhau.ngaythemnhankhau)}, 
        				ghichu 				= ${Nhankhau.getSQLValue(nhankhau.ghichu)}
        			WHERE id = '${nhankhau.id}';`;
        
        try {	
        	result = await connection.my_query(query);
        } catch (err){
        	console.log(err);
        }

        return result;
    }


    static async deleteNhankhau(idnhankhau){
    	var connection = require('../index.js').connection;
        var result;
        let query = `DELETE FROM nhankhau WHERE id = '${idnhankhau}';`;
        
        try {	
        	result = await connection.my_query(query);
        } catch (err){
        	console.log(err);
        }

        return result;
    }

}


module.exports = { Nhankhau };
