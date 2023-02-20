const { response } = require("express");
const { Nhankhau } = require("../model/nhankhau.js");

let HoKhau = require("../model/hokhau.js").HoKhau;
let Response = require('../utils/response.js').Response;
let LoginController = require('../controller/login_controller.js').LoginController;
let Lichsu = require('../model/lichsu.js').Lichsu;
let Utils = require('../utils/utils.js').Utils;

class HokhauController {
    constructor() {

    }
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
        token: "xxx",
        start: 12,
        length: 2
    optional: start, length
    }
    */
    async getListHoKhau(req, res) {
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

        let listHokhau = await HoKhau.selectAll(pagination);

        if (listHokhau == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }

        let nhankhau;
        for (let i = 0; i < listHokhau.length; i++) {
            nhankhau = await Nhankhau.select({ id: listHokhau[i].idchuho });
            if (nhankhau == null) continue;
            listHokhau[i]["hotenchuho"] = nhankhau[0].hoten
            listHokhau[i]["cccdchuho"] = nhankhau[0].cccd
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
    route: GET [domain]/getHokhauByIdChuho
    query: {
        token: "xxx",
        idchuho: "xxx"
    }
    */
    async getHokhauBySoHokhau(req, res) {
        //check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        let { token, sohokhau } = req.query;

        if (sohokhau == undefined) {
            Response.response(res, Response.ResponseCode.ERROR, "Lack of sohokhau", req.query, "Thiếu số hộ khẩu");
            return;
        }

        let listHoKhau = await HoKhau.getHokhauBySoHokhau(sohokhau);

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

        let nhankhau = await Nhankhau.select({ cccd: cccd });
        if (nhankhau == null || nhankhau.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return;
        }

        let hokhau = await HoKhau.getHokhauByCccdChuho(nhankhau[0]);

        if (hokhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy hộ khẩU với cccd này");
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
            token, quan, phuong, duong, sonha
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

        let nhankhau = await Nhankhau.select({ cccd: cccd });
        if (nhankhau == null || nhankhau.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return;
        }
        let idchuho = nhankhau[0].id;

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

        // check sohokhau of chuho existed
        if (nhankhau[0].sohokhau != null) {
            Response.response(res, Response.ResponseCode.ERROR, "sohokhau is already existed ", req.query, "Chủ hộ đang ở trong hộ khẩu khác rồi");
            return;
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
        hokhau.sohokhau = result.insertId

        //update cho chuho
        nhankhau[0].quanhevoichuho = "Là chủ hộ";
        nhankhau[0].sohokhau = result.insertId;
        result = await Nhankhau.update(nhankhau[0], { id: nhankhau[0].id });
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Thêm hộ khẩu thất bại ở khâu update vai trò nhân khẩu");
            return;
        }

        hokhau["hotenchuho"] = nhankhau[0].hoten
        hokhau["cccdchuho"] = nhankhau[0].cccd

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

        let nhankhau = await Nhankhau.select({ cccd: cccd });
        if (nhankhau == null || nhankhau.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return;
        }
        let hokhau = await HoKhau.getHokhauByCccdChuho(nhankhau[0]);
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

        hokhau["hotenchuho"] = nhankhau[0].hoten
        hokhau["cccdchuho"] = nhankhau[0].cccd

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

        //check chuho cu existed
        let nhankhauOld = await Nhankhau.select({ cccd: cccdChuhoOld });
        if (nhankhauOld == null || nhankhauOld.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd chủ hộ cũ");
            return;
        }
        let hokhau = await HoKhau.getHokhauByCccdChuho(nhankhauOld[0]);
        //check hokhau cu existed
        if (hokhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd cũ là chủ hộ");
            return;
        }

        //update quanhevoichuho cua nhankhauold
        result = await Nhankhau.update({ quanhevoichuho: null }, { id: nhankhauOld[0].id });
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Update chủ thất bại ở khâu update vai trò chủ hộ cũ");
            return;
        }


        //check chuho moi existed
        let nhankhauNew = await Nhankhau.select({ cccd: cccdChuhoNew });
        if (nhankhauNew == null || nhankhauNew.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd chủ hộ mới");
            return;
        }

        //check hokhau cua chuhomoi khong ton tai hoac chuhomoi khong nam trong hokhau nay
        // let hokhauMoi = await HoKhau.getHokhauByCccdChuho(nhankhauNew[0]);
        if (nhankhauNew[0].sohokhau == null || nhankhauNew[0].sohokhau != nhankhauOld[0].sohokhau) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Existed hokhau of new chuho", req.query, "Chủ hộ mới không nằm trong hộ khẩU hiện tại");
            return;
        }

        //update vai tro cua chu ho moi
        nhankhauNew[0].quanhevoichuho = "Là chủ hộ";
        result = await Nhankhau.update(nhankhauNew[0], { id: nhankhauNew[0].id });
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Thêm hộ khẩu thất bại ở khâu update vai trò nhân khẩu");
            return;
        }

        result = await HoKhau.updateChuho(hokhau, nhankhauNew[0].id);
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

        let nhankhau = await Nhankhau.select({ cccd: cccd });
        if (nhankhau == null || nhankhau.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
            return;
        }

        //check hokhau existed
        let hokhau = await HoKhau.getHokhauByCccdChuho(nhankhau[0]);
        if (hokhau == null) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd là chủ hộ");
            return;
        }

        //update sohokhau cua cac nhankhau trong hokhau
        let listNhankhau = await Nhankhau.select({ sohokhau: hokhau.sohokhau });
        if (listNhankhau == null || listNhankhau.length <= 0) {
            Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Lỗi update nhân khẩu trong hộ khẩu");
            return;
        }
        for (let element of listNhankhau) {
            element.sohokhau = null;
            element.quanhevoichuho = null;
            result = await Nhankhau.update(element, { id: element.id });
            if (result == null) {
                Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Lỗi update nhân khẩu trong hộ khẩu");
                return;
            }
        }
        await Lichsu.delete({ sohokhau: hokhau.sohokhau })


        //delete hokhau
        result = await HoKhau.deleteHokhauByCccd(nhankhau[0]);
        if (result == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query, "Xóa hộ khẩu thất bại");
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", req.query, "Đã xoá hộ khẩu");
    }

    async searchHokhau(req, res) {
        // check token
        let result = await LoginController.checkToken(req, res);
        if (!result) return;

        // get params
        let {
            token, cccdchuho, sonha, duong, phuong, quan, ngaylamhokhau, start, length
        } = req.query;

        let nhankhau;
        if (cccdchuho != undefined) {
            nhankhau = await Nhankhau.select({ cccd: cccdchuho });
            if (nhankhau == null || nhankhau.length <= 0) {
                Response.response(res, Response.ResponseCode.FILE_NOT_FOUND, "Not found", req.query, "Không tìm thấy cccd");
                return;
            }
        } else {
            nhankhau = null;
        }

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

        var hokhau;
        if (nhankhau != null) {
            hokhau = new HoKhau(
                null, nhankhau[0].id, sonha,
                duong, phuong, quan, ngaylamhokhau
            );
        } else {
            hokhau = new HoKhau(
                null, null, sonha,
                duong, phuong, quan, ngaylamhokhau
            );
        }

        // search
        let listHokhau = await HoKhau.search(hokhau, null, pagination)

        if (listHokhau == null) {
            Response.response(res, Response.ResponseCode.ERROR, "Failed", req.query);
            return;
        }

        Response.response(res, Response.ResponseCode.OK, "Success", listHokhau, "Thành công");

    }
}

module.exports = { HokhauController };