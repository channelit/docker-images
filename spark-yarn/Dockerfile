FROM cithub/hadoop
MAINTAINER Channel IT Services, LLC

ENV SPARK_VER=2.1.1-bin-hadoop2.7
ENV SPARK_HOME=/home/hadoop/spark/spark
ENV SPARK_OPTS=--packages graphframes:graphframes:0.5.0-spark2.1-s_2.11
ENV YARN_CONF_DIR=/home/hadoop/hadoop/etc/hadoop

VOLUME	/data

RUN\
	apt-get update &&\
	mkdir -p /home/hadoop/spark &&\
	wget https://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VER.tgz &&\
	tar xzvf spark-$SPARK_VER.tgz &&\
	mv spark-$SPARK_VER $SPARK_HOME &&\
	rm spark-$SPARK_VER.tgz
RUN\
	apt-get install -y python3-numpy python3-scipy python3-matplotlib ipython3 ipython-notebook python3-pandas python3-sympy python3-nose &&\
	apt-get install -y python3-dev python3-pip g++ libopenblas-dev git &&\
	pip3 install --upgrade pip &&\
	pip3 install jupyter &&\
	pip3 uninstall ipython -y &&\
	pip3 install ipython &&\
	pip3 install spaCy &&\
	pip3 install pyLDAvis scipy gensim nltk bokeh &&\
	pip3 install -U scikit-learn &&\
	pip3 install https://dist.apache.org/repos/dist/dev/incubator/toree/0.2.0/snapshots/dev1/toree-pip/toree-0.2.0.dev1.tar.gz &&\
	pip3 install toree &&\
	jupyter toree install --spark_home=$SPARK_HOME --spark_opts="--packages graphframes:graphframes:0.5.0-spark2.1-s_2.11" &&\
	rm /usr/bin/python &&\
	ln -s /usr/bin/python3 /usr/bin/python &&\
	apt-get update &&\
	apt-get clean
RUN\
	wget -q https://raw.githubusercontent.com/channelit/docker-images/master/spark-yarn/firststart.sh -O /firststart.sh &&\
	chmod 755 firststart.sh

EXPOSE 8888
