FROM rocker/binder:4.0.3

# Set environment variables
ENV HOME="/home/${NB_USER}" \
    RSTUDIO_VERSION="1.2.5042" \
    RETICULATE_MINICONDA_ENABLED="FALSE"

# Make sure we're in the user's home directory
WORKDIR ${HOME}

# Switch to root user
USER root

# Install everything
RUN echo "options(mc.cores = parallel::detectCores())" >> .Rprofile \
    # Install RStudio
    && /rocker_scripts/install_rstudio.sh \
    # Install system packages
    && apt-get install -y --no-install-recommends \
        clang \
    # Install R packages from CRAN (MRAN, really)
    && install2.r --error --skipinstalled \
        afex \
        bayestestR \
        brms \
        buildmer \
        cowplot \
        dfoptim \
        emmeans \
        furrr \
        kableExtra \
        languageserver \
        lmerTest \
        magick \
        pbkrtest \
        performance \
        reticulate \
        styler \
    # Install R packages from GitHub
    && installGithub.r \
        crsh/papaja@0b4a9a79 \
        stan-dev/cmdstanr@3233585 \
    # Install cmdstan
    && mkdir -p "${HOME}/.cmdstanr" \
    && Rscript -e "cmdstanr::install_cmdstan(dir = '${HOME}/.cmdstanr')" \
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
    # Add startup options for R
    && echo 'knitr::opts_knit$set(root.dir = getwd())' >> .Rprofile \
    # Provide default user permissions
    && chown -R ${NB_USER} ${HOME}

# Switch back to default user
USER ${NB_USER}
