from locust import HttpLocust, TaskSet, task
import os

def index(l):
    l.client.get("/")

def stats(l):
    l.client.get("/stats/requests")

class UserTasks(TaskSet):
    # one can specify tasks like this
    tasks = [index, stats]
    
    # but it might be convenient to use the @task decorator
    @task
    def page404(self):
        self.client.get("/does_not_exist")
    
class WebsiteUser(HttpLocust):
    """
    Locust user class that does requests to the locust web server running on localhost
    """
    URL_HOST = os.environ.get('URL_HOST', '127.0.0.1')
    URL_PORT = os.environ.get('URL_PORT', '8089')
    host = "http://" + URL_HOST + ":" + URL_PORT
    min_wait = 2000
    max_wait = 5000
    task_set = UserTasks