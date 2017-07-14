FROM cithub/ubuntu
MAINTAINER hpatel@channelit.biz
RUN apt-get update
RUN apt-get install -y vim curl wget monit python-simplejson
RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible
RUN touch start.sh &&\
	echo "#!/usr/bin/env bash" >> start.sh &&\
	echo "export ANSIBLE_HOST_KEY_CHECKING=False" &&\
	echo "monit -I" >> start.sh &&\
	chmod 755 start.sh