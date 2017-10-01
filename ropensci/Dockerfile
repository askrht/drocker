## Start with the ropensci image providing RStudio on 'base R'on Debian
FROM rocker/ropensci
ADD Makevars /home/rstudio/.R/
ADD Makevars /root/.R/
ADD Makevars /.R/
ADD Makevars /usr/local/lib/R/
ADD Makevars /usr/local/lib/R/.R/
ENV CC=/usr/bin/gcc \
  CXX=/usr/bin/g++ \
  CXX1X=/usr/bin/g++
RUN mkdir -p /home/rstudio/docs && \
  chmod 777 /home/rstudio/docs && \
  mkdir -p /srv/shiny-server && \
  ln -s /home/rstudio/docs /srv/shiny-server/docs && \
  install2.r --error \
    # -r 'http://cran.rstudio.com' \
    ranger \
    # gsheet \
    # caret \
    # doParallel \
    # rFerns \
    # C50 \
    # glmnet \
    # RWeka
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
  # R -e 'install.packages("ranger", repos="http://cran.rstudio.com")'
  # R -e 'install.packages(c("caret", "doParallel", "Boruta", "rFerns", "C50", "glmnet", "RWeka"), repos="http://cran.rstudio.com")' && \
  # R -e 'install.packages(c("C50", "glmnet"))'
  # R -e 'install.packages(c("DMxR"), repos="http://cran.us.r-project.org")'
