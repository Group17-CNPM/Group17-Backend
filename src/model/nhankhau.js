
/*
- id
- hoten
- ngaysinh
- gioitinh
- quequan
- dantoc
- tongiao
- sohokhau
- quanhevoichuho
- cccd
- ngaycap
- noicap
- nghenghiep
- ngaydangkythuongtru
- ngaythemnhankhau
- ghichu
*/

class Nhankhau {
    // static properties
    static table = "nhankhau";
    static array_key = [
        "id", "hoten", "ngaysinh", "gioitinh", "quequan", "dantoc", "tongiao",
        "sohokhau", "quanhevoichuho",
        "cccd", "capngay", "noicap",
        "nghenghiep", "ngaydangkythuongtru", "ngaythemnhankhau", "ghichu"
    ];
    // non static methods => Object
    constructor(nhankhau) {
        for (let key of Nhankhau.keys()) {
            this[key] = nhankhau[key];
        }
    }
    copy_from(nhankhau) {
        if (nhankhau == null) return;
        for (let key of Nhankhau.keys()) {
            this[key] = nhankhau[key] ?? this[key];
        }
    }
    async save() {
        let nhankhau = await Nhankhau.getById(this.id);
        if (nhankhau == null) {
            // insert if not existed
            return await Nhankhau.insert(this);
        } else {
            // update if existed
            return await Nhankhau.update(this, { id: this.id });
        }
    }
    async delete() {
        return await Nhankhau.delete(this);
    }

    // static methods => Table
    static keys() { return Nhankhau.array_key; }
    static from_json(json) {
        if (json == null) return null;
        return new Nhankhau(json);
    }
    static getSQLValue(value) {
        if (value == null) return "null";
        return `'${value}'`;
    }
    static getSelectString(key, value) {
        if (value == null) return "";
        return ` (${key} = '${value}') `;
    }
    static getSearchString(key, value, isString = true) {
        if (value == null) return "";
        if (isString) {
            return ` (INSTR(${key}, '${value}') > 0 OR INSTR('${value}', ${key}) > 0 OR ${key} = '${value}') `;
        }
        return ` (${key} = '${value}') `;
    }


    // CRUD:    
    // Create
    static async insert(nhankhau) {
        let connection = require('../index.js').connection;
        let params, result;
        params = Nhankhau.keys()
            .map(key => Nhankhau.getSQLValue(nhankhau[key]))
            .join(', ');

        let query = `INSERT INTO ${Nhankhau.table} VALUE (${params})`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
        }

        return result;
    }
    // Read
    static async select(nhankhau, keys = null) {
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(nhankhau)
            .map(key => Nhankhau.getSelectString(key, nhankhau[key]))
            .join(' AND ');

        let query = `SELECT ${selectFields} FROM ${Nhankhau.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""};`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        console.log(result);
        result.forEach(function (element) {
            list.push(Nhankhau.from_json(element));
        });

        return list;
    }
    static async getById(id, keys = null) {
        let connection = require('../index.js').connection;
        let result, selectFields = ``;
        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }
        let query = `SELECT ${selectFields} FROM ${Nhankhau.table} WHERE id = ${id}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return this.from_json(result[0]);
    }
    static async search(nhankhau, keys = null) {
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(nhankhau)
            .filter(key => nhankhau[key] != null)
            .map(key => Nhankhau.getSearchString(key, nhankhau[key]))
            .join(' AND ');

        let query = `SELECT ${selectFields} FROM ${Nhankhau.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""};`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        result.forEach(function (element) {
            list.push(Nhankhau.from_json(element));
        });

        return list;
    }
    // Update
    static async update(nhankhau, where) {
        if (nhankhau == null || where == null) {
            throw "Không đủ tham số cho hàm update";
        }
        let connection = require('../index.js').connection;
        let result;
        let setParams, whereParams;

        setParams = Object.keys(nhankhau)
            .map(key => `${key} = ${Nhankhau.getSQLValue(nhankhau[key])}`)
            .join(', ');

        whereParams = Object.keys(where).
            map(key => Nhankhau.getSelectString(key, where[key]))
            .join(', ');

        let query = `UPDATE ${Nhankhau.table} SET ${setParams} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
    // Delete
    static async delete(nhankhau) {
        let connection = require('../index.js').connection;
        let result;
        let whereParams = Object.keys(nhankhau)
            .map(key => Nhankhau.getSelectString(key, nhankhau[key]))
            .join(', ');

        let query = `DELETE FROM ${Nhankhau.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
}


module.exports = { Nhankhau };
