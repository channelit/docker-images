FROM ubuntu:20.04

MAINTAINER Channel IT Services, LLC

ARG arch_type=amd \
    mongo_major_version=7.0 \
    mongo_minor_version=7.0.2

ENV MONGO_VERSION=$mongo_version \
    MONGO_DOWNLOAD_URL="https://repo.mongodb.org/apt/ubuntu/dists/focal/mongodb-org/${mongo_major_version}/multiverse/binary-${arch_type}64/mongodb-org-server_${mongo_minor_version}_${arch_type}64.deb"

ADD $MONGO_DOWNLOAD_URL /mongo.deb
RUN apt update
RUN apt upgrade
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install tzdata
RUN apt install curl -y
RUN sudo dpkg -i /mongo.deb

ENV USER=mongo \
    GROUP=mongo \
    UID=27017 \
    GID=27017

RUN groupadd -r -g $GID $GROUP
RUN useradd -r -u $UID -g $USER -m -d /opt/$USER -s /bin/bash $USER
RUN mkdir -p /data/db
RUN chown -R $UID:$UID /data/db

ENTRYPOINT  ["/bin/sh", "-c" ,"mongod --dbpath=/data/db --bind_ip_all"]

#USER $USER
