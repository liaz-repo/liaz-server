package handler

import (
	"core/response"
	"core/web"
)

type HelloWorldHandler struct {
}

func (e *HelloWorldHandler) Hello(wc *web.WebContext) interface{} {
	return response.ReturnOK("hello,world!")
}
