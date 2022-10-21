FROM tensorflow/tensorflow:latest
WORKDIR /
RUN \
	apt-get update &&\
	pip3 install spacy &&\
	pip3 install pyLDAvis scipy nltk bokeh &&\
	pip3 install -U scikit-learn &&\
	pip3 install keras &&\
	pip3 install numpy networkx gensim django pandas &&\
	apt-get clean
RUN \
	python -m nltk.downloader all &&\
	python -m spacy download en
EXPOSE 6006 8888