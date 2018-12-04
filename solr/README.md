chmod 775 data
chmod g+s data
docker-compose up --no-start
docker-compose up -d zoo1 zoo2 zoo3
docker-compose up -d solr1
docker-compose up -d solr2 solr3
