FROM gcr.io/tensorflow/tensorflow:latest-py3
WORKDIR /
RUN \
	pip3 install jupyter &&\
	pip3 uninstall ipython -y &&\
	pip3 install ipython &&\
	pip3 install spaCy &&\
	pip3 install pyLDAvis scipy gensim nltk bokeh py4j &&\
	pip3 install -U scikit-learn &&\
	pip3 install keras &&\
	pip3 install queue &&\
	apt-get update && \
	apt-get clean && \
 	mkdir /opt/logs && \
	touch start.sh && \
	chmod 755 start.sh && \
	echo "#!/bin/sh" >> start.sh && \
	echo "nohup tensorboard --logdir=/data/logs > tb.out & nohup ./run_jupyter.sh >jupyter.out &" >> start.sh && \
	echo "tail -f jupyter.out" >> start.sh
EXPOSE ls
ls 8888
CMD ["./start.sh"]