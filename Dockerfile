FROM rocker/binder:4.1.2

ENV HOME="/home/$NB_USER"
ENV PROJDIR="$HOME/proj"
ENV RETICULATE_MINICONDA_ENABLED="FALSE"

USER root

RUN \
    # Install R packages from MRAN
    install2.r --error --skipinstalled \
    afex \
    broom.mixed \
    buildmer \
    cowplot \
    dfoptim \
    emmeans \
    furrr \
    here \
    Hmisc \
    httpgd \
    huxtable \
    kableExtra \
    languageserver \
    lmerTest \
    magick \
    modelsummary \
    patchwork \
    pbkrtest \
    performance \
    renv \
    reticulate \
    styler \
    tictoc \
    # Install R packages from GitHub
    && installGithub.r \
    crsh/citr@0e8243d \
    crsh/papaja@a231c36 \
    # Install Python packages
    && pip3 install --no-cache-dir \
    notebook \
    radian \
    session_info \
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
    siunitx \
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
    # Make sure R Markdown documents get knitted from the project directory
    && echo "knitr::opts_knit\$set(root.dir = getwd())" >> "$HOME/.Rprofile" \
    # Enable plotting via `httpgd` in VS Code
    && echo "options(vsc.use_httpgd = TRUE)" >> "$HOME/.Rprofile" \
    # Set color theme for radian
    && echo "options(radian.color_scheme = 'vs')" > "$HOME/.radian_profile" \
    # Create working directory
    && mkdir "$PROJDIR" \
    # Add default user permissions
    && chown -R "$NB_USER" "$HOME"

USER "$NB_USER"

WORKDIR "$PROJDIR"
