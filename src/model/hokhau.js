
/*
sohokhau
idchuho
sonha
duong
phuong
quan
ngaylamhokhau
*/
var Utils = require('../utils/utils.js').Utils;
const { Nhankhau } = require("./nhankhau.js");

class HoKhau {
    static keys = ["sohokhau", "idchuho", "sonha", "duong", "phuong", "quan", "ngaylamhokhau"];
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
        // console.log(json);
        if (json == null) return;
        var hokhau = new HoKhau();
        hokhau.sohokhau = json.sohokhau;
        hokhau.idchuho = json.idchuho;
        hokhau.sonha = json.sonha;
        hokhau.duong = json.duong;
        hokhau.phuong = json.phuong;
        hokhau.quan = json.quan;
        hokhau.ngaylamhokhau = this.getDateString(json.ngaylamhokhau);
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
        return `${d.getUTCFullYear()}-${d.getUTCMonth() + 1}-${d.getUTCDate()} ${d.getUTCHours()}:${d.getUTCMinutes()}:${d.getUTCSeconds()}`;
    }

    static async selectAll(pagination = null) {
        var connection = require("../index.js").connection;
        var result;

        let paginationString = "";
        if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET ${pagination.start} `;

        try {
            let query = `SELECT * FROM hokhau ${paginationString}`;
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

    static async getHokhauBySoHokhau(sohokhau) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `SELECT * FROM hokhau WHERE sohokhau = '${sohokhau}'`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        if (result == null) return null;

        return HoKhau.fromjson(result[0]);
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

    static async deleteHokhau(sohokhau) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `DELETE FROM hokhau WHERE sohokhau = ${sohokhau}`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        return result;
    }

    static async search(hokhau, keys = null, pagination = null) {
        // console.log(hokhau);
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(hokhau)
            .filter(key => hokhau[key])
            .map(key => Utils.getSearchEquation(key, hokhau[key], false))
            .join(' AND ');

        let paginationString = "";
        if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET ${pagination.start} `;

        let query = `SELECT ${selectFields} FROM hokhau WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""} ${paginationString};`;
        // console.log(query)
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        result.forEach(function (element) {
            list.push(HoKhau.fromjson(element));
        });

        return list;
    }

}

module.exports = { HoKhau }