FROM alexenge/r_basics:4.1.2

USER root

RUN \
    # Install R packages from GitHub
    installGithub.r \
    craddm/eegUtils@v0.6.3 \
    # Install Python packages
    && pip3 install --no-cache-dir \
    mne==0.24.1 \
    hu-neuro-pipeline==0.1.0 \
    # Add default user permissions
    && chown -R "${NB_USER}" "${HOME}"

USER "${NB_USER}"
