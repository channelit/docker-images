#### Docker Build Apple
```
docker buildx build --platform=linux/arm64 -t microcks:mac . --progress=plain --no-cache
```