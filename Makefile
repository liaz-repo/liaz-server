.PHONY: liaz-admin compile clean

RM			:= rm -rf

PROJECT_DIR	:= $(shell pwd)
BUILD		:= build

compile:
	@echo "cd $(PROJECT_DIR)/admin && CGO_ENABLED=0 go build -ldflags="-w -s" -a -installsuffix "" -gcflags="all=-N -l" -o $(PROJECT_DIR)/$(BUILD)/liaz-admin $(PROJECT_DIR)/admin/main.go" 
	@cd $(PROJECT_DIR)/admin && CGO_ENABLED=0 go build -ldflags="-w -s" -a -installsuffix "" -gcflags="all=-N -l" -o $(PROJECT_DIR)/$(BUILD)/liaz-admin $(PROJECT_DIR)/admin/main.go	
	
liaz-admin:
	@echo "cd $(PROJECT_DIR)/admin && CGO_ENABLED=0 go build -ldflags="-w -s" -a -installsuffix "" -gcflags="all=-N -l" -o $(PROJECT_DIR)/$(BUILD)/$@ $(PROJECT_DIR)/admin/main.go" 
	@cd $(PROJECT_DIR)/admin && CGO_ENABLED=0 go build -ldflags="-w -s" -a -installsuffix "" -gcflags="all=-N -l" -o $(PROJECT_DIR)/$(BUILD)/$@ $(PROJECT_DIR)/admin/main.go
	@echo Executing $@ complete!
	$(PROJECT_DIR)/$(BUILD)/$@ start -e dev

clean:
	$(RM) $(PROJECT_DIR)/$(BUILD)
	$(RM) $(PROJECT_DIR)/cache
	$(RM) $(PROJECT_DIR)/log
	@echo Cleanup complete!