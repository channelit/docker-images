FROM centos as build

RUN yum install -y epel-release
RUN yum update -y
RUN yum install -y git ca-certificates wget zip unzip

# Install JAVA
RUN yum install -y java-latest-openjdk
ENV JAVA_HOME /etc/alternatives/jre_openjdk
ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF8

# Install Gradle
RUN wget https://downloads.gradle-dn.com/distributions/gradle-7.3.2-bin.zip
RUN unzip gradle-7.3.2-bin.zip
ENV GRADLE_HOME /gradle-7.3.2
ENV PATH $PATH:/gradle-7.3.2/bin
ENV GRADLE_OPTS=-Dorg.gradle.daemon=false

RUN git clone https://github.com/linkedin/cruise-control.git
RUN cd cruise-control && gradle jar

RUN mv -v /cruise-control/cruise-control/build/libs/cruise-control-*.jar \
  /cruise-control/cruise-control/build/libs/cruise-control.jar
RUN mv -v /cruise-control/cruise-control/build/dependant-libs/cruise-control-metrics-reporter-*.jar \
  /cruise-control/cruise-control/build/dependant-libs/cruise-control-metrics-reporter.jar
