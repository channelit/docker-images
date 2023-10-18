FROM centos as build

ENV FULL_VERSION=0.29.0 \
	MAJOR_VERSION=0.29

RUN mkdir -p /opt/ksql
RUN curl -sq http://ksqldb-packages.s3.amazonaws.com/archive/$MAJOR_VERSION/archive.key | gpg --import && \
	curl http://ksqldb-packages.s3.amazonaws.com/archive/$MAJOR_VERSION/confluent-ksqldb-$FULL_VERSION.tar.gz --output confluent-ksqldb-$FULL_VERSION.tar.gz && \
	curl http://ksqldb-packages.s3.amazonaws.com/archive/$MAJOR_VERSION/confluent-ksqldb-$FULL_VERSION.tar.gz.asc --output confluent-ksqldb-$FULL_VERSION.tar.gz.asc && \
	gpg --verify confluent-ksqldb-$FULL_VERSION.tar.gz.asc confluent-ksqldb-$FULL_VERSION.tar.gz && \
	tar xvf confluent-ksqldb-$FULL_VERSION.tar.gz --strip-components=1 -C /opt/ksql

FROM openjdk:11-slim

ENV USER=ksql \
	GROUP=ksql \
	UID=1001 \
	GID=1001

COPY --from=build /opt/ksql /opt/ksql

RUN addgroup --system --gid $GID $GROUP
RUN adduser --system --uid $UID -gid $GID --home /home/$USER --disabled-password $USER

RUN chown -R $USER:$GROUP /opt/$USER

USER $USER

EXPOSE 8088