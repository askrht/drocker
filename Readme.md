# About

Use this convenient wrapper to maintain and to share a versioned infrastructure for your RStudio projects.

No more *... but it works on my machine*.

**drocker** is a docker-compose wrapper on top of [rocker/ropensci](https://github.com/rocker-org/ropensci) This is a starting point for a new R project.

The instructions below have been tested on Ubuntu 16.04. Adapt them as required for your own OS.

`/docs/collectl.Rmd` shows how to share large data files using Google Sheets, free storage.

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

# After starting the container
1. You can access RStudio at localhost:8787. It takes about 2 minutes for it to launch, the first time. Login as **rstudio / rstudio**.
1. RStudio files should be saved under the `/docs` folder.

# Restore user preferences (optional)
User preferences for RStudio are not restored if you rebuild the Docker image. To restore the user preferences, follow the steps given below.
1. Customize `docs/user-preferences`.
1. Login in to Rstudio as described above. (Very important or you will need to rebuild)
1. Enter the container and execute `./bootup` script
    ```
    docker exec -it drocker-ropensci bash
    cd /home/rstudio/docs && ./bootup
    ```

# Adding your packages to the Docker image (optional)
1. Modify `ropensci/Dockerfile` to install additional packages.
1. Stop the container, remove the existing drocker-ropensci image and bring it up again.
    ```
    docker-compose down && docker rmi drocker-ropensci && docker-compose up -d
    ```
