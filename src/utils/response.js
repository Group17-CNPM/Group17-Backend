

/* Định dạng response
{
	code: 200,
	message: "Success",
	data: [
		{
			id: 123,
			name: "Nguyễn Văn A"
		},
	],
	detail: "Thành công",
}
*/

class Response {

	static ResponseCode = {
		OK: 200,
		FILE_NOT_FOUND: 404,
		ERROR: 500
	}

	static response(res, code, message = null, data = null, detail = null){
		let responseData = {
			"code": code,
			"message": message
		};
		if (message != null) responseData.message = message;
		if (data != null) responseData.data = data;
		if (detail != null) responseData.detail = detail;
		res.setHeader('Access-Control-Allow-Origin', '*');
		res.json(responseData);
	}
}

module.exports = { Response };

