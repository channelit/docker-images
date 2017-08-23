FROM cithub/ubuntu

MAINTAINER CHANNEL IT SERVICES

ENV JANUSGRAPH_VERSION=0.1.1
RUN \
	apt-get install unzip -y
RUN \
	mkdir /home/janusgraph &&\
	cd /home/janusgraph &&\
	wget https://github.com/JanusGraph/janusgraph/releases/download/v$JANUSGRAPH_VERSION/janusgraph-$JANUSGRAPH_VERSION-hadoop2.zip &&\
	unzip janusgraph-$JANUSGRAPH_VERSION-hadoop2.zip -d /home/janusgraph &&\
	ln -s /home/janusgraph/janusgraph-${JANUSGRAPH_VERSION}-hadoop2 /home/janusgraph/janusgraph