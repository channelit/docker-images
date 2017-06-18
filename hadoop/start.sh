#!/bin/sh
service ssh start
cd $HADOOP_HOME/sbin
./start-dfs.sh
./start-yarn.sh