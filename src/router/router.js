

var LoginRouter = require('../router/login_router.js').LoginRouter;
var UserRouter = require('../router/user_router.js').UserRouter;
var NhankhauRouter = require('../router/nhankhau_router.js').NhankhauRouter;

class Router{
	constructor(app){
		this.app = app;
		this.loginRouter = new LoginRouter(app);
		this.userRouter = new UserRouter(app);
		this.nhankhauRouter = new NhankhauRouter(app);
	}
	route(){
		this.loginRouter.route();
		this.userRouter.route();
		this.nhankhauRouter.route();
	}
}

module.exports = { Router };

