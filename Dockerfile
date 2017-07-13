FROM ubuntu:16.04
MAINTAINER dsrd@civisanalytics.com

RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

ENV R_VERSION 3.3.3

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    apt-get install -y \
        libssl-dev \
        libcurl4-openssl-dev \
        libssh2-1-dev \
        pandoc \
        default-jdk \
        libxml2-dev \
        r-base-core=${R_VERSION}* \
        r-base-dev=${R_VERSION}* \
        r-recommended=${R_VERSION}*

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# tuck the python client here just in case people want it
RUN export LC_ALL=C.UTF-8 && export LANG=C.UTF-8
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    pip3 install -q civis && \
    rm -rf ~/.cache/pip && \
    rm -f get-pip.py

RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /etc/R/Rprofile.site

COPY ./requirements.txt /requirements.txt
RUN Rscript -e "packages <- readLines('/requirements.txt'); install.packages(packages)"
