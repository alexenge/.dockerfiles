FROM rocker/binder:4.0.5

ENV HOME=/home/"${NB_USER}" \
    RSTUDIO_VERSION=1.2.5042 \
    RETICULATE_MINICONDA_ENABLED=FALSE

WORKDIR "${HOME}"

USER root

RUN /rocker_scripts/install_rstudio.sh \
    && install2.r --error --skipinstalled \
    afex \
    buildmer \
    cowplot \
    dfoptim \
    emmeans \
    furrr \
    here \
    kableExtra \
    languageserver \
    lmerTest \
    magick \
    pbkrtest \
    performance \
    reticulate \
    styler \
    tictoc \
    && pip3 install --no-cache-dir \
    notebook \
    && chown -R "${NB_USER}" "${HOME}"

USER "${NB_USER}"
