FROM openjdk:11-jre-slim
MAINTAINER  Hardik Patel "hpatel@channelit.biz"

ARG SOLR_DOWNLOAD_SERVER

RUN	apt-get update && \
	apt-get -y install lsof procps wget gpg && \
  	rm -rf /var/lib/apt/lists/*

ENV	SOLR_VER="7.5.0" \
	SOLR_USER="solr" \
 	SOLR_UID="8983" \
	SOLR_GROUP="solr" \
 	SOLR_GID="8983" \
	SOLR_VERSION="7.5.0" \
	SOLR_DOWNLOAD_SERVER="${SOLR_DOWNLOAD_SERVER:-https://apache.claz.org/lucene/solr}" \
	PATH="/opt/solr/bin:$PATH"

RUN	groupadd -r --gid $SOLR_GID $SOLR_GROUP && \
	useradd -r --uid $SOLR_UID --gid $SOLR_GID $SOLR_USER

RUN	mkdir -p /opt/solr && \
	wget -nv ${SOLR_DOWNLOAD_SERVER}/${SOLR_VER}/solr-${SOLR_VER}.tgz -O /opt/solr.tgz && \
	tar -C /opt/solr --extract --file /opt/solr.tgz --strip-components=1 && \
	rm /opt/solr.tgz* && \
	rm -Rf /opt/solr/docs

EXPOSE 8983
WORKDIR /opt/solr
USER $SOLR_USER