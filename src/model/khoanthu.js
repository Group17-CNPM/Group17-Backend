var Utils = require('../utils/utils.js').Utils;
/*
- id
- ngaytao
- thoihan
- tenkhoanthu
- batbuoc
- ghichu
*/

class Khoanthu {
    // static properties
    static table = "khoanthu";
    static array_key = [
        "id", "ngaytao", "thoihan", "tenkhoanthu", "money", "batbuoc", "ghichu"
    ];
    // non static methods => Object
    constructor(khoanthu) {
        this.copy_from(khoanthu);
    }
    copy_from(khoanthu) {
        if (khoanthu == null) return;
        for (let key of Khoanthu.keys()) {
            this[key] = khoanthu[key] ?? this[key];
        }
    }
    async save() {
        let khoanthu = await Khoanthu.getById(this.id);
        if (khoanthu == null) {
            // insert if not existed
            return await Khoanthu.insert(this);
        } else {
            // update if existed
            return await Khoanthu.update(this, { id: this.id });
        }
    }
    async delete() {
        return await Khoanthu.delete(this);
    }

    // static methods => Table
    static keys() { return Khoanthu.array_key; }
    static from_json(json) {
        if (json == null) return null;
        let khoanthu = new Khoanthu(json);
        return khoanthu;
    }


// CRUD:    
    // Create
    static async insert(khoanthu) {
        let connection = require('../index.js').connection;
        let params, result;
        params = Khoanthu.keys()
            .map(key => Utils.getSQLValue(khoanthu[key]))
            .join(', ');

        let query = `INSERT INTO ${Khoanthu.table} VALUE (${params})`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
    // Read
    static async select(khoanthu, keys = null, pagination = null) {
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(khoanthu)
            .map(key => Utils.getEquation(key, khoanthu[key]))
            .join(' AND ');

        let paginationString = "";
        if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET ${pagination.start} `;

        let query = `SELECT ${selectFields} FROM ${Khoanthu.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""} ORDER BY ngaytao ASC ${paginationString};`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        // console.log(result);
        result.forEach(function (element) {
            list.push(Khoanthu.from_json(element));
        });

        return list;
    }
    static async getById(id, keys = null, pagination = null) {
        let connection = require('../index.js').connection;
        let result, selectFields = ``;
        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }
        let query = `SELECT ${selectFields} FROM ${Khoanthu.table} WHERE id = ${id}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return Khoanthu.from_json(result[0]);
    }
    static async search(khoanthu, keys = null, pagination = null) {
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(khoanthu)
            .filter(key => khoanthu[key])
            .map(key => Utils.getSearchEquation(key, khoanthu[key], false))
            .join(' AND ');

        let paginationString = "";
        if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET ${pagination.start} `;

        let query = `SELECT ${selectFields} FROM ${Khoanthu.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""} ${paginationString};`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        result.forEach(function (element) {
            list.push(Khoanthu.from_json(element));
        });

        return list;
    }
    // Update
    static async update(khoanthu, where) {
        if (khoanthu == null || where == null) {
            throw "Không đủ tham số cho hàm update";
        }
        let connection = require('../index.js').connection;
        let result;
        let setParams, whereParams;

        setParams = Object.keys(khoanthu)
            .map(key => `${key} = ${Utils.getSQLValue(khoanthu[key])}`)
            .join(', ');

        whereParams = Object.keys(where).
            map(key => Utils.getEquation(key, where[key], true))
            .join(', ');

        let query = `UPDATE ${Khoanthu.table} SET ${setParams} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
    // Delete
    static async delete(khoanthu) {
        let connection = require('../index.js').connection;
        let result;
        let whereParams = Object.keys(khoanthu)
            .map(key => Utils.getEquation(key, khoanthu[key], true))
            .join(', ');

        let query = `DELETE FROM ${Khoanthu.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
}


module.exports = { Khoanthu };
