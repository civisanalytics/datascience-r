FROM rocker/verse:3.6.2
MAINTAINER support@civisanalytics.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --no-install-recommends && \
    apt-get install -y --no-install-recommends \
        curl \
        libudunits2-dev \
        libcairo-dev \
        libgdal-dev \
        libgeos-dev \
        libglu1-mesa-dev \
        libx11-dev \
        mesa-common-dev \
				libsodium-dev \
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

# set cran to be default backup to set MRAN repo
# RUN echo "options(repos = c(options('repos'), 'https://cran.rstudio.com/'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site

COPY ./requirements.txt /requirements.txt
RUN Rscript -e 'install.packages(readLines("requirements.txt"))'

RUN Rscript -e 'install.packages("civis")' && \
	Rscript -e "library(civis)"

ENV VERSION=3.3.0 \
    VERSION_MAJOR=3 \
    VERSION_MINOR=3 \
    VERSION_MICRO=0
