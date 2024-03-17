package config

import "core/system"

type Config struct {
	Nacos  *Nacos  `mapstructure:""`
	Logger *Logger `yaml:"logger"`
}

var SystemConfig = new(Config)

// 设置参数
func Setup() {
	env := system.GetEnv()
	//nacos配置
	profile := profiles[env]
	SystemConfig.Nacos = new(Nacos)
	SystemConfig.Nacos.Username = profile.Username
	SystemConfig.Nacos.Password = profile.Password
	SystemConfig.Nacos.ServerAddr = profile.ServerAddr
	SystemConfig.Nacos.Namespace = profile.Namespace
	SystemConfig.Nacos.SharedDataIds = profile.SharedDataIds
	SystemConfig.Nacos.RefreshableDataIds = profile.RefreshableDataIds
	//配置中心
	SystemConfig.Nacos.Init()
	//日志
	SystemConfig.Logger.Init()
}
