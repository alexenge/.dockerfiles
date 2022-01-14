FROM alexenge/r_eeg:4.1.2

USER root

RUN \
    # Install system packages
    apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends clang \
    # Install cmdstandr from GitHub
    && installGithub.r stan-dev/cmdstanr@a2a97d9 \
    && mkdir -p "${HOME}"/.cmdstanr \
    && Rscript -e "cmdstanr::install_cmdstan(dir = '${HOME}/.cmdstanr')" \
    && echo "options(mc.cores = parallel::detectCores())" >> .Rprofile \
    && echo "options(brms.backend = 'cmdstanr')" >> .Rprofile \
    # Install R packages
    && install2.r --error --skipinstalled \
    bayestestR \
    brms \
    # Add default user permissions
    && chown -R "${NB_USER}" "${HOME}"

USER "${NB_USER}"
