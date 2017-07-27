docker exec master hdfs dfs -mkdir /data
cp /Users/hp/workbench/projects/gmu/spark-hin/src/main/resources/data/yago/yagoFacts.tsv data/master/data/.
docker exec master hdfs dfs -put data/yagoFacts.tsv /data/yagoFacts.tsv