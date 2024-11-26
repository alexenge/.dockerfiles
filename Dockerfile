FROM rocker/binder:4.4.1

ENV NB_USER=rstudio 
ENV HOME=/home/$NB_USER
ENV PROJECT_DIR=$HOME/project
ENV RETICULATE_MINICONDA_ENABLED=FALSE

COPY rstudio_prefs.json $HOME/.config/rstudio/rstudio-prefs.json
COPY .Rprofile $HOME/.Rprofile
COPY .radian_profile $HOME/.radian_profile

USER root

RUN \
    # Create project directory
    mkdir $PROJECT_DIR \
    # Install R packages from MRAN
    && install2.r --error --skipinstalled \
    afex \
    binom \
    broom.mixed \
    buildmer \
    cowplot \
    dfoptim \
    emmeans \
    furrr \
    ggnewscale \
    git2r \
    here \
    Hmisc \
    huxtable \
    kableExtra \
    languageserver \
    lmerTest \
    magick \
    MetBrewer \
    MKinfer \
    modelsummary \
    naturalsort \
    papaja \
    pbkrtest \
    performance \
    renv \
    reticulate \
    Rmisc \
    scico \
    styler \
    tarchetypes \
    targets \
    tictoc \
    # Install R packages from GitHub
    && installGithub.r \
    crsh/citr \
    nx10/httpgd \
    # Install Python packages
    && pip3 install --no-cache-dir \
    ipykernel \
    pyprojroot \
    radian \
    session_info \
    # Install LaTeX packages
    && tlmgr update --self \
    && tlmgr install \
    adjustbox \
    amscls \
    amsmath \
    apa6 \
    apa7 \
    auxhook \
    babel-english \
    beamer \
    bigintcalc \
    bitset \
    booktabs \
    caption \
    collectbox \
    csquotes \
    ec \
    endfloat \
    epstopdf-pkg \
    etexcmds \
    etoolbox \
    euenc \
    fancyhdr \
    fancyvrb \
    filehook \
    float \
    fontspec \
    footmisc \
    fp \
    framed \
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
    orcidlink \
    pdfescape \
    pdftexcmds \
    pgf \
    polyglossia \
    refcount \
    rerunfilecheck \
    scalerel \
    setspace \
    siunitx \
    stringenc \
    tcolorbox \
    times \
    threeparttable \
    threeparttablex \
    tipa \
    translator \
    trimspaces \
    unicode-math \
    uniquecounter \
    was \
    xcolor \
    xpatch \
    xunicode \
    zapfding \
    # Add default user permissions
    && chown -R $NB_USER $HOME

USER $NB_USER

WORKDIR $PROJECT_DIR
