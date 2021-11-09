FROM openjdk:16-alpine
MAINTAINER  Hardik Patel "hpatel@channelit.biz"

RUN	apt-get update && \
	apt-get -y install lsof procps gpg && \
	rm -rf /var/lib/apt/lists/*

ENV	KSQL_VER="8.6.2" \
	KSQL_USER="ksql" \
	KSQL_UID="8088" \
	KSQL_GROUP="ksql" \
	KSQL_GID="8088"

RUN	groupadd -r --gid $KSQL_GID $KSQL_GROUP && \
	useradd -r --uid $KSQL_UID --gid $KSQL_GID $KSQL_USER

RUN curl -sq http://ksqldb-packages.s3.amazonaws.com/archive/0.21/archive.key | gpg --import && \
	curl http://ksqldb-packages.s3.amazonaws.com/archive/0.21/confluent-ksqldb-0.21.0.tar.gz --output confluent-ksqldb-0.21.0.tar.gz && \
	curl http://ksqldb-packages.s3.amazonaws.com/archive/0.21/confluent-ksqldb-0.21.0.tar.gz.asc --output confluent-ksqldb-0.21.0.tar.gz.asc && \
	gpg --verify confluent-ksqldb-0.21.0.tar.gz.asc confluent-ksqldb-0.21.0.tar.gz && \
	tar -xf confluent-ksqldb-0.21.0.tar.gz -C /opt/ksql

RUN	chown "$KSQL_USER:$KSQL_USER" /opt/ksql

EXPOSE 8088
WORKDIR /opt/ksql
USER $KSQL_USER

CMD ["./opt/kafka/bin/kafka-server-start.sh", "/conf/server.properties"]