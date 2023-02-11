let Nhankhau = require("../model/nhankhau.js").Nhankhau;
/*
- id
- idnhankhau
- trangthai
- diachitamtrutamvang
- noidungdenghi
- thoigian
*/

class Tamtrutamvang {

    constructor(
        id = null,
        idnhankhau = null,
        trangthai = null,
        diachitamtrutamvang = null,
        noidungdenghi = null,
        thoigian = null
    ) {
        this.id = id;
        this.idnhankhau = idnhankhau;
        this.trangthai = trangthai;
        this.diachitamtrutamvang = diachitamtrutamvang;
        this.noidungdenghi = noidungdenghi;
        this.thoigian = thoigian
    }

    static fromJson(json) {
        if (json == null) return null;
        let tamtrutamvang = new Tamtrutamvang();
        tamtrutamvang.id = json.id;
        tamtrutamvang.idnhankhau = json.idnhankhau;
        tamtrutamvang.trangthai = json.trangthai;
        tamtrutamvang.diachitamtrutamvang = json.diachitamtrutamvang;
        tamtrutamvang.noidungdenghi = json.noidungdenghi;
        tamtrutamvang.thoigian = json.thoigian;
        return tamtrutamvang;
    }

    copy_from(tamtrutamvang) {
        if (tamtrutamvang == null) return;
        this.id = id ?? this.id;
        this.idnhankhau = idnhankhau ?? this.idnhankhau;
        this.trangthai = trangthai ?? this.trangthai;
        this.diachitamtrutamvang = diachitamtrutamvang ?? this.diachitamtrutamvang;
        this.noidungdenghi = noidungdenghi ?? this.noidungdenghi;
        this.thoigian = thoigian ?? this.thoigian;
    }

    static getSQLValue(field) {
        if (field == null) return field;
        return `'${field}'`;
    }

    static getSearchString(key, value) {
        return `(${Tamtrutamvang.getSQLValue(value)} IS NULL or INSTR(${key}, ${Tamtrutamvang.getSQLValue(value)}) > 0 or INSTR(${Tamtrutamvang.getSQLValue(value)}, ${key}) > 0)`;
    }

    static getDateString(d) {
        d = new Date(String(d));
        return `${d.getFullYear()}-${d.getMonth() + 1}-${d.getDate()} ${d.getHours()}:${d.getMinutes()}:${d.getSeconds()}`;
    }

    static async selectAll(pagination = null) {
        var connection = require("../index.js").connection;
        var result;

        let paginationString = "";
        if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET ${pagination.start} `;

        try {
            let query = `SELECT * FROM tamtrutamvang ${paginationString}`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        let listTamtrutamvang = [];
        result.forEach(function (element) {
            listTamtrutamvang.push(Tamtrutamvang.fromJson(element));
        });

        return listTamtrutamvang;
    }

    static async getTamtrutamvangById(id) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `SELECT * FROM tamtrutamvang WHERE id = '${id}'`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        if (result == null) return null;

        return Tamtrutamvang.fromJson(result[0]);
    }

    static async getTamtrutamvangByCccd(cccd) {
        var connection = require('../index.js').connection;
        var result;

        try {

            let nhankhau = await Nhankhau.select({ cccd: cccd });
            if (nhankhau == null || nhankhau.length <= 0) {
                return null;
            }

            let query = `SELECT * FROM tamtrutamvang WHERE idnhankhau = ${nhankhau[0].id}`;
            result = await connection.my_query(query);

            if (result == null) return null;

            return Tamtrutamvang.fromJson(result[0]);
        } catch (err) {
            console.log(err);
            return null;
        }
    }

    static async getTamtrutamvangByDiachiAndTrangthai(diachi = null, trangthai = null) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `SELECT * FROM tamtrutamvang WHERE `
                + this.getSearchString('diachitamtrutamvang', diachi) + ` AND `
                + this.getSearchString('trangthai', trangthai);
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        let listTamtrutamvang = [];
        result.forEach(function (element) {
            listTamtrutamvang.push(Tamtrutamvang.fromJson(element));
        });

        return listTamtrutamvang;
    }

    static async addTamtrutamvang(tamtrutamvang) {
        var connection = require('../index.js').connection;
        var result;

        let query = `INSERT INTO tamtrutamvang VALUE (null, '${tamtrutamvang.idnhankhau}', '${tamtrutamvang.trangthai}', ${this.getSQLValue(tamtrutamvang.diachitamtrutamvang)}, ${this.getSQLValue(tamtrutamvang.noidungdenghi)}, ${this.getSQLValue(tamtrutamvang.thoigian)})`;
        try {
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        return result;
    }

    static async updateTamtrutamvang(tamtrutamvang) {
        var connection = require('../index.js').connection;
        var result;
        let query = `UPDATE tamtrutamvang SET trangthai = ${tamtrutamvang.trangthai}, diachitamtrutamvang = ${this.getSQLValue(tamtrutamvang.diachitamtrutamvang)}, noidungdenghi = ${this.getSQLValue(tamtrutamvang.noidungdenghi)}, thoigian = ${this.getSQLValue(tamtrutamvang.thoigian)} WHERE id = ${tamtrutamvang.id}`;
        try {
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        return result;
    }

    static async deleteTamtrutamvang(tamtrutamvang) {
        var connection = require('../index.js').connection;
        var result;

        try {
            let query = `DELETE FROM tamtrutamvang WHERE id = ${tamtrutamvang.id}`;
            result = await connection.my_query(query);
        } catch (err) {
            console.log(err);
            return null;
        }

        return result;
    }

}

module.exports = { Tamtrutamvang }