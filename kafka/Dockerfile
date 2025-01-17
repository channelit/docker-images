FROM centos as build

ARG kafka_version=3.9.0
ARG scala_version=2.13

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_HOME=/opt/kafka \
    DOWNLOAD_SITE=https://downloads.apache.org \
    GLIBC_VERSION=$glibc_version

RUN mkdir -p /opt/kafka
RUN curl $DOWNLOAD_SITE/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz  -o /opt/kafka.tgz
RUN tar -C /opt/kafka --extract --file /opt/kafka.tgz --strip-components=1

FROM openjdk:24-slim

ENV USER=kafka \
    GROUP=kafka \
    UID=1001 \
    GID=1001

COPY --from=build /opt/kafka /opt/kafka

RUN addgroup --system --gid $GID $GROUP
RUN adduser --system --uid $UID -gid $GID --home /home/$USER --disabled-password $USER

RUN chown -R $USER:$GROUP /opt/$USER

USER $USER