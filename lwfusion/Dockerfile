FROM cithub/ubuntu
ENV\
	FUSION_VER=4.0.1
RUN\ 
	apt-get update &&\
	apt-get install -y wget vim nodejs tar npm default-jdk &&\
	apt-get update &&\
	npm install -g gulp &&\
	wget https://download.lucidworks.com/fusion-$FUSION_VER/fusion-$FUSION_VER.tar.gz &&\
	tar xzvf fusion-$FUSION_VER.tar.gz
EXPOSE 3000 8764 8765 8983 8984 8766 8769