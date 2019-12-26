.PHONY: help
.DEFAULT_GOAL := help
all: setup start ## setup start
help: # https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
setup: ## Build the docker image
	@docker-compose build
start: ## Start rstudio
	@docker run -d -p 8787:8787 -e USERID=`id -u` -e GROUPID=`id -g` -e UMASK=0022 -e USER=${USER} -e PASSWORD=welcome -v `dirname $(shell pwd -P)`:/home/${USER}/docs --name drocker drocker-ropensci
stop: ## Stop the container
	@docker rm -f drocker # kill and remove container
