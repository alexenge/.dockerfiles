FROM alexenge/r_eeg:4.3.1

USER root

COPY .Rprofile $HOME/.Rprofile

RUN \
    # Install system packages
    apt-get update \
    && apt-get install -y --no-install-recommends clang \
    # Install cmdstandr from GitHub
    && installGithub.r stan-dev/cmdstanr@v0.5.3 \
    && mkdir -p $HOME/.cmdstanr \
    && Rscript -e "cmdstanr::install_cmdstan(dir = '$HOME/.cmdstanr')" \
    # Install R packages
    && install2.r --error --skipinstalled \
    bayestestR \
    brms \
    # Add default user permissions
    && chown -R $NB_USER $HOME

USER $NB_USER
