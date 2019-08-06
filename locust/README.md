## Locust docker image

```bash
docker run --name=locust -v $(pwd)/locust.py:/locust.py -P cithub/locust locust -f /locust.py
```