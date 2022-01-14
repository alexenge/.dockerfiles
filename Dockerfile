FROM rocker/binder:4.1.2

ENV HOME=/home/"${NB_USER}" \
    RETICULATE_MINICONDA_ENABLED=FALSE

WORKDIR "${HOME}"

USER root

RUN \
    # Install R packages from MRAN
    install2.r --error --skipinstalled \
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
    # Install R packages from GitHub
    installGithub.r \
    crsh/citr@v0.3.2 \
    crsh/papaja@0b4a9a79 \
    # Install Python packages
    && pip3 install --no-cache-dir \
    notebook \
    radian \
    # Install LaTeX packages
    && tlmgr update --self \
    && tlmgr install \
    amsmath \
    apa7 \
    auxhook \
    babel-english \
    bigintcalc \
    bitset \
    booktabs \
    caption \
    csquotes \
    endfloat \
    epstopdf-pkg \
    etexcmds \
    etoolbox \
    euenc \
    fancyhdr \
    filehook \
    float \
    fontspec \
    footmisc \
    fp \
    geometry environ \
    gettitlestring \
    grffile \
    grfext \
    hycolor \
    hyperref \
    iftex \
    infwarerr \
    intcalc \
    kvdefinekeys \
    kvoptions \
    kvsetkeys \
    latex-amsmath-dev \
    letltxmacro \
    lineno \
    ltxcmds \
    makecell \
    makecmds \
    multirow \
    nowidow \
    pdfescape \
    pdftexcmds \
    pgf \
    polyglossia \
    refcount \
    rerunfilecheck \
    scalerel \
    setspace \
    stringenc \
    times \
    threeparttable \
    threeparttablex \
    tipa \
    trimspaces \
    unicode-math \
    uniquecounter \
    was \
    xcolor \
    xunicode \
    zapfding \
    # Set some package options
    && echo 'knitr::opts_knit$set(root.dir = getwd())' >> .Rprofile \
    && echo "options(radian.color_scheme = 'vs')" > "${HOME}"/.radian_profile \
    # Add default user permissions
    && chown -R "${NB_USER}" "${HOME}"

USER "${NB_USER}"
