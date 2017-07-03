FROM cithub/hadoop
MAINTAINER Channel IT Services, LLC

ENV SPARK_VER=2.1.1-bin-hadoop2.7
ENV SPARK_HOME=/home/hadoop/spark
ENV YARN_CONF_DIR=/home/hadoop/hadoop/etc/hadoop

RUN\
	apt-get install python -y &&\
	apt-get update &&\
	mkdir -p $SPARK_HOME &&\
	wget https://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VER.tgz &&\
	tar xzvf spark-$SPARK_VER.tgz &&\
	mv spark-$SPARK_VER $SPARK_HOME &&\
	rm spark-$SPARK_VER.tgz &&\
	ln -s /home/hadoop/spark/spark-$SPARK_VER /home/hadoop/spark/spark
RUN\
	mkdir /data/spark

EXPOSE 50030
VOLUME	/data