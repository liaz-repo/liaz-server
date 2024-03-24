package controller

import (
	"admin/handler"
	"core/web"
)

type HelloWorldController struct {
}

var _ web.IWebController = &HelloWorldController{}

func (e *HelloWorldController) Router(iWebRoutes web.IWebRoutes) {
	var helloWorldHandler = handler.HelloWorldHandler{}
	iWebRoutes.GET("/hello/world", helloWorldHandler.Hello)
}
