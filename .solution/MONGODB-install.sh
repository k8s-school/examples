#/bin/bash

set -euxo pipefail

kubectl apply -f 15-12-mongo-configmap.yaml
kubectl apply -f 15-11-mongo-service.yaml 
kubectl apply -f 15-14-mongo-pvc.yaml 

NB_REPLICA=3

for ((i=0; i<$NB_REPLICA; i++))
do
  kubectl wait --for=condition=ready pod --timeout=60s -l statefulset.kubernetes.io/pod-name=mongo-$i
done

