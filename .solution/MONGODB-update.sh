#!/bin/bash

# See https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/#updating-statefulsets

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)

SF="mongo"

kubectl patch statefulset "$SF" -p '{"spec":{"updateStrategy":{"type":"RollingUpdate"}}}'

kubectl patch statefulset "$SF" --type='json' -p='[
    {"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"mongo:4.4"},
    {"op": "replace", "path": "/spec/template/spec/containers/1/image", "value":"mongo:4.4"}]'

kubectl run -i --rm --tty shell --image=mongo:4.2 --restart=Never -- mongo --host mongo:27017 test --eval "db.restaurants.find()"

kubectl rollout status --watch --timeout=600s statefulset/"$SF"