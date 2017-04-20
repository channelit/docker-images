FROM ubuntu:16.04
MAINTAINER Channel IT Services, LLC
ENV\
	HADOOP_VER=2.8.0
RUN\
	apt-get update &&\
	apt-get install -y vim curl wget openssh-server openssh-client rsync default-jdk ntp &&\
	apt-get update &&\
	apt-get clean &&\
	wget http://ftp.twaren.net/Unix/Web/apache/hadoop/common/hadoop-$HADOOP_VER/hadoop-$HADOOP_VER.tar.gz &&\
	tar xzvf hadoop-$HADOOP_VER.tar.gz &&\
	rm hadoop-$HADOOP_VER.tar.gz

RUN\
	touch /etc/profile &&\
	echo "JAVA_HOME=/usr/lib/jvm/" >> /etc/profile &&\
	echo "HADOOP_HOME=<YOUR_HADOOP_PACKAGE_PATH>" >> /etc/profile &&\
	echo "HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> /etc/profile &&\
	echo "PATH=$HADOOP_HOME/bin:$PATH" >> /etc/profile &&\
	echo "CLASSPATH=$HADOOP_HOME/lib:$CLASSPATH" >> /etc/profile