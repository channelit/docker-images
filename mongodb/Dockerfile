FROM ubuntu:20.04

MAINTAINER Channel IT Services, LLC

ARG arch_type=amd

ENV MONGO_VERSION=$mongo_version \
    MONGO_DOWNLOAD_URL="https://repo.mongodb.org/apt/ubuntu/dists/focal/mongodb-org/7.0/multiverse/binary-${arch_type}64/mongodb-org-server_7.0.1_${arch_type}64.deb"

RUN apt update
RUN apt upgrade
RUN apt install curl -y
RUN echo $MONGO_DOWNLOAD_URL
RUN curl $MONGO_DOWNLOAD_URL -o /mongo.deb
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install tzdata
RUN dpkg -i /mongo.deb

ENV USER=mongo \
    GROUP=mongo \
    UID=27017 \
    GID=27017

RUN groupadd -r -g $GID $GROUP
RUN useradd -r -u $UID -g $USER -m -d /opt/$USER -s /bin/bash $USER

#USER $USER
