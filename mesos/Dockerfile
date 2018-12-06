FROM ubuntu:16.04
MAINTAINER hpatel@channelit.biz

RUN apt-get update
RUN apt-get install -y tar wget git

RUN wget http://www.apache.org/dist/mesos/1.7.0/mesos-1.7.0.tar.gz
RUN tar -zxf mesos-1.7.0.tar.gz