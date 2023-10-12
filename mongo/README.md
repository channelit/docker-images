#### On Apple Silicon
```
docker build --build-arg="arch_type=arm" . -t mymongo
```

### Run Locally (obviously create the local volume first)
```
docker run --name mongo -d -p 27017:27017 -v /mongo-data:/data/db mymongo:latest
```