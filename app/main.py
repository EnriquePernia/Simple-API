from fastapi import FastAPI, status


app = FastAPI()

# Sample endpoint to get a succesfull response
@app.get("/success", status_code=status.HTTP_200_OK)
def success():
    return {"msg": "Success"}

# Sample endpoint to get an error response
@app.get("/error", status_code=status.HTTP_403_FORBIDDEN)
def error():
    return {"msg": "Error"}
