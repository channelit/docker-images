FROM openjdk:17-buster as cc

RUN apt-get update -y
RUN apt-get install -y git ca-certificates wget zip unzip

ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8

# Install Gradle
RUN wget https://downloads.gradle-dn.com/distributions/gradle-7.3.2-bin.zip
RUN unzip gradle-7.3.2-bin.zip
ENV GRADLE_HOME /gradle-7.3.2
ENV PATH $PATH:/gradle-7.3.2/bin
ENV GRADLE_OPTS=-Dorg.gradle.daemon=false

RUN git clone https://github.com/linkedin/cruise-control.git
RUN cd cruise-control && ./gradlew jar

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

RUN mkdir -p /opt/cruise-control /opt/cruise-control/cruise-control-ui

COPY --from=cc /cruise-control/cruise-control/build/libs/cruise-control.jar /opt/cruise-control/cruise-control/build/libs/cruise-control.jar
COPY --from=cc /cruise-control/config /opt/cruise-control/config
COPY --from=cc /cruise-control/kafka-cruise-control-start.sh /opt/cruise-control/
COPY --from=cc /cruise-control/cruise-control/build/dependant-libs /opt/cruise-control/cruise-control/build/dependant-libs
COPY --from=ui /src/cruise-control-ui/dist /opt/cruise-control/cruise-control-ui/dist
RUN echo "local,localhost,/kafkacruisecontrol" > /opt/cruise-control/cruise-control-ui/dist/static/config.csv

EXPOSE 8090

CMD [ "/opt/cruise-control/start.sh" ]