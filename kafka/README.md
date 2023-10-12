### Simplified version of various Kafka docker images

#### Docker Build Apple
```
docker buildx build --platform=linux/arm64 -t kafka:mac . --progress=plain --no-cache
```


#### Build on Mac AMD
```
docker build -f Dockerfile_Confluent_Community --platform linux/amd64 . -t cithub/kafka-confluent-community
docker build --platform linux/amd64 . -t kafka
```

#### Run locally
```shell
docker-compose up --no-start
docker-compose up -d zoo1 zoo2 zoo3
docker-compose up -d
```
