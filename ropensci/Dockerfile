## Start with the ropensci image providing RStudio on 'base R'on Debian
FROM rocker/ropensci
RUN mkdir -p /home/rstudio/docs && \
  chmod 777 /home/rstudio/docs && \
  mkdir -p /srv/shiny-server && \
  ln -s /home/rstudio/docs /srv/shiny-server/docs && \
  install2.r --error \
  gsheet \
  ranger \
  caret \
  doParallel \
  Boruta \
  rFerns \
  C50 \
  glmnet \
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
  && rm -rf /tmp/downloaded_packages /tmp/*.rds
