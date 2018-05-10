FROM cithub/ubuntu
ENV\
	FUSION_VER=4.0.1
RUN\ 
	apt-get update &&\
	wget https://download.lucidworks.com/fusion-$FUSION_VER/fusion-$FUSION_VER.tar.gz &&\
	tar xzvf fusion-$FUSION_VER.tar.gz

ENTRYPOINT [ "/fusion/$FUSION_VER/bin/fusion", "start" ]

EXPOSE 3000 8764 8765 8983 8984 8766 8769