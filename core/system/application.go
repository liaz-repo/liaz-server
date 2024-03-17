package system

import (
	"github.com/nacos-group/nacos-sdk-go/v2/clients/config_client"
	"github.com/sirupsen/logrus"
)

type Application struct {
	env           string
	name          string
	iConfigClient config_client.IConfigClient
	logger        *logrus.Logger
}

func SetEnv(env string) {
	if len(application.env) == 0 {
		application.env = env
	}
}

func GetEnv() string {
	return application.env
}

func SetName(name string) {
	if len(application.name) == 0 {
		application.name = name
	}
}

func GetName() string {
	return application.name
}

func SetIConfigClient(configClient config_client.IConfigClient) {
	if application.iConfigClient == nil {
		application.iConfigClient = configClient
	}
}

func GetIConfigClient() config_client.IConfigClient {
	return application.iConfigClient
}

func SetLogger(logger *logrus.Logger) {
	if application.logger == nil {
		application.logger = logger
	}
}

func GetLogger() *logrus.Logger {
	return application.logger
}

var application = new(Application)
