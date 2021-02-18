FROM centos:7

ENV CLAM_VERSION=0.103.1

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
	./configure --enable-check --sysconfdir=/etc &&\
	make -j2 &&\
	make check


# Add clamav user
RUN adduser -S -G clamav -u 1000 clamav -h /var/lib/clamav && \
    mkdir -p /var/lib/clamav && \
    mkdir /usr/local/share/clamav && \
    chown -R clamav_user:clamav /var/lib/clamav /usr/local/share/clamav /etc/clamav

# Configure Clam AV...
#COPY --chown=clamav:clamav ./*.conf /etc/clamav/
#COPY --chown=clamav:clamav eicar.com /
#COPY --chown=clamav:clamav ./readyness.sh /

# permissions
RUN mkdir /var/run/clamav && \
    chown clamav:clamav /var/run/clamav && \
    chmod 750 /var/run/clamav

USER 1000

# initial update of av databases
RUN freshclam

EXPOSE 3310