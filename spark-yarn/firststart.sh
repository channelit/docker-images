#!/bin/sh

export SPARK_HOME=/home/hadoop/spark/spark
export YARN_CONF_DIR=/home/hadoop/hadoop/etc/hadoop
export PYSPARK_DRIVER_PYTHON=ipython3
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser --port=8888"
export SPARK_EXECUTOR_MEMORY=1g

hdfs namenode -format
./home/hadoop/hadoop/start.sh

jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root