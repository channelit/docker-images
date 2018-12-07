FROM ubuntu:16.04
MAINTAINER hpatel@channelit.biz

ENV	MESOS_VER="1.7.0" \
	MARATHON_VER="1.5.1" \
 	M_USER="dcos"


RUN apt-get update
RUN apt-get install -y tar wget git

RUN wget http://www.apache.org/dist/mesos/$MESOS_VER/mesos-$MESOS_VER.tar.gz
RUN tar -zxf mesos-$MESOS_VER.tar.gz
RUN wget http://downloads.mesosphere.com/marathon/v$MARATHON_VER/marathon-$MARATHON_VER.tgz
RUN tar -xzf marathon-$MARATHON_VER.tgz