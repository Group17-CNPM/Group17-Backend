
class Nhankhau {
    constructor(
    	cccd = null, 	
    	sohokhau = null, 
    	quanhevoichuho = null, 
    	role = null,
    	ngaycap = null,
    	noicap = null,
    	hoten = null,
    	ngaysinh = null, 
    	gioitinh = null,
    	quequan = null,
    	dantoc = null,
    	tongiao = null,
    	nghenghiep = null,
    	ngaydangkythuongtru = null,
    	ngaythemnhankhau = null,
    	ghichu = null
	) { 
		this.cccd 					= cccd;
		this.sohokhau 				= sohokhau;
		this.quanhevoichuho 		= quanhevoichuho;
		this.role 					= role;
		this.ngaycap 				= ngaycap;
		this.noicap 				= noicap;
		this.hoten 					= hoten;
		this.ngaysinh 				= ngaysinh;
		this.gioitinh 				= gioitinh;
		this.quequan 				= quequan;
		this.dantoc 				= dantoc;
		this.tongiao 				= tongiao;
		this.nghenghiep 			= nghenghiep;
		this.ngaydangkythuongtru 	= ngaydangkythuongtru;
		this.ngaythemnhankhau 		= ngaythemnhankhau;
		this.ghichu 				= ghichu;
    }
    copy_from(user){
        if (user == null) return;
		this.cccd 					= user.cccd;
		this.sohokhau 				= user.sohokhau;
		this.quanhevoichuho 		= user.quanhevoichuho;
		this.role 					= user.role;
		this.ngaycap 				= user.ngaycap;
		this.noicap 				= user.noicap;
		this.hoten 					= user.hoten;
		this.ngaysinh 				= user.ngaysinh;
		this.gioitinh 				= user.gioitinh;
		this.quequan 				= user.quequan;
		this.dantoc 				= user.dantoc;
		this.tongiao 				= user.tongiao;
		this.nghenghiep 			= user.nghenghiep;
		this.ngaydangkythuongtru 	= user.ngaydangkythuongtru;
		this.ngaythemnhankhau 		= user.ngaythemnhankhau;
		this.ghichu 				= user.ghichu;
    }
    static fromJson(json){
        if (json == null) return;
        var user = new Nhankhau();
		user.cccd 					= json.cccd;
		user.sohokhau 				= json.sohokhau;
		user.quanhevoichuho 		= json.quanhevoichuho;
		user.role 					= json.role;
		user.ngaycap 				= json.capngay;
		user.noicap 				= json.noicap;
		user.hoten 					= json.hoten;
		user.ngaysinh 				= json.ngaysinh;
		user.gioitinh 				= json.gioitinh;
		user.quequan 				= json.quequan;
		user.dantoc 				= json.dantoc;
		user.tongiao 				= json.tongiao;
		user.nghenghiep 			= json.nghenghiep;
		user.ngaydangkythuongtru 	= json.ngaydangkythuongtru;
		user.ngaythemnhankhau 		= json.ngaythemnhankhau;
		user.ghichu 				= json.ghichu;
        return user;
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
    
}


module.exports = { Nhankhau };
