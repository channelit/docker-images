FROM python:3.7.4-slim-stretch

COPY ./requirements.txt /tmp/

RUN pip install --requirement /tmp/requirements.txt

COPY requirements.txt /tmp/

EXPOSE 5557 5558 8089
