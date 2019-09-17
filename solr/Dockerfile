FROM openjdk:11-slim
MAINTAINER  Hardik Patel "hpatel@channelit.biz"

ARG SOLR_DOWNLOAD_SERVER

RUN	apt-get update && \
	apt-get -y install lsof procps wget gpg && \
	rm -rf /var/lib/apt/lists/*

ENV	SOLR_VER="8.2.0" \
	SOLR_USER="solr" \
	SOLR_UID="8983" \
	SOLR_GROUP="solr" \
	SOLR_GID="8983" \
	SOLR_LOGS_DIR=/solr_logs \
	SOLR_DATA_HOME=/solr_data \
	SOLR_CONFIG=/solr_conf \
	SOLR_DOWNLOAD_SERVER="${SOLR_DOWNLOAD_SERVER:-https://apache.claz.org/lucene/solr}" \
	PATH="/opt/solr/bin:$PATH"

RUN	groupadd -r --gid $SOLR_GID $SOLR_GROUP && \
	useradd -r --uid $SOLR_UID --gid $SOLR_GID $SOLR_USER

RUN	mkdir -p /opt/solr && \
	wget -nv ${SOLR_DOWNLOAD_SERVER}/${SOLR_VER}/solr-${SOLR_VER}.tgz -O /opt/solr.tgz && \
	tar -C /opt/solr --extract --file /opt/solr.tgz --strip-components=1 && \
	rm /opt/solr.tgz* && \
	rm -Rf /opt/solr/docs && \
	rm -Rf /opt/solr/example

RUN	chown "$SOLR_USER:$SOLR_USER" /opt/solr &&\
	mkdir -p "$SOLR_LOGS_DIR" "$SOLR_DATA_HOME" "$SOLR_CONFIG" && \
	cp /opt/solr/server/solr/solr.xml $SOLR_CONFIG/ &&\
	cp -r /opt/solr/server/solr/configsets/_default $SOLR_CONFIG/

RUN	wget -q https://raw.githubusercontent.com/channelit/docker-images/master/solr/solr-entrypoint.sh -O /opt/solr/solr-entrypoint.sh && \
	chmod 755 /opt/solr/solr-entrypoint.sh

RUN	wget -q https://raw.githubusercontent.com/channelit/docker-images/master/solr/setup-certs.sh -O /opt/solr/setup-certs.sh && \
	chmod 755 /opt/solr/setup-certs.sh

RUN	wget -q https://raw.githubusercontent.com/channelit/docker-images/master/solr/setup-jks.sh -O /opt/solr/setup-jks.sh && \
	chmod 755 /opt/solr/setup-jks.sh

EXPOSE 8983
WORKDIR /opt/solr
USER $SOLR_USER