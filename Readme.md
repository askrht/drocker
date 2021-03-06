# About
Use this convenient wrapper to maintain and to share a versioned infrastructure for your RStudio projects. No more *... but it works on my machine*. **drocker** is a docker-compose wrapper on top of [rocker/ropensci](https://github.com/rocker-org/ropensci) This is a starting point for a new R project. The instructions below have been tested on Ubuntu 16.04. Adapt them as required for your own OS. `/docs/collectl.Rmd` shows how to share large data files using Google Sheets, free storage.
# Install Docker
Download and install [Docker](https://www.docker.com/get-docker). Community Edition will work fine. More information on running RStudio in Docker can be found here  https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image. Caret examples are from [Earl Glynn's talk](https://github.com/EarlGlynn/kc-r-users-caret-2017).
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
To install docker-compose on CentOS 5 to work with Docker version 1.12.6
```
sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose
```
# Restore RStudio user preferences (experimental)
User preferences for RStudio are not restored if you rebuild the Docker image. To restore the user preferences, follow the steps given below.
1. Customize `docs/user-preferences`.
1. Login in to Rstudio as described above. (Very important or you will need to rebuild)
1. Enter the container and execute `./bootup` script
    ```
    docker exec -it drocker-ropensci bash
    cd /home/rstudio/docs && ./bootup
    ```
# Install RStudio
1. Change the password inside `.makerc` but do not check in this file. `echo "PASSWORD=welcome" > .makerc && chmod 600 .makerc`
1. Execute `make all`. Rstudio is at port 8787. Login with your unix user name. Shiny is at port 3838 serving `/srv/shiny-server/`. Execute `make help` to see all commands
