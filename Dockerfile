FROM alexenge/r_basics:4.0.5

USER root

RUN installGithub.r crsh/papaja@0b4a9a79 \
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
    && echo 'knitr::opts_knit$set(root.dir = getwd())' >> .Rprofile \
    && chown -R "${NB_USER}" "${HOME}"

USER "${NB_USER}"
