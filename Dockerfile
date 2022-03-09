FROM alexenge/r_basics:4.1.2

USER root

RUN \
    # Install R packages from MRAN
    install2.r --error --skipinstalled \
    arrow \
    # Install R packages from GitHub
    && installGithub.r \
    craddm/eegUtils@v0.7.0 \
    # Install Python packages
    && pip3 install --no-cache-dir \
    h5py==3.6.0 \
    mne==0.24.1 \
    hu-neuro-pipeline==0.3.1 \
    # Add default user permissions
    && chown -R "$NB_USER" "$HOME"

USER "$NB_USER"
