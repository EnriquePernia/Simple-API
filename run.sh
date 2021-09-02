#!/bin/sh

kubectl apply -f ./kubernetes-api/
kubectl apply -f ./kubernetes-ci/

#Set minikube DNS resolution manually
sudo -- sh -c "echo $(minikube ip) "sample-api" >> /etc/hosts"