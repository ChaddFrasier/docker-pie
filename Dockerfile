FROM ubuntu:bionic

LABEL maintainer="cfrasier@contractor.usgs.gov"

# set required environement variables
ENV PATH=/opt/conda/bin:$PATH     \
    ISIS3ROOT=/opt/conda/env/isis \
    PIEROOT=/usr/src/PIE

# install pre-reqs and windows Web fonts
RUN apt-get -y update --fix-missing            &&\
    apt install -y fontconfig                  &&\
    apt install -yy  ttf-mscorefonts-installer &&\
    apt-get -y install rsync                     \
                        git                      \
                        wget                     \
                        libgl1-mesa-glx          \
                        ca-certificates          \
                        libglib2.0-0             \
                        libxext6                 \
                        libsm6                   \
                        libxrender1              \
                        nodejs                   \
                        npm                    &&\
    # install Miniconda3 using steps found on miniconda's home docker.
    # here: https://hub.docker.com/r/continuumio/miniconda/dockerfile
    wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" &&\
    chmod +x Miniconda3-latest-Linux-x86_64.sh                                   &&\
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda                         &&\
    rm Miniconda3-latest-Linux-x86_64.sh                                         &&\
    /opt/conda/bin/conda clean -tipsy                                            &&\
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh              &&\
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc                      &&\
    echo "conda activate base" >> ~/.bashrc                                      &&\
    # update conda and initialize 'conda activate'
    . ~/.bashrc && conda init && bash && conda update -n base -c defaults conda  &&\
    # create both environments needed for PIE
    conda create -n isis python=3.6 && conda create -n gdal

# update node
RUN npm cache clean -f &&\
    fc-cache -f -v     &&\
    npm install -g n   &&\
    n stable

# force the shell to use the isis env for every 'RUN' commmand.
# see: https://pythonspeed.com/articles/activate-conda-dockerfile/
SHELL [ "conda", "run", "-n", "isis", "/bin/bash", "-c" ]
# install isis3 conda environment [could upgrade to ISIS4 eventually]
RUN conda config --env --add channels conda-forge       &&\
    conda config --env --add channels usgs-astrogeology &&\
    conda install -c usgs-astrogeology isis=3.10.2      &&\
    python $CONDA_PREFIX/scripts/isis3VarInit.py                                      
    
# install gdal on top of isis
SHELL [ "conda", "run", "-n", "gdal", "/bin/bash", "-c" ]
RUN conda config --env --add channels conda-forge                  &&\
    conda install -y gdal                                          &&\
    git clone "https://github.com/ChaddFrasier/PIE.git" ${PIEROOT} &&\
    cd ${PIEROOT} && npm install --only=prod

# Start the server on port 8080
WORKDIR ${PIEROOT}
EXPOSE 8080
CMD [ "conda", "run", "-n", "gdal", "conda", "activate", "--stack", "isis", "&&", "npm", "start" ]