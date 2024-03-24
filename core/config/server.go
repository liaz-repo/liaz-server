package config

import (
	"core/system"

	"github.com/gin-gonic/gin"
)

type Server struct {
	Port int `yaml:"port"`
}

func (e *Server) Init() {
	if e == nil {
		return
	}
	engine := gin.New()
	engine.SetTrustedProxies([]string{"127.0.0.1"})
	system.SetGinEngine(engine)
}
