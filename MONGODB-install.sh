#/bin/sh

set -e
set -x

kubectl apply -f 15-12-mongo-configmap.yaml
kubectl apply -f 15-11-mongo-service.yaml 
kubectl apply -f 15-14-mongo-pvc.yaml 
