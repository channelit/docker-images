FROM centos as build

ARG solr_version=9.0.0

ENV SOLR_VERSION=$solr_version \
    SOLR_HOME=/opt/solr \
    SOLR_LOGS_DIR=/solr_logs \
    SOLR_DATA_HOME=/solr_data \
    SOLR_CONF=/solr_conf \
    SOLR_DOWNLOAD_SERVER="https://dlcdn.apache.org/solr/solr" \
    PATH="/opt/solr/bin:$PATH"

RUN mkdir -p /opt/solr
RUN curl $SOLR_DOWNLOAD_SERVER/$SOLR_VERSION/solr-$SOLR_VERSION.tgz -o /opt/solr.tgz
RUN tar -C /opt/solr --extract --file /opt/solr.tgz --strip-components=1

FROM openjdk:18-slim

ENV USER=solr \
    GROUP=solr \
    UID=8983 \
    GID=8983

COPY --from=build /opt/solr /opt/solr

RUN addgroup --system --gid $GID $GROUP
RUN adduser --system --uid $UID -gid $GID --home /home/$USER --disabled-password $USER

RUN chown -R $USER:$GROUP /opt/$USER

USER $USER
