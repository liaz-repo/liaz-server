package system

import (
	"github.com/gin-gonic/gin"
	"github.com/go-xorm/xorm"
	"github.com/minio/minio-go/v7"
	"github.com/nacos-group/nacos-sdk-go/v2/clients/config_client"
	"github.com/sirupsen/logrus"
)

type Application struct {
	env           string
	name          string
	iConfigClient config_client.IConfigClient
	logger        *logrus.Logger
	xormEngine    *xorm.Engine
	minioClient   *minio.Client
	ginEngine     *gin.Engine
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

func SetXormEngine(engine *xorm.Engine) {
	if application.xormEngine == nil {
		application.xormEngine = engine
	}
}

func GetXormEngine() *xorm.Engine {
	return application.xormEngine
}

func SetMinioClient(client *minio.Client) {
	if application.minioClient == nil {
		application.minioClient = client
	}
}

func GetMinioClient() *minio.Client {
	return application.minioClient
}

func SetGinEngine(engine *gin.Engine) {
	if application.ginEngine == nil {
		application.ginEngine = engine
	}
}

func GetGinEngine() *gin.Engine {
	return application.ginEngine
}

var application = new(Application)
