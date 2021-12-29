FROM openjdk:17-buster as cc

RUN apt-get update -y
RUN apt-get install -y git ca-certificates wget zip unzip

ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8 -Djdk.lang.Process.launchMechanism=vfork

# Install Gradle
RUN wget https://downloads.gradle-dn.com/distributions/gradle-7.3.2-bin.zip
RUN unzip gradle-7.3.2-bin.zip
ENV GRADLE_HOME /gradle-7.3.2
ENV PATH $PATH:/gradle-7.3.2/bin
ENV GRADLE_OPTS=-Dorg.gradle.daemon=false

RUN git clone https://github.com/linkedin/cruise-control.git
RUN cd cruise-control && gradle --stacktrace --scan jar

RUN mv -v /cruise-control/cruise-control/build/libs/cruise-control-*.jar /cruise-control/cruise-control/build/libs/cruise-control.jar
RUN mv -v /cruise-control/cruise-control/build/dependant-libs/cruise-control-metrics-reporter-*.jar /cruise-control/cruise-control/build/dependant-libs/cruise-control-metrics-reporter.jar

FROM node:14-buster as ui
RUN mkdir /src && cd /src && git clone https://github.com/linkedin/cruise-control-ui.git
WORKDIR /src/cruise-control-ui
RUN git fetch origin
RUN git checkout master
RUN git pull
RUN git rev-parse HEAD
RUN npm install
RUN npm run build

FROM openjdk:17-slim

ENV USER=kafka \
    GROUP=kafka \
    UID=1001 \
    GID=1001

RUN mkdir -p /opt/cruise-control /opt/cruise-control/cruise-control-ui

COPY --from=cc /cruise-control/cruise-control/build/libs/cruise-control.jar /opt/cruise-control/cruise-control/build/libs/cruise-control.jar
COPY --from=cc /cruise-control/config /opt/cruise-control/config
COPY --from=cc /cruise-control/kafka-cruise-control-start.sh /opt/cruise-control/
COPY --from=cc /cruise-control/cruise-control/build/dependant-libs /opt/cruise-control/cruise-control/build/dependant-libs
COPY --from=ui /src/cruise-control-ui/dist /opt/cruise-control/cruise-control-ui/dist
RUN echo "local,localhost,/kafkacruisecontrol" > /opt/cruise-control/cruise-control-ui/dist/static/config.csv

RUN addgroup --system --gid $GID $GROUP
RUN adduser --system --uid $UID -gid $GID --home /home/$USER --disabled-password $USER

RUN chown -R $USER:$GROUP /opt/cruise-control

RUN chmod 777 -R /opt/cruise-control/

WORKDIR /opt/cruise-control/

USER kafka