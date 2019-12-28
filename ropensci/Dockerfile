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
RUN mkdir -p /home/rstudio/docs && chmod 777 /home/rstudio/docs && \
  mkdir -p /srv/shiny-server && \
  ln -s /home/rstudio/docs /srv/shiny-server/docs && \
  export ADD=shiny && bash /etc/cont-init.d/add && \
  install2.r --error \
  gsheet \
  ranger \
  caret \
  doParallel \
  Boruta \
  rFerns \
  C50 \
  RWeka \
  DMwR \
  fastICA \
  klaR \
  randomForest \
  rpart.plot \
  NMF \
  pvclust \
  AppliedPredictiveModeling \
  pROC \
  ipred \
  gbm \
  mlbench \
  rpivotTable \
  dygraphs \
  gsubfn \
  flexdashboard \
  tictoc \
  rmarkdown \
  properties \
  stringr \
  widgetframe \
  bookdown \
  DiagrammeR \
  collapsibleTree \
  anomalize \
  tidyr \
  sna \
  && R -e 'out <- devtools::install_github("rich-iannone/DiagrammeR")' && \
  rm -rf /tmp/downloaded_packages /tmp/*.rds
