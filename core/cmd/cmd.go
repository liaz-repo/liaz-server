package cmd

import (
	"core/config"
	"core/system"
	"errors"
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var (
	env, name string
	rootCmd   = &cobra.Command{
		Use:          system.GetName(),
		Short:        system.GetName(),
		SilenceUsage: true,
		Long:         system.GetName(),
		Args: func(cmd *cobra.Command, args []string) error {
			if len(args) < 1 {
				return errors.New("requires at least one arg")
			}
			return nil
		},
	}
	StartCmd = &cobra.Command{
		Use:     "start",
		Short:   "Start application",
		Example: system.GetName() + " start -e dev",
		Run: func(cmd *cobra.Command, args []string) {
			run()
		},
	}
)

func init() {
	rootCmd.AddCommand(StartCmd)
	StartCmd.PersistentFlags().StringVarP(&env, "start", "e", "dev", "Setting up the running environment")
}

func run() {
	setupConfig()
}

func setupConfig() {
	fmt.Printf("The profile active is %s\n", env)
	system.SetEnv(env)
	if len(name) > 0 {
		system.SetName(name)
	}
	config.Setup()
}

func Execute(applicationName string) {
	system.SetName(applicationName)
	if err := rootCmd.Execute(); err != nil {
		fmt.Printf("Execute err : %s\n", err.Error())
		os.Exit(-1)
	}
}
