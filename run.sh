#!/bin/sh

kubectl apply -f ./kubernetes-api/
kubectl apply -f ./kubernetes-ci/

#Set minikube DNS resolution manually
#If exists dont add it
FILE='/etc/hosts'
grep -F -- "$(minikube ip) ingress" "$FILE" || echo "$(minikube ip) ingress" >> "$FILE"
