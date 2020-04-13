
# Steps To Create Secured Solr Cluster

### Create folders and containers
```shell-script
mkdir data
chmod 775 data
chmod g+s data
docker-compose up --no-start
```

### Setup Certificates

#### Copy script
```shell-script
docker cp setup-jks.sh solr1:/opt/solr/setup-jks.sh
docker cp setup-jks.sh solr2:/opt/solr/setup-jks.sh
docker cp setup-jks.sh solr3:/opt/solr/setup-jks.sh
```

#### Start cluster
```shell-script
docker-compose up -d zoo1 zoo2 zoo3
docker-compose up -d solr1
docker-compose up -d solr2 solr3
```
#### If you get SSL errors
Stop and kill containers
Change permissions of data folder again
```sh
docker-compose up
```

#### Run script (You may need to run these couple of times untill you don't see any errors)
```shell-script
docker exec solr1 ./setup-jks.sh
docker exec solr2 ./setup-jks.sh
docker exec solr3 ./setup-jks.sh
```

#### Stop and start Solr nodes
```sh
docker-compose stop solr1 solr2 solr3
docker-compose up
```