### Simplified version of various Kafka docker images

#### Build on Mac AMD
```
docker build -f Dockerfile_Confluent_Community --platform linux/amd64 . -t cithub/kafka-confluent-community
```

#### Run locally
```shell
docker-compose up --no-start
docker-compose up -d zoo1 zoo2 zoo3
docker-compose up -d
```
