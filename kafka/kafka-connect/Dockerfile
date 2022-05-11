FROM centos as build

ARG kafka_version=3.1.0
ARG scala_version=2.13

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_HOME=/opt/kafka \
    DOWNLOAD_SITE=https://dlcdn.apache.org \
    GLIBC_VERSION=$glibc_version

RUN mkdir -p /opt/kafka
RUN curl $DOWNLOAD_SITE/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz  -o /opt/kafka.tgz
RUN tar -C /opt/kafka --extract --file /opt/kafka.tgz --strip-components=1
RUN rm /opt/kafka.tgz*

RUN yum install unzip -y

RUN mkdir -p /connectors  && \
    curl -nv https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/1.5.2.Final/debezium-connector-postgres-1.5.2.Final-plugin.tar.gz -o /connectors/debezium.tar.gz &&\
    tar -C /connectors --extract --file /connectors/debezium.tar.gz --strip-components=1 && \
    rm /connectors/debezium.tar.gz


RUN curl -nv https://d1i4a15mxbxib1.cloudfront.net/api/plugins/confluentinc/kafka-connect-elasticsearch/versions/11.0.5/confluentinc-kafka-connect-elasticsearch-11.0.5.zip -o /connectors/es.zip &&\
    unzip /connectors/es.zip &&\
    rm /connectors/es.zip &&\
    mv /confluentinc-kafka-connect-elasticsearch-11.0.5/lib/* /connectors/. &&\
    rm -rf /confluentinc-kafka-connect-elasticsearch-11.0.5

RUN curl -nv https://d1i4a15mxbxib1.cloudfront.net/api/plugins/confluentinc/kafka-connect-json-schema-converter/versions/7.0.1/confluentinc-kafka-connect-json-schema-converter-7.0.1.zip -o /connectors/confluentinc-kafka-connect-json-schema-converter-7.0.1.zip &&\
    unzip /connectors/confluentinc-kafka-connect-json-schema-converter-7.0.1.zip &&\
    rm /connectors/confluentinc-kafka-connect-json-schema-converter-7.0.1.zip &&\
    mv /confluentinc-kafka-connect-json-schema-converter-7.0.1/lib/* /connectors/. &&\
    rm -rf /confluentinc-kafka-connect-json-schema-converter-7.0.1


FROM openjdk:18-slim

ENV USER=kafka \
    GROUP=kafka \
    UID=1001 \
    GID=1001

COPY --from=build /opt/kafka /opt/kafka
COPY --from=build /connectors /connectors

RUN addgroup --system --gid $GID $GROUP
RUN adduser --system --uid $UID -gid $GID --home /home/$USER --disabled-password $USER

RUN chown -R $USER:$GROUP /opt/$USER /connectors

RUN apt update -y
RUN apt install curl -y

USER $USER