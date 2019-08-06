FROM python:3.7.4-slim-stretch

ADD https://raw.githubusercontent.com/channelit/docker-images/master/locust/requirements.txt /tmp/requirements.txt

RUN pip install --requirement /tmp/requirements.txt

COPY requirements.txt /tmp/

EXPOSE 5557 5558 8089
