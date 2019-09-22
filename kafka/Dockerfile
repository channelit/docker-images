  
FROM openjdk:13-slim

ARG kafka_version=2.3.0
ARG scala_version=2.12

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_HOME=/opt/kafka \
    GLIBC_VERSION=$glibc_version

ENV PATH=${PATH}:${KAFKA_HOME}/bin

RUN apt-get update && \
    apt-get -y install wget

RUN mkdir -p /opt/kafka && \
	wget -nv http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz  -O /opt/kafka.tgz && \
    tar -C /opt/kafka --extract --file /opt/kafka.tgz --strip-components=1 && \
    rm /opt/kafka.tgz*

EXPOSE 2181 9092