FROM rocker/binder:4.1.2

ENV HOME=/home/"${NB_USER}" \
    RETICULATE_MINICONDA_ENABLED=FALSE

WORKDIR "${HOME}"

USER root

RUN install2.r --error --skipinstalled \
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
    renv \
    reticulate \
    styler \
    tictoc \
    && pip3 install --no-cache-dir \
    notebook \
    radian \
    && echo "options(radian.color_scheme = 'vs')" > "${HOME}"/.radian_profile \
    && chown -R "${NB_USER}" "${HOME}"

USER "${NB_USER}"
