

var TamtrutamvangController = require('../controller/tamtrutamvang_controller.js').TamtrutamvangController;

class TamtrutamvangRouter {
    constructor(app) {
        this.app = app;
    }

    route() {
        this.app.route("/getListTamtrutamvang")
            .get(function (req, res) {
                let tamtrutamvangController = new TamtrutamvangController();
                tamtrutamvangController.getListTamtrutamvang(req, res);
            });
        this.app.route("/getTamtrutamvangById")
            .get(function (req, res) {
                let tamtrutamvangController = new TamtrutamvangController();
                tamtrutamvangController.getTamtrutamvangById(req, res);
            });
        this.app.route("/getTamtrutamvangByCccd")
            .get(function (req, res) {
                let tamtrutamvangController = new TamtrutamvangController();
                tamtrutamvangController.getTamtrutamvangByCccd(req, res);
            });
        this.app.route("/getTamtrutamvangByDiachiAndTrangthai")
            .get(function (req, res) {
                let tamtrutamvangController = new TamtrutamvangController();
                tamtrutamvangController.getTamtrutamvangByDiachiAndTrangthai(req, res);
            });
        this.app.route("/addTamtrutamvang")
            .get(function (req, res) {
                let tamtrutamvangController = new TamtrutamvangController();
                tamtrutamvangController.addTamtrutamvang(req, res);
            });
        this.app.route("/updateTamtruvang")
            .get(function (req, res) {
                let tamtrutamvangController = new TamtrutamvangController();
                tamtrutamvangController.updateTamtrutamvang(req, res);
            });
        this.app.route("/deleteTamtrutamvang")
            .get(function (req, res) {
                let tamtrutamvangController = new TamtrutamvangController();
                tamtrutamvangController.deleteTamtrutamvang(req, res);
            });
    }
}

module.exports = { TamtrutamvangRouter };