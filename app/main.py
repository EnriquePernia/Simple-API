from fastapi import FastAPI

from fastapi.testclient import TestClient


app = FastAPI()


@app.get("/")
def read_main():
    return {"msg": "Hello World"}

#Testing: https://fastapi.tiangolo.com/tutorial/testing/
client = TestClient(app)


def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "Hello World"}

