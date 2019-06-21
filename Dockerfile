FROM rocker/verse:3.5.3
MAINTAINER support@civisanalytics.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --no-install-recommends && \
    apt-get install -y --no-install-recommends \
        curl \
        wget && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# tuck the python client here just in case
COPY ./requirements-python.txt /requirements-python.txt
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    pip install -r requirements-python.txt && \
    rm -rf ~/.cache/pip && \
    rm -f get-pip.py


RUN Rscript -e "devtools::install_github('civisanalytics/civis-r', ref = 'v2.0.0', upgrade_dependencies = FALSE);"

RUN Rscript -e "library(civis)"

COPY ./requirements.txt /requirements.txt
RUN Rscript -e "l = readLines('requirements.txt'); install.packages(setdiff(l, rownames(installed.packages())))"

ENV VERSION=2.8.0 \
    VERSION_MAJOR=2 \
    VERSION_MINOR=8 \
    VERSION_MICRO=0
