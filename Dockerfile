FROM rocker/binder:4.0.3

# Set environment variables
ENV NB_USER=rstudio \
    NB_UID=1000 \
    RSTUDIO_VERSION=1.2.5042 \
    RETICULATE_MINICONDA_ENABLED=FALSE

# Install as root
USER root
RUN \
    # RStudio
    /rocker_scripts/install_rstudio.sh && \

    # Set some startup options
    mkdir .R && \
    echo "CXX14=clang++" >> .R/Makevars && \
    echo "CXX14FLAGS=-O3 -march=native -mtune=native -fPIC" >> .R/Makevars && \
    echo 'options(mc.cores = parallel::detectCores() - 1)' >> .Rprofile && \
    echo 'rstan::rstan_options(auto_write = TRUE)' >> .Rprofile && \
    echo 'knitr::opts_knit$set(root.dir = getwd())' >> .Rprofile && \
    chown -R ${NB_USER} .

# Switch back to default user
USER ${NB_USER}
ARG NB_USER=${NB_USER}
ARG NB_UID=${NB_UID}
