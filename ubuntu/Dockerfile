# Base image
FROM ubuntu:18.04

# update yum
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade 

# install utils
RUN apt-get install -y \
    wget \
    less \
    vim \
    zip \
    git \
    unzip \
;

CMD ["/bin/bash"]
