FROM cithub/hadoop
MAINTAINER Channel IT Services, LLC

ENV SPARK_VER=2.1.1-bin-hadoop2.7
ENV SPARK_HOME=/home/hadoop/spark
ENV YARN_CONF_DIR=/home/hadoop/hadoop/etc/hadoop

RUN\
	apt-get update &&\
	mkdir -p $SPARK_HOME &&\
	wget https://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VER.tgz &&\
	tar xzvf spark-$SPARK_VER.tgz &&\
	mv spark-$SPARK_VER $SPARK_HOME &&\
	rm spark-$SPARK_VER.tgz &&\
	ln -s /home/hadoop/spark/spark-$SPARK_VER /home/hadoop/spark/spark
RUN\
	apt-get install python3-pip -y &&\
	apt-get install -y python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose &&\
	apt-get install -y python-dev python-pip g++ libopenblas-dev git &&\
	pip3 install --upgrade pip &&\
	pip3 install jupyter &&\
	pip3 install spaCy &&\
	pip3 install pyLDAvis scipy scipy gensim nltk bokeh &&\
	pip3 install -U scikit-learn &&\
	apt-get update &&\
	apt-get clean
EXPOSE 50030
VOLUME	/data