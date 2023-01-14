const { response } = require("express");
const { Nhankhau } = require("../model/nhankhau.js");

let HoKhau = require("../model/hokhau.js").HoKhau;
let Response = require('../utils/response.js').Response;
let LoginController = require('../controller/login_controller.js').LoginController;

class HokhauController {
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
    route: GET [domain]/getListHokhau
    query: {
        token: "xxx"
    }
    */
    async getListHoKhau(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let listHokhau = await HoKhau.selectAll();

        if (listHokhau == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", listHokhau);
    }

    /*
    route: GET [domain]/getHokhauByIdChuho
    query: {
        token: "xxx",
        idchuho: "xxx"
    }
    */
    async getHokhauByIdChuHo(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let { token, idchuho } = req.query;

        if (idchuho == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of idchuho", req.query, "Thiếu id chủ hộ");
            return;
        }

        let listHoKhau = await HoKhau.getHokhauByIdChuHo(idchuho);

        if (listHoKhau == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", listHoKhau);

    }

    /*
    route: GET [domain]/getHokhauByCccdChuho
    query: {
        token: "xxx",
        cccd: "xxx"
    }
    */
    async getHokhauByCccdChuho(req, res) {
        // check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let { token, cccd } = req.query;
        if (cccd == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu số căn cước công dân");
            return;
        }

        let nhankhau = await Nhankhau.getNhankhauByCCCD(cccd);
        if (nhankhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return null;
        }

        let hokhau = await HoKhau.getHokhauByCccdChuho(cccd);

        if (hokhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy");
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", hokhau);
    }

    /*
    route: GET [domain]/getListHokhauByDiaChi
    query: {
        token: "xxx",
        quan: "xxx",
        phuong: "xxx",
        duong: "xxx",
        sonha: "xxx",
    }
    Optional params: all except {token}
    */
    async getHokhauByDiaChi(req, res) {
        //checktoken
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let {
            quan, phuong, duong, sonha
        } = req.query;

        let listHokhau = await HoKhau.getHokhauByDiaChi(quan, phuong, duong, sonha);

        if (listHokhau == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", listHokhau);
    }

    /*
    route: GET [domain]/addHokhau
    query: {
        token: "xxx"
        cccd: "xxx"
        sonha: "xxx"
        duong: "xxx"  
        phuong: "xxx"
        quan: "xxx"
        ngaylamhokhau: "yyyy-mm-dd"
    }
    */
    async addHokhau(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        //check params
        let {
            token, cccd, sonha, duong, phuong, quan, ngaylamhokhau
        } = req.query;

        let nhankhau = await Nhankhau.getNhankhauByCCCD(cccd);
        if (nhankhau == null) {
            Response.response(res, Response.ResponseCode, "Cccd doesn't exist", req.query, "Không tìm thấy cccd");
            return;
        }
        let idchuho = nhankhau.id;

        if (token == undefined || idchuho == undefined || sonha == undefined ||
            duong == undefined || phuong == undefined ||
            quan == undefined || ngaylamhokhau == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of params", req.query, "Thiếu tham số");
            return;
        }

        // check idchuho existed
        if (idchuho != null) {
            let hokhau = await HoKhau.getHokhauByIdChuHo(idchuho);
            if (hokhau.length != 0) {
                Response.response(res, Response.ResponseCode.ERROR, "idchuho is already existed ", req.query);
                return;
            }
        }

        //check date
        if (!this.checkDate(ngaylamhokhau)) {
            Response.response(res, Response.ResponseCode.ERROR, "ngaylamhokhau is invalid", req.query);
            return;
        }

        //add ho khau
        var hokhau = new HoKhau(null, idchuho, sonha, duong, phuong, quan, ngaylamhokhau);
        result = await HoKhau.addHokhau(hokhau);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Thêm hộ khẩu thất bại");
            return;
        }
        //todo: còn phải update quan hệ với chủ hộ sau khi đã add thành công
        nhankhau.quanhevoichuho = "Là chủ hộ";
        result = await Nhankhau.updateNhankhau(nhankhau);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Thêm hộ khẩu thất bại ở khâu update vai trò nhân khẩu");
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", hokhau, "Đã thêm hộ khẩu");
    }

    /*
    route: GET [domain]/updateHokhau
    query: {
        token: "xxx"
        cccd: "xxx"
        sonha: "xxx"
        duong: "xxx"  
        phuong: "xxx"
        quan: "xxx"
        ngaylamhokhau: "yyyy-mm-dd"
    }
    Optional params: all except {token, cccd}
    */
    async updateHokhau(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        //check params
        let {
            token, cccd, sonha, duong, phuong, quan, ngaylamhokhau
        } = req.query;

        if (cccd == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu số căn cước công dân");
            return;
        }

        let hokhau = await HoKhau.getHokhauByCccdChuho(cccd);
        //check hokhau existed
        if (hokhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd là chủ hộ");
            return;
        }

        //update if params != null
        if (sonha != null) {
            hokhau.sonha = sonha;
        }
        if (duong != null) {
            hokhau.duong = duong;
        }
        if (phuong != null) {
            hokhau.phuong = phuong;
        }
        if (quan != null) {
            hokhau.quan = quan;
        }
        if (ngaylamhokhau != null) {
            hokhau.ngaylamhokhau = ngaylamhokhau;
        }

        //update hokhau
        result = await HoKhau.updateHokhau(hokhau);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Update hộ khẩu thất bại");
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", hokhau, "Đã cập nhật thông tin hộ khẩu");
    }

    /*
    route: GET [domain]/updateChuho
    query: {
        token: "xxx"
        cccdChuhoOld: "xxx"
        cccdChuhoNew: "xxx"
    }
    */
    async updateChuho(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let { token, cccdChuhoOld, cccdChuhoNew } = req.query;

        //check params
        if (cccdChuhoOld == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu số căn cước công dân chủ hộ cũ");
            return;
        }
        if (cccdChuhoNew == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu số căn cước công dân chủ hộ mới");
            return;
        }

        let hokhau = await HoKhau.getHokhauByCccdChuho(cccdChuhoOld);
        //check hokhau cu existed
        if (hokhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd cũ là chủ hộ");
            return;
        }

        //check hokhau cua chu moi existed
        let hokhauMoi = await HoKhau.getHokhauByCccdChuho(cccdChuhoNew);
        if (hokhauMoi != null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Existed hokhau of new chuho", req.query, "Chủ hộ mới đã có hộ khẩu rồi");
            return;
        }

        //check nhankhau moi existed
        let nhankhauNew = await Nhankhau.getNhankhauByCCCD(cccdChuhoNew);
        if (nhankhauNew == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd của chủ hộ mới");
            return;
        }

        result = await HoKhau.updateChuho(hokhau, nhankhauNew.id);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Update chủ hộ thất bại");
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", hokhau, "Đã cập nhật thông tin chủ hộ");
    }

    /*
    route: GET [domain]/deleteHokhauByCccd
    query: {
        token: "xxx",
        cccd: "xxx"
    }
    */
    async deleteHokhauByCccd(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        //check params
        let { token, cccd } = req.query;
        if (cccd == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of cccd", req.query, "Thiếu cccd");
            return;
        }

        let nhankhau = await Nhankhau.getNhankhauByCCCD(cccd);
        if (nhankhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return;
        }

        //check hokhau existed
        let hokhau = await HoKhau.getHokhauByCccdChuho(cccd);
        if (hokhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd là chủ hộ");
            return;
        }

        //delete hokhau
        result = await HoKhau.deleteHokhauByCccd(cccd);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Xóa hộ khẩu thất bại");
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", req.query, "Đã xoá hộ khẩu");
    }
}

module.exports = { HokhauController };