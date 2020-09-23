FROM hseeberger/scala-sbt:8u222_1.3.4_2.13.1

ENV ZK_HOSTS=localhost:2181 \
    CMAK_VERSION=3.0.0.5

RUN mkdir -p /tmp && \
    cd /tmp && \
    wget https://github.com/yahoo/CMAK/archive/${CMAK_VERSION}.tar.gz && \
    tar xxf ${CMAK_VERSION}.tar.gz && \
    cd /tmp/kafka-manager-${CMAK_VERSION} && \
    sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-${CMAK_VERSION}.zip && \
    rm -rf /tmp/${CMAK_VERSION} /tmp/CMAK-${CMAK_VERSION}

WORKDIR /CMAK-${CMAK_VERSION}

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]