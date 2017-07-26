#!/bin/sh

export SPARK_HOME=/home/hadoop/spark/spark
export YARN_CONF_DIR=/home/hadoop/hadoop/etc/hadoop
export SPARK_OPTS="--packages graphframes:graphframes:0.5.0-spark2.1-s_2.11,com.databricks:spark-csv_2.11:1.2.0"
export PYSPARK_DRIVER_PYTHON=ipython3
export PYSPARK_SUBMIT_ARGS="--packages graphframes:graphframes:0.5.0-spark2.1-s_2.11,com.databricks:spark-csv_2.11:1.2.0"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser --port=8888"
export SPARK_EXECUTOR_MEMORY=1g

ssh-keygen -R localhost
ssh-keygen -R 0.0.0.0
ssh-keygen -R master
ssh-keygen -R slave1
ssh-keygen -R slave2

hdfs namenode -format -nonInteractive
./home/hadoop/hadoop/start.sh

if [ "$1" = "master" ]; then
	jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
fi