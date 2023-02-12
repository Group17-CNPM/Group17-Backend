

class Model{
	static const table = "table_name";
	static const array_key = ["id", "name", "age"];
	constructor(model){
		for (let key of Model.keys()){
			this[key] = model[key];
		}
	}
	copy_from(model){
		if (model == null) return;
		for (let key of Model.keys()){
			this[key] = model[key] ?? this[key];
		}
	}
	async save(){
		let model = await Model.getById(this.id);
        if (model == null){
            // insert if not existed
            return await Model.insert(this);
        } else {
            // update if existed
            return await Model.update(this);
        }
	}
	async delete(){
		return await Model.delete(this);
	}
	static keys() => Model.keys();
	static from_json(json){
		if (json == null) return null;
		return new Model(json);
	}
	

	// Create
	// insert object model to db
	static async insert(model){
		let connection = require('../index.js').connection;
		let params = ``, result;

		params = Model.keys()
		.map(key => Model.getSQLValue(model[key]))
		.join(', ');
		
		let query = `INSERT INTO ${Model.table} VALUE (${params})`;
		try{
			result = await connection.my_query(query);
		} catch (e){
			console.log(e);
		}

		return result;
	}
	// Read
	static async select(model, keys = null, pagination = null){
		let connection = require('../index.js').connection;
		let result, selectFields, whereParams;

		if (keys == null || keys.length <= 0) {
			selectFields = `*`
		} else {
			selectFields = keys.join(', ');
		}

		whereParams = new Object.keys(model)
		.map(key => Model.getSelectString(key, model[key]))
		.join(" AND ");

		let paginationString = "";
		if (pagination != null) paginationString = ` LIMIT ${pagination.length} OFFSET = ${pagination.start} `;

		let query = `SELECT ${selectFields} FROM ${Model.table} WHERE ${whereParams} ${paginationString};`;		
		try{ 
			result = await connection.my_query(query);
		} catch (e){
			console.log(e);
			return null;
		}

		let list = [];
		result.forEach(function(element){
			list.push(Model.from_json(element));
		});

		return list;
	}
	static async getById(id, keys = null){
		let connection = require('../index.js').connection;
		let result, selectFields = ``;
		if (keys == null || keys.length <= 0) {
			selectFields = `*`
		} else {
			selectFields = keys.join(', ');
		}
		let query = `SELECT ${selectFields} FROM ${Model.table} WHERE id = ${id}`;
		try{
			result = await connection.my_query(query);
		} catch (e){
			console.log(e);
			return null;
		}

		return result[0];
	}
	// Update
	static async update(model, where){
		let connection = require('../index.js').connection;
		let result;
		let setParams = ``, whereParams = ``;

		setParams = new Object.keys(model)
		.map(key => `${key} = ${Model.getSQLValue(model[key])}`)
		.join(', ');

		whereParams = Model.keys().
		map(key => Model.getSelectString(key, where[key]))
		.join(', ');

		let query = `UPDATE ${Model.table} SET ${setParams} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
		try{
			result = await connection.my_query(query);
		} catch (e){
			console.log(e);
			return null;
		}

		return result;
	}
	// Delete
	static async delete(model){
		let connection = require('../index.js').connection;
		let result;
		let whereParams = new Object.keys(model)
		.map(key => Model.getSelectString(key, model[key]))
		.join(', ');
		
		let query = `DELETE FROM ${Model.table} WHERE TRUE ${whereParams != "" ? " AND " + whereParams : ""}`;
		try{
			result = await connection.my_query(query);
		} catch (e){
			console.log(e);
			return null;
		}

		return result;
	}
}

