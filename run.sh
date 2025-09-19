#!/bin/bash

set -o errexit
set -o xtrace

kubectl apply -f kac.yaml
sleep 5
kubectl create -n argo -f https://raw.githubusercontent.com/argoproj/argo-workflows/main/examples/hello-world.yaml

sleep 15

export PGPASSWORD=$(kubectl get -n kubearchive secret kubearchive-database-credentials -o jsonpath='{.data.DATABASE_PASSWORD}' | base64 --decode)
kubectl exec -n postgresql -i deployment/postgresql -- env PGPASSWORD=$PGPASSWORD psql -h localhost -U kubearchive kubearchive -c "SELECT kind, namespace, name FROM resource;"
