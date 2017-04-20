FROM ubuntu:16.04
MAINTAINER Channel IT Services, LLC
ENV\
	HADOOP_VER=2.8.0
RUN\
	apt-get update &&\
	apt-get install -y vim curl wget openssh-server openssh-client rsync default-jdk ntp &&\
	apt-get update &&\
	apt-get clean