FROM alpine:3.14.1
#Mantainer

#Install prerequisites

#Copy project and install requirements
COPY . /API
WORKDIR /API
RUN pip3 install -f requirements.txt

#Run command

