FROM cithub/ubuntu
MAINTAINER Channel IT Services, LLC
ENV\
	HADOOP_VER=2.8.0
RUN\
	wget http://mirrors.ocf.berkeley.edu/apache/hadoop/common/hadoop-$HADOOP_VER/hadoop-$HADOOP_VER.tar.gz &&\
	tar xzvf hadoop-$HADOOP_VER.tar.gz &&\
	rm hadoop-$HADOOP_VER.tar.gz

RUN\
	touch /etc/profile &&\
	echo "JAVA_HOME=/usr/lib/jvm/" >> /etc/profile &&\
	echo "HADOOP_HOME=<YOUR_HADOOP_PACKAGE_PATH>" >> /etc/profile &&\
	echo "HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> /etc/profile &&\
	echo "PATH=$HADOOP_HOME/bin:$PATH" >> /etc/profile &&\
	echo "CLASSPATH=$HADOOP_HOME/lib:$CLASSPATH" >> /etc/profile