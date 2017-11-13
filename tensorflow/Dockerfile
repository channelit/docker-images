FROM gcr.io/tensorflow/tensorflow:latest-py3
WORKDIR /
RUN \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  	add-apt-repository -y ppa:webupd8team/java && \
  	apt-get update && \
  	apt-get install -y oracle-java8-installer && \
  	rm -rf /var/lib/apt/lists/* && \
  	rm -rf /var/cache/oracle-jdk8-installer && \
	apt-get update &&\
	apt-get install software-properties-common && \
	apt-get install -y wget curl vim bash-completion unzip openssh-server && \
	echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list && \
	curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add - && \
	apt-get update && sudo apt-get install bazel && \
	apt-get update &&\
	apt-get install -y python3-numpy python3-scipy python3-matplotlib ipython3 ipython-notebook python3-pandas python3-sympy python3-nose &&\
	apt-get install -y python3-dev python3-pip g++ libopenblas-dev git &&\
	apt-get clean &&\
	ln -sf /usr/bin/python3 /usr/bin/python &&\
	pip3 install --upgrade pip &&\
	pip3 install jupyter &&\
	pip3 uninstall ipython -y &&\
	pip3 install ipython &&\
	pip3 install spaCy &&\
	pip3 install pyLDAvis scipy gensim nltk bokeh py4j &&\
	pip3 install -U scikit-learn &&\
	pip3 install https://dist.apache.org/repos/dist/dev/incubator/toree/0.2.0/snapshots/dev1/toree-pip/toree-0.2.0.dev1.tar.gz &&\
	pip3 install toree &&\
	pip3 install tensorflow &&\
	pip3 install keras &&\
	apt-get update && \
	apt-get clean && \
 	mkdir /opt/logs && \
	touch start.sh && \
	chmod 755 start.sh && \
	echo "#!/bin/sh" >> start.sh && \
	echo "nohup tensorboard --logdir=/data/logs > tb.out & nohup ./run_jupyter.sh >jupyter.out &" >> start.sh && \
	echo "tail -f jupyter.out" >> start.sh
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
EXPOSE 6006 8888
CMD ["./start.sh"]