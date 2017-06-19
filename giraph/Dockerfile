FROM cithub/hadoop
MAINTAINER Channel IT Services, LLC
USER hadoop
ENV\
	GIRAPH_VER=1.2.0
RUN\
	wget http://apache.mirrors.lucidnetworks.net/giraph/giraph-$GIRAPH_VER/giraph-dist-$GIRAPH_VER-bin.tar.gz &&\
	tar xzvf giraph-dist-$GIRAPH_VER-bin.tar.gz &&\
	rm giraph-dist-$GIRAPH_VER-bin.tar.gz