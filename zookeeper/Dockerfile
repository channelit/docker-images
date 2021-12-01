FROM openjdk:jdk-slim

RUN apt-get update && \
    apt-get -y install lsof procps wget gpg && \
    rm -rf /var/lib/apt/lists/*

ENV ZOO_VER=3.7.0 \
    ZOO_USER=zookeeper \
    ZOO_GID=2121 \
    ZOO_GROUP=zoo \
    ZOO_CONF_DIR=/opt/zookeeper/conf \
    ZOO_DATA_DIR=/data \
    ZOO_DATA_LOG_DIR=/datalog \
    ZOO_LOG_DIR=/logs \
    ZOO_PORT=2181 \
    ZOO_TICK_TIME=2000 \
    ZOO_INIT_LIMIT=5 \
    ZOO_SYNC_LIMIT=2 \
    ZOO_AUTOPURGE_PURGEINTERVAL=0 \
    ZOO_AUTOPURGE_SNAPRETAINCOUNT=3 \
    ZOO_MAX_CLIENT_CNXNS=60 \
    ZOO_STANDALONE_ENABLED=false

RUN groupadd -r --gid $ZOO_GID $ZOO_GROUP && \
    useradd -r --uid $ZOO_GID --gid $ZOO_GID $ZOO_USER && \
    mkdir -p "$ZOO_DATA_LOG_DIR" "$ZOO_DATA_DIR" "$ZOO_CONF_DIR" "$ZOO_LOG_DIR" && \
    chown "$ZOO_USER:$ZOO_GROUP" "$ZOO_DATA_LOG_DIR" "$ZOO_DATA_DIR" "$ZOO_CONF_DIR" "$ZOO_LOG_DIR"

RUN mkdir -p /opt/zookeeper && \
    wget -nv https://dlcdn.apache.org/zookeeper/zookeeper-$ZOO_VER/apache-zookeeper-$ZOO_VER-bin.tar.gz -O /opt/zookeeper/zookeeper.tar.gz && \
    tar -xzf /opt/zookeeper/zookeeper.tar.gz -C /opt/zookeeper --strip-components=1 && \
    chown -R $ZOO_USER /opt/zookeeper

RUN wget -q https://raw.githubusercontent.com/channelit/docker-images/master/zookeeper/zookeeper-entrypoint.sh -O /zookeeper-entrypoint.sh && \
	chmod 755 /zookeeper-entrypoint.sh
    
WORKDIR /opt/zookeeper/
VOLUME ["$ZOO_DATA_DIR", "$ZOO_DATA_LOG_DIR", "$ZOO_LOG_DIR"]

EXPOSE $ZOO_PORT 2888 3888

ENV PATH=$PATH:/opt/zookeeper/bin \
    ZOOCFGDIR=$ZOO_CONF_DIR

ENTRYPOINT ["/zookeeper-entrypoint.sh"]

CMD ["/opt/zookeeper/bin/zkServer.sh", "start-foreground"]
