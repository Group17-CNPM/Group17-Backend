
/*
sohokhau
idchuho
sonha
duong
phuong
quan
ngaylamhokhau
*/

const { Nhankhau } = require("./nhankhau.js");

class HoKhau {

    constructor(
        sohokhau = null,
        idchuho = null,
        sonha = null,
        duong = null,
        phuong = null,
        quan = null,
        ngaylamhokhau = null
    ) {
        this.sohokhau = sohokhau;
        this.idchuho = idchuho;
        this.sonha = sonha;
        this.duong = duong;
        this.phuong = phuong;
        this.quan = quan;
        this.ngaylamhokhau = ngaylamhokhau;
    }

    copyfrom(hokhau) {
        if (hokhau == null) return;
        this.sohokhau = hokhau.sohokhau ?? this.sohokhau;
        this.idchuho = hokhau.idchuho ?? this.idchuho;
        this.sonha = hokhau.sonha ?? this.sonha;
        this.duong = hokhau.duong ?? this.duong;
        this.phuong = hokhau.phuong ?? this.phuong;
        this.quan = hokhau.quan ?? this.quan;
        this.ngaylamhokhau = hokhau.ngaylamhokhau ?? this.ngaylamhokhau;
    }

    static fromjson(json) {
        if (json == null) return;
        var hokhau = new HoKhau();
        hokhau.sohokhau = json.sohokhau;
        hokhau.idchuho = json.idchuho;
        hokhau.sonha = json.sonha;
        hokhau.duong = json.duong;
        hokhau.phuong = json.phuong;
        hokhau.quan = json.quan;
        hokhau.ngaylamhokhau = json.ngaylamhokhau;
        return hokhau;
    }

    static getSQLValue(field) {
        if (field == null) return field;
        return `'${field}'`;
    }

    static getSearchString(key, value) {
        return `(${HoKhau.getSQLValue(value)} IS NULL or INSTR(${key}, ${HoKhau.getSQLValue(value)}) > 0 or INSTR(${HoKhau.getSQLValue(value)}, ${key}) > 0)`;
    }

    static getDateString(d) {
        d = new Date(String(d));
        return `${d.getFullYear()}-${d.getMonth() + 1}-${d.getDate()} ${d.getHours()}:${d.getMinutes()}:${d.getSeconds()}`;
    }

    static async selectAll() {
        var connection = require("../index.js").connection;
        var result;

        try {
            let query = `SELECT * FROM hokhau`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        let listHokhau = [];
        result.forEach(function (element) {
            listHokhau.push(HoKhau.fromjson(element));
        });

        return listHokhau;
    }

    static async getHokhauByIdChuHo(idchuho) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `SELECT * FROM hokhau WHERE idchuho = '${idchuho}'`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        let listHoKhau = [];
        result.forEach(function (element) {
            listHoKhau.push(HoKhau.fromjson(element));
        });

        return listHoKhau;
    }

    static async getHokhauByCccdChuho(nhankhau) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `SELECT * FROM hokhau WHERE idchuho = ${nhankhau.id}`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        if (result == null) return null;

        return HoKhau.fromjson(result[0]);
    }


    // địa chỉ có thể null bất kỳ giá trị nào {quan, phuong, duong, sonha}
    static async getHokhauByDiaChi(quan = null, phuong = null, duong = null, sonha = null) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `SELECT * FROM hokhau WHERE `
                + this.getSearchString('quan', quan) + ` AND `
                + this.getSearchString('phuong', phuong) + ` AND `
                + this.getSearchString('duong', duong) + ` AND `
                + this.getSearchString('sonha', sonha);
            // console.log(query);
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        let listHoKhau = [];
        result.forEach(function (element) {
            listHoKhau.push(HoKhau.fromjson(element));
        });

        return listHoKhau;
    }

    static async addHokhau(hokhau) {
        var connection = require('../index.js').connection;
        var result;

        let query = `INSERT INTO hokhau VALUE (null, ${hokhau.idchuho}, '${hokhau.sonha}', '${hokhau.duong}', '${hokhau.phuong}', '${hokhau.quan}', '${hokhau.ngaylamhokhau}')`;
        try {
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        return result;
    }

    static async updateHokhau(hokhau) {
        var connection = require('../index.js').connection;
        var result;
        let query = `UPDATE hokhau SET idchuho = '${hokhau.idchuho}', sonha = '${hokhau.sonha}', duong = '${hokhau.duong}', phuong = '${hokhau.phuong}', quan = '${hokhau.quan}', ngaylamhokhau = '${hokhau.ngaylamhokhau}' Where sohokhau = ${hokhau.sohokhau}`;
        try {
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        return result;
    }

    static async updateChuho(hokhau, idchuhoNew) {
        var connection = require('../index.js').connection;
        var result;
        let query = `UPDATE hokhau SET idchuho = '${idchuhoNew}', sonha = '${hokhau.sonha}', duong = '${hokhau.duong}', phuong = '${hokhau.phuong}', quan = '${hokhau.quan}', ngaylamhokhau = '${hokhau.ngaylamhokhau}' Where sohokhau = ${hokhau.sohokhau}`;
        try {
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        return result;
    }

    static async deleteHokhauByCccd(nhankhau) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `DELETE FROM hokhau WHERE idchuho = ${nhankhau.id}`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        return result;
    }
}

module.exports = { HoKhau }