.PHONY: help
.DEFAULT_GOAL := help
include .makerc
export
all: clean setup start ## clean setup start
clean: stop ## Stop container and remove images
	-@docker rmi -f drocker-ropensci 2> /dev/null
	-@docker rmi -f rocker/ropensci 2> /dev/null
	@test "`docker images --filter dangling=true -q | wc -l`" == "0" || docker rmi `docker images --filter dangling=true -q`
help: # https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | cut -d: -f2- | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
setup: ## Build the docker image
	@docker-compose --tls --tlscacert ${HOME}/.docker/ca.pem --tlscert ${HOME}/.docker/cert.pem --tlskey ${HOME}/.docker/key.pem build
ssh: ## Opens a terminal into the container
	@docker exec -it -u ${USER} drocker bash
start: ## Start rstudio
	@docker run -d -p 3838:3838 -p 8787:8787 -e ROOT=TRUE -e USERID=`id -u` -e GROUPID=`id -g` -e UMASK=0022 -e USER=${USER} -e PASSWORD=${PASSWORD} -v `dirname $(shell pwd -P)`:/home/${USER}/workplace --name drocker drocker-ropensci
	@sleep 10
stop: ## Stop the container
	-@docker rm -f drocker 2> /dev/null # kill and remove container
