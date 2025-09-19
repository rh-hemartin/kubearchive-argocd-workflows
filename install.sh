#!/bin/bash

set -o errexit
set -o xtrace

export ARGO_WORKFLOWS_VERSION="v3.7.2"
kubectl create namespace argo --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argo -f "https://github.com/argoproj/argo-workflows/releases/download/${ARGO_WORKFLOWS_VERSION}/quick-start-minimal.yaml"

kubectl apply -k karchive/deps
echo "Waiting a little for stuff to be up and running..."
kubectl wait -n cert-manager pod --all --for=condition=Ready --timeout=180s
kubectl wait -n knative-eventing pod --all --for=condition=Ready --timeout=180s

kubectl apply -f karchive/deps/postgresql.yaml
sleep 15
echo "Waiting for PostgreSQL to be up..."
cat karchive/kubearchive.sql | kubectl exec -n postgresql -i deployments/postgresql -- env PGPASSWORD=password psql -h localhost -U kubearchive kubearchive

kubectl apply -k karchive/
kubectl apply -f karchive/migration-job.yaml
kubectl wait -n kubearchive --all deployment --for condition=Available=True --timeout=180s
