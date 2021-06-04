  
FROM openjdk:16-slim

ARG kafka_version=2.8.0
ARG scala_version=2.13

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

RUN mkdir -p /connectors  && \
    wget -nv https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/1.5.2.Final/debezium-connector-postgres-1.5.2.Final-plugin.tar.gz -O /connectors/debezium.tar.gz &&\
    tar -C /connectors --extract --file /connectors/debezium.tar.gz --strip-components=1 && \
    rm /connectors/debezium.tar.gz

RUN groupadd kafka &&\
    useradd -g kafka kafka


RUN chown -R kafka:kafka /opt/kafka /connectors && \
    chmod +x ./opt/kafka/bin/connect-distributed.sh

USER kafka


CMD ["./opt/kafka/bin/kafka-server-start.sh", "/conf/server.properties"]

EXPOSE 2181 9092