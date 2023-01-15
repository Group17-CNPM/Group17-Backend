const { query } = require('express');

var HokhauController = require('../controller/hokhau_controller.js').HokhauController;

class HokhauRouter {
    constructor(app) {
        this.app = app
    }

    route() {
        this.app.route("/getListHokhau")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.getListHoKhau(req, res);
            });

        this.app.route("/getHokhauByIdChuho")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.getHokhauByIdChuHo(req, res);
            });

        this.app.route("/getHokhauBySoHokhau")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.getHokhauBySoHokhau(req, res);
            });

        this.app.route("/getHokhauByCccdChuho")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.getHokhauByCccdChuho(req, res);
            });

        this.app.route("/getListHokhauByDiaChi")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.getHokhauByDiaChi(req, res);
            });

        this.app.route("/addHokhau")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.addHokhau(req, res);
            });

        this.app.route("/updateHokhau")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.updateHokhau(req, res);
            });

        this.app.route("/updateChuho")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.updateChuho(req, res);
            });

        this.app.route("/deleteHokhauByCccd")
            .get(function (req, res) {
                let hokhauController = new HokhauController();
                hokhauController.deleteHokhauByCccd(req, res);
            });
    }
}

module.exports = { HokhauRouter };