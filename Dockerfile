FROM alexenge/r_basics:4.4.1

USER root

RUN \
    # Install R packages from MRAN
    install2.r --error --skipinstalled \
    arrow \
    # Install R packages from GitHub
    && installGithub.r \
    alexenge/eegUtils \
    alexenge/erpcore \
    # Install Python packages
    && pip3 install --no-cache-dir \
    h5io \
    h5py \
    mne==1.8.0 \
    hu-neuro-pipeline==0.9.0 \
    # Add default user permissions
    && chown -R $NB_USER $HOME

USER $NB_USER
