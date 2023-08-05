FROM centos:7

ENV CLAM_VERSION=1.0.1

# only for centos8
RUN yum -y groupinstall "Development Tools"
RUN yum -y install epel-release
#RUN yum -y config-manager --set-enabled PowerTools
RUN yum -y update
RUN yum -y repolist

# dependencies
RUN yum install -y openssl openssl-devel libcurl-devel zlib-devel libpng-devel libxml2-devel json-c-devel bzip2-devel pcre2-devel ncurses-devel

# unit test dependencies
RUN yum install -y valgrind check check-devel

# download tar and install
RUN mkdir -p /opt/clamav
RUN curl -LSo /opt/clamav.tar.gz https://www.clamav.net/downloads/production/clamav-$CLAM_VERSION.tar.gz
RUN tar xvf /opt/clamav.tar.gz --strip-components=1 -C /opt/clamav/
RUN cd /opt/clamav &&\
	./configure --enable-check &&\
	make -j2 &&\
	make check &&\
	make install

RUN mkdir /usr/local/share/clamav
RUN cp /usr/local/etc/freshclam.conf.sample /usr/local/etc/freshclam.conf
RUN cp /usr/local/etc/clamd.conf.sample /usr/local/etc/clamd.conf

# Add clamav user
RUN groupadd clamav &&\
    useradd -g clamav -s /bin/false -c "Clam Antivirus" clamav &&\
    chown -R clamav:clamav /usr/local/share/clamav

EXPOSE 3310