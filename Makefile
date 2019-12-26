.PHONY: help
.DEFAULT_GOAL := help
all: setup start ## setup start
clean: ## Remove unused containers images
	@test "`docker ps --filter status=exited -q | wc -l`" == "0" || docker rm -v `docker ps --filter status=exited -q`
	@test "`docker images --filter dangling=true -q | wc -l`" == "0" || docker rmi `docker images --filter dangling=true -q`
help: # https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
setup: ## Build the docker image
	@docker-compose --tls --tlscacert ${HOME}/.docker/ca.pem --tlscert ${HOME}/.docker/cert.pem --tlskey ${HOME}/.docker/key.pem build
ssh: ## Opens a terminal into the container
	@docker exec -it -u ${USER} drocker bash
start: ## Start rstudio
	@docker run -d -p 3838:3838 -p 8787:8787 -e ROOT=TRUE -e USERID=`id -u` -e GROUPID=`id -g` -e UMASK=0022 -e USER=${USER} -e PASSWORD=welcome -v `dirname $(shell pwd -P)`:/home/${USER}/docs --name drocker drocker-ropensci
stop: ## Stop the container
	@docker rm -f drocker # kill and remove container
