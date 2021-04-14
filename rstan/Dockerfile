FROM rocker/binder:4.0.3

# Set environment variables
ENV NB_USER=rstudio \
    NB_UID=1000 \
    RSTUDIO_VERSION=1.2.5042 \
    RETICULATE_MINICONDA_ENABLED=FALSE

# Install as root
USER root
RUN \
    # RStudio
    /rocker_scripts/install_rstudio.sh && \
    # System packages
    apt-get install -y --no-install-recommends \
        clang \
        && \
    # R packages from MRAN
    install2.r -s --error \
        brms \
        cowplot \
        reticulate \
        rstan \
        styler \
        && \
    # R packages from GitHub
    installGithub.r \
        crsh/papaja@0b4a9a79 \
        && \
    # LaTeX packages
    tlmgr update --self && \
    tlmgr install \
        amsmath \
        apa7 \
        auxhook \
        bigintcalc \
        bitset \
        booktabs \
        caption \
        csquotes \
        endfloat \
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
        ltxcmds \
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
        && \
    # Set some startup options
    mkdir .R && \
    echo "CXX14=clang++" >> .R/Makevars && \
    echo "CXX14FLAGS=-O3 -march=native -mtune=native -fPIC" >> .R/Makevars && \
    echo 'options(mc.cores = parallel::detectCores() - 1)' >> .Rprofile && \
    echo 'rstan::rstan_options(auto_write = TRUE)' >> .Rprofile && \
    echo 'knitr::opts_knit$set(root.dir = getwd())' >> .Rprofile && \
    chown -R ${NB_USER} .

# Switch back to default user
USER ${NB_USER}
ARG ${NB_USER}
ARG ${NB_UID}
