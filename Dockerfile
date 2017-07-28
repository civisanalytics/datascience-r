FROM ubuntu:16.04
MAINTAINER dsrd@civisanalytics.com

RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

ENV R_VERSION 3.4.0

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --no-install-recommends && \
    apt-get install -y --no-install-recommends \
        libssl-dev \
        libcurl4-openssl-dev \
        libssh2-1-dev \
        locales \
        pandoc \
        default-jdk \
        libxml2-dev \
        curl \
        python3 && \
    apt-get install -y \
        r-base-core=${R_VERSION}* \
        r-base-dev=${R_VERSION}* \
        r-recommended=${R_VERSION}* && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make unicode works by setting locale environment variables.
# Note: the update-locale command is probably not necessary since it only
# affects fresh logins but is probably worth including for consistency with the
# environment locale set in the next command.
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# tuck the python client here just in case
COPY ./requirements-python.txt /requirements-python.txt
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    pip3 install -r requirements-python.txt && \
    rm -rf ~/.cache/pip && \
    rm -f get-pip.py

RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /etc/R/Rprofile.site
COPY ./requirements.txt /requirements.txt
RUN Rscript -e "packages <- readLines('/requirements.txt'); install.packages(packages)"
