FROM ubuntu:16.04
MAINTAINER dsrd@civisanalytics.com

RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

ENV R_VERSION 3.3.1

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

RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /etc/R/Rprofile.site

COPY ./requirements.txt /requirements.txt
RUN Rscript -e "packages <- readLines('/requirements.txt'); install.packages(packages)"
