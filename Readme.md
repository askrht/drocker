# About

**drocker** is a docker-compose wrapper on top of [rocker/ropensci](https://github.com/rocker-org/ropensci) This is a starting point for a new R project.

The instructions below have been tested on Ubuntu 16.04. Adapt them as required for your own OS.

# Start Here

1. Download and install [Docker](https://www.docker.com/get-docker). Community Edition will work fine.
    ```
    sudo apt update
    sudo apt install docker-ce docker-compose
    ```
1. Clone this repo
    ```
    git clone git@github.com:askrht/drocker.git
    ```
1. Start the docker image. This downloads approximately 4 GB of Docker images, first time.
    ```
    cd drocker
    docker-compose up -d --build
    ```
1. Stop the containers when you are done
    ```
    docker-compose down
    ```

# Useful links and folders
1. You can access RStudio at localhost:8787. It takes about 2 minutes for it to launch, the first time. Login as rstudio / rstudio.
1. RStudio files are saved under /docs

# Adding your packages to the Docker image
1. Modify ropensci/Dockerfile
1. Stop the container, remove the exsiting drocker_ropensci image and bring it up again
    ```
    docker-compose down && docker rmi drocker_ropensci && docker-compose up -d
    ```
1. You can enter the running container to check which packges are installed, like so:
    ```
    docker exec -it drocker_ropensci bash
    R
    > library("tidyverse")
    > installed.packages() %>% grep(pattern="gsheet") %>% installed.packages()[.]
    [1] "gsheet"
    ```
