FROM cithub/ubuntu

ENV\
	FUSION_VER=3.1.5 \
	APP_USER=fusion \
	APP_GROUP=fusion \
	APP_HOME=/opt/lucidworks/fusion

RUN\
	apt-get update &&\
	apt-get install scala -y &&\
	apt-get clean &&\
	wget https://download.lucidworks.com/fusion-$FUSION_VER/fusion-$FUSION_VER.tar.gz &&\
	tar xzvf fusion-$FUSION_VER.tar.gz
RUN\
	mkdir -p $APP_HOME &&\
	mv fusion/$FUSION_VER $APP_HOME &&\
	cd $APP_HOME &&\
	chmod -R 777 . &&\
	useradd -ms /bin/bash $APP_USER &&\
	usermod -aG $APP_GROUP $APP_USER &&\
	usermod -aG sudo $APP_USER &&\
	chown -R $APP_USER:$APP_GROUP $APP_HOME
RUN\
	wget -q https://raw.githubusercontent.com/channelit/docker-images/master/lwfusion/conf/fusion.properties -O $APP_HOME/$FUSION_VER/conf/fusion.properties

WORKDIR $APP_HOME
USER $APP_USER

EXPOSE 9983 8983 8765 8984 8764