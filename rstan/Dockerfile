FROM rocker/binder:4.0.2

# Set environment variables
ENV HOME=/home/${NB_USER} \
    RSTUDIO_VERSION=1.2.5042 \
    RETICULATE_MINICONDA_ENABLED=FALSE

# Change to root user for install
USER root

# Install RStudio, clang, and R packages
RUN /rocker_scripts/install_rstudio.sh && \
    apt-get install -y --no-install-recommends \
        clang && \
    install2.r -s --error \
        brms \
        cowplot \
        reticulate \
        rstan \
        styler && \
    installGithub.r \
        crsh/papaja@0b4a9a79 \
        craddm/eegUtils@01c939f2 && \
    # Set some startup options
    echo 'options(mc.cores = parallel::detectCores() - 1)' >> .Rprofile && \
    echo 'rstan::rstan_options(auto_write = TRUE)' >> .Rprofile && \
    echo 'knitr::opts_knit$set(root.dir = getwd())' >> .Rprofile && \
    mkdir .R && \
    echo "CXX14=clang++" >> .R/Makevars && \
    echo "CXX14FLAGS=-O3 -march=native -mtune=native -fPIC" >> .R/Makevars && \
    chown -R ${NB_USER} ${HOME}

# Change back to default user
USER ${NB_USER}
