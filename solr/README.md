
mkdir data
chmod 775 data
chmod g+s data
docker-compose up --no-start
docker-compose up -d zoo1 zoo2 zoo3
docker-compose up -d solr1
docker-compose up -d solr2 solr3
# import certificate
docker exec solr1 ./setup-jks.sh
docker exec solr2 ./setup-jks.sh
docker exec solr3 ./setup-jks.sh