# About

Use this convenient wrapper to maintain and to share a versioned infrastructure for your RStudio projects.

No more *... but it works on my machine*.

**drocker** is a docker-compose wrapper on top of [rocker/ropensci](https://github.com/rocker-org/ropensci) This is a starting point for a new R project.

The instructions below have been tested on Ubuntu 16.04. Adapt them as required for your own OS.

`/docs/collectl.Rmd` shows how to share large data files using Google Sheets, free storage.

# Start Here

1. Download and install [Docker](https://www.docker.com/get-docker). Community Edition will work fine. More information on running RStudio in Docker can be found here  https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image. Caret examples are from [Earl Glynn's talk](https://github.com/EarlGlynn/kc-r-users-caret-2017).
    ```
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install docker-ce docker-compose
    sudo systemctl status docker
    sudo usermod -aG docker ${USER} # add your id to docker group
    su - ${USER} # re-login
    id -nG # check if you are in docker group
    ```

1. Useful commands
    ```
    git clone git@github.com:askrht/drocker.git # to clone this repo
    cd drocker # execute all commands from in here
    vi ropensci/Dockerfile # add or remove R packages here
    docker-compose build # to build an image
    docker run -d -p 8787:8787 -e USER=$USER -e PASSWORD=welcome -v $PWD/docs:/home/$USER/docs --name r1 drocker-ropensci # spin up first RStudio
    docker run -d -p 8788:8787 -e USER=$USER -e PASSWORD=welcome -v $PWD/docs:/home/$USER/docs --name r3 drocker-ropensci # spin up second RStudio
    docker rm -f r1 r2 # kill and remove containers
    docker rmi drocker-ropensci # remove the image
    ```

# Restore user preferences (experimental)
User preferences for RStudio are not restored if you rebuild the Docker image. To restore the user preferences, follow the steps given below.
1. Customize `docs/user-preferences`.
1. Login in to Rstudio as described above. (Very important or you will need to rebuild)
1. Enter the container and execute `./bootup` script
    ```
    docker exec -it drocker-ropensci bash
    cd /home/rstudio/docs && ./bootup
    ```
