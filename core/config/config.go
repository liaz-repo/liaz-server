package config

import "core/system"

type Config struct {
	Nacos    *Nacos    `mapstructure:""`
	Logger   *Logger   `yaml:"logger"`
	Dasebase *Database `yaml:"database"`
	Minio    *Minio    `yaml:"minio"`
	Server   *Server   `yaml:"server"`
	Redis    *Redis    `yaml:"redis"`
	Security *Security `yaml:"security"`
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
	//数据库
	SystemConfig.Dasebase.Init()
	//缓存
	SystemConfig.Redis.Init()
	//文件储存
	SystemConfig.Minio.Init()
	//http
	SystemConfig.Server.Init()
}
