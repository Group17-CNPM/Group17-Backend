
/*
- id
- sohokhau
- idnhankhau
- loaithaydoi
- thoigian
*/

class Lichsu {
    // static properties
    static table = "lichsu";
    static array_key = [
        "id", "sohokhau", "idnhankhau", "loaithaydoi", "thoigian"
    ];
    // non static methods => Object
    constructor(lichsu) {
        for (let key of Lichsu.keys()) {
            this[key] = lichsu[key];
        }
    }
    copy_from(lichsu) {
        if (lichsu == null) return;
        for (let key of Lichsu.keys()) {
            this[key] = lichsu[key] ?? this[key];
        }
    }
    async save() {
        let lichsu = await Lichsu.getById(this.id);
        if (lichsu == null) {
            // insert if not existed
            return await Lichsu.insert(this);
        } else {
            // update if existed
            return await Lichsu.update(this, { id: this.id });
        }
    }
    async delete() {
        return await Lichsu.delete(this);
    }

    // static methods => Table
    static keys() { return this.array_key; }
    static from_json(json) {
        if (json == null) return null;
        let lichsu = new Lichsu(json);
        lichsu.thoigian = Lichsu.getDateString(lichsu.thoigian);
        return lichsu;
    }
    static getDateString(d){
        if (d == null) return "1970-1-1 0:0:0";
        d = new Date(String(d));
        return `${d.getUTCFullYear()}-${d.getUTCMonth() + 1}-${d.getUTCDate()} ${d.getUTCHours()}:${d.getUTCMinutes()}:${d.getUTCSeconds()}`;
    }
    static getSQLValue(value) {
        if (value == null) return "null";
        return `'${value}'`;
    }
    static getEquation(key, value, acceptNull = false){
        if (value == null) {
            if (acceptNull){
                return ` (${key} = null) `;
            } else {
                return "";
            }
        }
        return ` (${key} = '${value}') `;
    }
    static getSearchEquation(key, value, acceptNull = false) {
        // console.log(acceptNull);
        if (value == null) {
            if (acceptNull){
                return ` (${key} = null) `;
            } else {
                return "";
            }
        }
        return ` (INSTR(${key}, '${value}') > 0 OR INSTR('${value}', ${key}) > 0 OR ${key} = '${value}') `;
    }


// CRUD:    
    // Create
    static async insert(lichsu) {
        let connection = require('../index.js').connection;
        let params, result;
        params = Lichsu.keys()
            .map(key => Lichsu.getSQLValue(lichsu[key]))
            .join(', ');

        let query = `INSERT INTO ${Lichsu.table} VALUE (${params})`;
        console.log(query);
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
    // Read
    static async select(lichsu, keys = null) {
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(lichsu)
            .map(key => Lichsu.getEquation(key, lichsu[key]))
            .join(' AND ');

        let query = `SELECT ${selectFields} FROM ${Lichsu.table} 
        			WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}
        			ORDER BY thoigian ASC;`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        // console.log(result);
        result.forEach(function (element) {
            list.push(Lichsu.from_json(element));
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
        let query = `SELECT ${selectFields} FROM ${Lichsu.table} WHERE id = ${id}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return Lichsu.from_json(result[0]);
    }
    static async search(lichsu, keys = null) {
        let connection = require('../index.js').connection;
        let result, selectFields, whereParams;

        if (keys == null || keys.length <= 0) {
            selectFields = `*`
        } else {
            selectFields = keys.join(', ');
        }

        whereParams = Object.keys(lichsu)
            .filter(key => lichsu[key])
            .map(key => Lichsu.getSearchEquation(key, lichsu[key], false))
            .join(' AND ');

        // console.log(Object.keys(lichsu));

        let query = `SELECT ${selectFields} FROM ${Lichsu.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""};`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        let list = [];
        result.forEach(function (element) {
            list.push(Lichsu.from_json(element));
        });

        return list;
    }
    // Update
    static async update(lichsu, where) {
        if (lichsu == null || where == null) {
            console.log("update history lack of params");
            return null;
        }

        let connection = require('../index.js').connection;
        let result, setParams, whereParams;

        setParams = Object.keys(lichsu)
            .map(key => `${key} = ${Lichsu.getSQLValue(lichsu[key])}`)
            .join(', ');

        console.log(setParams);

        whereParams = Object.keys(where)
        	.map(key => Lichsu.getEquation(key, where[key], true))
            .join(', ');

        let query = `UPDATE ${Lichsu.table} SET ${setParams} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }
    // Delete
    static async delete(lichsu) {
        let connection = require('../index.js').connection;
        let result;
        let whereParams = Object.keys(lichsu)
            .map(key => Lichsu.getEquation(key, lichsu[key], true))
            .join(', ');

        let query = `DELETE FROM ${Lichsu.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
        try {
            result = await connection.my_query(query);
        } catch (e) {
            console.log(e);
            return null;
        }

        return result;
    }

// BUSINESS LOGIC:
	static async addNhankhauToHokhau(sohokhau, idnhankhau, thoigian){
		let Nhankhau = require('./nhankhau.js').Nhankhau, result;
		
		try{
			let [res1, res2] = await Promise.all([
				Nhankhau.update({sohokhau: sohokhau}, {id: idnhankhau}),
				Lichsu.insert({
					id: null, 
					sohokhau: sohokhau, 
					idnhankhau: idnhankhau, 
					loaithaydoi: '1', 
					thoigian: thoigian
				})
			]);
			result = res1 && res2;
		} catch (err){
			console.log(err);
			return null;
		}
		
		return result;
	}

	static async deleteNhankhauFromHokhau(sohokhau, idnhankhau, thoigian){
		let Nhankhau = require('./nhankhau.js').Nhankhau, result;
		
		try{
			let [res1, res2] = await Promise.all([
				Nhankhau.update({sohokhau: null}, {id: idnhankhau}),
				Lichsu.insert({
					id: null, 
					sohokhau: sohokhau, 
					idnhankhau: idnhankhau, 
					loaithaydoi: '2', 
					thoigian: thoigian
				})
			]);
			result = res1 && res2;
		} catch (err){
			console.log(err);
			return null;
		}
		
		return result;
	}
}


module.exports = { Lichsu };
