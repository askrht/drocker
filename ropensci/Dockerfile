## Start with the ropensci image providing RStudio on 'base R'on Debian
FROM rocker/ropensci
RUN mkdir -p /home/rstudio/docs && \
  chmod 777 /home/rstudio/docs && \
  mkdir -p /srv/shiny-server && \
  ln -s /home/rstudio/docs /srv/shiny-server/docs && \
  R -e 'install.packages(c("gsheet"))'
