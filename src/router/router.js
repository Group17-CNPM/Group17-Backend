

var LoginRouter = require('../router/login_router.js').LoginRouter;
var UserRouter = require('../router/user_router.js').UserRouter;
var NhankhauRouter = require('../router/nhankhau_router.js').NhankhauRouter;
var LichsuRouter = require('../router/lichsu_router.js').LichsuRouter;

class Router{
	constructor(app){
		this.app = app;
		this.loginRouter = new LoginRouter(app);
		this.userRouter = new UserRouter(app);
		this.nhankhauRouter = new NhankhauRouter(app);
		this.lichsuRouter = new LoginRouter(app);
	}
	route(){
		this.loginRouter.route();
		this.userRouter.route();
		this.nhankhauRouter.route();
		this.lichsuRouter.route();
	}
}

module.exports = { Router };

