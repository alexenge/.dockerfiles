FROM rocker/binder:4.1.2

ENV HOME="/home/$NB_USER"
ENV PROJDIR="$HOME/proj"
ENV RPROFILE="$HOME/.Rprofile"
ENV RADIAN_PROFILE="$HOME/.radian_profile"
ENV RSTUDIO_PREFS="$HOME/.config/rstudio/rstudio-prefs.json"
ENV RETICULATE_MINICONDA_ENABLED="FALSE"

USER root

RUN \
    # Install system packages
    apt-get update \
    && apt-get install -y --no-install-recommends jq \
    # Install R packages from MRAN
    && install2.r --error --skipinstalled \
    afex \
    broom.mixed \
    buildmer \
    cowplot \
    dfoptim \
    emmeans \
    furrr \
    git2r \
    here \
    Hmisc \
    httpgd \
    huxtable \
    kableExtra \
    languageserver \
    lmerTest \
    magick \
    MetBrewer \
    modelsummary \
    naturalsort \
    pbkrtest \
    performance \
    renv \
    reticulate \
    Rmisc \
    styler \
    tictoc \
    # Install R packages from GitHub
    && installGithub.r \
    crsh/citr@0e8243d \
    crsh/papaja@f1bbad9 \
    # Install Python packages
    && pip3 install --no-cache-dir \
    notebook \
    radian \
    session_info \
    # Install LaTeX packages
    && tlmgr update --self \
    && tlmgr install \
    amscls \
    amsmath \
    apa7 \
    auxhook \
    babel-english \
    beamer \
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
    # Use the project directory as the default R + RStudio working directory
    && echo "setwd(\"$PROJDIR\")" >> "$RPROFILE" \
    && mkdir -p "${RSTUDIO_PREFS%/*}" && touch "$RSTUDIO_PREFS" \
    && jq ".initial_working_directory=\"$PROJDIR\"" "$RSTUDIO_PREFS" \
    # Make sure R Markdown documents get knitted from the project directory
    && echo "knitr::opts_knit\$set(root.dir = getwd())" >> "$RPROFILE" \
    # Enable plotting via `httpgd` in VS Code
    && echo "options(vsc.use_httpgd = TRUE)" >> "$RPROFILE" \
    # Set color theme for radian
    && echo "options(radian.color_scheme = \"vs\")" >> "RADIAN_PROFILE" \
    # Create working directory
    && mkdir "$PROJDIR" \
    # Add default user permissions
    && chown -R "$NB_USER" "$HOME"

USER "$NB_USER"

WORKDIR "$PROJDIR"
