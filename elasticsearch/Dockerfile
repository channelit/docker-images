FROM ubuntu
MAINTAINER hpatel@channelit.biz
USER root
ENV\
	ES_VER=8.15.1
RUN\ 
	apt-get update &&\
	apt-get install -y wget vim nodejs tar npm default-jdk sudo &&\
	apt-get update
RUN	wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ES_VER-linux-x86_64.tar.gz elasticsearch-$ES_VER.tar.gz
RUN	tar xzvf elasticsearch-$ES_VER.tar.gz
RUN	rm elasticsearch-$ES_VER.tar.gz
RUN	ln -s elasticsearch-$ES_VER es
RUN	touch start.sh &&\
	chmod 755 start.sh &&\
	echo "#!/bin/sh" >> start.sh &&\
	echo "su - elastic -c '/es/bin/elasticsearch'" >> start.sh
RUN useradd -ms /bin/bash elastic &&\
	su - elastic &&\
	sudo chmod -R 755 /es
EXPOSE 9200 9300
ENTRYPOINT /start.sh