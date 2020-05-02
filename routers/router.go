package routers

import (
	"github.com/chienyuan/beegoapp/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
