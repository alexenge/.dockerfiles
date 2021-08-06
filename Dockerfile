FROM alexenge/r_papaja:4.0.5

USER root

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends clang \
    && installGithub.r stan-dev/cmdstanr@3233585 \
    && mkdir -p "${HOME}"/.cmdstanr \
    && Rscript -e "cmdstanr::install_cmdstan(dir = '${HOME}/.cmdstanr')" \
    && echo "options(mc.cores = parallel::detectCores())" >> .Rprofile \
    && echo "options(brms.backend = 'cmdstanr')" >> .Rprofile \
    && install2.r --error --skipinstalled \
    bayestestR \
    brms \
    && chown -R "${NB_USER}" "${HOME}"

USER "${NB_USER}"
