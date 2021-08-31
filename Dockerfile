FROM python:3.9.6

#Mantainer
LABEL mantainer="Enrique Pernia"
LABEL email="epernia1996@gmail.com"
LABEL tier="Backend"

#Install prerequisites
#RUN apt-get update && apt-get install -y \
ENV PYTHONPATH=.

#Install requirements
COPY ./requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

#Copy project
COPY ./app/ /project/app
WORKDIR /project

#Run command
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

