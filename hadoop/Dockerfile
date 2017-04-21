FROM cithub/ubuntu
MAINTAINER Channel IT Services, LLC
ENV\
	HADOOP_VER=2.8.0
	HADOOP_HOME=/usr/local/hadoop
	HADOOP_OPTS=-Djava.library.path=/usr/local/hadoop/lib/native
	PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
RUN\
	wget http://mirrors.ocf.berkeley.edu/apache/hadoop/common/hadoop-$HADOOP_VER/hadoop-$HADOOP_VER.tar.gz &&\
	tar xzvf hadoop-$HADOOP_VER.tar.gz &&\
	rm hadoop-$HADOOP_VER.tar.gz

RUN\
	mv hadoop-$HADOOP_VER /usr/local/hadoop &&\
    	mkdir -p /usr/local/hadoop/logs &&\
	wget https://github.com/channelit/docker-images/blob/master/hadoop/core-site.xml -P $HADOOP_HOME/etc/hadoop &&\
	wget https://github.com/channelit/docker-images/blob/master/hadoop/hdfs-site.xml -P $HADOOP_HOME/etc/hadoop &&\
	wget https://github.com/channelit/docker-images/blob/master/hadoop/maprd-site.xml -P $HADOOP_HOME/etc/hadoop &&\
	wget https://github.com/channelit/docker-images/blob/master/hadoop/yarn-site.xml -P $HADOOP_HOME/etc/hadoop &&\
	mkdir -p /data/dfs/data /data/dfs/name /data/dfs/namesecondary &&\
    	hdfs namenode -format
	
VOLUME /data

ADD start-yarn.sh /usr/local/bin/start-yarn.sh

EXPOSE 9000 50070 50010 50020 50075 50090
CMD ["hdfs"]
