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
    h5io==0.1.9 \
    h5py==3.9.0 \
    mne==1.6 \
    hu-neuro-pipeline==0.8.3 \
    # Add default user permissions
    && chown -R $NB_USER $HOME

USER $NB_USER
