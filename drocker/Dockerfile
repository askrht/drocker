## Start with the ropensci image providing RStudio on 'base R'on Debian
FROM rocker/ropensci:3.4.0
RUN mkdir -p /home/rstudio/docs && \
  chmod 777 /home/rstudio/docs && \
  mkdir -p /srv/shiny-server && \
  ln -s /home/rstudio/docs /srv/shiny-server/docs && \
  R -e 'out <- install.packages(c("gsheet"))'
