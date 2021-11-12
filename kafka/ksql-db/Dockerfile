FROM centos as build

ENV FULL_VERSION=0.21.0 \
	MAJOR_VERSION=0.21

RUN mkdir -p /opt/ksql
RUN curl -sq http://ksqldb-packages.s3.amazonaws.com/archive/$MAJOR_VERSION/archive.key | gpg --import && \
	curl http://ksqldb-packages.s3.amazonaws.com/archive/$MAJOR_VERSION/confluent-ksqldb-$FULL_VERSION.tar.gz --output confluent-ksqldb-$FULL_VERSION.tar.gz && \
	curl http://ksqldb-packages.s3.amazonaws.com/archive/$MAJOR_VERSION/confluent-ksqldb-$FULL_VERSION.tar.gz.asc --output confluent-ksqldb-$FULL_VERSION.tar.gz.asc && \
	gpg --verify confluent-ksqldb-$FULL_VERSION.tar.gz.asc confluent-ksqldb-$FULL_VERSION.tar.gz && \
	tar -xf confluent-ksqldb-$FULL_VERSION.tar.gz -C /opt/ksql

FROM openjdk:18-alpine

ENV USER=ksql \
	GROUP=ksql \
	UID=1001 \
	GID=1001

COPY --from=build /opt/ksql /opt/ksql

RUN addgroup -g $GID $GROUP
RUN adduser -u $UID -G $GROUP -h /home/$USER -D $USER

RUN chown -R $USER:$GROUP /opt/$USER

USER $USER

EXPOSE 8088