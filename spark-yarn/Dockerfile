FROM cithub/hadoop
MAINTAINER Channel IT Services, LLC

ENV SPRK_VER=2.1.1-bin-hadoop2.7
ENV SPARK_HOME=/home/hadoop/spark
ENG YARN_CONF_DIR=/home/hadoop/hadoop/etc/hadoop

RUN\
	mkdir -p $SPARK_HOME &&\
	wget https://d3kbcqa49mib13.cloudfront.net/spark-$SPRK_VER.tgz &&\
	tar xzvf spark-$SPRK_VER.tgz &&\
	mv spark-$SPRK_VER $SPARK_HOME &&\
	rm spark-$SPRK_VER.tgz &&\
	cd $SPARK_HOME
RUN\
	mkdir /data/spark

EXPOSE 50030
VOLUME	/data