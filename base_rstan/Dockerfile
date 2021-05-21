FROM rocker/binder:4.0.3

# Set environment variables
ENV RSTUDIO_VERSION=1.2.5042 \
    RETICULATE_MINICONDA_ENABLED=FALSE

# Switch to root user
USER root

# Install RStudio
RUN /rocker_scripts/install_rstudio.sh \
    # Install system packages
    && apt-get install -y --no-install-recommends \
        clang \
        clang-9 \
        libclang-dev \
        libglpk-dev \
        libnlopt-dev \
    # Install R packages from CRAN (MRAN, really)
    && install2.r -s --error \
        afex \
        bayestestR \
        brms \
        cowplot \
        dfoptim \
        emmeans \
        furrr \
        languageserver \
        lmerTest \
        magick \
        pbkrtest \
        reticulate \
        rstan \
        styler \
    # Install R packages from GitHub
    && installGithub.r \
        crsh/papaja@0b4a9a79 \
    # Install Python packages
    && pip3 install --no-cache-dir \
        notebook \
    # Install LaTeX packages
    && tlmgr update --self \
    && tlmgr install \
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
    # Set some startup options
    && echo "" > .Rprofile \
    && echo 'options(mc.cores = parallel::detectCores() - 1)'        >> .Rprofile \
    && echo 'rstan::rstan_options(auto_write = TRUE)'                >> .Rprofile \
    && echo 'knitr::opts_knit$set(root.dir = getwd())'               >> .Rprofile \
    && mkdir .R \
    && echo "" > .R/Makevars \
    && echo "CXX=clang++-9"                                          >> .R/Makevars \
    && echo "CXXFLAGS=-Os -mtune=native -march=native"               >> .R/Makevars \
    && echo "CXXFLAGS+= -Wno-unused-variable -Wno-unused-function"   >> .R/Makevars \
    && echo "CXXFLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined"   >> .R/Makevars \
    && echo "CXX14=clang++-9"                                        >> .R/Makevars \
    && echo "CXX14FLAGS=-Os -mtune=native -march=native"             >> .R/Makevars \
    && echo "CXX14FLAGS+= -Wno-unused-variable -Wno-unused-function" >> .R/Makevars \
    && echo "CXX14FLAGS+= -Wno-unknown-pragmas -Wno-macro-redefined" >> .R/Makevars \
    # Add user permissions
    && chown -R ${NB_USER} .

# Switch back to default user
USER ${NB_USER}
