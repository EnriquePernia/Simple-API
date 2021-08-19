from fastapi.testclient import TestClient
from app.main import app


#Testing: https://fastapi.tiangolo.com/tutorial/testing/
client = TestClient(app)

def test_success():
    response = client.get("/success")
    assert response.status_code == 200
    assert response.json() == {"msg": "Success"}

def test_error():
    response = client.get("/error")
    assert response.status_code == 403
    assert response.json() == {"msg": "Error"}