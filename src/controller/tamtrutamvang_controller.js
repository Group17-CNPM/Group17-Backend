// const { Tamtrutamvang } = require("../model/tamtrutamvang.js");


let Nhankhau = require("../model/nhankhau.js").Nhankhau;
let Tamtrutamvang = require("../model/tamtrutamvang.js").Tamtrutamvang;
let Response = require('../utils/response.js').Response;
let LoginController = require('../controller/login_controller.js').LoginController;
let Utils = require('../utils/utils.js').Utils;


class TamtrutamvangController {
    constructor() { }
    checkDate(date) {
        if (date == null) return false;
        let dateRegex = /^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/;
        return dateRegex.test(date);
    }
    checkNumber(number) {
        if (number == null) return false;
        let numberRegex = /^[0-9]{1,}$/;
        return numberRegex.test(String(number));
    }

    /*
    route: GET [domain]/getListTamtrutamvang
    query: {
        token: "xxx"
        start: 12,
        end: 13
    }
    */
    async getListTamtrutamvang(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let { start, length } = req.query;
        if (start != null && !Utils.checkNumber(start))
            return Response.response(res, Response.ResponseCode.ERROR, "start is invalid", req.query);
        if (length != null && !Utils.checkNumber(length))
            return Response.response(res, Response.ResponseCode.ERROR, "length is invalid", req.query);
        let pagination = null;
        if (start != null && length != null) {
            pagination = {
                start: start,
                length: length
            }
        }
        console.log(pagination);

        let listTamtrutamvang = await Tamtrutamvang.selectAll(pagination);

        if (listTamtrutamvang == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }

        let nhankhau;
        for (let i = 0; i < listTamtrutamvang.length; i++) {
            nhankhau = await Nhankhau.select({ id: listTamtrutamvang[i].idnhankhau });
            if (nhankhau == null) continue;
            listTamtrutamvang[i]["nhankhau"] = nhankhau[0];
        }

        Response.response(res, Response.ResponseCode.OK, "Success", listTamtrutamvang);
    }

    /*
    route: GET [domain]/getTamtrutamvangById
    query: {
        token: "xxx",
        id: "xxx"
    }
    */
    async getTamtrutamvangById(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let { token, id } = req.query;

        if (id == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of id", req.query, "Thiếu id");
            return;
        }

        let tamtrutamvang = await Tamtrutamvang.getTamtrutamvangById(id);

        if (tamtrutamvang == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", tamtrutamvang);
    }

    /*
    route: GET [domain]/getTamtrutamvangByCccd
    query: {
        token: "xxx",
        cccd: "xxx"
    }
    */
    async getTamtrutamvangByCccd(req, res) {
        // check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let { token, cccd } = req.query;
        if (cccd == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu số căn cước công dân");
            return;
        }

        let nhankhau = await Nhankhau.select({ cccd: cccd });
        if (nhankhau == null || nhankhau.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return;
        }

        let tamtrutamvang = await Tamtrutamvang.getTamtrutamvangByCccd(cccd);

        if (tamtrutamvang == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy tạm trú tạm vắng với cccd này");
            return;
        }

        tamtrutamvang["nhankhau"] = nhankhau[0];

        Response.response(res, Response.ResponseCode.OK, "Success", tamtrutamvang);
    }

    /*
    route: GET [domain]/getTamtrutamvangByDiachiAndTrangthai
    query: {
        token: "xxx",
        diachi: "xxx",
        trangthai: "xxx",
    }
    Optional params: all except {token}
    */
    async getTamtrutamvangByDiachiAndTrangthai(req, res) {
        //checktoken
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let {
            token, diachi, trangthai
        } = req.query;

        let listTamtrutamvang = await Tamtrutamvang.getTamtrutamvangByDiachiAndTrangthai(diachi, trangthai);

        if (listTamtrutamvang == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }

        let nhankhau;
        for (let i = 0; i < listTamtrutamvang.length; i++) {
            nhankhau = await Nhankhau.select({ id: listTamtrutamvang[i].idnhankhau });
            if (nhankhau == null) continue;
            listTamtrutamvang[i]["nhankhau"] = nhankhau[0];
        }

        Response.response(res, Response.ResponseCode.OK, "Success", listTamtrutamvang);
    }

    /*
    route: GET [domain]/addTamtrutamvang
    query: {
        token: "xxx"
        cccd: "xxx"
        trangthai: "xxx"
        diachitamtrutamvang: "xxx"  
        noidungdenghi: "xxx"
    }
    Optional params: diachitamtrutamvang, noidungdenghi
    */
    async addTamtrutamvang(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        //check params
        let {
            token, cccd, trangthai, diachitamtrutamvang, noidungdenghi, thoigian
        } = req.query;

        let nhankhau = await Nhankhau.select({ cccd: cccd });
        if (nhankhau == null || nhankhau.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return;
        }
        let idnhankhau = nhankhau[0].id;

        if (token == undefined || idnhankhau == undefined || trangthai == undefined || thoigian == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
            return;
        }

        if (diachitamtrutamvang == undefined) diachitamtrutamvang = null;
        if (noidungdenghi == undefined) noidungdenghi = null;

        // check tamtrutamvang existed
        if (idnhankhau != null) {
            let tamtrutamvang = await Tamtrutamvang.getTamtrutamvangByCccd(cccd);
            if (tamtrutamvang != null) {
                Response.response(res, Response.ResponseCode.ERROR, "tamtrutamvang is already existed ", req.query);
                return;
            }
        }

        //add tamtrutamvang
        var tamtrutamvang = new Tamtrutamvang(null, idnhankhau, trangthai, diachitamtrutamvang, noidungdenghi, thoigian);
        result = await Tamtrutamvang.addTamtrutamvang(tamtrutamvang);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Thêm tạm trú tạm vắng thất bại");
            return;
        }

        tamtrutamvang.id = result.insertId
        tamtrutamvang["nhankhau"] = nhankhau[0];

        Response.response(res, Response.ResponseCode.OK, "Success", tamtrutamvang, "Đã thêm tạm trú tạm vắng");
    }

    /*
    route: GET [domain]/updateTamtrutamvang
    query: {
        token: "xxx"
        cccd: "xxx"
        trangthai: "xxx"
        diachitamtrutamvang: "xxx"  
        noidungdenghi: "xxx"
    }
    Optional params: all except {token, cccd}
    */
    async updateTamtrutamvang(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        //check params
        let {
            token, cccd, trangthai, diachitamtrutamvang, noidungdenghi, thoigian
        } = req.query;

        if (cccd == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu số căn cước công dân");
            return;
        }

        let nhankhau = await Nhankhau.select({ cccd: cccd });
        if (nhankhau == null || nhankhau.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return;
        }

        let tamtrutamvang = await Tamtrutamvang.getTamtrutamvangByCccd(cccd);
        //check tamtrutamvang existed
        if (tamtrutamvang == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy tạm trú tạm vắng này");
            return;
        }

        //update if params != null
        if (trangthai != null) {
            tamtrutamvang.trangthai = trangthai;
        }
        if (diachitamtrutamvang != null) {
            tamtrutamvang.diachitamtrutamvang = diachitamtrutamvang;
        }
        if (noidungdenghi != null) {
            tamtrutamvang.noidungdenghi = noidungdenghi;
        }
        if (thoigian != null) {
            tamtrutamvang.thoigian = thoigian;
        }

        //update tamtrutamvang
        result = await Tamtrutamvang.updateTamtrutamvang(tamtrutamvang);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Update tạm trú tạm vắng thất bại");
            return;
        }

        tamtrutamvang["nhankhau"] = nhankhau[0];

        Response.response(res, Response.ResponseCode.OK, "Success", tamtrutamvang, "Đã cập nhật thông tin tạm trú tạm vắng");
    }

    /*
    route: GET [domain]/deleteTamtrutamvang
    query: {
        token: "xxx",
        id: "xxx"
    }
    */
    async deleteTamtrutamvang(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        //check params
        let { token, id } = req.query;
        if (id == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of id", req.query, "Thiếu id tạm trú tạm vắng");
            return;
        }

        //check tamtrutamvang existed
        let tamtrutamvang = await Tamtrutamvang.getTamtrutamvangById(id);
        if (tamtrutamvang == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy tạm trú tạm vắng");
            return;
        }

        //delete tamtrutamvang
        result = await Tamtrutamvang.deleteTamtrutamvang(tamtrutamvang);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Xóa tạm trú tạm vắng thất bại");
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", req.query, "Đã xoá tạm trú tạm vắng");
    }

    async searchTamtrutamvang(req, res) {
        // check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        // get params
        let {
            token, hoten, cccd, id, idnhankhau, trangthai, diachitamtrutamvang, noidungdenghi, thoigian, start, length
        } = req.query;

        let pagination = null;
        if (start != null && length != null) {
            pagination = {
                start: start,
                length: length
            }
        }

        if (hoten != undefined) {
            let listTamtrutamvang = await Tamtrutamvang.selectAll(pagination);
            let result = [];
            if (listTamtrutamvang == null) {
                Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
                return;
            }
            let nhankhau;
            for (let i = 0; i < listTamtrutamvang.length; i++) {
                nhankhau = await Nhankhau.select({ id: listTamtrutamvang[i].idnhankhau });
                if (nhankhau == null) continue;
                if (nhankhau[0].hoten.toLowerCase().includes(hoten.toLowerCase())) {
                    listTamtrutamvang[i]["nhankhau"] = nhankhau[0];
                    result.push(listTamtrutamvang[i]);
                }

            }

            Response.response(res, Response.ResponseCode.OK, "Success", result);
            return;
        }

        if (cccd != undefined) {
            let listTamtrutamvang = await Tamtrutamvang.selectAll(pagination);
            let result = [];
            if (listTamtrutamvang == null) {
                Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
                return;
            }
            let nhankhau;
            for (let i = 0; i < listTamtrutamvang.length; i++) {
                nhankhau = await Nhankhau.select({ id: listTamtrutamvang[i].idnhankhau });
                if (nhankhau == null) continue;
                if (nhankhau[0].cccd == null) continue;
                if (nhankhau[0].cccd.toLowerCase().includes(cccd.toLowerCase())) {
                    listTamtrutamvang[i]["nhankhau"] = nhankhau[0];
                    result.push(listTamtrutamvang[i]);
                }

            }

            Response.response(res, Response.ResponseCode.OK, "Success", result);
            return;
        }

        var tamtrutamvang;
        tamtrutamvang = new Tamtrutamvang(
            id, idnhankhau, trangthai, diachitamtrutamvang, noidungdenghi, thoigian
        );

        let listTamtrutamvang = await Tamtrutamvang.search(tamtrutamvang, null, pagination)

        if (listTamtrutamvang == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }
        let nhankhau;
        for (let i = 0; i < listTamtrutamvang.length; i++) {
            nhankhau = await Nhankhau.select({ id: listTamtrutamvang[i].idnhankhau });
            if (nhankhau == null) continue;
            listTamtrutamvang[i]["nhankhau"] = nhankhau[0];
        }

        Response.response(res, Response.ResponseCode.OK, "Success", listTamtrutamvang, "Thành công");

    }
}

module.exports = { TamtrutamvangController };