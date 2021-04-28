#/bin/bash

set -euxo pipefail

kubectl apply -f 15-12-mongo-configmap.yaml
kubectl apply -f 15-11-mongo-service.yaml 
kubectl apply -f 15-14-mongo-pvc.yaml 

kubectl wait --timeout=-1s --for=condition=ready pod/mongo-2
