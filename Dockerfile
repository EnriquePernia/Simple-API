FROM alpine:3.14.1

#Mantainer
LABEL mantainer="Enrique Pernia"
LABEL email="epernia1996@gmail.com"
LABEL tier="Backend"

#Install prerequisites
RUN apt-get update && apt-get install -y \
  python3.9.6 \
  python3-pip

#Install requirements
COPY .requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

#Copy project
RUN ./app/ /app

#Run command
ENTRYPOINT ["uvicorn"]
CMD ["app.main:app", "--host", "0.0.0.0", "--port", "80"]

