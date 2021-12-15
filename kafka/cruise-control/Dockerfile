FROM centos as build

RUN yum install -y epel-release
RUN yum install -y java-latest-openjdk
RUN yum install -y git ca-certificates wget zip unzip

ENV JAVA_HOME /etc/alternatives/jre

RUN git clone https://github.com/linkedin/cruise-control.git
RUN cd cruise-control && ./gradlew jar copyDependantLibs

RUN mv -v /cruise-control/cruise-control/build/libs/cruise-control-*.jar \
  /cruise-control/cruise-control/build/libs/cruise-control.jar
RUN mv -v /cruise-control/cruise-control/build/dependant-libs/cruise-control-metrics-reporter-*.jar \
  /cruise-control/cruise-control/build/dependant-libs/cruise-control-metrics-reporter.jar
