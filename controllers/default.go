package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "beegoapp.example.com"
	c.Data["Email"] = "chienyuan.feng@gmail.com"
	c.TplName = "index.tpl"
}
