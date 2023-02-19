var Utils = require('../utils/utils.js').Utils;
var Khoanthu = require('../model/khoanthu.js').Khoanthu;
/*
- id
- idkhoanthu
- sohokhau
- sotien
- nguoinop
- ngaynop
- ghichu
*/

class Thuphi {
    // static properties
    static table = "danhsachnopphi";
    static array_key = [
        "id", "idkhoanthu", "sohokhau", "sotien", "nguoinop", "ngaynop", "ghichu"
    ];
    // non static methods => Object
    constructor(thuphi) {
        this.copy_from(thuphi);
    }
    copy_from(thuphi) {
        if (thuphi == null) return;
        for (let key of Thuphi.keys()) {
            this[key] = thuphi[key] ?? this[key];
        }
    }
    async save() {
        let thuphi = await Thuphi.getById(this.id);
        if (thuphi == null) {
            // insert if not existed
            return await Thuphi.insert(this);
        } else {
            // update if existed
            return await Thuphi.update(this, { id: this.id });
        }
    }
    async delete() {
        return await Thuphi.delete(this);
    }

    // static methods => Table
    static keys() { return Thuphi.array_key; }
    static from_json(json) {
        if (json == null) return null;
        let thuphi = new Thuphi(json);
        return thuphi;
    }


// CRUD:    
    // Create
    static async insert(thuphi) {
        let connection = require('../index.js').connection;
        let params, result;
        params = Thuphi.keys()
            .map(key => Utils.getSQLValue(thuphi[key]))
            .join(', ');

        let query = `INSERT INTO ${Thuphi.table} VALUE (${params})`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
    // Read
    static async select(thuphi, keys = null, pagination = null) {
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(thuphi)
            .map(key => Utils.getEquation(key, thuphi[key]))
            .join(' AND ');

        let paginationString = "";
        if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET ${pagination.start} `;

        let query = `SELECT ${selectFields} FROM ${Thuphi.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""} ORDER BY ngaynop ASC ${paginationString};`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        // console.log(result);
        result.forEach(function (element) {
            list.push(Thuphi.from_json(element));
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
        let query = `SELECT ${selectFields} FROM ${Thuphi.table} WHERE id = ${id}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return Thuphi.from_json(result[0]);
    }
    static async search(thuphi, keys = null, pagination = null) {
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(thuphi)
            .filter(key => thuphi[key])
            .map(key => Utils.getSearchEquation(key, thuphi[key], false))
            .join(' AND ');

        let paginationString = "";
        if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET ${pagination.start} `;

        let query = `SELECT ${selectFields} FROM ${Thuphi.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""} ${paginationString};`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        result.forEach(function (element) {
            list.push(Thuphi.from_json(element));
        });

        return list;
    }
    // Update
    static async update(thuphi, where) {
        if (thuphi == null || where == null) {
            throw "Không đủ tham số cho hàm update";
        }
        let connection = require('../index.js').connection;
        let result;
        let setParams, whereParams;

        setParams = Object.keys(thuphi)
            .map(key => `${key} = ${Utils.getSQLValue(thuphi[key])}`)
            .join(', ');

        whereParams = Object.keys(where).
            map(key => Utils.getEquation(key, where[key], true))
            .join(', ');

        let query = `UPDATE ${Thuphi.table} SET ${setParams} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
    // Delete
    static async delete(thuphi) {
        let connection = require('../index.js').connection;
        let result;
        let whereParams = Object.keys(thuphi)
            .map(key => Utils.getEquation(key, thuphi[key], true))
            .join(', ');

        let query = `DELETE FROM ${Thuphi.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }

// business
    static async getListNotComplete(idkhoanthu, pagination = null){
        let paginationString = "", result;
        if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET ${pagination.start} `;
        let connection = require('../index.js').connection;

        let query = `SELECT ${Thuphi.table}.* FROM ${Thuphi.table}, ${Khoanthu.table} 
                        WHERE idkhoanthu = ${idkhoanthu} AND idkhoanthu = ${Khoanthu.table}.id
                        AND sotien < ${Khoanthu.table}.money
                        ${paginationString}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        result.forEach(function (element) {
            list.push(Thuphi.from_json(element));
        });

        return list;
    }
}


module.exports = { Thuphi };
