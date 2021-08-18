FROM alpine:3.14.1
#Mantainer

#Install prerequisites
RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip

#Copy project and install requirements
COPY . /API
WORKDIR /API
RUN pip3 install -f requirements.txt

#Run command

