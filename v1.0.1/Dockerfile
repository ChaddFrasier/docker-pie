# Version 1.0.1
# Build with non-root user for extra security
FROM ubuntu:18.04
LABEL maintainer="cfrasier@contractor.usgs.gov"

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PIEROOT=/usr/src/PIE \
    PATH=/opt/conda/bin:$PATH

# install dependencies
RUN apt-get update &&\
    apt-get install -y software-properties-common \
                        wget \
                        bzip2 \
                        ca-certificates \
                        curl \
                        git \
                        rsync \
                        git \
                        wget \
                        libgl1-mesa-glx \
                        ca-certificates \
                        libglib2.0-0 \
                        libxext6 \
                        libsm6 \
                        libxrender1 \
                        nodejs \
                        npm  &&\
    add-apt-repository ppa:ubuntugis/ppa && apt-get update && apt-get install -y gdal-bin &&\
    npm cache clean -f && npm install -g n && n stable &&\
    rm -rf /var/lib/apt/lists/* &&\
    groupadd -r piegroup && useradd --no-log-init -r -g piegroup pieuser

# install miniconda and server code
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    conda update -n base -c defaults conda && conda init bash && bash && \
    conda create -n isis python=3.6 &&\
    git clone https://github.com/ChaddFrasier/PIE.git ${PIEROOT} &&\
    cd ${PIEROOT} && npm install --only=prod

# install ISIS 3.10.2 using conda and init isis env
SHELL [ "conda", "run", "-n", "isis", "/bin/bash", "-c" ]
RUN conda config --env --add channels conda-forge && \
    conda config --env --add channels usgs-astrogeology && \
    conda install -c usgs-astrogeology isis=3.10.2 && python $CONDA_PREFIX/scripts/isis3VarInit.py &&\
    rsync -azv --delete --partial --exclude="testData" isisdist.astrogeology.usgs.gov::isis3data/data/base /opt/conda/envs/isis/data

# set run dir and go
USER pieuser
WORKDIR ${PIEROOT}
ENTRYPOINT [ "conda", "run", "-n", "isis", "npm", "start"]