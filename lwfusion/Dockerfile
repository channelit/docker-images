FROM cithub/ubuntu
ENV\
	FUSION_VER=4.0.1
RUN\ 
	apt-get update &&\
	wget https://download.lucidworks.com/fusion-$FUSION_VER/fusion-$FUSION_VER.tar.gz &&\
	tar xzvf fusion-$FUSION_VER.tar.gz
RUN\
	wget -q https://raw.githubusercontent.com/channelit/docker-images/master/lwfusion/conf/fusion.properties -O /fusion/$FUSION_VER/conf/fusion.properties &&\
	ln -s /fusion/$FUSION_VER lwfusion

ENTRYPOINT [ "./lwfusion/bin/fusion", "start"]

EXPOSE 3000 8764 8765 8983 8984 8766 8769