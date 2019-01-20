FROM openjdk:11-slim

RUN groupadd -r --gid 7474 neo4j && \
    useradd -r --uid 7474 --gid 7474 neo4j

RUN apt-get update && \
    apt-get -y install lsof procps wget gpg && \
    rm -rf /var/lib/apt/lists/*

ENV NEO4J_TARBALL=neo4j-community-3.5.1-unix.tar.gz \
    NEO4J_EDITION=community \
    NEO4J_URI=http://dist.neo4j.org/neo4j-community-3.5.1-unix.tar.gz \
    NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    NEO4J_dbms_tx__log_rotation_retention__policy=100M \
    NEO4J_dbms_memory_pagecache_size=512M \
    NEO4J_dbms_memory_heap_initial__size=512M \
    NEO4J_dbms_memory_heap_max__size=512M \
    NEO4J_dbms_connectors_default__listen__address=0.0.0.0 \
    NEO4J_dbms_connector_http_listen__address=0.0.0.0:7474 \
    NEO4J_dbms_connector_https_listen__address=0.0.0.0:7473 \
    NEO4J_dbms_connector_bolt_listen__address=0.0.0.0:7687 \
    NEO4J_ha_host_coordination=0.0.0.0:5001 \
    NEO4J_ha_host_data=0.0.0.0:6001 \
    NEO4J_causal__clustering_discovery__listen__address=0.0.0.0:5000 \
    NEO4J_causal__clustering_discovery__advertised__address=0.0.0.0:5000 \
    NEO4J_causal__clustering_transaction__listen__address=0.0.0.0:6000 \
    NEO4J_causal__clustering_transaction__advertised__address=0.0.0.0:6000 \
    NEO4J_causal__clustering_raft__listen__address=0.0.0.0:7000 \
    NEO4J_causal__clustering_raft__advertised__address=0.0.0.0:7000

RUN apt-get install -y wget \
    && wget -q ${NEO4J_URI} \
    && tar --extract --file ${NEO4J_TARBALL} --directory /var/lib \
    && mv /var/lib/neo4j-* /var/lib/neo4j \
    && rm ${NEO4J_TARBALL} \
    && mv /var/lib/neo4j/data /data \
    && chown -R neo4j:neo4j /data \
    && chmod -R 777 /data \
    && chown -R neo4j:neo4j /var/lib/neo4j \
    && chmod -R 777 /var/lib/neo4j \
    && ln -s /data /var/lib/neo4j/data \
    && wget -q https://raw.githubusercontent.com/channelit/docker-images/master/neo4j/neo4j-entrypoint.sh -O /neo4j-entrypoint.sh \
    && chmod 755 /neo4j-entrypoint.sh

ENV PATH /var/lib/neo4j/bin:$PATH

WORKDIR /var/lib/neo4j

VOLUME /data

EXPOSE 7474 7473 7687

ENTRYPOINT ["/neo4j-entrypoint.sh", "neo4j", "console"]

CMD ["neo4j"]