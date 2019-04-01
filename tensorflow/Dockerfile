FROM tensorflow/tensorflow:latest-py3-jupyter
WORKDIR /
RUN \
	apt-get update &&\
	pip3 install spacy &&\
	pip3 install pyLDAvis scipy nltk bokeh py4j &&\
	pip3 install -U scikit-learn &&\
	pip3 install keras &&\
	pip3 install numpy networkx gensim elasticsearch django pandas &&\
	pip3 install -U gensim &&\
	pip3 install pysal geojson hdbscan folium geopandas &&\
	apt-get clean
RUN \
	python -m nltk.downloader all &&\
	python -m spacy download en
EXPOSE 6006 8888