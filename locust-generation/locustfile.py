from locust import HttpUser, task

class HelloWorldUser(HttpUser):
    @task
    def hello_world(self):
        self.client.get("http://172.26.131.190/")
        # self.client.get("/world")
        print("Hello world!!")