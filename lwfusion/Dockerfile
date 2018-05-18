FROM cithub/ubuntu
ENV\
	FUSION_VER=3.1.0
RUN\
	apt-get update &&\
	apt-get install scala -y &&\
	apt-get clean &&\
	wget https://download.lucidworks.com/fusion-$FUSION_VER/fusion-$FUSION_VER.tar.gz &&\
	tar xzvf fusion-$FUSION_VER.tar.gz