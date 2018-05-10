FROM ubuntu:18.04
MAINTAINER Channel IT Services, LLC
ENV\
	DEBIAN_FRONTEND=noninteractive
RUN\
	apt-get update &&\
	apt-get install -y vim curl sudo wget openssh-server openssh-client rsync default-jdk ntp &&\
	apt-get update &&\
	apt-get clean &&\
	apt-get install software-properties-common -y &&\
	add-apt-repository ppa:webupd8team/java -y &&\
	echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections &&\
	apt install -y oracle-java9-set-default
