FROM rocker/verse:4.0.0
MAINTAINER support@civisanalytics.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --no-install-recommends && \
    apt-get install -y --no-install-recommends \
        curl \
        libudunits2-dev \
        libcairo-dev \
        libgdal-dev \
        libgeos-dev \
        libglu1-mesa-dev \
        libsodium-dev \
        libx11-dev \
        mesa-common-dev \
        python3-pip \
        python3-setuptools \
        wget && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# tuck the python client here just in case
COPY ./requirements-python.txt /requirements-python.txt
RUN pip3 install -r requirements-python.txt && \
    rm -rf ~/.cache/pip    

COPY ./requirements.txt /requirements.txt
RUN Rscript -e 'install.packages(readLines("requirements.txt"))'

RUN Rscript -e 'install.packages("civis", repos="https://cran.rstudio.com")' && \
  Rscript -e "library(civis)"

ENV VERSION=4.0.0 \
    VERSION_MAJOR=4 \
    VERSION_MINOR=0 \
    VERSION_MICRO=0
