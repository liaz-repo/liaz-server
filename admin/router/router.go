package router

import (
	"admin/controller"
	"core/web"
)

func init() {
	//添加路由
	web.AddRouter(func(wrg *web.WebRouterGroup) {
		r := wrg.Group("/admin")
		{
			new(controller.HelloWorldController).Router(r)
		}
	})
}
